# Checkins appear in the proper interval.

    Code
      checkins_in_interval(x, "timestamp", start, end)
    Output
      # A tibble: 5 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 06:00:00    15637
      2   335 2020-04-19 06:04:48    15722
      3   335 2020-04-19 06:40:09    15637
      4   335 2020-04-19 08:39:31    15722
      5   335 2020-04-19 09:00:00    15722

---

    Code
      checkins_in_interval(x, "timestamp", start, end)
    Warning <simpleWarning>
      no non-missing arguments to max; returning -Inf
    Warning <lifecycle_warning_deprecated>
      The `i` argument of `[.tbl_df` must lie in [-rows, 0] if negative, as of tibble 3.0.0.
      Use `NA_integer_` as row index to obtain a row full of `NA` values.
    Output
      # A tibble: 92 x 3
            id timestamp           location
         <int> <dttm>                 <int>
       1    NA 2020-04-18 23:00:00       NA
       2   335 2020-04-18 23:59:59    32576
       3   335 2020-04-18 23:59:59    15722
       4   335 2020-04-18 23:59:59    32576
       5   335 2020-04-18 23:59:59    32576
       6   335 2020-04-18 23:59:59    15637
       7   335 2020-04-18 23:59:59    15722
       8   335 2020-04-18 23:59:59    15637
       9   335 2020-04-18 23:59:59    15722
      10   335 2020-04-18 23:59:59    32617
      # ... with 82 more rows

---

    Code
      checkins_in_interval(x, "timestamp", start, end)
    Output
      # A tibble: 3 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1    NA 2020-04-19 00:00:00       NA
      2   335 2020-04-19 00:41:46    32576
      3   335 2020-04-19 00:59:59    32576

---

    Code
      checkins_in_interval(x, "timestamp", start, end, start_loc = FALSE)
    Output
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 00:41:46    32576
      2   335 2020-04-19 00:59:59    32576

---

    Code
      checkins_in_interval(x, "timestamp", start, end)
    Output
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-05-08 09:40:11    32576
      2   335 2020-05-08 10:40:11    32576

---

    Code
      checkins_in_interval(x, "timestamp", start, end, end_loc = FALSE)
    Output
      # A tibble: 1 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-05-08 09:40:11    32576

---

    Code
      checkins_in_interval(x, "timestamp", start, end, start_loc = TRUE, end_loc = TRUE)
    Output
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-05-08 10:40:11    32576
      2   335 2020-05-08 11:40:11    32576

---

    Code
      checkins_in_interval(x, "timestamp", start, end, start_loc = FALSE, end_loc = FALSE)
    Output
      # A tibble: 0 x 3
      # ... with 3 variables: id <int>, timestamp <dttm>, location <int>

