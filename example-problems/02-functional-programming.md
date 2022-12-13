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


