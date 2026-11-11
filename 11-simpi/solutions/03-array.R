# 03-array.R (reference solution) ----------------------------------------------
# Case 3: a job array. Slurm starts SLURM_ARRAY_TASK_COUNT copies of this
# script, possibly on different nodes. Task a runs replicates a, a + T, a + 2T,
# ... (T = number of tasks) using mclapply() on its own cores, and saves them.
#
# Usage (inside Slurm): Rscript 03-array.R [nsims] [n]
# Local test:  for a in 1 2 3 4; do
#                SLURM_ARRAY_TASK_ID=$a SLURM_ARRAY_TASK_COUNT=4 Rscript 03-array.R 100 10000
#              done

source("simpi.R")

size   <- read_size()
task   <- as.integer(Sys.getenv("SLURM_ARRAY_TASK_ID", unset = NA))
ntasks <- as.integer(Sys.getenv("SLURM_ARRAY_TASK_COUNT", unset = NA))
ncores <- as.integer(Sys.getenv("SLURM_CPUS_PER_TASK", unset = "1"))
if (is.na(task) || is.na(ntasks)) {
  stop("SLURM_ARRAY_TASK_ID and SLURM_ARRAY_TASK_COUNT must be set.")
}

# Same seeds as the serial version, so replicate i gives the same estimate
seeds <- make_seeds(size$nsims)
mine  <- seq(task, size$nsims, by = ntasks)

start <- Sys.time()
est <- unlist(parallel::mclapply(mine, simpi, n = size$n, seeds = seeds,
                                 mc.cores = ncores))
elapsed <- as.numeric(difftime(Sys.time(), start, units = "secs"))

# One file per task, named after the task, so tasks never overwrite each other
dir.create("results", showWarnings = FALSE)
saveRDS(
  list(task = task, host = Sys.info()[["nodename"]], i = mine, est = est,
       ncores = ncores, elapsed = elapsed),
  sprintf("results/pi-task%03d.rds", task)
)
report(est, elapsed, sprintf("03-array, task %d of %d, %d cores",
                             task, ntasks, ncores))
