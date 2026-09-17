# A discrete-time metapopulation model: cases move between k locations
# according to a distance-based kernel. See the lab for the underlying math.

# Row-normalized Gaussian kernel: K[i, j] is the share of location i's cases
# that move to location j on a single step.
make_kernel <- function(coords, bandwidth) {
  d <- as.matrix(dist(coords))
  K <- exp(-(d / bandwidth)^2)
  K / rowSums(K)
}

# Advance p0 forward nsteps times: p(s+1) = p(s) %*% K.
simulate_spread <- function(coords, p0, nsteps = 300, bandwidth = 0.15) {
  p <- p0
  for (s in seq_len(nsteps)) {
    K <- make_kernel(coords, bandwidth)
    p <- as.vector(p %*% K)
    p <- p / sum(p)
  }
  p
}

set.seed(2)
k <- 1000
coords <- cbind(runif(k), runif(k))
p0 <- rep(1 / k, k)

p_final <- simulate_spread(coords, p0)
summary(p_final)
