#include <Rcpp.h>

using namespace Rcpp;

// [[Rcpp::export]]
List ps_match1(const NumericVector & x) {
  
  int n = static_cast<int>(x.size());
  
  IntegerVector indices(n);
  NumericVector values(n);
  
  for (int i = 0; i < n; ++i) {
    
    // Maximum value
    double cur_best = std::numeric_limits< double >::max();
    int cur_i = 0;
    
    for (int j = 0; j < n; ++j) {
      
        // We can't compare to oneself
        if (i == j)
          continue;
          
        // If it is lower, then update
        if (std::abs(x[i] - x[j]) < cur_best) {
          
          cur_best = std::abs(x[i] - x[j]);
          cur_i    = j;
          
        }
          
    }
    
    // In the end, we register the result
    indices[i] = cur_i;
    values[i]  = x[cur_i];
    
  }
  
  return List::create(
    _["match_id"] = indices + 1, // We add one to match R's indices
    _["match_x"]  = values 
  );
  
}

// [[Rcpp::export]]
List ps_match2(const NumericVector & x) {
  
  int n = static_cast<int>(x.size());
  
  IntegerVector indices(n);
  NumericVector values(n);
  
  for (int i = 0; i < n; ++i) {
    
    // Instead of allocating new memory, we can point by reference
    // (saves operations)
    double & cur_best = values[i]; 
    int    & cur_i    = indices[i];
    
    cur_best = std::numeric_limits< double >::max();
    
    cur_i = 0;
    
    for (int j = 0; j < n; ++j) {
      
      // We can't compare to oneself
      if (i == j)
        continue;
      
      // If it is lower, then update
      if (std::abs(x[i] - x[j]) < cur_best) {
        
        cur_best = std::abs(x[i] - x[j]);
        cur_i    = j;
        
      }
      
    }
    
  }
  
  for (int i = 0; i < n; ++i) 
    values[i] = x[indices[i]];
  
  return List::create(
    _["match_id"] = indices + 1, // We add one to match R's indices
    _["match_x"]  = values 
  );
  
}

// [[Rcpp::export]]
List ps_match3(const NumericVector & x) {
  
  int n = static_cast<int>(x.size());
  
  IntegerVector indices(n);
  NumericVector values(n);
  values.fill(std::numeric_limits< double >::max());
  
  for (int i = 0; i < n; ++i) {
    
    // Instead of allocating new memory, we can point by reference
    // (saves operations)
    double & cur_best = values[i]; 
    auto & cur_i    = indices[i];
    
    for (int j = 0; j < i; ++j) {
      
      // If it is lower, then update
      double d = std::abs(x[i] - x[j]);
      if (d < cur_best) {
        
        cur_best = d;
        cur_i    = j;
        
      }
      
      if (d < values[j]) {
        
        values[j] = d;
        indices[j] = i;
        
      }
      
    }
    
  }
  
  for (int i = 0; i < n; ++i) 
    values[i] = x[indices[i]];
  
  return List::create(
    _["match_id"] = indices + 1, // We add one to match R's indices
    _["match_x"]  = values 
  );
  
}


/***R
set.seed(1231)
x <- cbind(runif(5))

ps_matchR <- function(x) {
  
  match_expected <- dist(x) |> as.matrix()
  diag(match_expected) <- .Machine$integer.max
  indices <- apply(match_expected, 1, which.min)
  
  list(
    match_id = as.integer(unname(indices)),
    match_x  = x[indices]
  )
  
}

resR <- ps_matchR(x)
res1 <- ps_match1(x)
res2 <- ps_match2(x)
res3 <- ps_match3(x)

cbind(
  X     = x,
  R     = resR$match_id,
  Rcpp1 = res$match_id,
  Rcpp2 = res2$match_id,
  Rcpp3 = res3$match_id
) |> head()

# Benchmarking
x <- cbind(runif(10000))
bench::mark(
  resR = ps_matchR(x)$match_x,
  res1 = ps_match1(x)$match_x,
  res2 = ps_match2(x)$match_x,
  res3 = ps_match3(x)$match_x,
  relative = TRUE
)
*/
