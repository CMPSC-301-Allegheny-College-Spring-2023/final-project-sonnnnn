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
relevantdata <- subset(read_sav("~/Documents/GitHub/final-project-sonnnnn/data/anes_timeseries_2020_spss_20220210 (1)/anes_timeseries_2020_spss_20220210.sav"), select = c(V201377,V201231x, V201033, V201124, V201127, V201237))
# View the data set.
View(relevantdata)

# View original data on some of the relevant variables
table(relevantdata$V201377) # media trust
table(relevantdata$V201231x) # party id
table(relevantdata$V201033) # how ppl intend to vote in presidential election
table(relevantdata$V201124) # how ppl feel about Congress
table(relevantdata$V201127) # how ppl feel about the president
table(relevantdata$V201237) # how often can ppl trust others

# rename the variables
names(relevantdata)[names(relevantdata) == 'V201377'] <- 'MediaTrust'
names(relevantdata)[names(relevantdata) == 'V201231x'] <- 'PartyID'
names(relevantdata)[names(relevantdata) == 'V201033'] <- 'PresidentialCandidate' 
names(relevantdata)[names(relevantdata) == 'V201124'] <- 'CongressApproval' 
names(relevantdata)[names(relevantdata) == 'V201127'] <- 'PresidentApproval'
names(relevantdata)[names(relevantdata) == 'V201237'] <- 'TrustamongCitizens'

# recode the data by getting ride of irrelevant responses and assign text values
relevantdata$MediaTrust<-recode(as.numeric(relevantdata$MediaTrust),"-9:-8=NA")
relevantdata$MediaTrust<-recode(relevantdata$MediaTrust,"1='None';2='A little';3='A moderate amount';4='A lot';5='A great deal'")
relevantdata$PartyID<-recode(as.numeric(relevantdata$PartyID),"-9:-8=NA")
relevantdata$PartyID<-recode(relevantdata$PartyID,"1='Strong Dem'; 2='Dem';3='Weak Dem';4='Independent';5='Weak Rep';6='Rep';7='Strong Rep'")
relevantdata$PresidentialCandidate<-recode(as.numeric(relevantdata$PresidentialCandidate),"-9:-8=NA;11:12=NA;-1=NA;4:5=3")
relevantdata$PresidentialCandidate<-recode(relevantdata$PresidentialCandidate,"1='Joe Biden'; 2='Donald Trump';3='Other'")
relevantdata$CongressApproval<-recode(as.numeric(relevantdata$CongressApproval),"-9:-8=NA")
relevantdata$CongressApproval<-recode(relevantdata$CongressApproval,"1='Approve'; 2='Disapprove'")
relevantdata$PresidentApproval<-recode(as.numeric(relevantdata$PresidentApproval),"-9:-8=NA")
relevantdata$PresidentApproval<-recode(relevantdata$PresidentApproval,"1='Approve'; 2='Disapprove'")
relevantdata$TrustamongCitizens<-recode(as.numeric(relevantdata$TrustamongCitizens),"-9:-8=NA")
relevantdata$TrustamongCitizens<-recode(relevantdata$TrustamongCitizens,"1='Always';2='Most of the time';3='About half of the time';4='Some of the time';5='Never'")

# removing the NA values
relevantdata<-na.omit(relevantdata)

# view data after recoding
table(relevantdata$MediaTrust) # media trust
table(relevantdata$PartyID) # party id
table(relevantdata$PresidentialCandidate) # how ppl intend to vote in presidential election
table(relevantdata$CongressApproval) # how ppl feel about Congress
table(relevantdata$PresidentApproval) # how ppl feel about the president
table(relevantdata$TrustamongCitizens) # how often can ppl trust others
                     
# create order for variables so that charts look better
relevantdata$PartyID<-factor(relevantdata$PartyID, levels = c("Strong Dem", "Dem", "Weak Dem", "Independent","Weak Rep","Rep","Strong Rep"))
relevantdata$MediaTrust<-factor(relevantdata$MediaTrust, levels = c("A great deal","A lot","A moderate amount","A little","None"))
relevantdata$TrustamongCitizens<-factor(relevantdata$TrustamongCitizens, levels = c("Always","Most of the time","About half of the time","Some of the time","Never"))
relevantdata$PresidentialCandidate<-factor(relevantdata$PresidentialCandidate, levels = c("Other","Donald Trump","Joe Biden"))

