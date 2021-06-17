# Hour checkin iter works.

    Code
      foreach(it = hour_checkin_gen(x, "timestamp")) %do% {
        it
      }
    Output
      [[1]]
      # A tibble: 3 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 01:00:00    32576
      2   335 2020-04-19 01:47:16    15722
      3   335 2020-04-19 01:59:59    15722
      
      [[2]]
      # A tibble: 4 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 02:00:00    15722
      2   335 2020-04-19 02:20:13    32576
      3   335 2020-04-19 02:55:41    32576
      4   335 2020-04-19 02:59:59    32576
      
      [[3]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 03:00:00    32576
      2   335 2020-04-19 03:59:59    32576
      
      [[4]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 04:00:00    32576
      2   335 2020-04-19 04:59:59    32576
      
      [[5]]
      # A tibble: 3 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 05:00:00    32576
      2   335 2020-04-19 05:06:50    15637
      3   335 2020-04-19 05:59:59    15637
      
      [[6]]
      # A tibble: 4 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 06:00:00    15637
      2   335 2020-04-19 06:04:48    15722
      3   335 2020-04-19 06:40:09    15637
      4   335 2020-04-19 06:59:59    15637
      
      [[7]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 07:00:00    15637
      2   335 2020-04-19 07:59:59    15637
      
      [[8]]
      # A tibble: 3 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 08:00:00    15637
      2   335 2020-04-19 08:39:31    15722
      3   335 2020-04-19 08:59:59    15722
      
      [[9]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 09:00:00    15722
      2   335 2020-04-19 09:59:59    15722
      
      [[10]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 10:00:00    15722
      2   335 2020-04-19 10:59:59    15722
      
      [[11]]
      # A tibble: 3 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 11:00:00    15722
      2   335 2020-04-19 11:27:57    32617
      3   335 2020-04-19 11:59:59    32617
      

---

    Code
      foreach(it = hcg(x, "timestamp")) %do% {
        it
      }
    Output
      [[1]]
      # A tibble: 3 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 01:00:00    32576
      2   335 2020-04-19 01:47:16    15722
      3   335 2020-04-19 01:59:59    15722
      
      [[2]]
      # A tibble: 4 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 02:00:00    15722
      2   335 2020-04-19 02:20:13    32576
      3   335 2020-04-19 02:55:41    32576
      4   335 2020-04-19 02:59:59    32576
      
      [[3]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 03:00:00    32576
      2   335 2020-04-19 03:59:59    32576
      
      [[4]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 04:00:00    32576
      2   335 2020-04-19 04:59:59    32576
      
      [[5]]
      # A tibble: 3 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 05:00:00    32576
      2   335 2020-04-19 05:06:50    15637
      3   335 2020-04-19 05:59:59    15637
      
      [[6]]
      # A tibble: 4 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 06:00:00    15637
      2   335 2020-04-19 06:04:48    15722
      3   335 2020-04-19 06:40:09    15637
      4   335 2020-04-19 06:59:59    15637
      
      [[7]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 07:00:00    15637
      2   335 2020-04-19 07:59:59    15637
      
      [[8]]
      # A tibble: 3 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 08:00:00    15637
      2   335 2020-04-19 08:39:31    15722
      3   335 2020-04-19 08:59:59    15722
      
      [[9]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 09:00:00    15722
      2   335 2020-04-19 09:59:59    15722
      
      [[10]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 10:00:00    15722
      2   335 2020-04-19 10:59:59    15722
      
      [[11]]
      # A tibble: 3 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 11:00:00    15722
      2   335 2020-04-19 11:27:57    32617
      3   335 2020-04-19 11:59:59    32617
      
      [[12]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 12:00:00    32617
      2   335 2020-04-19 12:59:59    32617
      
      [[13]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 13:00:00    32617
      2   335 2020-04-19 13:59:59    32617
      
      [[14]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 14:00:00    32617
      2   335 2020-04-19 14:59:59    32617
      
      [[15]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 15:00:00    32617
      2   335 2020-04-19 15:59:59    32617
      
      [[16]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 16:00:00    32617
      2   335 2020-04-19 16:59:59    32617
      
      [[17]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 17:00:00    32617
      2   335 2020-04-19 17:59:59    32617
      
      [[18]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 18:00:00    32617
      2   335 2020-04-19 18:59:59    32617
      
      [[19]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 19:00:00    32617
      2   335 2020-04-19 19:59:59    32617
      
      [[20]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 20:00:00    32617
      2   335 2020-04-19 20:59:59    32617
      
      [[21]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 21:00:00    32617
      2   335 2020-04-19 21:59:59    32617
      
      [[22]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 22:00:00    32617
      2   335 2020-04-19 22:59:59    32617
      
      [[23]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-19 23:00:00    32617
      2   335 2020-04-19 23:59:59    32617
      
      [[24]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 00:00:00    32617
      2   335 2020-04-20 00:59:59    32617
      
      [[25]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 01:00:00    32617
      2   335 2020-04-20 01:59:59    32617
      
      [[26]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 02:00:00    32617
      2   335 2020-04-20 02:59:59    32617
      
      [[27]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 03:00:00    32617
      2   335 2020-04-20 03:59:59    32617
      
      [[28]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 04:00:00    32617
      2   335 2020-04-20 04:59:59    32617
      
      [[29]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 05:00:00    32617
      2   335 2020-04-20 05:59:59    32617
      
      [[30]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 06:00:00    32617
      2   335 2020-04-20 06:59:59    32617
      
      [[31]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 07:00:00    32617
      2   335 2020-04-20 07:59:59    32617
      
      [[32]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 08:00:00    32617
      2   335 2020-04-20 08:59:59    32617
      
      [[33]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 09:00:00    32617
      2   335 2020-04-20 09:59:59    32617
      
      [[34]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 10:00:00    32617
      2   335 2020-04-20 10:59:59    32617
      
      [[35]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 11:00:00    32617
      2   335 2020-04-20 11:59:59    32617
      
      [[36]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 12:00:00    32617
      2   335 2020-04-20 12:59:59    32617
      
      [[37]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 13:00:00    32617
      2   335 2020-04-20 13:59:59    32617
      
      [[38]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 14:00:00    32617
      2   335 2020-04-20 14:59:59    32617
      
      [[39]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 15:00:00    32617
      2   335 2020-04-20 15:59:59    32617
      
      [[40]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 16:00:00    32617
      2   335 2020-04-20 16:59:59    32617
      
      [[41]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 17:00:00    32617
      2   335 2020-04-20 17:59:59    32617
      
      [[42]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 18:00:00    32617
      2   335 2020-04-20 18:59:59    32617
      
      [[43]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 19:00:00    32617
      2   335 2020-04-20 19:59:59    32617
      
      [[44]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 20:00:00    32617
      2   335 2020-04-20 20:59:59    32617
      
      [[45]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 21:00:00    32617
      2   335 2020-04-20 21:59:59    32617
      
      [[46]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 22:00:00    32617
      2   335 2020-04-20 22:59:59    32617
      
      [[47]]
      # A tibble: 2 x 3
           id timestamp           location
        <int> <dttm>                 <int>
      1   335 2020-04-20 23:00:00    32617
      2   335 2020-04-20 23:59:59    32617
      

