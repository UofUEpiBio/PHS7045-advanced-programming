# ============================================================================
# Lab 04 - Debugging and Profiling: solutions
#
# Instructor copy. Covers all four exercises: the diagnosis, the fix, and the
# check that the fix did not change the answer.
# ============================================================================


# ============================================================================
# Part 1, Exercise 1: Estimating pi by Monte Carlo
# ----------------------------------------------------------------------------
# Diagnosis: the flamegraph is almost entirely `runif`. The loop calls
# runif(1) twice per iteration -- 10,000,000 calls at n = 5e6. Each call is
# cheap; the per-call overhead of dropping from R into C is not.
#
#   Rprof at n = 2e6:  runif 51.7% self time, simulate_pi 47.9%.
#
# Fix: draw all n pairs in two calls instead of 2n calls.
# ============================================================================

simulate_pi_slow <- function(n = 5e6) {
  inside <- 0
  for (i in 1:n) {
    x <- runif(1, -1, 1)
    y <- runif(1, -1, 1)
    if (x^2 + y^2 <= 1) inside <- inside + 1
  }
  4 * inside / n
}

simulate_pi_fast <- function(n = 5e6) {
  x <- runif(n, -1, 1)
  y <- runif(n, -1, 1)
  4 * mean(x^2 + y^2 <= 1)
}

set.seed(1)
n <- 5e6

t_slow <- system.time(pi_slow <- simulate_pi_slow(n))[["elapsed"]]
t_fast <- system.time(pi_fast <- simulate_pi_fast(n))[["elapsed"]]

cat("\n-- Exercise 1 ---------------------------------------------------\n")
cat(sprintf("loop:       %.3f s  -> %.6f\n", t_slow, pi_slow))
cat(sprintf("vectorized: %.3f s  -> %.6f\n", t_fast, pi_fast))
cat(sprintf("speedup:    %.1fx\n", t_slow / t_fast))

# The two estimates do NOT agree bit-for-bit: they consume the random stream
# in a different order, so they are different draws from the same estimator.
# The right check is agreement to within Monte Carlo error.
mc_se <- sqrt(pi * (4 - pi) / n)
cat(sprintf("MC SE:      %.6f   |difference| = %.6f  (%.2f SEs)\n",
            mc_se, abs(pi_slow - pi_fast), abs(pi_slow - pi_fast) / mc_se))

# bench::mark(check = FALSE) for the same reason -- the results are not
# expected to be identical.
if (requireNamespace("bench", quietly = TRUE)) {
  print(bench::mark(
    slow = simulate_pi_slow(1e5),
    fast = simulate_pi_fast(1e5),
    relative = TRUE, check = FALSE
  ))
}


# ============================================================================
# Part 1, Exercise 2: Spread across a landscape
# ----------------------------------------------------------------------------
# Diagnosis: make_kernel() is called once per step, but nothing inside it
# depends on the step index s. The recursion is p^(s+1) = p^(s) K with a
# single, fixed K -- so 300 identical 1000x1000 kernels get built and thrown
# away. dist() dominates the time, and the repeated 8 MB allocations show up
# as <GC> in the flamegraph.
#
# Note the loop itself is NOT the problem and cannot be removed: each step
# depends on the previous one. Only the loop-invariant computation moves out.
# ============================================================================

make_kernel <- function(coords, bandwidth) {
  d <- as.matrix(dist(coords))
  K <- exp(-(d / bandwidth)^2)
  K / rowSums(K)
}

simulate_spread_slow <- function(coords, p0, nsteps = 300, bandwidth = 0.15) {
  p <- p0
  for (s in seq_len(nsteps)) {
    K <- make_kernel(coords, bandwidth)   # rebuilt every step
    p <- as.vector(p %*% K)
    p <- p / sum(p)
  }
  p
}

simulate_spread_fast <- function(coords, p0, nsteps = 300, bandwidth = 0.15) {
  p <- p0
  K <- make_kernel(coords, bandwidth)     # hoisted out of the loop
  for (s in seq_len(nsteps)) {
    p <- as.vector(p %*% K)
    p <- p / sum(p)
  }
  p
}

set.seed(2)
k <- 1000
coords <- cbind(runif(k), runif(k))
p0 <- rep(1 / k, k)

t_slow2 <- system.time(p_slow <- simulate_spread_slow(coords, p0))[["elapsed"]]
t_fast2 <- system.time(p_fast <- simulate_spread_fast(coords, p0))[["elapsed"]]

cat("\n-- Exercise 2 ---------------------------------------------------\n")
cat(sprintf("rebuilt each step: %.3f s\n", t_slow2))
cat(sprintf("hoisted:           %.3f s\n", t_fast2))
cat(sprintf("speedup:           %.1fx\n", t_slow2 / t_fast2))

