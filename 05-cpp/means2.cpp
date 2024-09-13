#include<iostream> // To print
#include<vector>   // To use vectors
#include<numeric>  // To use the accumulate function

int main() {

  // Defining the data
  std::vector< double > dat = {1.0, 2.5, 4.4};
  
  // Making room for the output
  double ans = std::accumulate(dat.begin(), dat.end(), 0.0);
  ans /= dat.size();

  // Print out the value to the screen
  printf("The mean of dat is %.2f\n", ans);

  // Returning
  return 0;

}