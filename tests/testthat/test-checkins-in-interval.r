context("Test normalize by day")

data(checkins)

x <- checkins %>%
  filter(id == 335) 

start <- x$timestamp[4] 
hour(start) <- 6
minute(start) <- 0
second(start) <- 0
end <- start + hours(2) + minutes(59) + seconds(59)

checkins_in_interval(x, "id", "timestamp", start, end)
