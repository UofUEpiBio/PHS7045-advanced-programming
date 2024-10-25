#include <vector>
#include <random> // <1>
int main() {
  
  // Setting the seed
  std::mt19937 rng_engine; // <2>
  rng_engine.seed(123); // <2>
  
  std::uniform_real_distribution<double> dist(-1.0, 1.0); // <3>

  // Number of simulations
  size_t n_sims = 5e6;

  // Defining the data
  double pi_approx = 0.0;
  for (size_t i = 0u; i < n_sims; ++i)
  {

    // Generating a point in the unit square
    double x = dist(rng_engine);
    double y = dist(rng_engine);

    double dist = std::sqrt(
        std::pow(x, 2.0) + std::pow(y, 2.0) // <2>
        );

    // Checking if the point is inside the unit circle 
    if (dist <= 1.0)
      pi_approx += 1.0;

  }

  printf("pi approx to %.4f\n", 4.0*pi_approx/n_sims);

  return 0;

}
