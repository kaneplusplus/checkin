context("Test normalize by day")

data(checkins)

checkins %>%
  filter(id == 335) %>%
  normalize_by_day(id = "id", ts_col = "timestamp")
