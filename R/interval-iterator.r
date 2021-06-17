#' @title Create a time interval iterator generator
#'
#' @description The time interval generator creates an iterator, which
#' iterates over consecutive periods of length duration. This function is
#' a more general version of the `hour_check_gen()` function, which iterates
#' over consecutive hours based on start and stop defined by the maximum and
#' minimum times defined in a check data set.
#'
#' @param x the data frame of checkins.
#' @param time the column denoting the timestamp.
#' @param start the beginning of the interval.
#' @param end the end of the interval.
#' @param duration the period for each iteration.
#' @param start_loc should the starting location be included? Default TRUE.
#' @param end_loc should the starting location be included? Default TRUE.
#'
#' @examples
#'
#' library(lubridate)
#' library(dplyr)
#' library(purrr)
#'
#' data(checkins)
#'
#' # Create a data set for the first hour of the checkins data.
#' x <- checkins %>%
#'   filter(timestamp < min(timestamp) + hours(1))
#'  
#' # Create a generator for that hour with 15 minute durations.  
#'
#' gen_15 <- partial(time_interval_gen,
#'                   start = min(x$timestamp), 
#'                   end = max(x$timestamp),
#'                   duration = minutes(15))
#'
#' checkin_count <- function(it) {
#'   tibble(unique_ids = length(unique(it$id)), count = nrow(it))
#' }
#'
#' # Count the number of checkins for each interval.
#' map_interval_dfr(x, gen_15, checkin_count, "timestamp")
#'
#' @seealso hour_checkin_gen
#' @importFrom lubridate hours
#' @export
time_interval_gen <- function(x, time, start, end, duration, 
                               start_loc = TRUE, end_loc = TRUE) {

  interval_gen <- 
    next_elem <- function() {
      if (start > end) {
        stop("StopIteration", call. = FALSE) 
      } else {
        end <- start + duration
        ret <- checkins_in_interval(x, time, start, end, start_loc, end_loc)
        start <<- end + seconds(1)
      } 
      ret
    }
  it <- list(nextElem = next_elem)
  class(it) <- c("abstractiter", "iter")
  it
}

#' @title Create an hour interval iterator generator
#'
#' @description The hour interval iterator generator is a special case of
#' the time interval generator, which iterates over consecutive hours.
#' While this function may be useful on it's own, if you are interested in 
#' applying a function to (possibly grouped) data, then you may be better off
#' reading the `map_hourly_interval` documentation.
#'
#' @param x the data frame of checkins.
#' @param time the column denoting the timestamp.
#' @param end the end of the interval.
#'
#' @examples
#'
#' data(checkins)
#'
#' # Get the first hour entries from the beginning of the checkins data.
#' hour_checkin_gen(head(checkins), "timestamp")$nextElem()
#'
#' @importFrom utils tail
#' @importFrom lubridate hour<- minute<- second<- hours minute second seconds
#' @seealso map_hourly_interval
#' @export
hour_checkin_gen <- function(x, time, end = NULL) {
  x <- x[order(x[[time]]),]
  start <- x[[time]][1]
  if (!(minute(start) == 0 && second(start) == 0)) {
    start <- start + hours(1)
    minute(start) <- second(start) <- 0

    i <- which.max(x[[time]] <= start)
    if (i > 1) {
      x <- x[-( (seq_len(i) - 1)[-1] ),]
    }
    x[[time]][1] <- start
  }

  if (is.null(end)) {
    end <- max(x[[time]])
    minute(end) <- 59
    second(end) <- 59
  }
    
  time_interval_gen(x, time, start, end, hours(1) - seconds(1))
}

