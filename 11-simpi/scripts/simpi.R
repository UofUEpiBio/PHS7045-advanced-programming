# simpi.R ---------------------------------------------------------------------
# Shared functions for simulating pi. Every script in this folder sources this
# file, so all versions (serial, multicore, job array) use the same code.

# One random-number stream per replicate.
#
# Replicate i always starts from seeds[[i]], no matter which core or node runs
# it. That is why every correct version of the simulation prints exactly the
# same estimate of pi.
make_seeds <- function(nsims, base_seed = 7045) {
  RNGkind("L'Ecuyer-CMRG")
  set.seed(base_seed)
  seeds <- vector("list", nsims)
  seeds[[1]] <- .Random.seed
  for (i in seq_len(nsims)[-1]) {
    seeds[[i]] <- parallel::nextRNGStream(seeds[[i - 1]])
  }
  seeds
}

# Replicate i: throw n random points into the square [-1, 1] x [-1, 1] and
# count the share that lands inside the unit circle. That share estimates
# pi / 4, so 4 times the share estimates pi.
simpi <- function(i, n, seeds) {
  # Start replicate i's own stream (equivalent to set.seed() for this stream)
  assign(".Random.seed", seeds[[i]], envir = globalenv())
  p <- matrix(runif(n * 2, -1, 1), ncol = 2)
  mean(sqrt(rowSums(p^2)) <= 1) * 4
}

# Read the simulation size from the command line:
#   Rscript script.R [nsims] [n]
# Defaults: 10,000 replicates of 10,000 points each (1e8 points in total).
read_size <- function(args = commandArgs(trailingOnly = TRUE)) {
  list(
    nsims = if (length(args) >= 1) as.integer(args[1]) else 10000L,
    n     = if (length(args) >= 2) as.integer(args[2]) else 10000L
  )
}

# Print the estimate with enough digits to compare runs exactly.
report <- function(ans, elapsed = NA, label = "") {
  msg <- sprintf("[%s] host: %s | replicates: %d | pi-hat: %.12f",
                 label, Sys.info()[["nodename"]], length(ans), mean(ans))
  if (!is.na(elapsed)) msg <- sprintf("%s | elapsed: %.2f s", msg, elapsed)
  message(msg)
}
