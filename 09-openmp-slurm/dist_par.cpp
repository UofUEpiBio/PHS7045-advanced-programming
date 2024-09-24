#include <omp.h>
#include <RcppArmadillo.h>
using namespace Rcpp;

// [[Rcpp::depends(RcppArmadillo)]]
// [[Rcpp::plugins(openmp)]]

// [[Rcpp::export]]
arma::mat dist_par(const arma::mat & X, int cores = 1) {
  
  // Some constants
  int N = (int) X.n_rows;
  int K = (int) X.n_cols;
  
  // Output
  arma::mat D(N,N);
  D.zeros(); // Filling with zeros
  
  // Setting the cores
  omp_set_num_threads(cores);
  
#pragma omp parallel for shared(D, N, K, X) default(none)
  for (int i=0; i < N; ++i)
  {
    
    for (int j=0; j < i; ++j)
    {
      
      // Computing the distance
      D.at(i,j) = std::sqrt(
        arma::sum(arma::pow(X.row(i) - X.row(j), 2.0))
      );
      
      // Computing square root
      D.at(j,i) = D.at(i,j);
      
    }
    
  }
    
  // My nice distance matrix
  return D;
  
}
