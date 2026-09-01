# PHS 7045: Advanced Programming

## Fall 2026 syllabus

## Course description

This course develops students' ability to write R code to address complex questions that cannot be effectively or efficiently solved with existing R packages. Dealing with such problems often requires computationally intensive algorithms and the ability to debug code and reduce computing time. Topics include functional and object-oriented programming, debugging and profiling, C/C++ integration with R, parallel computing, command-line programming in Linux, high-performance computing with Slurm, R package development, automated reporting, and the efficient and ethical use of artificial intelligence (AI) in coding and research. Students will learn through seeing (lectures), doing (labs and homework), and teaching (helping one another improve code).

## Course outcomes and objectives

By the end of this course, students will be able to:

- Use Git, GitHub, Quarto, or R Markdown to develop and communicate reproducible computational work.
- Design, write, document, and evaluate R programs using functions, classes, and functional programming techniques.
- Debug and profile code, identify performance bottlenecks, and make evidence-based improvements.
- Integrate C++ with R and select appropriate serial or parallel approaches for computationally intensive problems.
- Use Linux, the University of Utah's high-performance computing resources, and Slurm to run and manage computational jobs.
- Develop reusable R packages and automated research-reporting workflows.
- Direct AI tools effectively and ethically, critically evaluate their output, and document their use transparently while retaining the ability to write and reason about code independently.

## Instructors

| Instructor | Contact | Office hours |
|---|---|---|
| George G. Vega Yon, Ph.D. | [george.vegayon@utah.edu](mailto:george.vegayon@utah.edu) | By appointment |
| Thi-Mui Pham, Ph.D. | [u6045188@utah.edu](mailto:u6045188@utah.edu) | By appointment |

## Meeting information

| Meeting information | Details |
|---|---|
| Days | Tuesdays and Thursdays |
| Time | 11:30AM -- 1:00PM |
| Location | Williams building, Lupine conference room |

## Prerequisites

Students must be able to write functions and submit solutions using an R dynamic-reporting tool such as R Markdown or Quarto. Students should have at least moderate proficiency in R and/or strong proficiency in another programming language, such as Julia, Python, C, or C++. Before the course, students may ask either instructor for an example problem to assess their readiness.

## Course requirements and evaluation

The course will depend heavily on Git and GitHub for sharing course material and submitting work. Students will also use dynamic-reporting tools such as R Markdown and Quarto. These tools will be introduced during the first sessions of the course.

