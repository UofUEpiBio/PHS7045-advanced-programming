**Advanced Programming in R and the CHPC**

**Spring 2023**

## Description:

This course develops students’ ability to write R scripts which address
complex questions that cannot be otherwise addressed with existing R
packages. The nature of these scripts are often intensive and require
sophistication to debug and increase the efficiency of run time. Topics
covered include: functions and vectorized programming, debugging and
code optimization, parallel computing, C/C++ to R coding, R package
creation, the linux environment, and running jobs on the university’s
high performance computing nodes. Students will learn through seeing
(lectures), doing (homeworks), and teaching (helping one another improve
coding). This course is aimed for students with at least moderate
proficiency in R programming and/or strong proficiency in another
programming language such as Python and C/C++.

## Professor:

> Jonathan Chipman, PhD
> 
> Assistant Professor
> 
> Division of Biostatistics, Department of Population Health Sciences
> 
> Cancer Biostatistics, Huntsman Cancer Institute
> 
> Phone: (317) 385-3348
> 
> Email: jonathan.chipman@hci.utah.edu

## Tentative Guest Lecturers:

George Vega Yon

Andrew Redd

Anita Orendt

Julia Silge

Rebecca Barter – R package creation (starts mid-December)

## Locations and Times

Lectures: T/Th 3-4:30pm

In-person: TBD

Office hours: TBD

## Pre-Requisites: Students must be able to
write their own functions and submit homework solutions in R markdown or
latex. Prior to the course, students may ask the professor for an
example problem to assess their comfort with R programming.

## Required Materials:

*TARP: The Art of R Programming: A Tour of Statistical Software Design.
Norman Matloff*

## Course structure:

## Course objectives:

1)  Write R functions to use in conjunction with vectorization (rather
    than using for loops)

2)  Learn local-machine parallel computing methods

3)  Be able to degub and optimize scripts
    
    1.  Know the debugger functions
    
    2.  Know the Rprof function

4)  Write complex scripts / algorithms
    
    3.  Newton-Raphson convergence
    
    4.  Expectation Maximization

5)  Know the CHPC environment
    
    5.  Linux and vim
    
    6.  Available help
    
    7.  Cluster usage

6)  Submit a job to CHPC using a SLURM script
    
    8.  Know difference in job parameter settings
    
    9.  Know how to parallel jobs and collate results

## Course content: Rough/tentative schedule

At home readings of basics

In class advanced

Week 1: Class introduction and document preparation

  - Syllabus and schedule

  - Github: Reproducible code and version control

  - Quarto: Document preparation
    
      - Students can choose options for collating if desired (such as
        bookdown)

Week 2: R Essentials

  - At home reading:
    
      - Classes: Vectors (Chapter 2), Matrices and Arrays (Chapter 3),
        Lists (Chapter 4), Data Frames (Chapter 5)
    
      - Set operations (Chapter 8)

  - In Class:
    
      - Handling matrixes that are out of memory
    
      - data.table
    
      - Matrixes and arrays more efficient than data frames
    
      - Lists great tools for simulations and holding differently
        structured data

  - String manipulation (Chapter 11)
    
      - Control structures (Chapter 7)

  - Writing and calling functions (Chapter 7)

Week 3: Exploiting R functions for intensive scripts

  - Split, apply and combine;

  - Top-down design and scoping (Chapter 7),

  - Simulations (Chapter 8)

Week 4: Optimization

  - Debugging (Chapter 13)

  - Vectorizing code (Chapter 14)

  - Parallel R (Chapter 16)

Week 5: Rccp

  - Writing C/C++ to be called from R (Chapter 15)

  - Guest lecture: George Vega Yon

Week 6-7: Algorithms and teaching each other

  - Guest lecture: George Vega Yon – Phylogenetics and tree pruning

  - Expectation Maximization

  - Newton-Raphson convergence

R-Package creation

Week 8: Intro to CHPC

  - Lecture 1:
    
      - Guest lecture: Anita Orendt – Intro to Linux and
    
      - vim

  - Lecture 2: slurm

Week 9: Intro to CHPC and SLURM scripts

  - Guest lecture: Anita Orendt -- CHPC environment

  - SLURM

