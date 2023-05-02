# Data Analytics (CS301) 

################################################

# Names: 
print("The names of this group are the following.")
print("Truong Son Nguyen")

################################################

print("The name of this group is the following.")
print("Political Polling")

rm(list = ls()) # clear out the variables
# from memory to make a clean execution of the code.

# If you want to remove all previous plots
# and clear the console, run the following two lines.
graphics.off() # clear out all plots from previous work.

cat("\014") # clear the console

################################################

# Instructions: Complete this code using
# RStudio by following the steps in README.md.
# Note: your code must be able to
# execute without errors. Please be sure
# that comments are commended, and code
# is coded correctly without typographical errors.

library(dplyr)
library(tidyverse)
library(car)
library(foreign)
library(haven)
##### Begin by loading your csv file.
newanes <- read_sav("Documents/GitHub/final-project-sonnnnn/data/anes_timeseries_2020_spss_20220210 (1)/anes_timeseries_2020_spss_20220210.sav")
# View the data set.
View(newanes)

# Add your code here to address the four main research questions which are noted in the README.md file. 

# TODO

################################################

