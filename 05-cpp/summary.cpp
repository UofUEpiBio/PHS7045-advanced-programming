#include "summary.hpp"

int main() {
    // Some data
    std::vector< double > dat = {1.0, 2.5, 4.4};
    std::vector< int > dat2 = {1, 2, 3, 4, 5};

    // Summarize the data
    Summarizer<double> s_double(dat);
    s_double.print();

    Summarizer<int> s_int(dat2);
    s_int.print();

    return 0;

}
