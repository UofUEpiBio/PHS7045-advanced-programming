# 02-mclapply.R ---------------------------------------------------------------
# Case 2: a single job using several cores of ONE machine.
#
# Usage: Rscript 02-mclapply.R [nsims] [n] [ncores]
#
# How many cores? On CHPC, use exactly what Slurm gave you
# (SLURM_CPUS_PER_TASK). Never use parallel::detectCores() on a cluster: it
# counts every core of the node, including the ones other people are using.

source("simpi.R")

size   <- read_size()
args   <- commandArgs(trailingOnly = TRUE)
ncores <- as.integer(Sys.getenv("SLURM_CPUS_PER_TASK", unset = NA))
if (is.na(ncores)) ncores <- if (length(args) >= 3) as.integer(args[3]) else 2L

seeds <- make_seeds(size$nsims)

start <- Sys.time()
if (.Platform$OS.type == "windows" && ncores > 1) {
  # mclapply() cannot fork on Windows; use a socket cluster instead
  cl <- parallel::makePSOCKcluster(ncores)
  parallel::clusterExport(cl, "simpi")
  ans <- parallel::parLapply(cl, seq_len(size$nsims), simpi,
                             n = size$n, seeds = seeds)
  parallel::stopCluster(cl)
} else {
  ans <- parallel::mclapply(seq_len(size$nsims), simpi,
                            n = size$n, seeds = seeds, mc.cores = ncores)
}
ans <- unlist(ans)
elapsed <- as.numeric(difftime(Sys.time(), start, units = "secs"))

report(ans, elapsed, sprintf("02-mclapply, %d cores", ncores))
saveRDS(ans, "02-mclapply.rds")
