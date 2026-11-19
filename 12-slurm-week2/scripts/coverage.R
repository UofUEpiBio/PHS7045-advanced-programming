# coverage.R ------------------------------------------------------------------
# How often does a 95% confidence interval for the mean cover the true mean
# when the data are skewed? We compare the t-interval and the bootstrap
# percentile interval for samples from a lognormal(0, 1), whose mean is
# exp(1/2).
#
# Usage: Rscript coverage.R [nsims]   (nsims = replicates per sample size)
#
# This script is the controller: it does no heavy computing itself. slurmR
# writes the job files, submits them as a job array, waits, and collects.

library(slurmR)

nsims <- as.integer(commandArgs(trailingOnly = TRUE)[1])
if (is.na(nsims)) nsims <- 100L

# One row per replicate: nsims replicates for each sample size
grid <- expand.grid(rep = seq_len(nsims), n = c(10, 20, 50, 100))

# Replicate i. Everything it needs is an argument, because slurmR runs it in a
# fresh R session on another node. It sets its own seed, so the answer does
# not depend on which job or core runs it.
sim_one <- function(i, grid, B = 999, mu = exp(0.5)) {
  set.seed(7045 + i)
  n <- grid$n[i]
  x <- rlnorm(n)

  # t-interval
  half <- qt(0.975, df = n - 1) * sd(x) / sqrt(n)
  t_ci <- mean(x) + c(-half, half)

  # Bootstrap percentile interval: B resamples, one per column
  boot    <- colMeans(matrix(sample(x, n * B, replace = TRUE), nrow = n))
  boot_ci <- quantile(boot, c(0.025, 0.975), names = FALSE)

  c(
    n          = n,
    t_cover    = t_ci[1] <= mu && mu <= t_ci[2],
    boot_cover = boot_ci[1] <= mu && mu <= boot_ci[2]
  )
}

# Create the job (files only, nothing is submitted yet)
job <- Slurm_lapply(
  as.list(seq_len(nrow(grid))),
  sim_one,
  grid       = grid,
  njobs      = 4,
  mc.cores   = 1,
  job_name   = "coverage-sim",
  plan       = "none",
  sbatch_opt = list(
    account   = "notchpeak-shared-short",
    partition = "notchpeak-shared-short",
    qos       = "notchpeak-shared-short",
    nodes     = 1,
    time      = "01:00:00",
    mem       = "8G"
  )
)

# Submit, then wait for and collect the results
start <- Sys.time()
job   <- sbatch(job)
wait_slurm(job)
ans   <- Slurm_collect(job)
elapsed <- as.numeric(difftime(Sys.time(), start, units = "secs"))

# Coverage by sample size
res <- as.data.frame(do.call(rbind, ans))
stopifnot(nrow(res) == nrow(grid))
tab <- aggregate(cbind(t_cover, boot_cover) ~ n, data = res, FUN = mean)
print(tab, row.names = FALSE, digits = 4)

message(sprintf(
  "replicates: %d | elapsed: %.1f s | job id: %s",
  nrow(res), elapsed, job$jobid
))
