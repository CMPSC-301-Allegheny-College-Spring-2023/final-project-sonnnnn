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
newanes <- read_sav("~/Documents/GitHub/final-project-sonnnnn/data/anes_timeseries_2020_spss_20220210 (1)/anes_timeseries_2020_spss_20220210.sav")
# View the data set.
View(newanes)

# View original data on some of the relevant variables
table(newanes$V201377) # media trust
table(newanes$V201231x) # party id
table(newanes$V201033) # how ppl intend to vote in presidential election
table(newanes$V201124) # how ppl feel about Congress
table(newanes$V201127) # how ppl feel about the president
table(newanes$V201237) # how often can ppl trust others

# get relavant data in a new subset
relevantdata <- subset(newanes, select = c(V201377,V201231x, V201033, V201124, V201127, V201237))

# rename the variables
names(relevantdata)[names(relevantdata) == 'V201377'] <- 'Media Trust'
names(relevantdata)[names(relevantdata) == 'V201231x'] <- 'Party ID'
names(relevantdata)[names(relevantdata) == 'V201033'] <- 'Presidential Candidate' 
names(relevantdata)[names(relevantdata) == 'V201124'] <- 'Congress Approval' 
names(relevantdata)[names(relevantdata) == 'V201127'] <- 'President Approval'
names(relevantdata)[names(relevantdata) == 'V201237'] <- 'Trust among Citizens'

# 





##############################################

