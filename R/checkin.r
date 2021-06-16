
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

