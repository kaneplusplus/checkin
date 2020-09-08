context("Test normalize by day")

library(dplyr)

data(checkins)

checkins %>%
  filter(id == 335) %>%
  normalize_by_day(ts_col = "timestamp")
