

# FARSfunctions

<!-- badges: start -->

<!-- badges: end -->

The goal of FARSfunctions is to provide functions, concerning with fatal injuries
because of motor vehicle traffic crashes.

##Overview

The following functions, included in the R package FARSfunctions are created in
the course "Mastering Software Development in R" as an exercise how to create
an R package and how to push that package on GitHub.

##Data basis

The used data is provided by the US National Highway Traffic Safety Administration's
Fatality Analysis Reporting System (FARS) and can be found at

www.nhtsa.gov/research-data/fatality-analysis-reporting-system-fars

The package's data is dealing with motor vehicle traffic crashes in the US between 2013 and 2015.
These are the variables of the data which will be used by the functions.

Variable     | Description
------------ | ------------------------------------------------
**STATE**    | *state code of the motor vehicle traffic crash*
**MONTH**    | *Month of the motor vehicle traffic crash*
**YEAR**     | *Year of the motor vehicle traffic crash*


## Installation

Use following code to install this package

install.packages("FARSfunctions")


##Examples

The package provides various functions, to deal with motor vehicle traffic accidents.

To load the data in your RStudio environment, you can run:

library(magrittr)

year2013 <- 2013

accidents_2013 <- year2013 %>%

make_filename %>%

fars_read

The files you are using need to be in the same directory as the working directory.
Each row in the data frame represents variable values about a motor vehicle traffic crash.

To get a summary of the total amount of motor vehicle traffic crashes, sorted by month of the specificed year, you can use following code:

fars_summarize_years(c(2013, 2014, 2015))


Another function in the FARSfunctions package maps the location of motor vehicle traffic crashes.
Use as function's arguments, the state number and the year of the motor vehicle traffic crash.

State code | Names
-----------|--------------
01         | Alabama
02         | Alaska
03         | Arizona
04         | Arkansas
05         | California
06         | Colodrado
07         | Connecticut
08         | Delaware
09         | District of Columbia
10         | Florida
11         | Georgia
12         | Hawaii
13         | Idaho
14         | Illinois
15         | Indiana
16         | Iowa
17         | Kansas
18         | Kentuky
19         | Louisiana
20         | Maine
21         | Maryland
22         | Massachusetts
23         | Michigan
24         | Minnesota
25         | Mississippi
26         | Missouri
27         | Montana
28         | Nebraska
29         | Nevada
30         | New Hampshire
31         | New Jersey
32         | New Mexico
33         | New York
34         | North Carolina
35         | North Dakota
36         | Ohio
37         | Oklahoma
38         | Oregon
39         | Pennsylvania
40         | Rhode Island
41         | South Carolina
42         | South Dakota
43         | Tennessee
44         | Texas
45         | Utah
46         | Vermont
47         | Virginia
48         | Washington
49         | West Virginia
50         | Wisconsin
51         | Wyoming


As an example, you can run that code, to get the location of motor vehicle traffic crashes in Alabama in 2013

fars_map_state(1, 2013)


##References

- D. Peng, Roger; Kross, Sean; Anderson, Brooke (2017): Mastering Software Development in R, https://bookdown.org/rdpeng/RProgDA/

- Xie Yihui, Dervieux Christophe, Riederer Emily (2020): R Markdown Cookbook, https://bookdown.org/yihui/rmarkdown-cookbook/
