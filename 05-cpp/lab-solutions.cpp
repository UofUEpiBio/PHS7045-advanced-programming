#include <iostream>

#include "binom.hpp"

int main() {

  Binom b(10, 0.5);

  std::cout << "Exercise 1: factorial" << std::endl;
  for (int i = 1; i <= 10; ++i)
    std::cout << b.factorial(i) << std::endl;

  std::cout << "\nExercise 2: choose" << std::endl;
  for (int i = 1; i <= 10; ++i)
    std::cout << b.choose(10, i) << std::endl;

  std::cout << "\nExercise 3: dbinom" << std::endl;
  for (int i = 0; i <= 10; ++i)
    std::cout << b.dbinom(i) << std::endl;

  std::cout << "\nExercise 4: print" << std::endl;
  for (int i = 0; i <= 10; ++i)
    b.print(i);

  return 0;

}
