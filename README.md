

# FARSfunctions

<!-- badges: start -->
[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/6aau2lmknc7xbvx7?svg=true)](https://ci.appveyor.com/api/projects/status/6aau2lmknc7xbvx7?svg=true)
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
09         | Florida
10         | Georgia
11         | Hawaii
12         | Idaho
13         | Illinois
14         | Indiana
15         | Iowa
16         | Kansas
17         | Kentuky
18         | Louisiana
19         | Maine
20         | Maryland
21         | Massachusetts
22         | Michigan
23         | Minnesota
24         | Mississippi
25         | Missouri
26         | Montana
27         | Nebraska
28         | Nevada
29         | New Hampshire
30         | New Jersey
31         | New Mexico
32         | New York
33         | North Carolina
34         | North Dakota
35         | Ohio
36         | Oklahoma
37         | Oregon
38         | Pennsylvania
39         | Rhode Island
40         | South Carolina
41         | South Dakota
42         | Tennessee
43         | Texas
44         | Utah
45         | Vermont
46         | Virginia
47         | Washington
48         | West Virginia
49         | Wisconsin
50         | Wyoming


As an example, you can run that code, to get the location of motor vehicle traffic crashes in Alabama in 2013

fars_map_state(1, 2013)


##References

- D. Peng, Roger; Kross, Sean; Anderson, Brooke (2017): Mastering Software Development in R, https://bookdown.org/rdpeng/RProgDA/

- Xie Yihui, Dervieux Christophe, Riederer Emily (2020): R Markdown Cookbook, https://bookdown.org/yihui/rmarkdown-cookbook/
