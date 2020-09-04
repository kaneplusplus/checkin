
#' @importFrom lubridate hours
#' @export
interval_iter <- function(x, ts_col, start, end, duration, start_loc = TRUE, 
  end_loc = TRUE) {

  interval_iter <- 
  next_elem <- function() {
    if (start > tail(x[[ts_col]], 1)) {
      stop("StopIteration", call. = FALSE) 
    } else {
      end <- start + duration
      ret <- checkins_in_interval(x, ts_col, start, end, start_loc, end_loc)
      start <<- end + seconds(1)
    } 
    ret
  }
  it <- list(nextElem = next_elem)
  class(it) <- c("abstractiter", "iter")
  it
}

hour_checkin_iter <- function(x, ts_col, start_loc = TRUE, end_loc = TRUE) {
  x <- x[order(x[[ts_col]]),]
  start <- x[[ts_col]][1]
  hour(start) <- 0
  minute(start) <- 0
  second(start) <- 0
  end <- tail(x[[ts_col]], 1)
  hour(end) <- 0
  minute(end) <- 0
  second(end) <- 0

  interval_iter(x, ts_col, start, end, hours(1) - seconds(1), start_loc, 
                end_loc)

}
