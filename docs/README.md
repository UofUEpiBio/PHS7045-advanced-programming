
# PHS 7045

``` r
# List of pages to be rendered
fns <- read.csv("pages.csv")
print(fns)
```

                            path            urlpath                 name

1 ../lectures/01-git/slides.html slides/week01.html Week 1: Intro to Git

``` r
# Moving the data
for (i in 1:nrow(fns)) {

    file.copy(from = fns$path[i], to = fns$urlpath[i])
    cat(sprintf("-  %s ([link](%s))\n\n", fns$name[i], fns$urlpath[i]))

}
```

- Week 1: Intro to Git ([link](slides/week01.html))
