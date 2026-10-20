#include <iostream>

int factorial(int k) {
  // int: 32 bits (4 bytes), max 2^31 - 1 = 2,147,483,647
  int ans = 1;
  for (int i = 2; i <= k; ++i) ans *= i;
  return ans;
}

int main() {
  for (int k = 10; k <= 14; ++k)
    std::cout << k << "! = " << factorial(k) << std::endl;
  return 0;
}
