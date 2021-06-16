
#' @importFrom lubridate hours
#' @export
time_interval_iter <- function(x, ts_col, start, end, duration, 
                               start_loc = TRUE, end_loc = TRUE) {

  interval_iter <- 
    next_elem <- function() {
      if (start > end) {
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

#' @importFrom utils tail
#' @importFrom lubridate hour<- minute<- second<- hours minute second seconds
#' @export
hour_checkin_iter <- function(x, ts_col, end = NULL) {
  x <- x[order(x[[ts_col]]),]
  start <- x[[ts_col]][1]
  if (!(minute(start) == 0 && second(start) == 0)) {
    start <- start + hours(1)
    minute(start) <- second(start) <- 0

    i <- which.max(x[[ts_col]] <= start)
    if (i > 1) {
      x <- x[-( (seq_len(i) - 1)[-1] ),]
    }
    x[[ts_col]][1] <- start
  }

  if (is.null(end)) {
    end <- max(x[[ts_col]])
    minute(end) <- 59
    second(end) <- 59
  }
    
  time_interval_iter(x, ts_col, start, end, hours(1) - seconds(1))
}

