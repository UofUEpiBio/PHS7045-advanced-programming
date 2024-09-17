#include<cmath>
#include<iostream>

class Binom {
private:
    int n;
    double p;

public:
    Binom(int n, double p) : n(n), p(p) {};
    int factorial(int n) const;
    double choose(int a, int b) const;
    double dbinom(int k) const;
    void print(int k) const;
};

inline int Binom::factorial(int n) const {
    if (n == 0) {
        return 1;
    }
    return n * factorial(n - 1);
}

inline double Binom::choose(int a, int b) const {

    double num = static_cast<double>(factorial(a));
    double den = static_cast<double>(
        factorial(b) *
        factorial(a - b)
        );
    return num / den;

}

inline double Binom::dbinom(int k) const {
    return
        choose(this->n, k) *
        std::pow(this->p, k) *
        std::pow(1.0 - this->p, this->n - k);
}

inline void Binom::print(int k) const {
    std::printf(
        "P(Y=%-2d; n=%d, p=%.2f) = %.4f\n",
        k, this->n, this->p, this->dbinom(k)
    );
}

int main() {

    Binom binom(10, 0.5);

    for (int k = 0; k <= 10; k++)
        binom.print(k);
    
    return 0;

}