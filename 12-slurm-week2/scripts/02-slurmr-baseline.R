# 02-slurmr-baseline.R ------------------------------------------------------------
# A first, working version of the coverage simulation on CHPC, with slurmR as
# the controller. It gives the right answer, but it was written in a hurry:
# it is not efficient. Hands-on 2 is about making it better.
#
# Usage (from the LOGIN node, inside ~/lab12):
#   module load R
#   Rscript 02-slurmr-baseline.R [nsims] [B]
#
# This script does no heavy computing itself. It writes the job files,
# submits them with sbatch, waits for Slurm, and combines the answers. All the
# replicates run on compute nodes, as job arrays.

library(slurmR)
source("coverage.R")

size  <- read_size()
grid  <- make_grid(size$nsims)
seeds <- make_seeds(nrow(grid))

# Resources requested for EACH array task
opts <- list(
  account   = "notchpeak-shared-short",
  partition = "notchpeak-shared-short",
  time      = "01:00:00",
  mem       = "8G"
)

start  <- Sys.time()
ans    <- list()
jobids <- character()

# One job array per sample size, one after the other
for (n_i in unique(grid$n)) {
  ids <- grid$id[grid$n == n_i]

  res <- Slurm_lapply(
    ids,
    sim_one,
    grid       = grid,
    rep_seeds  = seeds,
    B          = size$B,
    njobs      = 10,
    mc.cores   = 1,
    job_name   = sprintf("baseline-n%03d", n_i),
    sbatch_opt = opts,
    plan       = "collect"
  )

  ans    <- c(ans, res)
  jobids <- c(jobids, last_job()$jobid)
}

elapsed <- as.numeric(difftime(Sys.time(), start, units = "secs"))

tab <- summarize_coverage(ans, grid)
report(tab, elapsed, "02-slurmr-baseline")
saveRDS(tab, "02-slurmr-baseline.rds")

# The job IDs, for sacct
writeLines(jobids, "baseline-jobids.txt")
message("Job IDs: ", paste(jobids, collapse = ","))
