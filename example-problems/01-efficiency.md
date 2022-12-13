## Avoiding loops 1

*   A bernoulli graph, also known as an Erdos-Renyi graph, is a simple model which
    is fully characterized by the density of the graph.

*   In a graph with probability parameter $p$ and $n$ nodes (vertices), the
    expected number of ties is $pn^2$, e.g. if $n = 100$ and $p = 0.1$
    $E(m) = 100^2 \times 0.1 = 1,000$.

*   Simulate a bernoulli network (a.k.a. Erdos-Renyi graph) with parameter p = .01
   (chance of any edge) and n = 1e3.

## Avoiding loops 2

Rewrite the following R functions to make them faster. It is OK (and recommended) to take a look at Stackoverflow and Google

```{r, eval = FALSE}
# Total row sums
fun1 <- function(mat) {
  n <- nrow(mat)
  ans <- double(n) 
  for (i in 1:n) {
    ans[i] <- sum(mat[i, ])
  }
  ans
}
fun1alt <- function(mat) {
  # YOUR CODE HERE
}
# Cumulative sum by row
fun2 <- function(mat) {
  n <- nrow(mat)
  k <- ncol(mat)
  ans <- mat
  for (i in 1:n) {
    for (j in 2:k) {
      ans[i,j] <- mat[i, j] + ans[i, j - 1]
    }
  }
  ans
}
fun2alt <- function(mat) {
  # YOUR CODE HERE
}
# Use the data with this code
set.seed(2315)
dat <- matrix(rnorm(200 * 100), nrow = 200)
# Test for the first
microbenchmark::microbenchmark(
  fun1(dat),
  fun1alt(dat), unit = "relative", check = "equivalent"
)
# Test for the second
microbenchmark::microbenchmark(
  fun2(dat),
  fun2alt(dat), unit = "relative", check = "equivalent"
)
```

The last argument, check = “equivalent”, is included to make sure that the functions return the same result.


