# Syllabus Advanced Programming<br>(Spring 2024)

ALERT: This syllabus is a draft and is subject to change.

## Description

This course develops students’ ability to write R code to address complex questions that cannot be effectively or efficiently solved with existing R packages. Dealing with such problems often requires using computationally intensive algorithms, requiring sophistication to debug and reduce computing time. Topics covered include writing functions and vectorized programming, debugging, code optimization, parallel computing, C/C++ to R coding, R package creation, command-line programming using Linux, and running jobs on the university’s high-performance computing nodes. Students will learn through seeing (lectures), doing (homework), and teaching (helping one another improve coding). This course is aimed at students with at least moderate proficiency in R programming and/or strong proficiency in another programming language, such as Julia, Python, or C/C++.

## Professors

Jonathan Chipman, Ph.D.  
Assistant Professor  
Division of Biostatistics, Department of Population Health Sciences  
Cancer Biostatistics, Huntsman Cancer Institute  
Email: jonathan.chipman@hci.utah.edu

George Vega Yon, Ph.D.  
Research Assistant Professor  
Division of Epidemiology, Department of Internal Medicine  
Email: george.vegayon@utah.edu

## Locations and Times

Lectures: T/Th 11:30 AM - 1:00 pm  
In-person: 295 CH 3C650
Office hours:
JC, WB 1N452 - Th 2:30 PM - 3:30 PM

## Grading and evaluation

The course will depend heavily on the version control software Git and GitHub for sharing course material and work submissions. We expect students to use dynamic reporting tools such as rmarkdown and quarto. Git, GitHub, and dynamic reporting tools will all be taught during the first sessions of the course.

