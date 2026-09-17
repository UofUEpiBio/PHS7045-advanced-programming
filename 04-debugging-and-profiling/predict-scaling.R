# Fit a Poisson regression on standardized predictors (Newton-Raphson
# converges faster this way), then predict counts for new data. See the lab
# for the algebra connecting the standardized-scale coefficients to the
# center/scale used to build them.

fit_poisson <- function(X, y, maxit = 50, tol = 1e-8) {
  Z <- scale(X)
  Zd <- cbind(1, Z)

  beta <- rep(0, ncol(Zd))
  beta[1] <- log(mean(y))

  for (it in 1:maxit) {
    mu <- exp(drop(Zd %*% beta))
    score <- crossprod(Zd, y - mu)
    info <- crossprod(Zd * mu, Zd)
    step <- solve(info, score)

    beta <- beta + drop(step)

    if (max(abs(step)) < tol) break
  }

  list(coefficients = beta, iterations = it)
}

predict_counts <- function(fit, newdata) {
  Z <- scale(newdata)
  Zd <- cbind(1, Z)
  exp(drop(Zd %*% fit$coefficients))
}

set.seed(1)
n <- 400
X <- cbind(x1 = rnorm(n, 50, 10), x2 = rnorm(n, 2, 0.5))
beta_true <- c(-1, 0.9, 0.3)
Z_true <- scale(X)
y <- rpois(n, exp(drop(cbind(1, Z_true) %*% beta_true)))

fit <- fit_poisson(X, y)

# Predicting on the training data looks perfect.
head(predict_counts(fit, X))

# A colleague asks for the predicted count at a single new clinic.
predict_counts(fit, X[1, , drop = FALSE])
