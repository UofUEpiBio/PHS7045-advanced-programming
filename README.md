

# PHS 7045: Advanced Programming

Welcome to Advanced Programming in R and HPC! You can find the syllabus
[here](syllabus.md). Readings for the week can be found in the GitHub
issues associated with them.

## Contents

| Week | Title | Lecture | Lab |
|:---|:---|:---|:---|
| 8/20 and 8/22 | Intro to Git + Intro to classes + [quarto](https://UofUEpiBio.github.io/PHS7045-advanced-programming/quarto.html) ([source](lectures/01-git/quarto.qmd)) | [slides](https://UofUEpiBio.github.io/PHS7045-advanced-programming/01-git/slides.html) ([source](https://github.com/UofUEpiBio/PHS7045-advanced-programming//tree/main/01-git/slides.qmd)) | [lab](https://UofUEpiBio.github.io/PHS7045-advanced-programming/01-git/lab.html) ([source](https://github.com/UofUEpiBio/PHS7045-advanced-programming//tree/main/01-git/lab.qmd)) |
| 8/27 and 8/29 | R Essentials + [Homework 1](https://UofUEpiBio.github.io/PHS7045-advanced-programming/homeworks/hw-01-essentialsSimulations.html) ([source](https://UofUEpiBio.github.io/PHS7045-advanced-programming/homeworks/hw-01-essentialsSimulations.qmd)) | [slides](https://UofUEpiBio.github.io/PHS7045-advanced-programming/02-essentials/slides.html) ([source](https://github.com/UofUEpiBio/PHS7045-advanced-programming//tree/main/02-essentials/slides.qmd)) | [lab](https://UofUEpiBio.github.io/PHS7045-advanced-programming/02-essentials/lab.html) ([source](https://github.com/UofUEpiBio/PHS7045-advanced-programming//tree/main/02-essentials/lab.qmd)) |
| 9/03 and 9/5 | Debugging and profiling | [slides](https://UofUEpiBio.github.io/PHS7045-advanced-programming/04-debugging-and-profiling/slides.html) ([source](https://github.com/UofUEpiBio/PHS7045-advanced-programming//tree/main/04-debugging-and-profiling/slides.qmd)) | [lab](https://UofUEpiBio.github.io/PHS7045-advanced-programming/04-debugging-and-profiling/lab.html) ([source](https://github.com/UofUEpiBio/PHS7045-advanced-programming//tree/main/04-debugging-and-profiling/lab.qmd)) |
| 9/10 and 9/12 | Functions and data.table + [Homework 2](https://UofUEpiBio.github.io/PHS7045-advanced-programming/hw-01b-datatable.html) ([source](https://UofUEpiBio.github.io/PHS7045-advanced-programming/hw-01b-datatable.qmd)) |  | [lab](https://UofUEpiBio.github.io/PHS7045-advanced-programming/03-more-functions-and-datatable/lab.html) ([source](https://github.com/UofUEpiBio/PHS7045-advanced-programming//tree/main/03-more-functions-and-datatable/lab.qmd)) |
| 9/17 and 9/19 | Introduction to C++ + Homework 3 (C++), Deliver a paragraph in abstract mode describing their projects for the midterm. |  |  |
| 9/24 and 9/26 | C++ in R | [slides](https://UofUEpiBio.github.io/PHS7045-advanced-programming/05-rcpp/slides.html) ([source](https://github.com/UofUEpiBio/PHS7045-advanced-programming//tree/main/05-rcpp/slides.qmd)) | [lab](https://UofUEpiBio.github.io/PHS7045-advanced-programming/05-rcpp/lab.html) ([source](https://github.com/UofUEpiBio/PHS7045-advanced-programming//tree/main/05-rcpp/lab.qmd)) |
| 10/01 and 10/03 | Parallel Computing |  | [lab](https://UofUEpiBio.github.io/PHS7045-advanced-programming/06-parallel-computing/lab.html) ([source](https://github.com/UofUEpiBio/PHS7045-advanced-programming//tree/main/06-parallel-computing/lab.qmd)) |
| 10/08 and 10/10 | Fall Break |  |  |
| 10/15 and 10/17 (presentations) | Midterm project |  |  |
| 10/22 and 10/24 | UofU’s CHPC + Homework 4 (Slurm) |  |  |
| 10/29 and 10/31 | Slurm |  |  |
| 11/05 and 11/07 | R packages I | [slides](https://UofUEpiBio.github.io/PHS7045-advanced-programming/07-rpkgs-i/slides.html) ([source](https://github.com/UofUEpiBio/PHS7045-advanced-programming//tree/main/07-rpkgs-i/slides.qmd)) | [lab](https://UofUEpiBio.github.io/PHS7045-advanced-programming/07-rpkgs-i/lab.html) ([source](https://github.com/UofUEpiBio/PHS7045-advanced-programming//tree/main/07-rpkgs-i/lab.qmd)) |
| 11/12 and 11/14 | R packages II | [slides](https://UofUEpiBio.github.io/PHS7045-advanced-programming/07-rpkgs-i/slides.html) ([source](https://github.com/UofUEpiBio/PHS7045-advanced-programming//tree/main/07-rpkgs-i/slides.qmd)) | [lab](https://UofUEpiBio.github.io/PHS7045-advanced-programming/07-rpkgs-i/lab.html) ([source](https://github.com/UofUEpiBio/PHS7045-advanced-programming//tree/main/07-rpkgs-i/lab.qmd)) |
| 11/19 and 11/21 | Automatic Reports with GitHub Actions |  |  |
| 11/26 and 11/28 (off) | More practice with slurm (and netplot) |  |  |
| 12/03 and 12/05 | Final Prep (Hackathon) |  |  |
| 12/12 | Final |  |  |

## Assignment workflow

Assignment materials will be distributed in a single compressed file
(usually zip) for each assignment. Once the assignment materials are
available, the students are required to do the following:

1.  Download the compressed file and extract its contents into an empty
    folder.

2.  Initialize the folder as a git repository, add its contents, and
    make the first commit.

3.  Create a new repository in Github.com (under your account) and push
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
