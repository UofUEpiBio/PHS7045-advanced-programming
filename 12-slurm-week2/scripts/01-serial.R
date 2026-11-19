# 01-serial.R -------------------------------------------------------------------
# The whole simulation, one replicate after another, on one core.
# Use it for small tests inside an interactive session (salloc), never on the
# login node.
#
# Usage: Rscript 01-serial.R [nsims] [B]

source("coverage.R")

size  <- read_size()
grid  <- make_grid(size$nsims)
seeds <- make_seeds(nrow(grid))

start <- Sys.time()
ans   <- lapply(grid$id, sim_one, grid = grid, rep_seeds = seeds, B = size$B)
elapsed <- as.numeric(difftime(Sys.time(), start, units = "secs"))

tab <- summarize_coverage(ans, grid)
report(tab, elapsed, "01-serial")
saveRDS(tab, "01-serial.rds")