# group data into relevant cluster
# MediaTrust and party ID
PartyIDxMediaTrust <- relevantdata %>% 
     group_by(MediaTrust, PartyID) %>% 
     summarise(count = n()) %>% 
     mutate(percentage = count / sum(count))
#PartyID and congress approval
PartyIDxCongressApproval <- relevantdata %>% 
     group_by(CongressApproval, PartyID) %>% 
     summarise(count = n()) %>% 
     mutate(percentage = count / sum(count))
# PartyID and president approval
PartyIDxPresidentApproval <- relevantdata %>% 
     group_by(PresidentApproval, PartyID) %>% 
     summarise(count = n()) %>% 
     mutate(percentage = count / sum(count))
# Party ID and presidential candidate
PartyIDxPresidentialCandidate <- relevantdata %>% 
     group_by(PresidentialCandidate, PartyID) %>% 
     summarise(count = n()) %>% 
     mutate(percentage = count / sum(count))
# PartyID and trust among citizens
PartyIDxTrustamongCitizens <- relevantdata %>% 
     group_by(TrustamongCitizens, PartyID) %>% 
     summarise(count = n()) %>% 
     mutate(percentage = count / sum(count))

# plots
# PartyIDxMediaTrust
ggplot(PartyIDxMediaTrust, aes(x = PartyID, y = percentage, fill = MediaTrust)) +
     geom_col(position = "fill") +
     labs(x = "Party ID", y = "Percentage", fill = "Media Trust") +
     ggtitle("Percentage Stacked Bar Chart of Media Trust and Party ID") +
     theme_minimal()
# PartyIDxCongressApproval
ggplot(PartyIDxCongressApproval, aes(x = PartyID, y = percentage, fill = CongressApproval)) +
          geom_col(position = "fill") +
          labs(x = "Party ID", y = "Percentage", fill = "Congress Approval") +
          ggtitle("Percentage Stacked Bar Chart of Media Trust and Party ID") +
          theme_minimal()
# PartyIDxPresidentApproval
ggplot(PartyIDxPresidentApproval, aes(x = PartyID, y = percentage, fill = PresidentApproval)) +
     geom_col(position = "fill") +
     labs(x = "Party ID", y = "Percentage", fill = "President Approval") +
     ggtitle("Percentage Stacked Bar Chart of President Approval (Trump) and Party ID") +
     theme_minimal()
# PartyIDxPresidentialCandidate
ggplot(PartyIDxPresidentialCandidate, aes(x = PartyID, y = percentage, fill = PresidentialCandidate)) +
     geom_col(position = "fill") +
     labs(x = "Party ID", y = "Percentage", fill = "Presidential Candidate") +
     ggtitle("Percentage Stacked Bar Chart of Presidential Candidate and Party ID") +
     theme_minimal()
# PartyIDxTrustAmongCitizens
ggplot(PartyIDxTrustamongCitizens, aes(x = PartyID, y = percentage, fill = TrustamongCitizens)) +
     geom_col(position = "fill") +
     labs(x = "Party ID", y = "Percentage", fill = "Trust Among Citizens") +
     ggtitle("Percentage Stacked Bar Chart of Trust Among Citizens and Party ID") +
     theme_minimal()

# Performing regression analysis
# Party ID and Media Trust
relevantdata$PartyID_num <- as.numeric(relevantdata$PartyID)
relevantdata$MediaTrust_num <- as.numeric(relevantdata$MediaTrust)
PartyIDxMediaTrustReg <- lm(MediaTrust_num ~ PartyID_num, data = relevantdata)
summary(PartyIDxMediaTrustReg)
# Party ID and Presidential candidate
relevantdata$PresidentialCandidate_num <- as.numeric(relevantdata$PresidentialCandidate)
PartyIDxPresidentialCandidateReg <- lm(PresidentialCandidate_num ~ PartyID_num, data = relevantdata)
summary(PartyIDxPresidentialCandidateReg)
# Party ID and Trust among citizens
relevantdata$TrustamongCitizens_num <- as.numeric(relevantdata$TrustamongCitizens)
PartyIDxTrustamongCitizensReg <- lm(TrustamongCitizens_num ~ PartyID_num, data = relevantdata)
summary(PartyIDxTrustamongCitizensReg)
