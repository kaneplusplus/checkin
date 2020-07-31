library(dplyr)
library(usethis)
library(lubridate)

# The following line is location dependent.
# x <- readRDS("~/projects/covid-19-mobility/traj.rds")

checkins <- x %>%
  select(imsi, time_stamp, laccid) %>%
  rename(id = imsi, location = laccid, timestamp = time_stamp) %>%
  mutate(id= as.integer(as.factor(id)),
         location = as.integer(as.factor(location)),
         timestamp = timestamp + days(49)) %>%
  filter(id <= 1000)

use_data(checkins)
