#include <cstdio>

void set_x_copy(int x, int y) {x = y;};
void set_x(int * x, int y) {*x = y;};
void set_x_ref(int & x, int y) {x = y;};
// This would generate an error
// void set_x_ref(const int & x, int y) {x = y;};

int main() {

    int x = 0;

    set_x_copy(x, 3);
    std::printf("x = %d\n", x);

    set_x(&x, 2);
    std::printf("x = %d\n", x);

    set_x_ref(x, 1);
    std::printf("x = %d\n", x);

    return 0;

}