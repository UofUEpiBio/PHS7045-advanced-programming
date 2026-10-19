#ifndef BINOM_HPP
#define BINOM_HPP

#include <cmath>
#include <cstdio>

class Binom {
private:
  int n;
  double p;

public:
  // The member-initializer list initializes n and p directly, before the body
  // of the constructor runs. Assigning inside the body instead would first
  // default-initialize them and then overwrite them.
  Binom(int n_, double p_) : n(n_), p(p_) {};
  int factorial(int k) const;
  double choose(int a, int b) const;
  double dbinom(int k) const;
  void print(int k) const;
};

// Exercise 1 ----------------------------------------------------------------
inline int Binom::factorial(int k) const {

  // 0! = 1, and this is also the stopping rule of the recursion.
  if (k <= 1)
    return 1;

  return k * factorial(k - 1);

}

// A loop does the same job and is just as valid here. The recursive version
// mirrors the definition k! = k * (k-1)! and is shorter; the iterative one
// uses a single stack frame instead of one per call. The recursion is not
// tail recursive (the multiplication happens after the inner call returns),
// so the compiler cannot simply rewrite it into a loop.
//
// inline int Binom::factorial(int k) const {
//
//   int result = 1;
//   for (int i = 2; i <= k; ++i)
//     result *= i;
//
//   return result;
//
// }

// Exercise 2 ----------------------------------------------------------------
inline double Binom::choose(int a, int b) const {

  if (b < 0 || b > a)
    return 0.0;

  // Casting to double *before* dividing: otherwise we would be doing
  // integer division.
  return static_cast<double>(factorial(a)) /
    (static_cast<double>(factorial(b)) * static_cast<double>(factorial(a - b)));

}

// Exercise 3 ----------------------------------------------------------------
inline double Binom::dbinom(int k) const {

  if (k < 0 || k > n)
    return 0.0;

  return choose(n, k) * std::pow(p, k) * std::pow(1.0 - p, n - k);

}

// Exercise 4 ----------------------------------------------------------------
inline void Binom::print(int k) const {

  std::printf(
    "P(Y=%-2d; n=%d, p=%.2f) = %.4f\n",
    k, n, p, dbinom(k)
  );

}

#endif
