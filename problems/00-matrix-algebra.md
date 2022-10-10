
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


