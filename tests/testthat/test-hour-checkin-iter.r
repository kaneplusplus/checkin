test_that("Hour checkin iter works.", {

  library(dplyr)
  library(lubridate)
  library(purrr)

  data(checkins)

  x <- checkins %>%
    filter(id == 335)

  x <- x[1:9,]

  hour_checkin_gen(x, "timestamp")$nextElem()

  expect_snapshot(
    foreach(it = hour_checkin_gen(x, "timestamp")) %do% {
      it
    } 
  )

  eo_next_day <- max(x$timestamp)
  eo_next_day <- eo_next_day + days(1)
  hour(eo_next_day) <- 23
  minute(eo_next_day) <- 59
  second(eo_next_day) <- 59

  hcg <- partial(hour_checkin_gen, end = eo_next_day)
  expect_snapshot(
    foreach(it = hcg(x, "timestamp")) %do% {
      it
    } 
  )
})
