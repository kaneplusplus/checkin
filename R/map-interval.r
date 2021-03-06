
get_groups <- function(.x) {
  groups = attributes(.x)$groups
  if (is.null(groups)) {
    groups <- tibble(.rows = list(seq_len(nrow(.x))))
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
map_interval <- function(.x, .f, .gen, .combine, on, end = NULL, ...) {
  groups <- get_groups(.x)
  if (is.null(getDoParName())) {
    registerDoSEQ()
  } 
  foreach(i = seq_len(nrow(groups)), .combine = .combine) %dopar% {
    group <- groups[[".rows"]][[i]]
    grouped <- !groups$null[i]
    cn <- names(groups)[1]
    group_name <- as.character(groups[[1]][i])
    ret <- foreach(it = .gen(.x[group,], on, end), .combine = bind_rows) %do% {
      .f(it, ...)
    }
    if (grouped) {
      ret <- bind_cols(tibble({{cn}} := rep(group_name, nrow(ret))), ret)
    }
    ret
  } 
}

map_hourly_interval <- function(.x, .f, on, end = NULL, ...) {
  map_interval(
    .x = .x, 
    .f = .f, 
    .gen = hour_checkin_iter, 
    on = on, 
    end = end,
    ...)
}

map_hourly_interval_dfr <- function(.x, .f, on, end = NULL, ...) {
  map_interval(
    .x = .x, 
    .f = .f, 
    .gen = hour_checkin_iter, 
    .combine = bind_rows,
    on = on, 
    end = end,
    ...)
}

map_hourly_interval_dfc <- function(.x, .f, on, end = NULL, ...) {
  map_interval(
    .x = .x, 
    .f = .f, 
    .gen = hour_checkin_iter, 
    .combine = bind_cols,
    on = on, 
    end = end,
    ...)
}