# Unlike Exercise 1, this transformation is deterministic, so the results must
# match exactly.
cat("identical results: ", isTRUE(all.equal(p_slow, p_fast)), "\n", sep = "")


# ============================================================================
# Part 2, Exercise 1: Fitting a Poisson regression by Newton-Raphson
# ----------------------------------------------------------------------------
# THE BUG: `beta <- beta - drop(step)` should be `beta + drop(step)`.
#
# Why. Newton-Raphson steps by -H^{-1} U. There are two equivalent ways to
# write it, with opposite signs:
#
#   beta - H^{-1} U            with the Hessian     H = -X'WX
#   beta + I^{-1} U            with the information I = -H = X'WX
#
# The code builds `info <- crossprod(X * mu, X)`, which is X'WX = I, the
# information -- NOT the Hessian. So `step <- solve(info, score)` is already
# the full, correctly signed ascent step I^{-1}U, and it must be ADDED.
# Subtracting it applies the textbook minus sign a second time, on a matrix
# that already absorbed it.
#
# Symptom. Since I = X'WX is positive definite (every mu_i > 0), +step always
# increases the log-likelihood and -step always decreases it. So the buggy
# version descends:
#
#   iter 1  loglik    -749.2
#   iter 2  loglik   -3587.2
#   iter 3  loglik  -12665.1
#   iter 4  loglik  -87714.1   beta_3 = -86.0
#   iter 5  Error in solve.default(info, score):
#           system is computationally singular, rcond = 2.45e-41
#
# beta runs off, mu = exp(X beta) underflows to ~0, W = diag(mu) goes to zero,
# and X'WX becomes numerically singular. Note the error surfaces in solve()
# four iterations AFTER the actual mistake -- which is why traceback() alone
# is not enough and browser() is.
# ============================================================================

