# Course Final Project :: CS301

**Due** : Thursday, 4th May 2023, 7:00pm (Note: Strict deadline, no extensions are possible)

## Names of all members

Truong Son Nguyen

## Group Name

Political Polling

## Dataset reference

American National Election Studies. 2021. "ANES 2020 Time Series Study Full Release" [dataset and documentation]. February 10, 2022 version. www.electionstudies.org
https://electionstudies.org/data-center/2020-time-series-study/

## In clear and meaningful language, discuss your three (foundational) questions.

I am interested in studying of politics and public opinion using polling datas. I was introduced to this dataset through a Political Science professor of mine, and thanks to the knowledge in R that I acquire in this class, I am now capable of dissecting this dataset in order to look at some issues that are of interest to me. In particular, I have a couple of questions that I want to look into:

1. Is there a correlation between trust in the news media and party identification? In other words, given a person's political affiliation, can we reasonably predict how they feel about the news media?

2. Are people bias in their choice of presidential candidate? In other words, do voters have an incentive to support the candidate representing their party?

3. Is there a correlation between party identification for voters and how they approve or disapprove of political institutions? In particular, is party ID a determinant of how people judge Congress and the Presidency?

4. Can we, as citizens, still trust one another? Would party identification affect the level of trust people have for one another?

## What motivation is there behind these questions?

When we think of the United States, words like “freedom” or “democracy” usually come to one’s mind. The U.S. has a long history of democratic traditions, and the political vision of equality, liberty, and “unalienable rights” has created a foundation for a diverse society of many different racial, religious, and social groups. On the international level, the U.S. has long been viewed as a protector of democratic principles across the globe, its political ideals “have echoed through time and across borders” (Edel 2019). While there are problems in our political system, such as the disenfranchisement of minority groups throughout the country’s history or the misdeeds we have made as a nation, we should still celebrate this rich legacy of political philosophy. For in many instances, it was these ideals that guided us in addressing our shortcomings and thus shaping America into what it is today.

And yet, that democratic tradition is under siege. In recent years, democratic backsliding has been a common trend globally, and the U.S. is no exception. Freedom House report in 2021 claimed that over the past ten years, “the United States’ aggregate … score has declined by 11 points, placing it among the 25 countries that have suffered the largest decline in this period” (Repucci & Slipowitz 2021, 2). The memories of January 6th are still fresh for many of us: for the first time in our country’s history, there was an attempt to overturn an election and disrupt the electoral processes that have been in place for over two centuries. This has profound implications for our political landscape and certainly is a stain on our name as one of the world’s leading democracies. Scholars have identified three causal mechanisms behind the regression of democracy worldwide: the pernicious effects of polarization, rulers’ control of the legislature, and the incremental nature of abuses of power (Haggard & Kaufman 2021). If we agree that a healthy democracy is something to be desired, then it is upon us to protect and preserve the democratic principles that are the foundations of this country by addressing the problems that led us down this path.

Among the causes mentioned above, what is most troubling is the widespread partisanship and polarization among ordinary citizens in recent years. In a study looking at support for democracy in the U.S., it is suggested that Americans are willing “to trade-off democratic principles for other valid but potentially conflicting considerations such as political ideology, partisan loyalty, and policy preferences” (Graham & Svolik 2020). Furthermore, while ideological polarization leads to “extreme division between opponents over the issues” in the political system, affective polarization causes members of opposing parties to “dislike and distrust each other” (Orhan 2022, 715). It divides society and creates mutually distrustful “us” versus “them” groups who view each other as existential threats instead of fellow citizens whom they might disagree with. A democracy is a political model that permits differences of ideas and yet overcomes them via a thoughtful majority rule where everyone’s concern is taken into consideration. This, unfortunately, does not seem to be where we are at.

## Q1, Method, Code and Conclusion

1. Is there a correlation between trust in the news media and party identification? In other words, given a person's political affiliation, can we reasonably predict how they feel about the news media?

Percentage stacked bar chart:
```
ggplot(PartyIDxMediaTrust, aes(x = PartyID, y = percentage, fill = MediaTrust)) +
     geom_col(position = "fill") +
     labs(x = "Party ID", y = "Percentage", fill = "Media Trust") +
     ggtitle("Percentage Stacked Bar Chart of Media Trust and Party ID") +
     theme_minimal()
```

Regression Analysis:
```
relevantdata$PartyID_num <- as.numeric(relevantdata$PartyID)
relevantdata$MediaTrust_num <- as.numeric(relevantdata$MediaTrust)
PartyIDxMediaTrustReg <- lm(MediaTrust_num ~ PartyID_num, data = relevantdata)
summary(PartyIDxMediaTrustReg)

Call:
lm(formula = MediaTrust_num ~ PartyID_num, data = relevantdata)

Residuals:
    Min      1Q  Median      3Q     Max
-3.4812 -0.6524  0.1284  0.5188  2.3476

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 2.347584   0.023382  100.40   <2e-16 ***
PartyID_num 0.304802   0.005168   58.98   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.9951 on 6950 degrees of freedom
Multiple R-squared:  0.3336,	Adjusted R-squared:  0.3335
F-statistic:  3479 on 1 and 6950 DF,  p-value: < 2.2e-16

```

The regression analysis results suggest that there is a significant positive relationship between party identification and trust in the media.

The adjusted R-squared value of 0.3335 indicates that 33.35% of the variation in the dependent variable is explained by the independent variable in the model.

The p-value of the coefficient is very small (< 2.2e-16), which suggests that the relationship between party identification and trust in the media is statistically significant.

In particular, the plot for these particular variables suggest that among Republican voters, there is a great amount of distrust towards the media. More than half of strong Republicans voters, and approximately half of the weak Republicans voters said that they have zero trust in the media, while this number across all categories of Democrats voters is less than 10%.