The course evaluation has four components: class participation, homework assignments, a project midterm (examples [here](https://github.com/UofUEpiBio/PHS7045-advanced-programming/tree/main/projects#example-programming-projects1)), and a final. <span class="underline">Class participation</span> will be measured by lab completion. Students must submit completed labs via GitHub by the Sunday of the instruction week. <span class="underline">Homework assignments</span> will consist of programming problems the student will have to solve and submit as rmarkdown or quarto reports via GitHub. Finally, <span class="underline">midterm and final evaluations</span> will consist of a project where the students should address a programming or computational problem using the tools and methods instructed in this course. Each component weighs into the final grade as follows:

  - Weekly Labs : 15%.

  - Homework Assignments (5) : 9% each for a total of 45%.

  - Midterm project : 20%.

  - Final project : 20%.

Students will present their lab work at least once during the course. There will be <span class="underline">six homework assignments, of which only the top five will be used for the final grade</span>. Besides the written report, <span class="underline">students will present their final project during class</span>. As a general principle, we will grade labs, homework assignments, and projects considering the quality of code documentation, code proficiency and correctness (speed, simplicity, etc.,) and written and oral presentation quality. Details regarding specific evaluation aspects of homework assignments, the midterm project, and the final project will be provided in time. Finally, the grading scale is set as follows:

  - A : 93-100

  - A- : 90-92.9

  - B+ : 88-89.9

  - B : 83-87.9

  - B- : 80-82.9

  - Grades in C - D range are similar to grades in the B range.

  - F : 0-59.9

## Pre-Requisites

Students must be able to write functions and submit homework solutions using R dynamic reporting tools like rmarkdown or quarto. Before the course, students may ask the professor for an example problem to assess their comfort with R programming.

## Contents

The weekly contents are available on the GitHub website of the course [here](README.md#contents).

<!-- TBD
### Part 1 (Weeks 1-8)

  - **Collaboration and reporting tools**: Students will learn how to use version control software (Git) and generate dynamic reports using Rmarkdown. (Week 1)

  - **Fundamentals of R**: We will review data structures, control-flow statements, and large data handling from the software development point of view. (Weeks 2 and 3)

  - **Code debugging and profiling**: Programmers will also learn to debug code (find errors) and identify bottlenecks to speed up their programs. (Week 4)

  - **Incorporating C++ into R**: We will learn how to incorporate C++ code into our R programs to deal with computationally intensive tasks using Rcpp or equivalent. (Week 5)

  - **Simulation and parallel computing**: The program also involves writing simulations and learning to leverage parallel computing for computationally intensive tasks, including embarrassingly parallel computing methods. (Week 6)

  - **R package development**: Students will learn how to write R packages to efficiently encapsulate their functions and routines to facilitate code sharing and stability. (Weeks 7 and 8)

### Midterm (Week 9)

  - You can find some example projects [here]([https://github.com/UofUEpiBio/PHS7045-advanced-programming](https://github.com/UofUEpiBio/PHS7045-advanced-programming/tree/main/projects#example-programming-projects1)).

### Part 2 (Weeks 10-16)

  - **Command-line in Linux**: Part of the course involves becoming familiar with the fundamentals of command-line usage. This involves managing data, using ssh, and other basic operations to work on Linux-based systems. (TBD)

  - **High-performance computing on Slurm cluster**: Students will be taught how to work with the University of Utah’s high-performance computing cluster through the job scheduler Slurm. We will also review alternatives to submit jobs, including the R package slurmR. (TBD)
  
-->

## Readings

  - R Programming for Data Science, 2019. Roger Peng. [<span class="underline">https://bookdown.org/rdpeng/rprogdatascience/</span>](https://bookdown.org/rdpeng/rprogdatascience/)

  - The Art of R Programming, 2009. Norman Matloff. [<span class="underline">https://heather.cs.ucdavis.edu/\~matloff/132/NSPpart.pdf</span>](https://heather.cs.ucdavis.edu/~matloff/132/NSPpart.pdf)

### Supplementary References

  - R for Data Science, 2017 Garrett Grolemund and Hadley Wickham. [<span class="underline">http://r4ds.had.co.nz/</span>](http://r4ds.had.co.nz/)

  - Exploratory Data Analysis with R, 2020 Roger Peng [<span class="underline">https://bookdown.org/rdpeng/exdata/</span>](https://bookdown.org/rdpeng/exdata/)

  - Mastering Software Development in R, 2017 Roger Peng, Sean Kross, Brooke Anderson [<span class="underline">https://bookdown.org/rdpeng/RProgDA/</span>](https://bookdown.org/rdpeng/RProgDA/)

# University and Course Policies

## Americans With Disabilities Act (ADA)

The University of Utah seeks to provide equal access to its programs, services, and activities for people with disabilities.

All written information in this course can be made available in an alternative format with prior notification to the [<span class="underline">Center for Disability & Access</span>](https://disability.utah.edu/) (CDA). CDA will work with you and the instructor to make arrangements for accommodations. Prior notice is appreciated. To read the full accommodations policy for the University of Utah, please see Section Q of the [<span class="underline">Instruction & Evaluation regulations</span>](http://regulations.utah.edu/academics/6-100.php).

In compliance with ADA requirements, some students may need to record course content. Any recordings of course content are for personal use only, should not be shared, and should never be made publicly available. In addition, recordings must be destroyed at the conclusion of the course.

If you will need accommodations in this class, or for more information about what support they provide, contact:

> **Center for Disability & Access**
>   801-581-5020
>   [<span class="underline">disability.utah.edu</span>](disability.utah.edu)
>   65 Student Services Building
>   201 S 1460 E
>   Salt Lake City, UT 84112

## Safety at the U

The University of Utah values the safety of all campus community members. You will receive important emergency alerts and safety messages regarding campus safety via text message. For more safety information and to view available training resources, including helpful videos, visit [<span class="underline">safeu.utah.edu</span>](http://safeu.utah.edu/).

To report suspicious activity or to request a courtesy escort, contact:

> **Campus Police & Department of Public Safety**
> 
> 801-585-COPS (801-585-2677)  
> [<span class="underline">Dps.utah.edu</span>](https://dps.utah.edu/)  
> 1735 E. S. Campus Dr.  
> Salt Lake City, UT 84112

## Addressing Sexual Misconduct

Title IX makes it clear that violence and harassment based on sex and gender (which includes sexual orientation and gender identity/expression) is a civil rights offense subject to the same kinds of accountability and the same kinds of support applied to offenses against other protected categories such as race, national origin, color, religion, age, status as a person with a disability, veteran’s status, or genetic information.

If you or someone you know has been harassed or assaulted, you are encouraged to report it to university officials: 

> **Title IX Coordinator & Office of Equal Opportunity and Affirmative Action**
>   801-581-8365
>   [<span class="underline">oeo.utah.edu</span>](oeo.utah.edu)
>   135 Park Building
>   201 Presidents' Cir.
>   Salt Lake City, UT 84112

> **Office of the Dean of Students**
>   801-581-7066
>   [<span class="underline">deanofstudents.utah.edu</span>](deanofstudents.utah.edu)
>   270 Union Building
>   200 S. Central Campus Dr.
>   Salt Lake City, UT 84112

To file a police report, contact:

> **Campus Police & Department of Public Safety**
>   801-585-COPS (801-585-2677)
>   [<span class="underline">dps.utah.edu</span>](dps.utah.edu)
>   1735 E. S. Campus Dr.
>   Salt Lake City, UT 84112

If you do not feel comfortable reporting to authorities, the U's Victim-Survivor Advocates provide free, confidential, and trauma-informed support services to students, faculty, and staff who have experienced interpersonal violence.

To privately explore options and resources available to you with an advocate, contact:

> **Center for Student Wellness**
>   801-581-7776
> [<span class="underline">wellness.utah.edu</span>](wellness.utah.edu)
>   328 Student Services Building
>   201 S. 1460 E.
>   Salt Lake City, UT 84112

## Academic Misconduct

It is expected that students comply with University of Utah policies regarding academic honesty, including but not limited to refraining from cheating, plagiarizing, misrepresenting one’s work, and/or inappropriately collaborating. This includes the use of generative artificial intelligence (AI) tools without citation, documentation, or authorization. Students are expected to adhere to the prescribed professional and ethical standards of the profession/discipline for which they are preparing. Any student who engages in academic dishonesty or who violates the professional and ethical standards for their profession/discipline may be subject to academic sanctions as per the [<span class="underline">University of Utah’s Student Code: Policy 6-410: Student Academic Performance, Academic Conduct, and Professional and Ethical Conduct</span>](https://regulations.utah.edu/academics/6-410.php).

Plagiarism and cheating are serious offenses and may be punished by failure on an individual assignment, and/or failure in the course. Academic misconduct, according to the University of Utah Student Code:

“...Includes, but is not limited to, cheating, misrepresenting one’s work, inappropriately collaborating, plagiarism, and fabrication or falsification of information…It also includes facilitating academic misconduct by intentionally helping or attempting to help another to commit an act of academic misconduct.”

For details on plagiarism and other important course conduct issues, see the U's [<span class="underline">Code of Student Rights and Responsibilities<\span>](http://regulations.utah.edu/academics/6-400.php).


## Drop/Withdrawal Policies

Students may drop courses within the first two weeks of a semester
without penalties.

Students may officially withdraw (W) from a class or all classes after
the drop deadline through the midpoint of a course. A “W” grade is
recorded on the transcript, and appropriate tuition/fees are assessed.
The grade “W” is not used in calculating the student’s GPA.

For deadlines to withdraw from full-term, first, and second-session
classes, see the U's [<span class="underline">Academic
Calendar</span>](https://registrar.utah.edu/academic-calendars/index.php).


## Further policies

For additional University policies, please refer to: [<span class="underline">https://cte.utah.edu/instructor-education/syllabus/optional-additions.php</span>](https://cte.utah.edu/instructor-education/syllabus/optional-additions.php)
