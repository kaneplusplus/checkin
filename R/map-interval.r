
get_groups <- function(.x) {
  groups = attributes(.x)$groups
  if (is.null(groups)) {
    groups <- tibble(rows = list(seq_len(nrow(.x))))
    names(groups)[1] <- ".rows"
    groups$name <- "all"
    groups$null <- TRUE
  } else {
    groups$null <- FALSE
  }
  groups
}

#' @importFrom dplyr bind_rows bind_cols
#' @importFrom tibble tibble
#' @importFrom foreach foreach %do% %dopar% getDoParName registerDoSEQ
map_interval_impl <- function(.x, .f, .gen, .combine, time, end = NULL, ...) {
  groups <- get_groups(.x)
  if (is.null(getDoParName())) {
    registerDoSEQ()
  } 
  foreach(i = seq_len(nrow(groups)), .combine = .combine) %dopar% {
    group <- groups[[".rows"]][[i]]
    grouped <- !groups$null[i]
    cn <- names(groups)[1]
    group_name <- as.character(groups[[1]][i])
    ret <- foreach(it = .gen(.x[group,], time, end), .combine = .combine) %do% {
      .f(it, ...)
    }
    if (grouped) {
      ret <- bind_cols(tibble({{cn}} := rep(group_name, nrow(ret))), ret)
    }
    ret
  } 
}

#' Apply a function to each group and hourly interval in a data.frame
#' 
#' @description For checking data represented as a data frame, a column
#' contatining timestamps, and other information associated with the checkin,
#' this functions applies a specified function to the subsets of the
#' data falling within the time interval. This can be used to get check in
#' counts for each hour, for example. In addition, grouped data is supported
#' (using dplyr::group_by) to further specify subsets of specific groups and 
#' time intervals on which the function should be applied. The
#' `map_hourly_interval_dfr()` function appends the results by row and
#' `map_hourly_interval_dfc()` function appends results by column.
#'
#' @param .x a data.frame to apply a function to.
#' @param .f the function to apply to the group and hourly interval.
#' @param time the column denoting the checkin times.
#' @param end the end time. By default this is the the end of the hour
#' corresponding to the largest time.
#' @param ... other arguments to pass to the function `.f`.
#'
#' @examples
#' # Count the number of transitions between locations in the checkin data.
#'
#' library(dplyr)
#'
#' data(checkin)
#'
#'  from_to <- function(it) {
#'    it$duration <- c(diff(it$timestamp), 0)
#'    units(it$duration) <- "secs"
#'    it$duration <- as.numeric(it$duration)
#'    from_duration <- sum(it$duration[it$location == it$location[1]])
#'    tibble(from=it$location[1],
#'           to = it$location[nrow(it)],
#'           timestamp = it$timestamp[1],
#'           from_duration = from_duration)
#'  }
#'
#'  y <- checkin %>%
#'    group_by(id) %>%
#'    map_hourly_interval_dfr(from_to, time = "timestamp") 
#' 
#' @aliases map_hourly_interval_dfc map_hourly_interval
#' @export
map_hourly_interval_dfr <- function(.x, .f, time, end = NULL, ...) {
  map_interval_impl(
    .x = .x, 
    .f = .f, 
    .gen = hour_checkin_iter, 
    .combine = bind_rows,
    time = time, 
    end = end,
    ...)
}

#' @export
map_hourly_interval_dfc <- function(.x, .f, time, end = NULL, ...) {
  map_interval_impl(
    .x = .x, 
    .f = .f, 
    .gen = hour_checkin_iter, 
    .combine = bind_cols,
    time = time, 
    end = end,
    ...)
}

#' @export
map_interval_dfc <- function(.x, .gen, .f, time, end = NULL, ...) {
  map_interval_impl(
    .x = .x, 
    .f = .f, 
    .gen = .gen, 
    .combine = bind_cols,
    time = time, 
    end = end,
    ...)
}

#' @export
map_interval_dfr <- function(.x, .gen, .f, time, end = NULL, ...) {
  map_interval_impl(
    .x = .x, 
    .f = .f, 
    .gen = .gen, 
    .combine = bind_rows,
    time = time, 
    end = end,
    ...)
}

