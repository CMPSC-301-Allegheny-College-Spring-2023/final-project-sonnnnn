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
fname <- file.choose()
data <- read.table(file.choose(), header = TRUE, sep = ",")

# View the data set.

View(data)

# Add your code here to address the four main research questions which are noted in the README.md file. 

# TODO

################################################

# Note: Did leave your name to the top of this script?
