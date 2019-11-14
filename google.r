library(dplyr)
library(ggplot2)


linkedin_data <- read.csv("temp_datalab_records_linkedin_company.csv")


data_grouped <- linkedin_data %>% 
  group_by(as_of_date, company_name) %>%
  summarise(n = mean(followers_count))

sorted_data_followers <- arrange(data_grouped, desc(data_grouped$n))

google <- sorted_data_followers[sorted_data_followers$company_name=='Google', ]

dates <- strptime(as.character(google$as_of_date), "%Y-%m-%d")

as.Date(dates)
format(dates, "%d/%m/%Y")

lb.2015 <- strptime(as.character("01/01/2015"), "%m/%d/%Y")
ub.2015 <- strptime(as.character("01/01/2016"), "%m/%d/%Y")

format(lb.2015, "%d/%m/%Y")
format(ub.2015, "%d/%m/%Y")

con.2015 <- dates >= lb.2015 & dates < ub.2015

google.2015 <- google[con.2015, ]

lb.2016 <- strptime(as.character("01/01/2016"), "%m/%d/%Y")
ub.2016 <- strptime(as.character("01/01/2017"), "%m/%d/%Y")

format(lb.2016, "%d/%m/%Y")
format(ub.2016, "%d/%m/%Y")

con.2016 <- dates >= lb.2016 & dates < ub.2016

google.2016 <- google[con.2016, ]

lb.2017 <- strptime(as.character("01/01/2017"), "%m/%d/%Y")
ub.2017 <- strptime(as.character("01/01/2018"), "%m/%d/%Y")

format(lb.2017, "%d/%m/%Y")
format(ub.2017, "%d/%m/%Y")

con.2017 <- dates >= lb.2017 & dates < ub.2017

google.2017 <- google[con.2017, ]

lb.2018 <- strptime(as.character("01/01/2018"), "%m/%d/%Y")
ub.2018 <- strptime(as.character("01/01/2019"), "%m/%d/%Y")

format(lb.2018, "%d/%m/%Y")
format(ub.2018, "%d/%m/%Y")

con.2018 <- dates >= lb.2018 & dates < ub.2018

google.2018 <- google[con.2018, ]

mean.2015 <- mean(google.2015$n)
mean.2016 <- mean(google.2016$n)
mean.2017 <- mean(google.2017$n)
mean.2018 <- mean(google.2018$n)
years <- group_by(google, year)

hist(google$n)