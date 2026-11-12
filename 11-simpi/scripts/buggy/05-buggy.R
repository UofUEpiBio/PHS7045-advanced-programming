# 05-buggy.R ------------------------------------------------------------------
# A colleague's multicore pi simulation. It "works", but something is off.
#
# Usage: Rscript 05-buggy.R [nsims] [n]

args  <- commandArgs(trailingOnly = TRUE)
nsims <- if (length(args) >= 1) as.integer(args[1]) else 10000L
n     <- if (length(args) >= 2) as.integer(args[2]) else 10000L

simpi <- function(i, n) {
  p <- matrix(runif(n * 2, -1, 1), ncol = 2)
  mean(sqrt(rowSums(p^2)) <= 1) * 4
}

ncores <- parallel::detectCores()

set.seed(7045)
start <- Sys.time()
ans <- unlist(parallel::mclapply(seq_len(nsims), simpi, n = n,
                                 mc.cores = ncores))
elapsed <- as.numeric(difftime(Sys.time(), start, units = "secs"))

message(sprintf("host: %s | cores: %d | pi-hat: %.12f | elapsed: %.2f s",
                Sys.info()[["nodename"]], ncores, mean(ans), elapsed))
saveRDS(ans, "05-buggy.rds")
