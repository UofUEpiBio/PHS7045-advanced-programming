#ifndef SUMMARY_HPP
#define SUMMARY_HPP

#include <vector>
#include <numeric>
#include <cmath>
#include <cstdio>

template<typename T>
class Summarizer {
private:
    const std::vector<T>* dat = nullptr;
    double n;

public:
    // Constructors
    Summarizer(const std::vector<T> & dat_);

    // Calculators
    double mean() const;
    double sd() const;
    T min() const;
    T max() const;

    // Printer
    void print() const;
    
};

template<typename T>
inline Summarizer<T>::Summarizer(const std::vector<T> & dat_) {
    dat = &dat_;
    n = dat->size();
};

template<typename T>
inline double Summarizer<T>::mean() const {
    return std::accumulate(
        dat->begin(), dat->end(), 0.0
        ) / n;
};

template<typename T>
inline double Summarizer<T>::sd() const {
    double m = mean();
    double sum = 0.0;
    for (std::size_t i = 0u; i < dat->size(); ++i)
        sum += std::pow((*dat)[i] - m, 2.0);
    return std::sqrt(sum / (dat->size() - 1));
};

template<typename T>
inline T Summarizer<T>::min() const {
    T min = (*dat)[0];
    for (std::size_t i = 1u; i < dat->size(); ++i)
        if ((*dat)[i] < min)
            min = (*dat)[i];
    return min;
};

template<typename T>
inline T Summarizer<T>::max() const {
    T max = (*dat)[0];
    for (std::size_t i = 1u; i < dat->size(); ++i)
        if ((*dat)[i] > max)
            max = (*dat)[i];
    return max;
};

template<>
inline void Summarizer<double>::print() const {
    std::printf("Summary for double data\n");
    std::printf("Mean : %.2f\n", mean());
    std::printf("SD   : %.2f\n", sd());
    std::printf("Min  : %.2f\n", min());
    std::printf("Max  : %.2f\n", max());
};

template<>
inline void Summarizer<int>::print() const {
    std::printf("Summary for int data\n");
    std::printf("Mean : %.2f\n", mean());
    std::printf("SD   : %.2f\n", sd());
    std::printf("Min  : %d\n", min());
    std::printf("Max  : %d\n", max());
};

#endif