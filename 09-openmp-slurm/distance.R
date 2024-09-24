library(Rcpp)

# Compiling
Rcpp::sourceCpp("distance.cpp", verbose = TRUE)

id <- as.integer(Sys.getenv("SLURM_ARRAY_TASK_ID", unset = "0"))
message("We are working in array #", id)

is_array <- ifelse(
  Sys.getenv("SLURM_ARRAY_TASK_ID", unset = "") == "",
  FALSE,
  TRUE
)

# Generating seeds
set.seed(123)

# Need to make sure all arrays have different seeds
if (is_array) {
  seeds <- as.integer(Sys.getenv("SLURM_ARRAY_TASK_COUNT", 1))
  seeds <- sample.int(.Machine$integer.max, seeds)
  set.seed(seeds[id])
}

n <- 500
Y <- matrix(rnorm(n * n), ncol = n)
X <- cbind(rnorm(n))

# Running the benchmark
res <- microbenchmark::microbenchmark(
  K4B_v1(X, Y, 2),
  K4B_v2(X, Y, 2, 4),
  check = "equal", times = 10
)

print(res, unit = "relative")
print(res, unit = "ms")

png(
  ifelse(
    is_array,
    sprintf("openmp-example-%02i.png", id),
    "openmp-exampl.png"
    )
)
boxplot(res, unit = "ms")
dev.off()

