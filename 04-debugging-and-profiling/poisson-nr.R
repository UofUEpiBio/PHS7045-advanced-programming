# Fit a Poisson regression (log link) by Newton-Raphson on the
# log-likelihood. See the lab for the score, Hessian, and the update
# equation this function is supposed to implement.

fit_poisson_nr <- function(X, y, maxit = 50, tol = 1e-8) {
  beta <- rep(0, ncol(X))
  beta[1] <- log(mean(y))

  for (it in 1:maxit) {
    mu <- exp(drop(X %*% beta))
    score <- crossprod(X, y - mu)
    info <- crossprod(X * mu, X)
    step <- solve(info, score)

    beta <- beta - drop(step)

    if (max(abs(step)) < tol) break
  }

  list(coefficients = beta, iterations = it)
}

set.seed(331)
n <- 500
x1 <- rnorm(n, 50, 10)
x2 <- rbinom(n, 1, 0.4)
X <- cbind(1, x1, x2)
y <- rpois(n, exp(drop(X %*% c(-2, 0.05, 0.8))))

fit_poisson_nr(X, y)