## Q2, Method, Code and Conclusion

2. Are people bias in their choice of presidential candidate? In other words, do voters have an incentive to support the candidate representing their party?

Percentage stacked bar chart
```
ggplot(PartyIDxPresidentialCandidate, aes(x = PartyID, y = percentage, fill = PresidentialCandidate)) +
     geom_col(position = "fill") +
     labs(x = "Party ID", y = "Percentage", fill = "Presidential Candidate") +
     ggtitle("Percentage Stacked Bar Chart of Presidential Candidate and Party ID") +
     theme_minimal()
```

Regression Analysis:
```
relevantdata$PresidentialCandidate_num <- as.numeric(relevantdata$PresidentialCandidate)
PartyIDxPresidentialCandidateReg <- lm(PresidentialCandidate_num ~ PartyID_num, data = relevantdata)
summary(PartyIDxPresidentialCandidateReg)

Call:
lm(formula = PresidentialCandidate_num ~ PartyID_num, data = relevantdata)

Residuals:
     Min       1Q   Median       3Q      Max
-1.98796  0.01204  0.03557  0.18263  1.03557

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept)  3.158547   0.009774  323.17   <2e-16 ***
PartyID_num -0.170587   0.002160  -78.97   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.416 on 6950 degrees of freedom
Multiple R-squared:  0.473,	Adjusted R-squared:  0.4729
F-statistic:  6237 on 1 and 6950 DF,  p-value: < 2.2e-16
```

The regression analysis results suggest that there is a significant relationship between party identification and choice of presidential candidate.

The adjusted R-squared value of 0.4729 indicates that 47.29% of the variation in the dependent variable is explained by the independent variable in the model.

The p-value of the coefficient is very small (< 2.2e-16), which suggests that the relationship between party identification and choice of presidential candidate is statistically significant.

Overall, these findings suggest that Party ID is a strong predictor of which Presidential candidate a voter is likely to support in the election. For example, Republican voters are more likely to choose Trump over Biden, and Democrats are more likely to choose Biden over Trump

## Q3, Method, Code and Conclusion

3. Is there a correlation between party identification for voters and how they approve or disapprove of political institutions? In particular, is party ID a determinant of how people judge Congress and the Presidency?

Percentage stacked bar chart for Party ID and Congress Approval:
```
ggplot(PartyIDxCongressApproval, aes(x = PartyID, y = percentage, fill = CongressApproval))+
          geom_col(position = "fill") +
          labs(x = "Party ID", y = "Percentage", fill = "Congress Approval") +
          ggtitle("Percentage Stacked Bar Chart of Congress Approval and Party ID") +
          theme_minimal()
```

Percentage stacked bar chart for Party ID and President Approval:
```
ggplot(PartyIDxPresidentApproval, aes(x = PartyID, y = percentage, fill = PresidentApproval)) +
     geom_col(position = "fill") +
     labs(x = "Party ID", y = "Percentage", fill = "President Approval") +
     ggtitle("Percentage Stacked Bar Chart of President Approval (Trump) and Party ID") +
     theme_minimal()
```

For this particular part of the project, I struggled to perform regression of analysis on these data types, due to it being binary (Approve or disapprove). However, from looking at the stacked bar chart for Congress approval and President approval, I can tell that there might be a statistically significant relationship between Party ID and President Approval: people tend to approve of the President if they come from the same party, and disapprove if they are from a different party. On the other hand, there is no noticeable trend when it comes to Congress approval: apparently, Congress is equally unpopular among different level of party identification.

## Q4, Method, Code and Conclusion?

4. Can we, as citizens, still trust one another? Would party identification affect the level of trust people have for one another?

Percentage stacked bar chart:
```
ggplot(PartyIDxTrustamongCitizens, aes(x = PartyID, y = percentage, fill = TrustamongCitizens)) +
     geom_col(position = "fill") +
     labs(x = "Party ID", y = "Percentage", fill = "Trust Among Citizens") +
     ggtitle("Percentage Stacked Bar Chart of Trust Among Citizens and Party ID") +
     theme_minimal()
```

Regression analysis
```
# Party ID and Trust among citizens
relevantdata$TrustamongCitizens_num <- as.numeric(relevantdata$TrustamongCitizens)
PartyIDxTrustamongCitizensReg <- lm(TrustamongCitizens_num ~ PartyID_num, data = relevantdata)
summary(PartyIDxTrustamongCitizensReg)

Call:
lm(formula = TrustamongCitizens_num ~ PartyID_num, data = relevantdata)

Residuals:
    Min      1Q  Median      3Q     Max
-1.7776 -0.7676  0.2224  0.2423  2.2423

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept)  2.780896   0.020665 134.570   <2e-16 ***
PartyID_num -0.003319   0.004567  -0.727    0.467    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.8795 on 6950 degrees of freedom
Multiple R-squared:  7.6e-05,	Adjusted R-squared:  -6.788e-05
F-statistic: 0.5282 on 1 and 6950 DF,  p-value: 0.4674

```

The regression analysis results suggest that there is no statistically significant relationship between party identification and trust among citizens.

The adjusted R-squared value of -6.788e-05 indicates that the independent variable (Party ID) explains very little of the variation in the dependent variable (Trust among Citizens).

The p-value of the coefficient is 0.4674, which suggests that the relationship between party identification and trust among citizens is not statistically significant. Thus, we can't reject the null hypothesis.

Overall, these findings suggest that Party ID is not a significant predictor of Trust among Citizens. Other variables, such as income, education, and demographic characteristics, might need to be considered in determining whether there exists different level of trust or distrust across different groups.
