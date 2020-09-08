
#' @importFrom dplyr bind_rows
#' @importFrom lubridate force_tz tz seconds
#' @importFrom utils tail
carry_forward <- function(x, cd, ts_col) {
  ret <- NULL
  xd <- tail(x[date(x[[ts_col]]) <= cd,], 1)
  xd[[ts_col]] <- 
    force_tz(date(cd) + days(1) - seconds(1), tz(x[[ts_col]]))
  if ( !(xd[[ts_col]] %in% x[[ts_col]]) ) {
    ret <- xd
  }
  xd[[ts_col]] <- 
    force_tz(xd[[ts_col]] + seconds(1), tz(x[[ts_col]]))
  if ( !(xd[[ts_col]] %in% x[[ts_col]]) ) {
    ret <- bind_rows(ret, xd)
  }
  ret
}

#' Normalize data by day
#' @param x the data frame of checkins
#' @param ts_col the column denoting the timestamp
#' @param last_day the last day to normalize. If NULL then the last day
#' in x$timestamp is used.
#' @importFrom lubridate date days
#' @importFrom foreach foreach %do% 
#' @importFrom dplyr bind_rows
#' @export
normalize_by_day  <- function(x, ts_col, last_day = NULL) {
  x <- x[order(x[[ts_col]]),]
  first_day <- date(min(x[[ts_col]]))
  if (is.null(last_day)) {
    last_day <- date(max(x[[ts_col]]))
  }

  days_covered <- rep(first_day, last_day - first_day + 1)
  days_covered <- days_covered + days(seq(0, length(days_covered) - 1))

  d <- NULL
  add_days <- foreach(d = days_covered, .combine = bind_rows) %do% {
    carry_forward(x, d, ts_col)
  }
  add_days <- add_days[date(add_days[[ts_col]]) %in% days_covered,]
  x <- bind_rows(x, add_days)
  x[order(x[[ts_col]]),]
}

#' Get the checkins in an interval
#' @param x the data frame of checkins
#' @param ts_col the column denoting the timestamp
#' @param start the beginning of the interval
#' @param end the end of the interval
#' @param start_loc should the starting location be included? Default TRUE.
#' @param end_loc should the starting location be included? Default TRUE.
#' @importFrom dplyr bind_rows
#' @export
checkins_in_interval <- function(x, ts_col, start, end,
  start_loc = TRUE, end_loc = TRUE) {
  if (nrow(x) == 0) {
    warning("No data, returning NULL")
    return(NULL)
  }
  x <- x[order(x[[ts_col]]),]
  if (start < min(x[[ts_col]]) && start_loc) { # || stop > max(x$time_stamp)) {
    se <- x[1,]
    se[[ts_col]] <- start
    na_vars <- setdiff(names(se), ts_col)
    for (nv in na_vars) {
      se[[nv]] <- NA
    }
  } else if ( !(start %in% x[[ts_col]]) && start_loc) {
    se <- x[max(which(x[[ts_col]] < start)),]
    se[[ts_col]] <- start
  } else {
    se <- NULL
  } 
  ee <- NULL 
  if ( !(end %in% x[[ts_col]]) && end_loc ) {
    ee <- x[max(which(x[[ts_col]] < end)),]
    ee[[ts_col]] <- end 
  }
  bind_rows(
    se,
    x[x[[ts_col]] >= start & x[[ts_col]] <= end,],
    ee)
}

#' @importFrom lubridate hour<- minute<- second<-
to_prev_midnight <- function(x) {
  hour(x) <- 0
  minute(x) <- 0
  second(x) <- 0
  x
}

#' @importFrom utils tail
interval_seq <- function(start, end, by) {
  ret <- NULL
  if (end > start) {
    ret <- start
    while(tail(ret, 1) < end) {
      ret <- c(ret, tail(ret, 1) + by)
    }
  }
  ret
}
