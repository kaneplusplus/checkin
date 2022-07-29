
<!-- README.md is generated from README.Rmd. Please edit that file -->



# checkin

<!-- badges: start -->
[![R-CMD-check](https://github.com/kaneplusplus/checkin/workflows/R-CMD-check/badge.svg)](https://github.com/kaneplusplus/checkin/actions)
[![R-CMD-check](https://github.com/kaneplusplus/checkin/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/kaneplusplus/checkin/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The analysis of mobility data often begins with the processing of data capturing the time and location of individuals. When preparing these data for analysis, the continuous timestamp data can be particularly difficult to normalize since they require the data scientist to integrate model. For example, we may want to build sequences of checkins for a given device over locations and then count the total number of transitions between locations over all individuals.  Problems like these are common in mobility research, they require careful consideration based on the goals of an analysis, and software tools implementing these types of computations will provide benefits in terms of time savings and data integrity. To address these challenges we provide the `checkin` package, which provides a standard set of functions for appropriately descretizing spatio-timestamp data for aggregate analysis for the R programming environment

## Installation

You can install the the development version of {checkin} from 
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("kaneplusplus/checkin")
```

# Usage

Consider the `checkins` data set from the `checkin` library shown below. The data consists of 3 columns corresponding to the device (id), time, (timestamp), and location identifier (location). There are a total of 
1000 unique people/devices rangin in time from 2020-04-19 00:01:13 EST to 2020-05-08 18:58:29 EST.


```r
library(checkin)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
data(checkins)
checkins
#> # A tibble: 14,609 × 3
#>       id timestamp           location
#>    <int> <dttm>                 <int>
#>  1   442 2020-04-19 17:23:44    36496
#>  2   442 2020-04-19 17:23:35    36496
#>  3   166 2020-04-19 12:55:44    37461
#>  4   476 2020-04-19 06:23:47    33476
#>  5   456 2020-04-19 05:39:09    33468
#>  6   458 2020-04-19 10:04:20    36500
#>  7   458 2020-04-19 15:15:25    36876
#>  8   651 2020-04-19 13:31:19    37391
#>  9   652 2020-04-19 05:27:54    37469
#> 10   653 2020-04-19 05:28:59    37389
#> # … with 14,599 more rows
#> # ℹ Use `print(n = ...)` to see more rows

checkins |>
  group_by(id) |>
  summarize(total_ids = n())
#> # A tibble: 1,000 × 2
#>       id total_ids
#>    <int>     <int>
#>  1     1         1
#>  2     2         2
#>  3     3         1
#>  4     4         5
#>  5     5         1
#>  6     6         3
#>  7     7         1
#>  8     8         1
#>  9     9         2
#> 10    10         2
#> # … with 990 more rows
#> # ℹ Use `print(n = ...)` to see more rows
```

Now suppose we would like to examine the checkins of indvidual/device number 335. We will extract all rows with id 335 and then specify an interval starting at the beginning of the hour of the first checkin to one hour later using the `checkins_in_interval()` function. The code and output are below and there are two things to note. First, the first row location is `NA`. This is because the individual/device does not appear before 2020-04-19 00:41:46 and a location cannot be determined. Second the original data set did not include an entry for id 335 at 2020-04-19 00:59:59. This value was carried forward from the previous location.


```r
library(lubridate)
#> 
#> Attaching package: 'lubridate'
#> The following objects are masked from 'package:base':
#> 
#>     date, intersect, setdiff, union
x <- checkins %>%
  filter(id == 335) %>%
  arrange(timestamp)

start <- x$timestamp[1]
minute(start) <- 0
second(start) <- 0

end <- start + hours(1) - seconds(1)
checkins_in_interval(x, "timestamp", start, end)
#> # A tibble: 3 × 3
#>      id timestamp           location
#>   <int> <dttm>                 <int>
#> 1    NA 2020-04-19 00:00:00       NA
#> 2   335 2020-04-19 00:41:46    32576
#> 3   335 2020-04-19 00:59:59    32576
```
Finally, suppose we would like to get the locations of individuals/devices at the beginning of a time interval, the location at the end of the interval, and the total amount of time the individual/devices was checked into the beginning location. This operation would be performed in two steps. First, a function, `from_to()` is constructed, which takes the rows corresponding to a single `id` for a given interval. This function finds, the initial location (`from`), the end location(`to`), the timestamp at the _beginning_ of the interval, and the duration of the initial location. In the second step, we group the `checkin` data by `id` and pass the result to the `map_hourly_interval_dfr()` function, which applies to `from_to()` function to each `id` over each hourly interval. Other intervals are included in the package and the documentation includes a information on how to construct similar functions over custom intervals.


```r
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

 checkins |>
   group_by(id) |>
   map_hourly_interval_dfr(from_to, time = "timestamp") 
#> # A tibble: 319,867 × 5
#>    id     from    to timestamp           from_duration
#>    <chr> <int> <int> <dttm>                      <dbl>
#>  1 1     33175 33175 2020-04-22 05:00:00          3599
#>  2 2     36523 36523 2020-04-20 01:00:00          3599
#>  3 2     36523 36523 2020-04-20 02:00:00          3599
#>  4 2     36523 36523 2020-04-20 03:00:00          3599
#>  5 2     36523 36523 2020-04-20 04:00:00          3599
#>  6 2     36523 36523 2020-04-20 05:00:00          3599
#>  7 2     36523 36523 2020-04-20 06:00:00          3599
#>  8 2     36523 36523 2020-04-20 07:00:00          3599
#>  9 2     36523 36523 2020-04-20 08:00:00          3599
#> 10 2     36523 36523 2020-04-20 09:00:00          3599
#> # … with 319,857 more rows
#> # ℹ Use `print(n = ...)` to see more rows
```

# Acknowledgements

This work was partially supported by the National Science Foundation (NSF) Grant Human Networks and Data Science - Infrastructure (HNDS-I), award numbers 2024335 and 2024233.

## Code of Conduct

Please note that the checkin project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.
