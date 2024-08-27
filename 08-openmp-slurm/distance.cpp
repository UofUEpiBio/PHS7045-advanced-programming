#include <omp.h>
#include <RcppArmadillo.h>

// [[Rcpp::plugins(openmp)]]
// [[Rcpp::depends(RcppArmadillo)]]
using namespace Rcpp;


//' Fourth order biweight kernel
// [[Rcpp::export]]
arma::mat K4B_v1(
    arma::mat X,
    arma::mat Y,
    arma::vec h
) {
  
  arma::uword n_n = X.n_rows;
  arma::uword n_m = Y.n_cols;
  arma::mat Nhat(n_n, n_m);
  arma::vec Dhat(n_n);
  arma::mat Yhat(n_n, n_m);
  
  for (arma::uword i = 0; i < n_n; ++i)
  {
    
    const auto xrow_i = X.row(i);
    for (arma::uword j = 0; j < i; ++j)
    {
      
      arma::vec Dji_h = (X.row(j) - xrow_i) / h;
      auto Dji_h2 = arma::pow(Dji_h, 2.0);
      
      double Kji_h = prod(
        (arma::abs(Dji_h) < 1) %
          (1.0 - 3.0 * Dji_h2) %
          arma::pow(1.0 - Dji_h2, 2.0) * 105.0 / 64.0
      );
      
      Dhat(i) += Kji_h;
      Dhat(j) += Kji_h;
      
      Nhat.row(i) += Y.row(j) * Kji_h;
      Nhat.row(j) += Y.row(i) * Kji_h;
      
    }
    
  }
  
  for (size_t i = 0u; i < n_n; ++i)
  {
    if (Dhat(i) != 0)
      Yhat.row(i) = Nhat.row(i)/Dhat(i);
  }
  
  return(Yhat);
  
}

// [[Rcpp::export]]
arma::mat K4B_v2(
    const arma::mat & X,
    const arma::mat & Y,
    arma::vec h,
    int ncores
) {
  
  const arma::uword n_n = X.n_rows;
  const arma::uword n_m = Y.n_cols;
  arma::mat Nhat(n_n, n_m);
  arma::vec Dhat(n_n);
  arma::mat Yhat(n_n, n_m);
  
  #ifdef _OPENMP
    omp_set_num_threads(ncores);
  #endif
  
  #pragma omp parallel for shared(Nhat, Dhat, Yhat, X, Y) default(none) \
    firstprivate(n_n, h)
  for (arma::uword i = 0; i < n_n; ++i)
  {
    
    const auto xrow_i = X.row(i);
    for (arma::uword j = 0; j < n_n; ++j)
    {
      
      // Not on self
      if (i == j)
        continue;
      
      arma::vec Dji_h = (X.row(j) - xrow_i) / h;
      auto Dji_h2 = arma::pow(Dji_h, 2.0);
      
      double Kji_h = prod(
        (arma::abs(Dji_h) < 1) %
          (1.0 - 3.0 * Dji_h2) %
          arma::pow(1.0 - Dji_h2, 2.0) * 105.0 / 64.0
      );
      
      Dhat(i) += Kji_h;
      // Dhat(j) += Kji_h;
      
      Nhat.row(i) += Y.row(j) * Kji_h;
      // Nhat.row(j) += Y.row(i) * Kji_h;
      
      
    }
    
  }
  
  for (size_t i = 0u; i < n_n; ++i)
  {
    if (Dhat(i) != 0)
      Yhat.row(i) = Nhat.row(i)/Dhat(i);
  }
  
  return(Yhat);
  
}

/** *R

set.seed(1231)
n <- 1000

Y <- matrix(rnorm(n * n), ncol = k)
X <- cbind(rnorm(n))
h <- NWcv_K4B_rcpp(X, Y, 2)

res <- microbenchmark::microbenchmark(
  K4B_v1(X, Y, 2),
  K4B_v2(X, Y, 2, 4),
  K4B_v2(X, Y, 2, 8),
  check = "equal"
  )

boxplot(res, unit = "ms")
print(res, unit = "relative")


*/