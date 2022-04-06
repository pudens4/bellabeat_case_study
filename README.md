# bellabeat_case_study


## Overview 

As part of the Captsone project for the Google Data Analytics certificate, I
took on the Bellabeat case study to analyze and discover insight that can help the 
company. 

## Process 

The first step is understanding what is being asked by the stakeholders, clarify any
questions. 
* what is the relationship between the users who does activities on a daily basis, weight and their sleep?

To do the analysis, I used R to clean, and prepare the data for analysis.


## Findings 

The findings in the data were we have a small sample size of users

Tracking activities 
* 33 for daily activities 
* 24 daily sleep 
* 8 for weight loss

day       avg_steps avg_sleep
  <ord>         <dbl>     <dbl>
1 Monday        9273.      6.99
2 Tuesday       9183.      6.74
3 Wednesday     8023.      7.24
4 Thursday      8184.      6.69
5 Friday        7901.      6.76
6 Saturday      9871.      6.98
7 Sunday        7298.      7.55


Users are most active beginning and end of the week. 
Sleep mostly middle and end of the weekend.

Summary users without sleep tracker 

 TotalSteps    TotalDistance       Calories   
 Min.   :    0   Min.   : 0.000   Min.   :   0  
 1st Qu.: 3790   1st Qu.: 2.620   1st Qu.:1828  
 Median : 7406   Median : 5.245   Median :2134  
 **Mean   : 7638   Mean   : 5.490   Mean   :2304**  
 3rd Qu.:10727   3rd Qu.: 7.713   3rd Qu.:2793  
 Max.   :36019   Max.   :28.030   Max.   :4900  

Summary users with sleep tracker
TotalSteps    TotalDistance    TotalMinutesAsleep TotalTimeInBed     Calories   
 Min.   :   17   Min.   : 0.010   Min.   : 58.0      Min.   : 61.0   Min.   : 257  
 1st Qu.: 5189   1st Qu.: 3.592   1st Qu.:361.0      1st Qu.:403.8   1st Qu.:1841  
 Median : 8913   Median : 6.270   Median :432.5      Median :463.0   Median :2207  
 **Mean   : 8515   Mean   : 6.012   Mean   :419.2      Mean   :458.5   Mean   :2389**  
 3rd Qu.:11370   3rd Qu.: 8.005   3rd Qu.:490.0      3rd Qu.:526.0   3rd Qu.:2920  
 Max.   :22770   Max.   :17.540   Max.   :796.0      Max.   :961.0   Max.   :4900  

Summary weight 
 WeightKg      WeightPounds        BMI       
 Min.   :52.60   Min.   :116.0   Min.   :22.65  
 1st Qu.:57.55   1st Qu.:126.9   1st Qu.:23.85  
 Median :62.50   Median :137.8   Median :25.05  
 **Mean   :62.50   Mean   :137.8   Mean   :25.05**  
 3rd Qu.:67.45   3rd Qu.:148.7   3rd Qu.:26.25  
 Max.   :72.40   Max.   :159.6   Max.   :27.45  
 
 
 
/Volumes/Pud SSD/GitHub Projects/bellabeat_case_study/Plots/Calories vs total distance.png
 
 
/Volumes/Pud SSD/GitHub Projects/bellabeat_case_study/Plots/Total step vs total mn sleep.png
 
 
/Volumes/Pud SSD/GitHub Projects/bellabeat_case_study/Plots/Total steps vs calories.png


## Resources
Data has been provided on Kaggle through a list of users who willingly give their data. 

## Summary

As the data has been limited in terms of sample size, based on what I have found 
