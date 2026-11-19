# coverage.R -------------------------------------------------------------------
# Shared functions for the coverage simulation. Every script in this folder
# sources this file, so all versions (serial, slurmR) use the same code.
#
# The question: how often does a 95% confidence interval for the mean actually
# contain the true mean when the data are skewed? We compare two intervals,
# the classic t-interval and the bootstrap percentile interval, for samples
# of size n from a lognormal(0, 1) distribution, whose true mean is exp(1/2).

# The simulation grid: one row per replicate. Row `id` is replicate `rep` of
# the scenario with sample size `n`.
make_grid <- function(
    nsims,
    n = c(10, 20, 50, 100)
) {
  grid <- expand.grid(rep = seq_len(nsims), n = n)
  grid$id <- seq_len(nrow(grid))
  grid
}

# One seed per replicate (row of the grid). Replicate i always calls
# set.seed(seeds[i]) before drawing anything, no matter which core, job, or
# node runs it. That is why every correct version of the simulation prints
# exactly the same table. sample.int() draws without replacement, so no two
# replicates share a seed.
make_seeds <- function(nreps, base_seed = 7045) {
  set.seed(base_seed)
  sample.int(1e7, nreps)
}

# Replicate i: draw a sample of size grid$n[i], build both intervals, and
# record whether each one covers the true mean and how wide it is.
#
# Everything the function needs is an argument (mu is the true mean of a
# lognormal(0, 1), exp(1/2)). slurmR saves FUN to a file and runs it in a
# fresh R session on another node, so it cannot rely on global variables.
#
# The seeds argument is called `rep_seeds`, not `seeds`, on purpose:
# Slurm_lapply() has its own `seeds` argument (one seed per job), so
# Slurm_lapply(..., seeds = seeds) would never reach sim_one().
sim_one <- function(
    i,
    grid,
    rep_seeds,
    B    = 999,
    conf = 0.95,
    mu   = exp(0.5)
) {
  # Replicate i's own seed
  set.seed(rep_seeds[i])

  n     <- grid$n[i]
  x     <- rlnorm(n)
  alpha <- 1 - conf

  # t-interval
  half <- qt(1 - alpha / 2, df = n - 1) * sd(x) / sqrt(n)
  t_ci <- mean(x) + c(-half, half)

  # Bootstrap percentile interval: B resamples of size n, one per column
  boot_means <- colMeans(matrix(sample(x, n * B, replace = TRUE), nrow = n))
  boot_ci    <- quantile(boot_means, c(alpha / 2, 1 - alpha / 2), names = FALSE)

  c(
    id         = i,
    n          = n,
    t_cover    = (t_ci[1] <= mu) & (mu <= t_ci[2]),
    boot_cover = (boot_ci[1] <= mu) & (mu <= boot_ci[2]),
    t_width    = diff(t_ci),
    boot_width = diff(boot_ci)
  )
}

# Combine the replicates (a list of vectors, in any order) into one table per
# sample size. Stops if a replicate is missing or duplicated.
summarize_coverage <- function(ans, grid) {
  res <- as.data.frame(do.call(rbind, ans))
  if (nrow(res) != nrow(grid) || anyDuplicated(res$id) ||
      !setequal(res$id, grid$id)) {
    stop(
      "Expected ", nrow(grid), " distinct replicates, got ", nrow(res),
      " rows with ", length(unique(res$id)), " distinct ids."
    )
  }
  res <- res[order(res$id), ]
  aggregate(
    cbind(t_cover, boot_cover, t_width, boot_width) ~ n,
    data = res,
    FUN  = mean
  )
}

# Read the simulation size from the command line:
#   Rscript script.R [nsims] [B]
# nsims is the number of replicates PER sample size (4 sample sizes).
# Defaults: 1,000 replicates per sample size, 999 bootstrap resamples.
read_size <- function(args = commandArgs(trailingOnly = TRUE)) {
  list(
    nsims = if (length(args) >= 1) as.integer(args[1]) else 1000L,
    B     = if (length(args) >= 2) as.integer(args[2]) else 999L
  )
}

# Print the table, plus a one-line fingerprint with enough digits to compare
# runs exactly: the sum of all the interval widths.
report <- function(tab, elapsed = NA, label = "") {
  out <- tab
  out[, c("t_cover", "boot_cover")] <- round(out[, c("t_cover", "boot_cover")], 4)
  out[, c("t_width", "boot_width")] <- round(out[, c("t_width", "boot_width")], 4)
  print(out, row.names = FALSE)
  msg <- sprintf(
    "[%s] host: %s | fingerprint: %.10f",
    label, Sys.info()[["nodename"]], sum(tab$t_width + tab$boot_width)
  )
  if (!is.na(elapsed)) msg <- sprintf("%s | elapsed: %.2f s", msg, elapsed)
  message(msg)
}
