# Example problems

The following is a list of problems for Advanced Programming.

# Basic difficulty problems

## Given the following matrices `A`, `B`, and C
    
```{r, R.options=list(digits=2)}
set.seed(122)
A <- matrix(rnorm(12), ncol=3)
B <- matrix(rnorm(12), nrow=3)
C <- A %*% cbind(1:3) + rnorm(4) # Adding a vector of length 4!
```
    
Compute
    
  1.  Compute the matrix product between `A` and `B`
  2.  Generate the transpose of `A`
  3.  Merge `A` and `B` by row and by column. 
  3.  Calculate the element-wise product of `A` and the transpose of `B`.
  4.  Calculate The inverse of the cross product of `A`, this is $(A^\mbox{t}\times A)^{-1}$
  5.  Compute $(A^\mbox{t} A)^{-1} A^\mbox{t} C$. How could you do this with a single command in R?


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


# Medium difficulty problems
1.  Create a function to simulate OLS (ordinary least squares) data with the following:
    
    *   An argument `n`: Number of observations to make
    *   An argument `beta`: Coefficient with default value 0.3
    *   An argument `alpha`: Coefficient with default value 4
    *   `X` and the error are N(0, 1)
    *   The function should return both `Y` and `X`
    
    To generate 100 OLS model observations, you can type in
        
    ```r
    X <- rnorm(100)
    Y <- 4 + X*0.3 + rnorm(100)
    ```
    
2.  To make sure you are doing OK, try estimating your model using the `lm`
    function with a large simulation of observations.


# Advanced difficulty problems
## Simulating PI

The following function allows simulating PI

```{r, eval = FALSE}
sim_pi <- function(n = 1000, i = NULL) {
  p <- matrix(runif(n*2), ncol = 2)
  mean(rowSums(p^2) < 1) * 4
}
# Here is an example of the run
set.seed(156)
sim_pi(1000) # 3.132
```

In order to get accurate estimates, we can run this function multiple times, with the following code:

```{r, eval = FALSE}
# This runs the simulation a 4,000 times, each with 10,000 points
set.seed(1231)
system.time({
  ans <- unlist(lapply(1:4000, sim_pi, n = 10000))
  print(mean(ans))
})
```

Rewrite the previous code using `parLapply()` to make it run faster. Make sure you set the seed using `clusterSetRNGStream()`:

```{r, eval = FALSE}
# YOUR CODE HERE
system.time({
  # YOUR CODE HERE
  ans <- # YOUR CODE HERE
  print(mean(ans))
  # YOUR CODE HERE
})
```