Evaluation has four components: weekly labs, homework assignments, a midterm project, and a final project. Class participation will be measured through lab completion. Unless an assignment states otherwise, completed labs must be submitted through GitHub by the Sunday of the corresponding instructional week. Homework will consist of programming problems submitted as R Markdown or Quarto reports. For the midterm and final projects, students will address a programming or computational problem using methods taught in the course. [Example programming projects are available here](https://github.com/UofUEpiBio/PHS7045-advanced-programming/tree/main/projects#example-programming-projects1).

| Component | Weight |
|---|---:|
| Weekly labs | 15% |
| Homework assignments (highest five of six, 9% each) | 45% |
| Midterm project | 20% |
| Final project | 20% |

Students will present their lab work at least once during the course and will present their final project in class. Work will be evaluated based on code documentation, proficiency and correctness (including speed and simplicity where applicable), and the quality of written and oral presentations. Assignment-specific criteria and rubrics will be provided with each assignment.

### Midterm and final scheduling

The preliminary schedule below includes planned dates for the midterm and final activities. A student who anticipates a conflict or needs to request a change should contact the instructors as early as possible. Any adjustment must be discussed with and confirmed by **both instructors** before it takes effect.

## Use of artificial intelligence

The use of AI is encouraged and required in this course. We will explore efficient and ethical ways to use AI for both programming and research. Because this is a programming course, students must also be able to write and explain code on their own, reason critically about computational problems, and independently evaluate AI-generated output for correctness, quality, bias, security, reproducibility, and appropriate attribution.

Students are fully responsible for any work they submit, including work produced with AI assistance. They must be transparent about how they use AI throughout the course. Assignment or evaluation instructions may require students to submit the prompts, relevant AI outputs, revisions, and/or a brief description of how AI contributed to the work. AI use is authorized only within the boundaries of the applicable course and assignment instructions; undisclosed or misrepresented AI use may be treated as academic misconduct.

## Grading scale

| Grade | Percentage |
|---|---:|
| A | 93 to 100 |
| A- | 90 to <93 |
| B+ | 87 to <90 |
| B | 83 to <87 |
| B- | 80 to <83 |
| C+ | 77 to <80 |
| C | 73 to <77 |
| C- | 70 to <73 |
| D+ | 67 to <70 |
| D | 63 to <67 |
| D- | 60 to <63 |
| E | Below 60 |

## Required and recommended readings

No required textbook is currently specified. Recommended readings include:

- Roger Peng, *R Programming for Data Science* (2019): [https://bookdown.org/rdpeng/rprogdatascience/](https://bookdown.org/rdpeng/rprogdatascience/)
- Norman Matloff, *The Art of R Programming* (2009): [PDF](https://heather.cs.ucdavis.edu/~matloff/132/NSPpart.pdf)
- Garrett Grolemund and Hadley Wickham, *R for Data Science* (2017): [https://r4ds.had.co.nz/](https://r4ds.had.co.nz/)
- Roger Peng, *Exploratory Data Analysis with R* (2020): [https://bookdown.org/rdpeng/exdata/](https://bookdown.org/rdpeng/exdata/)
- Roger Peng, Sean Kross, and Brooke Anderson, *Mastering Software Development in R* (2017): [https://bookdown.org/rdpeng/RProgDA/](https://bookdown.org/rdpeng/RProgDA/)

In addition, the following books by Dr. Vega Yon are recommended:

- Vega Yon, *AI for the Scientist in a Hurry* (2026): [https://book-ai.ggvy.cl](https://book-ai.ggvy.cl)
- Vega Yon, *Applied HPC with R* (2026): [https://book-hpc.ggvy.cl](https://book-hpc.ggvy.cl)

## Course schedule

The current course schedule is subject to change. Students will be notified of any changes in class and via email. The schedule below includes planned dates for the midterm and final activities. A student who anticipates a conflict or needs to request a change should contact the instructors as early as possible. Any adjustment must be discussed with and confirmed by **both instructors** before it takes effect.

| Dates | Meetings and topics |
|---|---|
| Aug. 25 and 27 | Course introduction and AI; how to use AI in the course |
| Sept. 1 and 3 | Introduction to Git; introduction to R classes |
| Sept. 8 and 10 | Functional programming |
| Sept. 15 and 17 | Debugging and profiling |
| Sept. 22 and 24 | Introduction to C++ |
| Sept. 29 and Oct. 1 | C++ in R |
| Oct. 6 and 8 | Parallel computing |
| Oct. 13 and 15 | Fall Break - no class |
| Oct. 20 and 22 | Bonus AI topics; Ollama |
| Oct. 27 and 29 | Midterm project hackathon and lightning presentations |
| Nov. 3 and 5 | University of Utah CHPC introduction and coding agents |
| Nov. 10 and 12 | Slurm and additional Slurm practice |
| Nov. 17 and 19 | R packages I |
| Nov. 24 and 26 | Topic TBD; Thanksgiving recess on Nov. 26 |
| Dec. 1 and 3 | Automatic reports with GitHub Actions; Dec. 3 topic TBD |
| Dec. 8 and 10 | Final project preparation hackathon |
| Dec. 15 and 17 | Final project activities |

# University and course policies

The current University of Utah mandatory syllabus policies are maintained by the [Martha Bradley Evans Center for Teaching Excellence](https://cte.utah.edu/instructor-education/syllabus/institutional-policies.php). The summaries and contact information below should be read together with that official source.

## Americans With Disabilities Act (ADA)

The University of Utah seeks to provide equal access to its programs, services, and activities for people with disabilities.

All written information in this course can be made available in an alternative format with prior notification to the [<span class="underline">Center for Disability & Access</span>](https://disability.utah.edu/) (CDA). CDA will work with you and the instructor to make arrangements for accommodations. Prior notice is appreciated. To read the full accommodations policy for the University of Utah, please see Section Q of the [<span class="underline">Instruction & Evaluation regulations</span>](http://regulations.utah.edu/academics/6-100.php).

In compliance with ADA requirements, some students may need to record course content. Any recordings of course content are for personal use only, should not be shared, and should never be made publicly available. In addition, recordings must be destroyed at the conclusion of the course.

If you will need accommodations in this class, or for more information about what support they provide, contact:

> **Center for Disability & Access**  
>   801-581-5020  
>   [disability.utah.edu](https://disability.utah.edu/)<br>
>   65 Student Services Building  
>   201 S 1460 E  
>   Salt Lake City, UT 84112  

## Safety at the U

The University of Utah values the safety of all campus community members. You will receive important emergency alerts and safety messages regarding campus safety via text message. For more safety information and to view available training resources, including helpful videos, visit [<span class="underline">safeu.utah.edu</span>](http://safeu.utah.edu/).

To report suspicious activity or to request a courtesy escort, contact:

> **Campus Police & Department of Public Safety**  
> 801-585-COPS (801-585-2677)  
> [dps.utah.edu](https://dps.utah.edu/)<br>
> 1735 E. S. Campus Dr.  
> Salt Lake City, UT 84112

## Addressing Sexual Misconduct

Title IX makes it clear that violence and harassment based on sex and gender (which includes sexual orientation and gender identity/expression) is a civil rights offense subject to the same kinds of accountability and the same kinds of support applied to offenses against other protected categories such as race, national origin, color, religion, age, status as a person with a disability, veteran’s status, or genetic information.

If you or someone you know has been harassed or assaulted, you are encouraged to report it to university officials: 

> **Title IX Coordinator & Office of Equal Opportunity and Affirmative Action**  
>   801-581-8365  
>   [oeo.utah.edu](https://oeo.utah.edu/)<br>
>   135 Park Building  
>   201 Presidents' Cir.  
>   Salt Lake City, UT 84112  

> **Office of the Dean of Students**  
>   801-581-7066  
>   [deanofstudents.utah.edu](https://deanofstudents.utah.edu/)<br>
>   270 Union Building  
>   200 S. Central Campus Dr.  
>   Salt Lake City, UT 84112  

To file a police report, contact:

> **Campus Police & Department of Public Safety**  
>   801-585-COPS (801-585-2677)  
>   [dps.utah.edu](https://dps.utah.edu/)<br>
>   1735 E. S. Campus Dr.  
>   Salt Lake City, UT 84112  

If you do not feel comfortable reporting to authorities, the U's Victim-Survivor Advocates provide free, confidential, and trauma-informed support services to students, faculty, and staff who have experienced interpersonal violence.

To privately explore options and resources available to you with an advocate, contact:

> **Center for Student Wellness**  
>   801-581-7776  
>   [wellness.utah.edu](https://wellness.utah.edu/)<br>
>   328 Student Services Building  
>   201 S. 1460 E.  
>   Salt Lake City, UT 84112  

## Academic Misconduct

It is expected that students comply with University of Utah policies regarding academic honesty, including but not limited to refraining from cheating, plagiarizing, misrepresenting one’s work, and/or inappropriately collaborating. This includes the use of generative artificial intelligence (AI) tools without citation, documentation, or authorization. Students are expected to adhere to the prescribed professional and ethical standards of the profession/discipline for which they are preparing. Any student who engages in academic dishonesty or who violates the professional and ethical standards for their profession/discipline may be subject to academic sanctions as per the [<span class="underline">University of Utah’s Student Code: Policy 6-410: Student Academic Performance, Academic Conduct, and Professional and Ethical Conduct</span>](https://regulations.utah.edu/academics/6-410.php).

Plagiarism and cheating are serious offenses and may be punished by failure on an individual assignment, and/or failure in the course. Academic misconduct, according to the University of Utah Student Code:

“...Includes, but is not limited to, cheating, misrepresenting one’s work, inappropriately collaborating, plagiarism, and fabrication or falsification of information…It also includes facilitating academic misconduct by intentionally helping or attempting to help another to commit an act of academic misconduct.”

For details on plagiarism and other important course conduct issues, see the U's [Code of Student Rights and Responsibilities](https://regulations.utah.edu/academics/6-400.php).


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
