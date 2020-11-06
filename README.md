
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

'''{r eval = FALSE}
\href{https://www.nhtsa.gov/research-data/fatality-analysis-reporting-system-fars}{www.nhtsa.gov/research-data/fatality-analysis-reporting-system-fars}.
'''

The package's data is dealing with motor vehicle traffic crashes in the US between 2013 and 2015.
These are the variables of the data which will be used by the functions.

Variable     | Description
------------ | ------------------------------------------------
**STATE**    | *state code of the motor vehicle traffic crash*
**MONTH**    | *Month of the motor vehicle traffic crash*
**YEAR**     | *Year of the motor vehicle traffic crash*


## Installation

Use following code to install this package

'''{r eval = FALSE}
install.packages("FARSfunctions")
'''


##Examples

The package provides various functions, to deal with motor vehicle traffic accidents.

To load the data in your RStudio environment, you can run:

'''{r include = FALSE}
library(magrittr)
'''
'''{r echo = FALSE}
year2013 <- 2013
accidents_2013 <- year2013 %>%
make_filename %>%
fars_read
'''

The files you are using need to be in the same directory as the working directory.
Each row in the data frame represents variable values about a motor vehicle traffic crash.

To get a summary of the total amount of motor vehicle traffic crashes, sorted by month of the specificed year, you can use following code:

'''{r}
fars_summarize_years(c(2013, 2014, 2015))
'''

Another function in the FARSfunctions package maps the location of motor vehicle traffic crashes.
Use as function's arguments, the state number and the year of the motor vehicle traffic crash.

'''{r echo = FALSE}
state_code_names <- cbind(code = c("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50"), name = c("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"))
'''

As an example, you can run that code, to get the location of motor vehicle traffic crashes in Alabama in 2013

'''{r}
fars_map_state(1, 2013)
'''


##References

- D. Peng, Roger; Kross, Sean; Anderson, Brooke (2017): Mastering Software Development in R, [https://bookdown.org/rdpeng/RProgDA/](https://bookdown.org/rdpeng/RProgDA/)

- Xie Yihui, Dervieux Christophe, Riederer Emily (2020): R Markdown Cookbook, [https://bookdown.org/yihui/rmarkdown-cookbook/](https://bookdown.org/yihui/rmarkdown-cookbook/)
