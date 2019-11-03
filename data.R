library(dplyr)
library(ggplot2)


dataUrl <- "https://data.lacity.org/api/views/yru6-6re4/rows.csv?accessType=DOWNLOAD"

csvfile_data = "Arrest_Data_from_2010_to_Present.csv"

if(!file.exists(csvfile_data))
{
  checkUrl <- file(dataUrl,"r")
  if (!isOpen(checkUrl)) {
    stop(paste("Error happened! =>", geterrmessage()))
  }
  download.file(dataUrl,destfile=csvfile_data)
}

path_rf <- file.path("csvfile_data")
files <- list.files(path_rf, recursive=TRUE)
  

Arrest_data <- read.csv("Arrest_Data_from_2010_to_Present.csv")

# Arrest_data <- Arrest_data[complete.cases(Arrest_data), ]

dates <- Arrest_data$Arrest.Date

dates <- strptime(as.character(dates), "%m/%d/%Y")

as.Date(dates)
format(dates, "%d/%m/%Y")

lb <- strptime(as.character("01/01/2018"), "%m/%d/%Y")
ub <- strptime(as.character("01/01/2019"), "%m/%d/%Y")

format(lb, "%d/%m/%Y")
format(ub, "%d/%m/%Y")

con <- dates >= lb & dates < ub

dates.2018 <- dates[con]
df <- data.frame(date=dates.2018)
    
# How many bookings of arrestees were made in 2018?
no_bookings <- nrow(df)


Arrest_data.2018 <- Arrest_data[con, ]

data_grouped_by_area <- Arrest_data.2018 %>% 
  group_by(Area.ID) %>%
  summarise(n = sum(Area.ID))

max_id <- which.max(data_grouped_by_area$n)

# How many bookings of arrestees were made in the area with the most arrests in 2018?
max_booking_2018 <- data_grouped_by_area[max_id, 2]


