f <- function(x, remainder){
  
  # Step 1, add 1 to even elements
  x[x%%2] <- x[x%%2] + 1
  
  # Step 2, see if each value in sequence is even or odd
  out <- x %% remainder
  
  # if(length(unique(out))!= 2) browser()
  
  # Step 2, for elements with 0 remainder, add 1
  x[out == 0] <- x[out == 0] + 1
  
  # Step 3, report number of unique elements
  length(unique(x))

}
f(x=1:10,remainder=3)
