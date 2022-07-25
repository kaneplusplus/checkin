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
    Output
      # A tibble: 1 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1    NA 2020-04-18 23:00:00       NA

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
      # i Use `colnames()` to see all variable names

