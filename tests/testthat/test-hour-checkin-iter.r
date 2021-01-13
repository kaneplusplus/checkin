library(dplyr)
library(foreach)
library(lubridate)

data(checkins)

x <- checkins %>%
  filter(id == 335)

x <- x[1:9,]

foreach(it = hour_checkin_iter(x, "timestamp")) %do% {
  it
} 

eo_next_day <- max(x$timestamp)
eo_next_day <- eo_next_day + day(1)
hour(eo_next_day) <- 23
minute(eo_next_day) <- 59
second(eo_next_day) <- 59

foreach(it = hour_checkin_iter(x, "timestamp", end = eo_next_day)) %do% {
  it
} 