Weeks 10-12: Example SLURM calls

  - Guest lecture: Andrew Redd

  - Examples from research

Week 13: Student examples

  - Presentations

  - Improvements

Week 14: slurmR

  - Guest lecture: George Vega Yon

Week 15: Work on final project in class

Week 16: Presentations

## Grading

TBD

**COVID-19 Campus Guidelines**

You can remain current with the University’s policies on COVID-19 here:
<https://coronavirus.utah.edu/> As of August 1, there are no
requirements for proof of COVID-19 vaccination for students and faculty,
and no requirements for masks and face coverings on UU campus. However,
I would like us each to consider how we can best protect ourselves, our
colleagues, and our broader community from COVID-19.

> ***Vaccinations:*** I strongly encourage everyone to get vaccinated if
> they have not done so already. This is the single most powerful way
> that you can protect yourself, your friends/families and to keep the
> virus from mutating. [Free
> vaccinations](https://alert.utah.edu/covid/vaccine/) are available on
> campus.
> 
> ***Masking*:** CDC guidelines (updated July 27) recommend masking in
> indoor public spaces (regardless of vaccination status) because
> breakthrough infections are possible and do occur. **Given this
> guidance,** **the Honors College requests that all faculty and
> students wear masks while indoor in classrooms until further change in
> COVID infection rates.** In setting our own community standards, the
> Honors College will continue to monitor epidemiological data on [COVID
> cases from the Utah Department of
> Health](https://coronavirus.utah.gov/case-counts/) and [CDC’s
> evidence-based guidance for
> COVID-19](https://www.cdc.gov/coronavirus/2019-ncov/communication/guidance.html).

**Drop/Withdrawal Policies**

Students may drop a course within the first two weeks of a given
semester without any penalties.

Students may officially withdraw (W) from a class or all classes after
the drop deadline through the midpoint of a course. A “W” grade is
recorded on the transcript and appropriate tuition/fees are assessed.
The grade “W” is not used in calculating the student’s GPA.

For deadlines to withdraw from full-term, first, and second session
classes, see the U's [Academic
Calendar](https://registrar.utah.edu/academic-calendars/index.php).

**Plagiarism & Cheating**

It is assumed that all work submitted to your instructor is your own
work. When you have used ideas of others, you must properly indicate
that you have done so.

Plagiarism and cheating are serious offenses and may be punished by
failure on an individual assignment, and/or failure in the course.
Academic misconduct, according to the University of Utah Student Code,

*“...Includes, but is not limited to, cheating, misrepresenting one’s
work, inappropriately collaborating, plagiarism, and fabrication or
falsification of information…It also includes facilitating academic
misconduct by intentionally helping or attempting to help another to
commit an act of academic misconduct.”*

For details on plagiarism and other important course conduct issues, see
the U's [Code of Student Rights and
Responsibilities](http://regulations.utah.edu/academics/6-400.php).

**Course Material Copyright**

**The Content is made available only for your personal, noncommercial
educational and scholarly use.** You may not use the Content for any
other purpose, or distribute, post or make the Content available to
others, unless you obtain any required permission from the copyright
holder. Some Content may be provided via streaming or other means that
restrict copying; you may not circumvent those restrictions. You may not
alter or remove any copyright or other proprietary notices included in
the Content.

 

Please see the [Code of Student Rights and
Responsibilities](https://regulations.utah.edu/academics/6-400.php),
Section III.A.5 regarding use and distribution of class Content and
materials.

<https://regulations.utah.edu/academics/6-400.php>  
Section III.A.5. prohibits the following:  
Sale or distribution of information representing the work product of a
faculty member to a commercial entity for financial gain without the
express written permission of the faculty member responsible for the
course. (“Work product” means original works of authorship that have
been fixed in a tangible medium and any works based upon and derived
from the original work of authorship.)

**Safety at the U**

The University of Utah values the safety of all campus community
members. You will receive important emergency alerts and safety messages
regarding campus safety via text message.

For more information regarding safety and to view available training
resources, including helpful videos,
visit [safeu.utah.edu](http://safeu.utah.edu/).

To report suspicious activity or to request a courtesy escort, contact:

> **Campus Police & Department of Public Safety**
> 
> 801-585-COPS (801-585-2677)
> 
> [dps.utah.edu](https://dps.utah.edu/)
> 
> 1735 E. S. Campus Dr.
> 
> Salt Lake City, UT 84112

**Wellness at the U**

Your personal health and wellness are essential to your success as a
student. Personal concerns like stress, anxiety, relationship
difficulties, depression, or cross-cultural differences can interfere
with a student’s ability to succeed and thrive in this course and at the
University of Utah.

Please feel welcome to reach out to your instructor or TA's to handle
issues regarding your coursework.

For helpful resources to manage your personal wellness and counseling
options, contact:

> **Center for Student Wellness**  
> 801-581-7776  
> [wellness.utah.edu](http://wellness.utah.edu/)  
> 2100 Eccles Student Life Center  
> 1836 Student Life Way  
> Salt Lake City, UT 84112
> 
> **Women's Resource Center**  
> 801-581-8030  
> [womenscenter.utah.edu](https://womenscenter.utah.edu/)  
> 411 Union Building  
> 200 S. Central Campus Dr.  
> Salt Lake City, UT 84112

**Addressing Sexual Misconduct**

Title IX makes it clear that violence and harassment based on sex and
gender (which includes sexual orientation and gender
identity/expression) is a civil rights offense subject to the same kinds
of accountability and the same kinds of support applied to offenses
against other protected categories such as race, national origin, color,
religion, age, status as a person with a disability, veteran’s status,
or genetic information.

If you or someone you know has been harassed or assaulted, you are
encouraged to report it to university officials: 

> **Title IX Coordinator & Office of Equal Opportunity and Affirmative
> Action**  
> 801-581-8365  
> [oeo.utah.edu](https://oeo.utah.edu/)  
> 135 Park Building  
> 201 Presidents' Cir.  
> Salt Lake City, UT 84112
> 
> **Office of the Dean of Students**  
> 801-581-7066  
> [deanofstudents.utah.edu](https://deanofstudents.utah.edu/)  
> 270 Union Building  
> 200 S. Central Campus Dr.  
> Salt Lake City, UT 84112

To file a police report, contact:

> **Campus Police & Department of Public Safety**  
> 801-585-COPS (801-585-2677)  
> [dps.utah.edu](https://dps.utah.edu/)  
> 1735 E. S. Campus Dr.  
> Salt Lake City, UT 84112

If you do not feel comfortable reporting to authorities, the U's
Victim-Survivor Advocates provide **free,
confidential** and **trauma-informed** support services to **students,
faculty, and staff **who have experienced interpersonal violence.

To **privately** explore options and resources available to you with an
advocate, contact:

> **Center for Student Wellness**  
> 801-581-7776  
> [wellness.utah.edu](http://wellness.utah.edu/)  
> 328 Student Services Building  
> 201 S. 1460 E.  
> Salt Lake City, UT 84112

**American with Disabilities Act (ADA)**

The University of Utah seeks to provide equal access to its programs,
services, and activities for people with disabilities.

All written information in this course can be made available in an
alternative format with prior notification to the Center for Disability
& Access (CDA). CDA will work with you and the instructor to make
arrangements for accommodations. Prior notice is appreciated. To read
the full accommodations policy for the University of Utah, please see
Section Q of the [Instruction & Evaluation
regulations](http://regulations.utah.edu/academics/6-100.php).

If you will need accommodations in this class, or for more information
about what support they provide, contact:

> **Center for Disability & Access**  
> 801-581-5020  
> [disability.utah.edu](https://disability.utah.edu/)  
> 162 Union Building  
> 200 S. Central Campus Dr.  
> Salt Lake City, UT 84112

**Diverse Student Support**

Your success at the University of Utah is important to all of us here\!
If you feel like you need extra support in academics, overcoming
personal difficulties, or finding community, the U is here for you.

## Student Support Services (TRIO)

TRIO federal programs are targeted to serve and assist low-income
individuals, first-generation college students, and individuals with
disabilities.

Student Support Services (SSS) is a TRIO program for current or incoming
undergraduate university students who are seeking their first bachelor's
degree and need academic assistance and other services to be successful
at the University of Utah.

For more information about what support they provide, a list of ongoing
events, and links to other resources, view their website or contact:

> **Student Support Services (TRIO)**  
> 801-581-7188  
> [trio.utah.edu](https://trio.utah.edu/)  
> Room 2075   
> 1901 E. S. Campus Dr.  
> Salt Lake City, UT 84112

## American Indian Students

The AIRC works to increase American Indian student visibility and
success on campus by advocating for and providing student centered
programs and tools to enhance academic success, cultural events to
promote personal well-being, and a supportive “home-away-from-home”
space for students to grow and develop leadership skills. 

For more information about what support they provide, a list of ongoing
events, and links to other resources, view their website or contact:

> **American Indian Resource Center**  
> 801-581-7019  
> [diversity.utah.edu/centers/airc<span class="underline"> </span>](https://diversity.utah.edu/centers/airc/)  
> Fort Douglas Building 622  
> 1925 De Trobriand St.  
> Salt Lake City, UT 84113

## Black Students

Using a pan-African lens, the Black Cultural Center seeks to counteract
persistent campus-wide and global anti-blackness. The Black Cultural
Center works to holistically enrich, educate, and advocate for students,
faculty, and staff through Black centered programming,
culturally affirming educational initiatives, and retention strategies.

For more information about what support they provide, a list of ongoing
events, and links to other resources, view their website or contact:

> **Black Cultural Center**  
> 801-213-1441  
> [diversity.utah.edu/centers/bcc](https://diversity.utah.edu/centers/bcc/)  
> Fort Douglas Building 603  
> 95 Fort Douglas Blvd.  
> Salt Lake City, UT 84113

## Students with Children

Our mission is to support and coordinate information, program
development and services that enhance family resources as well as the
availability, affordability and quality of child care for University
students, faculty and staff.

For more information about what support they provide, a list of ongoing
events, and links to other resources, view their website or contact:

> **Center for Childcare & Family Resources**  
> 801-585-5897  
> [childcare.utah.edu](https://childcare.utah.edu/)  
> 408 Union Building  
> 200 S. Central Campus Dr.  
> Salt Lake City, UT 84112

## Students with Disabilities

The Center for Disability Services is dedicated to serving students with
disabilities by providing the opportunity for success and equal access
at the University of Utah. They also strive to create an inclusive,
safe, and respectful environment.

For more information about what support they provide and links to other
resources, view their website or contact:

> **Center for Disability Services**  
> 801-581-5020  
> [disability.utah.edu](https://disability.utah.edu/)  
> 162 Union Building  
> 200 S. Central Campus Dr.  
> Salt Lake City, UT 84112

## Student of Ethnic Descent

The Center for Ethnic Student Affairs offers several programs dedicated
to the success of students with varied cultural and ethnic backgrounds.
Their mission is to create an inclusive, safe campus community that
values the experiences of all students.

For more information about what support they provide, a list of ongoing
events, and links to other resources, view their website or contact:

> **Center for Ethnic Student Affairs**  
> 801-581-8151  
> [diversity.utah.edu/centers/cesa/<span class="underline"> </span>](https://diversity.utah.edu/centers/cesa/)  
> 235 Union Building  
> 200 S. Central Campus Dr.  
> Salt Lake City, UT 84112

<span class="underline">English as a Second/Additional Language (ESL)
Students</span>

If you are an English language learner, there are several resources on
campus available to help you develop your English writing and language
skills. Feel free to contact:

> **Writing Center  
> **801-587-9122  
> [writingcenter.utah.edu](http://writingcenter.utah.edu/)  
> 2701 Marriott Library  
> 295 S 1500 E  
> Salt Lake City, UT 84112
> 
> **English for Academic Success (EAS) Program  
> **801-581-8047**  
> **[linguistics.utah.edu/eas-program<span class="underline"> </span>](https://linguistics.utah.edu/eas-program/)  
> 2300 LNCO  
> 255 S. Central Campus Dr.  
> Salt Lake City, UT 84112
> 
> **English Language Institute  
> **801-581-4600  
> [continue.utah.edu/eli<span class="underline"> </span>](http://continue.utah.edu/eli)  
> 540 Arapeen Dr.  
> Salt Lake City, UT 84108

## Undocumented Students

Immigration is a complex phenomenon with broad impact—those who are
directly affected by it, as well as those who are indirectly affected by
their relationships with family members, friends, and loved ones. If
your immigration status presents obstacles that prevent you from
engaging in specific activities or fulfilling specific course criteria,
confidential arrangements may be requested from the Dream Center.

**Arrangements with the Dream Center will not jeopardize your student
status, your financial aid, or any other part of your residence.** The
Dream Center offers a wide range of resources to support undocumented
students (with and without DACA) as well as students from mixed-status
families.

For more information about what support they provide and links to other
resources, view their website or contact:

> **Dream Center  
> **801-213-3697  
> [dream.utah.edu](http://dream.utah.edu/)  
> 1120 Annex (Wing B)  
> 1901 E. S. Campus Dr.  
> Salt Lake City, UT 84112

## LGBTQ+ Students

The LGBTQ+ Resource Center acts in accountability with the campus
community by identifying the needs of people with a queer range of
\[a\]gender and \[a\]sexual experiences and responding with
university-wide services.

For more information about what support they provide, a list of ongoing
events, and links to other resources, view their website or contact:

> **LGBTQ+ Resource Center**  
> 801-587-7973  
> [lgbt.utah.edu<span class="underline"> </span>](http://lgbt.utah.edu/)  
> 409 Union Building  
> 200 S. Central Campus Dr.  
> Salt Lake City, UT 84112

## Veteran & Military Students

The mission of the Veterans Support Center is to improve and enhance the
individual and academic success of veterans, service members, and their
family members who attend the university; to help them receive the
benefits they earned; and to serve as a liaison between the student
veteran community and the university.

For more information about what support they provide, a list of ongoing
events, and links to other resources, view their website or contact:

> **Veterans Support Center**  
> 801-587-7722  
> [veteranscenter.utah.edu ](http://veteranscenter.utah.edu/)    
> 418 Union Building  
> 200 S. Central Campus Dr.  
> Salt Lake City, UT 84112

## Women

The Women’s Resource Center (WRC) at the University of Utah serves as
the central resource for educational and support services for women.
Honoring the complexities of women’s identities, the WRC facilitates
choices and changes through programs, counseling, and training grounded
in a commitment to advance social justice and equality.

For more information about what support they provide, a list of ongoing
events, and links to other resources, view their website or contact:

> **Women's Resource Center**  
> 801-581-8030  
> [womenscenter.utah.edu<span class="underline"> </span>](https://womenscenter.utah.edu/)  
> 411 Union Building  
> 200 S. Central Campus Dr.  
> Salt Lake City, UT 84112

## Inclusivity at the U

The Office for Inclusive Excellence is here to engage, support, and
advance an environment fostering the values of respect, diversity,
equity, inclusivity, and academic excellence for students in our
increasingly global campus community. They also handle reports of bias
in the classroom as outlined below:

*Bias or hate incidents consist of speech, conduct, or some other form
of expression or action that is motivated wholly or in part by prejudice
or bias whose impact discriminates, demeans, embarrasses, assigns
stereotypes, harasses, or excludes individuals because of their race,
color, ethnicity, national origin, language, sex, size, gender identity
or expression, sexual orientation, disability, age, or religion.*

For more information about what support they provide and links to other
resources, or to report a bias incident, view their website or contact:

> **Office for Inclusive Excellence  
> **801-581-4600  
> [inclusive-excellence.utah.edu<span class="underline"> </span>](https://inclusive-excellence.utah.edu/)
> <span class="underline"> </span>  
> 170 Annex (Wing D)  
> 1901 E. S. Campus Dr.  
> Salt Lake City, UT 84112

## Other Student Groups at the U

To learn more about some of the other resource groups available at the
U, check out:

 [getinvolved.utah.edu/](https://getinvolved.utah.edu/)

 [studentsuccess.utah.edu/resources/student-support](https://studentsuccess.utah.edu/resources/student-support/)
