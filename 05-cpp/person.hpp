#ifndef PERSON_HPP
#define PERSON_HPP

#include<string>
#include<iostream>

class Person {
private: // <1>
    std::string name;
    int age;
    double height;

public: // <2>
  // Constructor
  Person(std::string n, int a, double h) { // <3>
    name = n;
    age = a;
    height = h;
  };

  // Default constructor
  Person() : name("Unknown"), age(0), height(0.0) {}; // <3>

  // Destructor
  ~Person() { // <4>
    std::cout <<
      this->name + " destroyed" <<
      std::endl;
  };

  // Getters and setters
  std::string get_name() { return name; };    // <5>
  void set_name(std::string n) { name = n; }; // <5>
};

#endif