context("Test normalize by day")

x <- x %>% arrange(timestamp)

data(checkins)

x <- checkins %>%
  filter(id == 335) 

start <- x$timestamp[4] 
hour(start) <- 6
minute(start) <- 0
second(start) <- 0
#end <- start + hours(2) + minutes(59) + seconds(59)
end <- start + hours(3) 

checkins_in_interval(x, "timestamp", start, end)

# No available first checkin to carry forward.
x <- x %>% arrange(timestamp)
start <- x$timestamp[1] 
minute(start) <- 0
second(start) <- 0

end <- start + hours(1) - seconds(1)

# Here we get an NA because we can't get a value before the start
checkins_in_interval(x, "timestamp", start, end)

# Here we don't because start_loc is FALSE
checkins_in_interval(x, "timestamp", start, end, start_loc = FALSE)

start <- tail(x$timestamp, 1)
end <- start + hours(1)
checkins_in_interval(x, "timestamp", start, end)

checkins_in_interval(x, "timestamp", start, end, end_loc = FALSE)

start <- end
end <- start + hours(1)
checkins_in_interval(x, "timestamp", start, end, 
                     start_loc = TRUE, end_loc = TRUE)

checkins_in_interval(x, "timestamp", start, end, 
                     start_loc = FALSE, end_loc = FALSE)

# using the slider package for sliding window operations.
# drop_last default
