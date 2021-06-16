
test_that("Checkins appear in the proper intervanl.", {

  library(dplyr)

  data(checkins)

  x <- checkins %>%
    filter(id == 335) %>%
    arrange(timestamp)

  start <- x$timestamp[4] 
  hour(start) <- 6
  minute(start) <- 0
  second(start) <- 0
  #end <- start + hours(2) + minutes(59) + seconds(59)
  end <- start + hours(3) 

  expect_snapshot(checkins_in_interval(x, "timestamp", start, end))

  # No available first checkin to carry forward.
  start <- x$timestamp[1] 
  minute(start) <- 0
  second(start) <- 0

  end <- start + hours(1) - seconds(1)

  # Here we get an NA because we can't get a value before the start
  expect_snapshot(checkins_in_interval(x, "timestamp", start, end))

  # Here we don't because start_loc is FALSE
  expect_snapshot(
    checkins_in_interval(x, "timestamp", start, end, start_loc = FALSE))

  # loc at the end of the interval
  start <- tail(x$timestamp, 1)
  end <- start + hours(1)
  expect_snapshot(checkins_in_interval(x, "timestamp", start, end))

  expect_snapshot(
    checkins_in_interval(x, "timestamp", start, end, end_loc = FALSE)
  )

  start <- end
  end <- start + hours(1)
  expect_snapshot(
    checkins_in_interval(x, "timestamp", start, end, 
                         start_loc = TRUE, end_loc = TRUE)
  )

  expect_snapshot(
    checkins_in_interval(x, "timestamp", start, end, 
                         start_loc = FALSE, end_loc = FALSE)
  )
})

