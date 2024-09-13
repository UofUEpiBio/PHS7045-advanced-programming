#include<iostream>
#include "person.hpp"

int main() {
  Person p1; // Default constructor
  Person p2("John", 30, 1.80); // Other constructor

  std::cout << p1.get_name() << std::endl;
  std::cout << p2.get_name() << std::endl;

  return 0;
}