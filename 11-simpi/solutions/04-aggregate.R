# 04-aggregate.R (reference solution) -----------------------------------------
# Combine the results of all array tasks into a single estimate of pi.
#
# Usage: Rscript 04-aggregate.R [nsims] [n]

source("simpi.R")

size  <- read_size()
files <- list.files("results", pattern = "^pi-task[0-9]+\\.rds$",
                    full.names = TRUE)
if (length(files) == 0) stop("No results found in results/.")
res <- lapply(files, readRDS)

i   <- unlist(lapply(res, `[[`, "i"))
est <- unlist(lapply(res, `[[`, "est"))

# Every replicate exactly once?
missing <- setdiff(seq_len(size$nsims), i)
if (length(missing) > 0 || anyDuplicated(i)) {
  stop("Replicates missing or duplicated. Did every task finish?")
}

# Put replicates back in order 1, 2, ..., nsims before averaging, so the sum
# is computed in the same order as in the serial version
ans <- est[order(i)]

hosts <- vapply(res, `[[`, character(1), "host")
message("Tasks: ", length(res), " | distinct nodes: ", length(unique(hosts)),
        " (", paste(sort(unique(hosts)), collapse = ", "), ")")
message(sprintf("Slowest task: %.2f s",
                max(vapply(res, `[[`, numeric(1), "elapsed"))))
report(ans, label = "04-aggregate")
saveRDS(ans, "04-aggregate.rds")
