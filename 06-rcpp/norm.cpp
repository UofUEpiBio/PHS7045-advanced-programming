#include <Rcpp.h>

using namespace Rcpp;

// [[Rcpp::export]]
double normRcpp(NumericVector x) {
  
  return sqrt(sum(pow(x, 2.0)));
  
}