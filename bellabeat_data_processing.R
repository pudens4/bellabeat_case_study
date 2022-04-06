# Import the libraries needed 
library(tidyverse)
library(tidyr)
library(skimr)


#import the data for analysis

daily_activity <- read_csv('/Volumes/Pud SSD/GitHub Projects/bellabeat_case_study/Resources/Fitabase_Data_4_12_16_5_12_16/dailyActivity_merged.csv')
daily_sleep <- read_csv('/Volumes/Pud SSD/GitHub Projects/bellabeat_case_study/Resources/Fitabase_Data_4_12_16_5_12_16/sleepDay_merged.csv')
weight_log <- read_csv('/Volumes/Pud SSD/GitHub Projects/bellabeat_case_study/Resources/Fitabase_Data_4_12_16_5_12_16/weightLogInfo_merged.csv')

# how many unique users we have 

n_distinct(daily_activity$Id)
n_distinct(daily_sleep$Id)
n_distinct(weight_log$Id)

# duplicates in the dataset

sum(duplicated(daily_activity))
sum(duplicated(daily_sleep))
sum(duplicated(weight_log))


daily_activity <- daily_activity %>%
  distinct() %>%
  drop_na()

daily_sleep <- daily_sleep %>%
  distinct() %>%
  drop_na()

weight_log <- weight_log %>%
  distinct() %>%
  drop_na()



daily_activity
daily_sleep


# change dtypes of activity date
daily_activity$ActivityDate=as.POSIXct(daily_activity$ActivityDate, format="%m/%d/%Y", tz=Sys.timezone())
daily_activity$date <- format(daily_activity$ActivityDate, format = "%m/%d/%y")
daily_activity$month <- format(daily_activity$ActivityDate, format = "%B")
daily_activity$day <- format(daily_activity$ActivityDate, format = "%d")
daily_activity$weekday <- format(daily_activity$ActivityDate, format = "%A")


# Mutate SleepDay data type to date / time and create new time, date, and month columns in df
daily_sleep$SleepDay=as.POSIXct(daily_sleep$SleepDay, format="%m/%d/%Y %I:%M:%S %p", tz=Sys.timezone())
daily_sleep$date <- format(daily_sleep$SleepDay, format = "%m/%d/%y")
daily_sleep$month <- format(daily_sleep$SleepDay, format = "%B")
daily_sleep$day <- format(daily_sleep$SleepDay, format = "%d")
daily_sleep$weekday <- format(daily_sleep$SleepDay, format = "%A")

weight_log$Date=as.POSIXct(weight_log$Date, format="%m/%d/%Y %I:%M:%S %p", tz=Sys.timezone())
weight_log$date <- format(weight_log$Date, format = "%m/%d/%y")
weight_log$time <- format(weight_log$Date, format = "%H:%M:%S")
weight_log$month <- format(weight_log$Date, format = "%B")
weight_log$day <- format(weight_log$Date, format = "%d")
weight_log$weekday <- format(weight_log$Date, format = "%A")

# Merge daily activity/ daily sleep and weight log
daily_activity_nsleep <- merge(daily_activity, daily_sleep, by = c ("Id", "date"))
weight_bmi <- merge(daily_activity, weight_log, by =c ('Id', 'date'))
weight_bmi2 <- weight_bmi %>% select(-c("IsManualReport","LogId","WeightKg","month.y"))


# statistical summary of the data
# summary of daily activity without sleep 

daily_activity %>% 
  select(TotalSteps, TotalDistance, Calories) %>%
  summary()

# summary of daily activity with sleep
daily_activity_nsleep %>%
  select(TotalSteps, TotalDistance, TotalMinutesAsleep, TotalTimeInBed, Calories)%>%
  summary()

# 

weight_log %>%  
  select(WeightKg,
         WeightPounds,
         BMI) %>%
  summary()


# trend analysis for users 
daily_use <- daily_activity_nsleep %>%
  group_by(Id) %>%
  summarize(days_used=sum(n())) %>%
  mutate(usage = case_when(
    days_used >= 1 & days_used <= 7 ~ "low use",
    days_used >= 8 & days_used <= 16 ~ "moderate use", 
    days_used >= 17 & days_used <= 31 ~ "high use", 
  ))

daily_use


# Daily avg steps and sleep
daily_activity_nsleep <- daily_activity_nsleep %>%
  mutate(day = weekdays(as.Date(date, format = "%m/%d/%Y")))

avg_steps_and_sleep <- daily_activity_nsleep %>%
  group_by(day) %>%
  summarize(avg_steps = mean(TotalSteps), avg_sleep = mean(TotalMinutesAsleep / 60)) #convert minutes asleep to hours asleep

avg_steps_and_sleep$day <- ordered(avg_steps_and_sleep$day, levels=c("Monday", "Tuesday", "Wednesday", "Thursday",
                                                                     "Friday", "Saturday", "Sunday"))

avg_steps_and_sleep <- avg_steps_and_sleep %>%
  arrange(day)

avg_steps_and_sleep

# corr between sleep and steps 

ggplot(data=daily_activity_nsleep, aes(x=TotalSteps, y= TotalMinutesAsleep)) + geom_point(color = "black") + geom_smooth() + labs(title =  'Total steps Vs. Total Minutes Sleep')


# corr calories and total distance
ggplot(data=daily_activity_nsleep, aes(x=Calories, y=TotalDistance)) + geom_point(color = "red") + geom_smooth() + labs(title =  'Calories Vs. Total Distance')

# corr calories vs steps 

ggplot(data = daily_activity, aes(x=Calories, y=TotalSteps)) + geom_point(color = "blue") + geom_smooth() + labs(title =  'Total Steps vs. Calories')