fit_poisson_nr <- function(X, y, maxit = 50, tol = 1e-8, verbose = FALSE) {
  beta <- rep(0, ncol(X))
  beta[1] <- log(mean(y))

  for (it in 1:maxit) {
    mu <- exp(drop(X %*% beta))
    score <- crossprod(X, y - mu)
    info <- crossprod(X * mu, X)      # this is X'WX = information, not Hessian
    step <- solve(info, score)

    beta <- beta + drop(step)         # FIXED: was `beta - drop(step)`

    if (verbose) {
      ll <- sum(y * drop(X %*% beta) - exp(drop(X %*% beta)))
      cat(sprintf("  iter %2d  loglik = %12.4f  beta = %s\n",
                  it, ll, paste(sprintf("%7.4f", beta), collapse = " ")))
    }

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

cat("\n-- Exercise 3 ---------------------------------------------------\n")
cat("log-likelihood now increases every iteration:\n")
fit <- fit_poisson_nr(X, y, verbose = TRUE)

glm_fit <- glm(y ~ x1 + x2, family = poisson())
cat(sprintf("\nNewton-Raphson: %s  (%d iterations)\n",
            paste(sprintf("%.4f", fit$coefficients), collapse = " "),
            fit$iterations))
cat(sprintf("glm():          %s\n",
            paste(sprintf("%.4f", coef(glm_fit)), collapse = " ")))
cat("agree to 6 decimals: ",
    isTRUE(all.equal(unname(fit$coefficients), unname(coef(glm_fit)),
                     tolerance = 1e-6)), "\n", sep = "")

# ---------------------------------------------------------------------------
# The quieter variant mentioned in the lab: using the linear predictor in
# place of the mean in the score (forgetting to apply the inverse link).
#
# This one never errors -- but it also never converges. The step shrinks
# without ever meeting tol (still ~2e-3 at iteration 200, with beta still
# drifting), so it silently exhausts maxit and returns whatever it reached.
# The "estimate" is therefore a function of maxit:
#
#   maxit =  50  ->  -3.3492  0.1044  1.6692
#   maxit = 200  ->  -4.2258  0.1228  1.9900
#
# Lesson: always compare $iterations against maxit. Hitting the cap is a
# failure, not an answer.
# ---------------------------------------------------------------------------
fit_poisson_quietbug <- function(X, y, maxit = 50, tol = 1e-8) {
  beta <- rep(0, ncol(X))
  beta[1] <- log(mean(y))
  for (it in 1:maxit) {
    mu <- exp(drop(X %*% beta))
    score <- crossprod(X, y - drop(X %*% beta))   # BUG: eta instead of mu
    info <- crossprod(X * mu, X)
    step <- solve(info, score)
    beta <- beta + drop(step)
    if (max(abs(step)) < tol) break
  }
  list(coefficients = beta, iterations = it)
}

quiet <- fit_poisson_quietbug(X, y)
cat(sprintf("\nquiet bug (y - eta): %s\n",
            paste(sprintf("%.4f", quiet$coefficients), collapse = " ")))
cat(sprintf("   -> ran %d of maxit = 50 iterations: never converged, never errored.\n",
            quiet$iterations))


# ============================================================================
# Part 2, Exercise 2: Predicting counts for a new clinic
# ----------------------------------------------------------------------------
# THE BUG: predict_counts() calls scale(newdata), recomputing the centering
# and scaling constants from whatever data it is handed.
#
# Why it matters. fit_poisson() fits on z_ij = (x_ij - c_j) / s_j, so the
# returned beta-tilde is defined relative to THAT c and s. Expanding:
#
#   log mu = b0~ + sum_j b_j~ (x_j - c_j)/s_j
#          = (b0~ - sum_j b_j~ c_j/s_j)  +  sum_j (b_j~/s_j) x_j
#
# c_j and s_j are parameters of the fitted model, not properties of the data
# being predicted. Recomputing them silently swaps in a different model.
#
# Symptom (this is what makes it nasty):
#   - all 400 training rows -> identical to the correct answer. Looks perfect.
#   - 3 rows                -> one prediction off by ~2x (1.295 vs 0.643).
#   - 1 row                 -> NaN, because sd() of a single value is NA.
# ============================================================================

fit_poisson_scaled <- function(X, y, maxit = 50, tol = 1e-8) {
  Z <- scale(X)
  ctr <- attr(Z, "scaled:center")
  scl <- attr(Z, "scaled:scale")
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

  # FIX (a): keep the training center/scale on the fit object.
  list(coefficients = beta, center = ctr, scale = scl, iterations = it)
}

predict_counts_buggy <- function(fit, newdata) {
  Z <- scale(newdata)                                  # BUG
  exp(drop(cbind(1, Z) %*% fit$coefficients))
}

# FIX (a): reuse the stored constants instead of recomputing them.
predict_counts_fixed <- function(fit, newdata) {
  Z <- scale(newdata, center = fit$center, scale = fit$scale)
  exp(drop(cbind(1, Z) %*% fit$coefficients))
}

set.seed(1)
n2 <- 400
x1b <- rnorm(n2, 50, 10)
x2b <- rnorm(n2, 2, 0.5)
Xs <- cbind(x1 = x1b, x2 = x2b)
y2 <- rpois(n2, exp(drop(cbind(1, scale(Xs)) %*% c(-1, 0.9, 0.3))))

fit2 <- fit_poisson_scaled(Xs, y2)

cat("\n-- Exercise 4 ---------------------------------------------------\n")
cat(sprintf("all 400 rows, max rel. error: %.2e  <- looks fine\n",
            max(abs(predict_counts_buggy(fit2, Xs) /
                    predict_counts_fixed(fit2, Xs) - 1))))
cat(sprintf("3 rows,  buggy: %s\n",
            paste(sprintf("%.3f", predict_counts_buggy(fit2, Xs[1:3, ])),
                  collapse = " ")))
cat(sprintf("3 rows,  fixed: %s\n",
            paste(sprintf("%.3f", predict_counts_fixed(fit2, Xs[1:3, ])),
                  collapse = " ")))
cat(sprintf("1 row,   buggy: %s  <- sd of one value is NA\n",
            predict_counts_buggy(fit2, Xs[1, , drop = FALSE])))
cat(sprintf("1 row,   fixed: %.4f\n",
            predict_counts_fixed(fit2, Xs[1, , drop = FALSE])))

# ---------------------------------------------------------------------------
# FIX (b): back-transform the coefficients once, so the model is returned on
# the original scale and prediction needs no scaling step at all.
#
#   beta_j  = beta_j~ / s_j
#   beta_0  = beta_0~ - sum_j beta_j~ c_j / s_j
# ---------------------------------------------------------------------------
bt <- fit2$coefficients
beta_orig  <- bt[-1] / fit2$scale
beta0_orig <- unname(bt[1] - sum(bt[-1] * fit2$center / fit2$scale))

df2 <- data.frame(x1 = x1b, x2 = x2b, y = y2)
glm2 <- glm(y ~ x1 + x2, family = poisson(), data = df2)

cat(sprintf("\nback-transformed: %s\n",
            paste(sprintf("%.4f", c(beta0_orig, beta_orig)), collapse = " ")))
cat(sprintf("glm():            %s\n",
            paste(sprintf("%.4f", coef(glm2)), collapse = " ")))
cat("agree to 6 decimals: ",
    isTRUE(all.equal(unname(c(beta0_orig, beta_orig)), unname(coef(glm2)),
                     tolerance = 1e-6)), "\n", sep = "")

# And the single-row prediction now matches predict.glm exactly.
cat(sprintf("\nsingle row, fix (a): %.6f\n",
            predict_counts_fixed(fit2, Xs[1, , drop = FALSE])))
cat(sprintf("single row, glm():   %.6f\n",
            unname(predict(glm2, newdata = df2[1, ], type = "response"))))
