
test_that("Hourly mapping works.", {

  data(checkins)

  x <- checkins %>%
    filter(timestamp <= min(timestamp) + days(1))

  cc <- x %>% group_by(id) %>% summarize(n = n()) %>% arrange(desc(n))

  x <- x %>%
    filter(id %in% cc$id[1:10]) %>%
    filter(timestamp < min(timestamp) + days(1))

  from_to <- function(it) {
    it$duration <- c(diff(it$timestamp), 0)
    units(it$duration) <- "secs"
    it$duration <- as.numeric(it$duration)
    from_duration <- sum(it$duration[it$location == it$location[1]])
    tibble(from=it$location[1],
           to = it$location[nrow(it)],
           timestamp = it$timestamp[1],
           from_duration = from_duration)
  }

  y <- x %>% 
    group_by(id) %>%
    map_hourly_interval_dfr(from_to, time = "timestamp") 

  expect_snapshot(y)

  # Create the mobility graph.
  z <- y %>%
    group_by(from, to, timestamp) %>%
    summarize(n = n()) 
  expect_snapshot(z)

  expect_snapshot(x %>% map_hourly_interval_dfr(from_to, time = "timestamp"))

  expect_snapshot(
    x %>% 
      group_by(id) %>%
      map_hourly_interval_dfc(from_to, time = "timestamp") 
  )

  expect_snapshot(
    x %>% 
      group_by(id) %>%
      map_interval_dfr(.gen = hour_checkin_iter, from_to, time = "timestamp") 
  )
  expect_snapshot(
    x %>% 
      group_by(id) %>%
      map_interval_dfc(.gen = hour_checkin_iter, from_to, time = "timestamp") 
  )
  
})
