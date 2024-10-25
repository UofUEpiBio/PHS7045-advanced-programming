#include<iostream>

template<typename T>
class MyAdder {
private:
  T x;
  T y;
public:
  MyAdder(T x, T y) : x(x), y(y) {};

  T add() {
    return x + y;
  };
};

int main() {
  MyAdder<int> a(1, 2);
  MyAdder<double> b(1.0, 2.0);

  std::cout << a.add() << std::endl;
  std::cout << b.add() << std::endl;

  return 0;
}