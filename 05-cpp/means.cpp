#include<iostream> // To print
#include<vector>   // To use vectors

int main() {

  // Defining the data
  std::vector< double > dat = {1.0, 2.5, 4.4};
  
  // Making room for the output
  double ans = 0.0;

  // For-loops have three components:
  // - Starts in i = 0
  // - Until i reaches dat.size() (stops)
  // - Increments i + 1
  for (int i = 0; i < dat.size(); ++i)
    ans = ans + dat[i];

  ans = ans/dat.size();

  // Print out the value to the screen
  std::cout << "The mean of dat is " << ans << std::endl;

  // Returning
  return 0;

}