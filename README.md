
# PHS 7045: Advanced Programming

Welcome to Advanced Programming in R and HPC! You can find the syllabus
[here](syllabus.md).

## Contents

| Week | Title                                                                                                                                                                                                                                                                                                          | Lecture                                                                                                                                                 | Lab                                                                                                                                                          |
|-----:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------|
|    1 | Intro to Git (Issue [3](https://github.com/UofUEpiBio/PHS7045-advanced-programming/issues/3)) + [quarto](https://UofUEpiBio.github.io/PHS7045-advanced-programming/quarto.html) ([source](lectures/01-git/quarto.qmd))                                                                                         | [slides](https://UofUEpiBio.github.io/PHS7045-advanced-programming/week-01-slides.html) ([source](lectures/01-git/slides.qmd))                          | [lab](https://UofUEpiBio.github.io/PHS7045-advanced-programming/week-01-lab.html) ([source](labs/01-git/01-git.qmd))                                         |
|    2 | R Essentials (Issue [4](https://github.com/UofUEpiBio/PHS7045-advanced-programming/issues/4)) + [Homework 1](https://UofUEpiBio.github.io/PHS7045-advanced-programming/hw-01-essentialsSimulations.html) ([source](https://UofUEpiBio.github.io/PHS7045-advanced-programming/hw-01-essentialsSimulations.qmd)) | [slides](https://UofUEpiBio.github.io/PHS7045-advanced-programming/week-02-slides.html) ([source](lectures/02-essentials/slides.qmd))                   | [lab](https://UofUEpiBio.github.io/PHS7045-advanced-programming/week-02-lab.html) ([source](labs/02-essentials/02-essentials.qmd))                           |
|    3 | Functions and data.table (Issue [5](https://github.com/UofUEpiBio/PHS7045-advanced-programming/issues/5)) + [Homework 1b (bonus)](https://UofUEpiBio.github.io/PHS7045-advanced-programming/hw-01b-datatable.html) ([source](https://UofUEpiBio.github.io/PHS7045-advanced-programming/hw-01b-datatable.qmd))  | [slides](https://UofUEpiBio.github.io/PHS7045-advanced-programming/week-03-slides.html) ([source](lectures/03-more-functions-and-datatable/slides.qmd)) | [lab](https://UofUEpiBio.github.io/PHS7045-advanced-programming/week-03-lab.html) ([source](labs/03-functions-and-datatable/03-functions-and-datatable.qmd)) |
|    4 | Debugging and profiling (Issue [7](https://github.com/UofUEpiBio/PHS7045-advanced-programming/issues/7))                                                                                                                                                                                                       | [slides](https://UofUEpiBio.github.io/PHS7045-advanced-programming/week-04-slides.html) ([source](lectures/04-debugging-and-profiling/slides.qmd))      | [lab](https://UofUEpiBio.github.io/PHS7045-advanced-programming/week-04-lab.html) ([source](labs/04-debugging-and-profiling/04-debugging-and-profiling.qmd)) |
|    5 | Rcpp (Issue [8](https://github.com/UofUEpiBio/PHS7045-advanced-programming/issues/8))                                                                                                                                                                                                                          | [slides](https://UofUEpiBio.github.io/PHS7045-advanced-programming/week-05-slides.html) ([source](lectures/05-rcpp/slides.qmd))                         | [lab](https://UofUEpiBio.github.io/PHS7045-advanced-programming/week-05-lab.html) ([source](labs/05-rcpp/lab.qmd))                                           |

## Assignment workflow

The course instructors will distribute the materials in a single
compressed file (usually zip) for each assignment. Once the assignment
materials are available, the students are required to do the following:

1.  Download the compressed file and extract its contents into an empty
    folder.

2.  Initialize the folder as a git repository, add its contents, and
    make the first commit.

3.  Create a new repository in Github.com (under your account), and push
    your local repo into it. The name of the repository should be \[name
    of the compressed file\]-\[your GitHub username\]

You can start working on your assignment! We recommend pushing your
changes as much as possible (it is good practice). As soon as you finish
your assignment, you will have to ping one of the instructors in your
commit message, for example:

``` sh
git commit -a -m "Assignment done @gvegayon and @chipmanj"
```

This way @gvegayon and @chipmanj will receive a notification about this
assignment. Furthermore, we encourage you to use other GitHub resources,
such as adding the URL of [GitHub issue]() regarding that assignment,
for example, if you include the following link in your commit message:

    git commit -a -m "Assignment done https://github.com/UofUEpiBio/PHS7045-advanced-programming/issues/17"

Issue \#17 in the PHS7045 website will now include a link to your
commit. A similar thing can be done by cross-referencing an issue; this
is, if you create a new issue in your repository and include the same
link (https://github.com/UofUEpiBio/PM566/issues/17), the issue will be
shown in \#17 as cross-referenced.

## Example

For week \#3, we will distribute a zip file named
`week3-assignment.zip`. Using the command line, you can do all the
previous steps as follows:

``` sh
cd ~
wget github.com/UofUEpiBio/PHS7045-advanced-programming/raw/master/assignments/week3-assignment.zip
unzip week3-assignment.zip -d week3-assignment-gvegayon
cd week3-assignment-gvegayon
git init
git add .
git commit -a -m "Initial commit"
```

You still need to go to Github.com to create the new repository.
Assuming you do that successfully, we continue:

``` sh
git remote add origin git@github.com:gvegayon/week3-assignment-gvegayon.git
git push -u origin master
```

And you are done!
