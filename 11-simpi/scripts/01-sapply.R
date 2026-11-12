# 01-sapply.R -----------------------------------------------------------------
# Case 1: a single job on a single core.
#
# Usage: Rscript 01-sapply.R [nsims] [n]

source("simpi.R")

size  <- read_size()
seeds <- make_seeds(size$nsims)

start <- Sys.time()
ans   <- sapply(seq_len(size$nsims), simpi, n = size$n, seeds = seeds)
elapsed <- as.numeric(difftime(Sys.time(), start, units = "secs"))

report(ans, elapsed, "01-sapply")
saveRDS(ans, "01-sapply.rds")
