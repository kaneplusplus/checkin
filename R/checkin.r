
#' @title Get the checkins in an interval
#'
#' @description This function filters the input data frame such that the 
#' output is a similar data frame where all entries are in the specified
#' period between `start` and `end`. The `start_loc` and `end_loc` parameters
#' specify whether or not last observations should be carried forward. If
#' `start_loc` is `TRUE` then a checkin occuring before the interval will
#' be carried forward so that the location appears in the output at the
#' beginning of the interval. If `end_loc` is `TRUE` then a checkin is carried
#' forward to the end of the interval.
#' 
#' @param x the data frame of checkins.
#' @param time the column denoting the timestamp.
#' @param start the beginning of the interval.
#' @param end the end of the interval.
#' @param start_loc should the starting location be included? Default TRUE.
#' @param end_loc should the end location be included? Default TRUE.
#'
#' @examples
#'  library(dplyr)
#'  library(lubridate)
#'  data(checkins)
#'
#'  x <- checkins %>%
#'    filter(id == 335) %>%
#'    arrange(timestamp)
#'
#'  start <- x$timestamp[1]
#'  minute(start) <- 0
#'  second(start) <- 0
#'
#'  end <- start + hours(1) - seconds(1)
#'  checkins_in_interval(x, "timestamp", start, end)
#'
#' @importFrom dplyr bind_rows
#' @export
checkins_in_interval <- function(x, time, start, end,
  start_loc = TRUE, end_loc = TRUE) {
  if (nrow(x) == 0) {
    warning("No data, returning NULL")
    return(NULL)
  }
  x <- x[order(x[[time]]),]
  if (start < min(x[[time]]) && start_loc) { # || stop > max(x$time_stamp)) {
    se <- x[1,]
    se[[time]] <- start
    na_vars <- setdiff(names(se), time)
    for (nv in na_vars) {
      se[[nv]] <- NA
    }
  } else if ( !(start %in% x[[time]]) && start_loc) {
    inds <- which(x[[time]] < start)
    se <- NULL
    if (length(inds) > 0) {
      se <- x[max(inds),]
      se[[time]] <- start
    }
  } else {
    se <- NULL
  } 
  ee <- NULL 
  if ( !(end %in% x[[time]]) && end_loc ) {
    inds <- which(x[[time]] < end)
    if (length(inds)) {
      ee <- x[max(inds),]
      ee[[time]] <- end 
    }
  }
  bind_rows(
    se,
    x[x[[time]] >= start & x[[time]] <= end,],
    ee)
}

