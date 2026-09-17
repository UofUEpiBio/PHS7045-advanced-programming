# Estimate pi by throwing darts at the square [-1, 1]^2 and counting how many
# land inside the unit circle. See the lab for the underlying math.

simulate_pi <- function(n = 5e6) {
  inside <- 0
  for (i in 1:n) {
    x <- runif(1, -1, 1)
    y <- runif(1, -1, 1)
    if (x^2 + y^2 <= 1) inside <- inside + 1
  }
  4 * inside / n
}

set.seed(1)
simulate_pi(5e6)
