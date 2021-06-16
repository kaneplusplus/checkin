# Hourly mapping works.

    Code
      y
    Output
      # A tibble: 156 x 5
         id     from    to timestamp           from_duration
         <chr> <int> <int> <dttm>                      <dbl>
       1 34    16775 16775 2020-04-19 08:00:00          3599
       2 34    16775 16775 2020-04-19 09:00:00          3599
       3 34    16775 16775 2020-04-19 10:00:00          3599
       4 34    16775 16918 2020-04-19 11:00:00          1335
       5 34    16918 16918 2020-04-19 12:00:00          3599
       6 34    16918 16918 2020-04-19 13:00:00          3599
       7 34    16918 16918 2020-04-19 14:00:00          3599
       8 34    16918 15078 2020-04-19 15:00:00          1533
       9 34    15078 15078 2020-04-19 16:00:00          3599
      10 34    15078 15078 2020-04-19 17:00:00          3599
      # ... with 146 more rows

---

    Code
      z
    Output
      # A tibble: 154 x 4
      # Groups:   from, to [53]
          from    to timestamp               n
         <int> <int> <dttm>              <int>
       1 15078 15078 2020-04-19 16:00:00     1
       2 15078 15078 2020-04-19 17:00:00     1
       3 15078 15078 2020-04-19 18:00:00     1
       4 15078 15078 2020-04-19 19:00:00     1
       5 15078 16844 2020-04-19 20:00:00     1
       6 15497 15497 2020-04-19 20:00:00     1
       7 15497 36858 2020-04-19 21:00:00     1
       8 15637 15637 2020-04-19 06:00:00     1
       9 15637 15637 2020-04-19 07:00:00     1
      10 15637 15722 2020-04-19 08:00:00     1
      # ... with 144 more rows

---

    Code
      x %>% map_hourly_interval_dfr(from_to, time = "timestamp")
    Output
      # A tibble: 22 x 4
          from    to timestamp           from_duration
         <int> <int> <dttm>                      <dbl>
       1 32576 36902 2020-04-19 01:00:00          2402
       2 36902 32576 2020-04-19 02:00:00           122
       3 32576 33658 2020-04-19 03:00:00            84
       4 33658 33658 2020-04-19 04:00:00          3599
       5 33658 15637 2020-04-19 05:00:00           358
       6 15637 16277 2020-04-19 06:00:00           849
       7 16277 33660 2020-04-19 07:00:00          1090
       8 33660 33467 2020-04-19 08:00:00          1707
       9 33467 36524 2020-04-19 09:00:00          3154
      10 36524 33329 2020-04-19 10:00:00          2430
      # ... with 12 more rows

---

    Code
      x %>% group_by(id) %>% map_hourly_interval_dfc(from_to, time = "timestamp")
    Message <simpleMessage>
      New names:
      * from -> from...1
      * to -> to...2
      * timestamp -> timestamp...3
      * from_duration -> from_duration...4
      * from -> from...5
      * ...
      New names:
      * from -> from...9
      * to -> to...10
      * timestamp -> timestamp...11
      * from_duration -> from_duration...12
      New names:
      * from -> from...13
      * to -> to...14
      * timestamp -> timestamp...15
      * from_duration -> from_duration...16
      New names:
      * from -> from...17
      * to -> to...18
      * timestamp -> timestamp...19
      * from_duration -> from_duration...20
      New names:
      * from -> from...21
      * to -> to...22
      * timestamp -> timestamp...23
      * from_duration -> from_duration...24
      New names:
      * from -> from...25
      * to -> to...26
      * timestamp -> timestamp...27
      * from_duration -> from_duration...28
      New names:
      * from -> from...29
      * to -> to...30
      * timestamp -> timestamp...31
      * from_duration -> from_duration...32
      New names:
      * from -> from...33
      * to -> to...34
      * timestamp -> timestamp...35
      * from_duration -> from_duration...36
      New names:
      * from -> from...37
      * to -> to...38
      * timestamp -> timestamp...39
      * from_duration -> from_duration...40
      New names:
      * from -> from...41
      * to -> to...42
      * timestamp -> timestamp...43
      * from_duration -> from_duration...44
      New names:
      * from -> from...45
      * to -> to...46
      * timestamp -> timestamp...47
      * from_duration -> from_duration...48
      New names:
      * from -> from...49
      * to -> to...50
      * timestamp -> timestamp...51
      * from_duration -> from_duration...52
      New names:
      * from -> from...53
      * to -> to...54
      * timestamp -> timestamp...55
      * from_duration -> from_duration...56
      New names:
      * from -> from...57
      * to -> to...58
      * timestamp -> timestamp...59
      * from_duration -> from_duration...60
      New names:
      * from...1 -> from...2
      * to...2 -> to...3
      * timestamp...3 -> timestamp...4
      * from_duration...4 -> from_duration...5
      * from...5 -> from...6
      * ...
      New names:
      * from -> from...1
      * to -> to...2
      * timestamp -> timestamp...3
      * from_duration -> from_duration...4
      * from -> from...5
      * ...
      New names:
      * from -> from...9
      * to -> to...10
      * timestamp -> timestamp...11
      * from_duration -> from_duration...12
      New names:
      * from -> from...13
      * to -> to...14
      * timestamp -> timestamp...15
      * from_duration -> from_duration...16
      New names:
      * from -> from...17
      * to -> to...18
      * timestamp -> timestamp...19
      * from_duration -> from_duration...20
      New names:
      * from -> from...21
      * to -> to...22
      * timestamp -> timestamp...23
      * from_duration -> from_duration...24
      New names:
      * from -> from...25
      * to -> to...26
      * timestamp -> timestamp...27
      * from_duration -> from_duration...28
      New names:
      * from -> from...29
      * to -> to...30
      * timestamp -> timestamp...31
      * from_duration -> from_duration...32
      New names:
      * from -> from...33
      * to -> to...34
      * timestamp -> timestamp...35
      * from_duration -> from_duration...36
      New names:
      * from -> from...37
      * to -> to...38
      * timestamp -> timestamp...39
      * from_duration -> from_duration...40
      New names:
      * from -> from...41
      * to -> to...42
      * timestamp -> timestamp...43
      * from_duration -> from_duration...44
      New names:
      * from -> from...45
      * to -> to...46
      * timestamp -> timestamp...47
      * from_duration -> from_duration...48
      New names:
      * from -> from...49
      * to -> to...50
      * timestamp -> timestamp...51
      * from_duration -> from_duration...52
      New names:
      * from -> from...53
      * to -> to...54
      * timestamp -> timestamp...55
      * from_duration -> from_duration...56
      New names:
      * from -> from...57
      * to -> to...58
      * timestamp -> timestamp...59
      * from_duration -> from_duration...60
      New names:
      * from -> from...61
      * to -> to...62
      * timestamp -> timestamp...63
      * from_duration -> from_duration...64
      New names:
      * from -> from...65
      * to -> to...66
      * timestamp -> timestamp...67
      * from_duration -> from_duration...68
      New names:
      * from -> from...69
      * to -> to...70
      * timestamp -> timestamp...71
      * from_duration -> from_duration...72
      New names:
      * from -> from...73
      * to -> to...74
      * timestamp -> timestamp...75
      * from_duration -> from_duration...76
      New names:
      * from...1 -> from...2
      * to...2 -> to...3
      * timestamp...3 -> timestamp...4
      * from_duration...4 -> from_duration...5
      * from...5 -> from...6
      * ...
      New names:
      * id -> id...1
      * id -> id...62
      * from...2 -> from...63
      * to...3 -> to...64
      * timestamp...4 -> timestamp...65
      * ...
      New names:
      * from -> from...1
      * to -> to...2
      * timestamp -> timestamp...3
      * from_duration -> from_duration...4
      * from -> from...5
      * ...
      New names:
      * from -> from...9
      * to -> to...10
      * timestamp -> timestamp...11
      * from_duration -> from_duration...12
      New names:
      * from -> from...13
      * to -> to...14
      * timestamp -> timestamp...15
      * from_duration -> from_duration...16
      New names:
      * from -> from...17
      * to -> to...18
      * timestamp -> timestamp...19
      * from_duration -> from_duration...20
      New names:
      * from -> from...21
      * to -> to...22
      * timestamp -> timestamp...23
      * from_duration -> from_duration...24
      New names:
      * from -> from...25
      * to -> to...26
      * timestamp -> timestamp...27
      * from_duration -> from_duration...28
      New names:
      * from -> from...29
      * to -> to...30
      * timestamp -> timestamp...31
      * from_duration -> from_duration...32
      New names:
      * from -> from...33
      * to -> to...34
      * timestamp -> timestamp...35
      * from_duration -> from_duration...36
      New names:
      * from -> from...37
      * to -> to...38
      * timestamp -> timestamp...39
      * from_duration -> from_duration...40
      New names:
      * from -> from...41
      * to -> to...42
      * timestamp -> timestamp...43
      * from_duration -> from_duration...44
      New names:
      * from...1 -> from...2
      * to...2 -> to...3
      * timestamp...3 -> timestamp...4
      * from_duration...4 -> from_duration...5
      * from...5 -> from...6
      * ...
      New names:
      * id -> id...139
      * from...2 -> from...140
      * to...3 -> to...141
      * timestamp...4 -> timestamp...142
      * from_duration...5 -> from_duration...143
      * ...
      New names:
      * from -> from...1
      * to -> to...2
      * timestamp -> timestamp...3
      * from_duration -> from_duration...4
      * from -> from...5
      * ...
      New names:
      * from -> from...9
      * to -> to...10
      * timestamp -> timestamp...11
      * from_duration -> from_duration...12
      New names:
      * from -> from...13
      * to -> to...14
      * timestamp -> timestamp...15
      * from_duration -> from_duration...16
      New names:
      * from -> from...17
      * to -> to...18
      * timestamp -> timestamp...19
      * from_duration -> from_duration...20
      New names:
      * from -> from...21
      * to -> to...22
      * timestamp -> timestamp...23
      * from_duration -> from_duration...24
      New names:
      * from -> from...25
      * to -> to...26
      * timestamp -> timestamp...27
      * from_duration -> from_duration...28
      New names:
      * from -> from...29
      * to -> to...30
      * timestamp -> timestamp...31
      * from_duration -> from_duration...32
      New names:
      * from -> from...33
      * to -> to...34
      * timestamp -> timestamp...35
      * from_duration -> from_duration...36
      New names:
      * from -> from...37
      * to -> to...38
      * timestamp -> timestamp...39
      * from_duration -> from_duration...40
      New names:
      * from -> from...41
      * to -> to...42
      * timestamp -> timestamp...43
      * from_duration -> from_duration...44
      New names:
      * from -> from...45
      * to -> to...46
      * timestamp -> timestamp...47
      * from_duration -> from_duration...48
      New names:
      * from -> from...49
      * to -> to...50
      * timestamp -> timestamp...51
      * from_duration -> from_duration...52
      New names:
      * from -> from...53
      * to -> to...54
      * timestamp -> timestamp...55
      * from_duration -> from_duration...56
      New names:
      * from -> from...57
      * to -> to...58
      * timestamp -> timestamp...59
      * from_duration -> from_duration...60
      New names:
      * from -> from...61
      * to -> to...62
      * timestamp -> timestamp...63
      * from_duration -> from_duration...64
      New names:
      * from...1 -> from...2
      * to...2 -> to...3
      * timestamp...3 -> timestamp...4
      * from_duration...4 -> from_duration...5
      * from...5 -> from...6
      * ...
      New names:
      * id -> id...184
      * from...2 -> from...185
      * to...3 -> to...186
      * timestamp...4 -> timestamp...187
      * from_duration...5 -> from_duration...188
      * ...
      New names:
      * from -> from...1
      * to -> to...2
      * timestamp -> timestamp...3
      * from_duration -> from_duration...4
      * from -> from...5
      * ...
      New names:
      * from -> from...9
      * to -> to...10
      * timestamp -> timestamp...11
      * from_duration -> from_duration...12
      New names:
      * from -> from...13
      * to -> to...14
      * timestamp -> timestamp...15
      * from_duration -> from_duration...16
      New names:
      * from -> from...17
      * to -> to...18
      * timestamp -> timestamp...19
      * from_duration -> from_duration...20
      New names:
      * from -> from...21
      * to -> to...22
      * timestamp -> timestamp...23
      * from_duration -> from_duration...24
      New names:
      * from -> from...25
      * to -> to...26
      * timestamp -> timestamp...27
      * from_duration -> from_duration...28
      New names:
      * from -> from...29
      * to -> to...30
      * timestamp -> timestamp...31
      * from_duration -> from_duration...32
      New names:
      * from -> from...33
      * to -> to...34
      * timestamp -> timestamp...35
      * from_duration -> from_duration...36
      New names:
      * from -> from...37
      * to -> to...38
      * timestamp -> timestamp...39
      * from_duration -> from_duration...40
      New names:
      * from -> from...41
      * to -> to...42
      * timestamp -> timestamp...43
      * from_duration -> from_duration...44
      New names:
      * from -> from...45
      * to -> to...46
      * timestamp -> timestamp...47
      * from_duration -> from_duration...48
      New names:
      * from -> from...49
      * to -> to...50
      * timestamp -> timestamp...51
      * from_duration -> from_duration...52
      New names:
      * from...1 -> from...2
      * to...2 -> to...3
      * timestamp...3 -> timestamp...4
      * from_duration...4 -> from_duration...5
      * from...5 -> from...6
      * ...
      New names:
      * id -> id...249
      * from...2 -> from...250
      * to...3 -> to...251
      * timestamp...4 -> timestamp...252
      * from_duration...5 -> from_duration...253
      * ...
      New names:
      * from -> from...1
      * to -> to...2
      * timestamp -> timestamp...3
      * from_duration -> from_duration...4
      * from -> from...5
      * ...
      New names:
      * from -> from...9
      * to -> to...10
      * timestamp -> timestamp...11
      * from_duration -> from_duration...12
      New names:
      * from -> from...13
      * to -> to...14
      * timestamp -> timestamp...15
      * from_duration -> from_duration...16
      New names:
      * from -> from...17
      * to -> to...18
      * timestamp -> timestamp...19
      * from_duration -> from_duration...20
      New names:
      * from -> from...21
      * to -> to...22
      * timestamp -> timestamp...23
      * from_duration -> from_duration...24
      New names:
      * from -> from...25
      * to -> to...26
      * timestamp -> timestamp...27
      * from_duration -> from_duration...28
      New names:
      * from -> from...29
      * to -> to...30
      * timestamp -> timestamp...31
      * from_duration -> from_duration...32
      New names:
      * from -> from...33
      * to -> to...34
      * timestamp -> timestamp...35
      * from_duration -> from_duration...36
      New names:
      * from -> from...37
      * to -> to...38
      * timestamp -> timestamp...39
      * from_duration -> from_duration...40
      New names:
      * from -> from...41
      * to -> to...42
      * timestamp -> timestamp...43
      * from_duration -> from_duration...44
      New names:
      * from -> from...45
      * to -> to...46
      * timestamp -> timestamp...47
      * from_duration -> from_duration...48
      New names:
      * from -> from...49
      * to -> to...50
      * timestamp -> timestamp...51
      * from_duration -> from_duration...52
      New names:
      * from -> from...53
      * to -> to...54
      * timestamp -> timestamp...55
      * from_duration -> from_duration...56
      New names:
      * from -> from...57
      * to -> to...58
      * timestamp -> timestamp...59
      * from_duration -> from_duration...60
      New names:
      * from -> from...61
      * to -> to...62
      * timestamp -> timestamp...63
      * from_duration -> from_duration...64
      New names:
      * from...1 -> from...2
      * to...2 -> to...3
      * timestamp...3 -> timestamp...4
      * from_duration...4 -> from_duration...5
      * from...5 -> from...6
      * ...
      New names:
      * id -> id...302
      * from...2 -> from...303
      * to...3 -> to...304
      * timestamp...4 -> timestamp...305
      * from_duration...5 -> from_duration...306
      * ...
      New names:
      * from -> from...1
      * to -> to...2
      * timestamp -> timestamp...3
      * from_duration -> from_duration...4
      * from -> from...5
      * ...
      New names:
      * from -> from...9
      * to -> to...10
      * timestamp -> timestamp...11
      * from_duration -> from_duration...12
      New names:
      * from -> from...13
      * to -> to...14
      * timestamp -> timestamp...15
      * from_duration -> from_duration...16
      New names:
      * from -> from...17
      * to -> to...18
      * timestamp -> timestamp...19
      * from_duration -> from_duration...20
      New names:
      * from -> from...21
      * to -> to...22
      * timestamp -> timestamp...23
      * from_duration -> from_duration...24
      New names:
      * from -> from...25
      * to -> to...26
      * timestamp -> timestamp...27
      * from_duration -> from_duration...28
      New names:
      * from -> from...29
      * to -> to...30
      * timestamp -> timestamp...31
      * from_duration -> from_duration...32
      New names:
      * from -> from...33
      * to -> to...34
      * timestamp -> timestamp...35
      * from_duration -> from_duration...36
      New names:
      * from -> from...37
      * to -> to...38
      * timestamp -> timestamp...39
      * from_duration -> from_duration...40
      New names:
      * from -> from...41
      * to -> to...42
      * timestamp -> timestamp...43
      * from_duration -> from_duration...44
      New names:
      * from -> from...45
      * to -> to...46
      * timestamp -> timestamp...47
      * from_duration -> from_duration...48
      New names:
      * from -> from...49
      * to -> to...50
      * timestamp -> timestamp...51
      * from_duration -> from_duration...52
      New names:
      * from -> from...53
      * to -> to...54
      * timestamp -> timestamp...55
      * from_duration -> from_duration...56
      New names:
      * from...1 -> from...2
      * to...2 -> to...3
      * timestamp...3 -> timestamp...4
      * from_duration...4 -> from_duration...5
      * from...5 -> from...6
      * ...
      New names:
      * id -> id...367
      * from...2 -> from...368
      * to...3 -> to...369
      * timestamp...4 -> timestamp...370
      * from_duration...5 -> from_duration...371
      * ...
      New names:
      * from -> from...1
      * to -> to...2
      * timestamp -> timestamp...3
      * from_duration -> from_duration...4
      * from -> from...5
      * ...
      New names:
      * from -> from...9
      * to -> to...10
      * timestamp -> timestamp...11
      * from_duration -> from_duration...12
      New names:
      * from -> from...13
      * to -> to...14
      * timestamp -> timestamp...15
      * from_duration -> from_duration...16
      New names:
      * from -> from...17
      * to -> to...18
      * timestamp -> timestamp...19
      * from_duration -> from_duration...20
      New names:
      * from -> from...21
      * to -> to...22
      * timestamp -> timestamp...23
      * from_duration -> from_duration...24
      New names:
      * from -> from...25
      * to -> to...26
      * timestamp -> timestamp...27
      * from_duration -> from_duration...28
      New names:
      * from -> from...29
      * to -> to...30
      * timestamp -> timestamp...31
      * from_duration -> from_duration...32
      New names:
      * from -> from...33
      * to -> to...34
      * timestamp -> timestamp...35
      * from_duration -> from_duration...36
      New names:
      * from -> from...37
      * to -> to...38
      * timestamp -> timestamp...39
      * from_duration -> from_duration...40
      New names:
      * from -> from...41
      * to -> to...42
      * timestamp -> timestamp...43
      * from_duration -> from_duration...44
      New names:
      * from -> from...45
      * to -> to...46
      * timestamp -> timestamp...47
      * from_duration -> from_duration...48
      New names:
      * from -> from...49
      * to -> to...50
      * timestamp -> timestamp...51
      * from_duration -> from_duration...52
      New names:
      * from -> from...53
      * to -> to...54
      * timestamp -> timestamp...55
      * from_duration -> from_duration...56
      New names:
      * from -> from...57
      * to -> to...58
      * timestamp -> timestamp...59
      * from_duration -> from_duration...60
      New names:
      * from -> from...61
      * to -> to...62
      * timestamp -> timestamp...63
      * from_duration -> from_duration...64
      New names:
      * from -> from...65
      * to -> to...66
      * timestamp -> timestamp...67
      * from_duration -> from_duration...68
      New names:
      * from -> from...69
      * to -> to...70
      * timestamp -> timestamp...71
      * from_duration -> from_duration...72
      New names:
      * from -> from...73
      * to -> to...74
      * timestamp -> timestamp...75
      * from_duration -> from_duration...76
      New names:
      * from -> from...77
      * to -> to...78
      * timestamp -> timestamp...79
      * from_duration -> from_duration...80
      New names:
      * from...1 -> from...2
      * to...2 -> to...3
      * timestamp...3 -> timestamp...4
      * from_duration...4 -> from_duration...5
      * from...5 -> from...6
      * ...
      New names:
      * id -> id...424
      * from...2 -> from...425
      * to...3 -> to...426
      * timestamp...4 -> timestamp...427
      * from_duration...5 -> from_duration...428
      * ...
      New names:
      * from -> from...1
      * to -> to...2
      * timestamp -> timestamp...3
      * from_duration -> from_duration...4
      * from -> from...5
      * ...
      New names:
      * from -> from...9
      * to -> to...10
      * timestamp -> timestamp...11
      * from_duration -> from_duration...12
      New names:
      * from -> from...13
      * to -> to...14
      * timestamp -> timestamp...15
      * from_duration -> from_duration...16
      New names:
      * from -> from...17
      * to -> to...18
      * timestamp -> timestamp...19
      * from_duration -> from_duration...20
      New names:
      * from -> from...21
      * to -> to...22
      * timestamp -> timestamp...23
      * from_duration -> from_duration...24
      New names:
      * from -> from...25
      * to -> to...26
      * timestamp -> timestamp...27
      * from_duration -> from_duration...28
      New names:
      * from -> from...29
      * to -> to...30
      * timestamp -> timestamp...31
      * from_duration -> from_duration...32
      New names:
      * from -> from...33
      * to -> to...34
      * timestamp -> timestamp...35
      * from_duration -> from_duration...36
      New names:
      * from -> from...37
      * to -> to...38
      * timestamp -> timestamp...39
      * from_duration -> from_duration...40
      New names:
      * from -> from...41
      * to -> to...42
      * timestamp -> timestamp...43
      * from_duration -> from_duration...44
      New names:
      * from...1 -> from...2
      * to...2 -> to...3
      * timestamp...3 -> timestamp...4
      * from_duration...4 -> from_duration...5
      * from...5 -> from...6
      * ...
      New names:
      * id -> id...505
      * from...2 -> from...506
      * to...3 -> to...507
      * timestamp...4 -> timestamp...508
      * from_duration...5 -> from_duration...509
      * ...
      New names:
      * from -> from...1
      * to -> to...2
      * timestamp -> timestamp...3
      * from_duration -> from_duration...4
      * from -> from...5
      * ...
      New names:
      * from -> from...9
      * to -> to...10
      * timestamp -> timestamp...11
      * from_duration -> from_duration...12
      New names:
      * from -> from...13
      * to -> to...14
      * timestamp -> timestamp...15
      * from_duration -> from_duration...16
      New names:
      * from -> from...17
      * to -> to...18
      * timestamp -> timestamp...19
      * from_duration -> from_duration...20
      New names:
      * from -> from...21
      * to -> to...22
      * timestamp -> timestamp...23
      * from_duration -> from_duration...24
      New names:
      * from -> from...25
      * to -> to...26
      * timestamp -> timestamp...27
      * from_duration -> from_duration...28
      New names:
      * from -> from...29
      * to -> to...30
      * timestamp -> timestamp...31
      * from_duration -> from_duration...32
      New names:
      * from -> from...33
      * to -> to...34
      * timestamp -> timestamp...35
      * from_duration -> from_duration...36
      New names:
      * from -> from...37
      * to -> to...38
      * timestamp -> timestamp...39
      * from_duration -> from_duration...40
      New names:
      * from -> from...41
      * to -> to...42
      * timestamp -> timestamp...43
      * from_duration -> from_duration...44
      New names:
      * from -> from...45
      * to -> to...46
      * timestamp -> timestamp...47
      * from_duration -> from_duration...48
      New names:
      * from -> from...49
      * to -> to...50
      * timestamp -> timestamp...51
      * from_duration -> from_duration...52
      New names:
      * from -> from...53
      * to -> to...54
      * timestamp -> timestamp...55
      * from_duration -> from_duration...56
      New names:
      * from -> from...57
      * to -> to...58
      * timestamp -> timestamp...59
      * from_duration -> from_duration...60
      New names:
      * from -> from...61
      * to -> to...62
      * timestamp -> timestamp...63
      * from_duration -> from_duration...64
      New names:
      * from -> from...65
      * to -> to...66
      * timestamp -> timestamp...67
      * from_duration -> from_duration...68
      New names:
      * from -> from...69
      * to -> to...70
      * timestamp -> timestamp...71
      * from_duration -> from_duration...72
      New names:
      * from -> from...73
      * to -> to...74
      * timestamp -> timestamp...75
      * from_duration -> from_duration...76
      New names:
      * from -> from...77
      * to -> to...78
      * timestamp -> timestamp...79
      * from_duration -> from_duration...80
      New names:
      * from -> from...81
      * to -> to...82
      * timestamp -> timestamp...83
      * from_duration -> from_duration...84
      New names:
      * from...1 -> from...2
      * to...2 -> to...3
      * timestamp...3 -> timestamp...4
      * from_duration...4 -> from_duration...5
      * from...5 -> from...6
      * ...
      New names:
      * id -> id...550
      * from...2 -> from...551
      * to...3 -> to...552
      * timestamp...4 -> timestamp...553
      * from_duration...5 -> from_duration...554
      * ...
    Output
      # A tibble: 1 x 634
        id...1 from...2 to...3 timestamp...4       from_duration...5 from...6 to...7
        <chr>     <int>  <int> <dttm>                          <dbl>    <int>  <int>
      1 34        16775  16775 2020-04-19 08:00:00              3599    16775  16775
      # ... with 627 more variables: timestamp...8 <dttm>, from_duration...9 <dbl>,
      #   from...10 <int>, to...11 <int>, timestamp...12 <dttm>,
      #   from_duration...13 <dbl>, from...14 <int>, to...15 <int>,
      #   timestamp...16 <dttm>, from_duration...17 <dbl>, from...18 <int>,
      #   to...19 <int>, timestamp...20 <dttm>, from_duration...21 <dbl>,
      #   from...22 <int>, to...23 <int>, timestamp...24 <dttm>,
      #   from_duration...25 <dbl>, from...26 <int>, to...27 <int>,
      #   timestamp...28 <dttm>, from_duration...29 <dbl>, from...30 <int>,
      #   to...31 <int>, timestamp...32 <dttm>, from_duration...33 <dbl>,
      #   from...34 <int>, to...35 <int>, timestamp...36 <dttm>,
      #   from_duration...37 <dbl>, from...38 <int>, to...39 <int>,
      #   timestamp...40 <dttm>, from_duration...41 <dbl>, from...42 <int>,
      #   to...43 <int>, timestamp...44 <dttm>, from_duration...45 <dbl>,
      #   from...46 <int>, to...47 <int>, timestamp...48 <dttm>,
      #   from_duration...49 <dbl>, from...50 <int>, to...51 <int>,
      #   timestamp...52 <dttm>, from_duration...53 <dbl>, from...54 <int>,
      #   to...55 <int>, timestamp...56 <dttm>, from_duration...57 <dbl>,
      #   from...58 <int>, to...59 <int>, timestamp...60 <dttm>,
      #   from_duration...61 <dbl>, id...62 <chr>, from...63 <int>, to...64 <int>,
      #   timestamp...65 <dttm>, from_duration...66 <dbl>, from...67 <int>,
      #   to...68 <int>, timestamp...69 <dttm>, from_duration...70 <dbl>,
      #   from...71 <int>, to...72 <int>, timestamp...73 <dttm>,
      #   from_duration...74 <dbl>, from...75 <int>, to...76 <int>,
      #   timestamp...77 <dttm>, from_duration...78 <dbl>, from...79 <int>,
      #   to...80 <int>, timestamp...81 <dttm>, from_duration...82 <dbl>,
      #   from...83 <int>, to...84 <int>, timestamp...85 <dttm>,
      #   from_duration...86 <dbl>, from...87 <int>, to...88 <int>,
      #   timestamp...89 <dttm>, from_duration...90 <dbl>, from...91 <int>,
      #   to...92 <int>, timestamp...93 <dttm>, from_duration...94 <dbl>,
      #   from...95 <int>, to...96 <int>, timestamp...97 <dttm>,
      #   from_duration...98 <dbl>, from...99 <int>, to...100 <int>,
      #   timestamp...101 <dttm>, from_duration...102 <dbl>, from...103 <int>,
      #   to...104 <int>, timestamp...105 <dttm>, from_duration...106 <dbl>,
      #   from...107 <int>, ...

---

    Code
      x %>% group_by(id) %>% map_interval_dfr(.gen = hour_checkin_iter, from_to,
        time = "timestamp")
    Output
      # A tibble: 156 x 5
         id     from    to timestamp           from_duration
         <chr> <int> <int> <dttm>                      <dbl>
       1 34    16775 16775 2020-04-19 08:00:00          3599
       2 34    16775 16775 2020-04-19 09:00:00          3599
       3 34    16775 16775 2020-04-19 10:00:00          3599
       4 34    16775 16918 2020-04-19 11:00:00          1335
       5 34    16918 16918 2020-04-19 12:00:00          3599
       6 34    16918 16918 2020-04-19 13:00:00          3599
       7 34    16918 16918 2020-04-19 14:00:00          3599
       8 34    16918 15078 2020-04-19 15:00:00          1533
       9 34    15078 15078 2020-04-19 16:00:00          3599
      10 34    15078 15078 2020-04-19 17:00:00          3599
      # ... with 146 more rows

---

    Code
      x %>% group_by(id) %>% map_interval_dfc(.gen = hour_checkin_iter, from_to,
        time = "timestamp")
    Message <simpleMessage>
      New names:
      * from -> from...1
      * to -> to...2
      * timestamp -> timestamp...3
      * from_duration -> from_duration...4
      * from -> from...5
      * ...
      New names:
      * from -> from...9
      * to -> to...10
      * timestamp -> timestamp...11
      * from_duration -> from_duration...12
      New names:
      * from -> from...13
      * to -> to...14
      * timestamp -> timestamp...15
      * from_duration -> from_duration...16
      New names:
      * from -> from...17
      * to -> to...18
      * timestamp -> timestamp...19
      * from_duration -> from_duration...20
      New names:
      * from -> from...21
      * to -> to...22
      * timestamp -> timestamp...23
      * from_duration -> from_duration...24
      New names:
      * from -> from...25
      * to -> to...26
      * timestamp -> timestamp...27
      * from_duration -> from_duration...28
      New names:
      * from -> from...29
      * to -> to...30
      * timestamp -> timestamp...31
      * from_duration -> from_duration...32
      New names:
      * from -> from...33
      * to -> to...34
      * timestamp -> timestamp...35
      * from_duration -> from_duration...36
      New names:
      * from -> from...37
      * to -> to...38
      * timestamp -> timestamp...39
      * from_duration -> from_duration...40
      New names:
      * from -> from...41
      * to -> to...42
      * timestamp -> timestamp...43
      * from_duration -> from_duration...44
      New names:
      * from -> from...45
      * to -> to...46
      * timestamp -> timestamp...47
      * from_duration -> from_duration...48
      New names:
      * from -> from...49
      * to -> to...50
      * timestamp -> timestamp...51
      * from_duration -> from_duration...52
      New names:
      * from -> from...53
      * to -> to...54
      * timestamp -> timestamp...55
      * from_duration -> from_duration...56
      New names:
      * from -> from...57
      * to -> to...58
      * timestamp -> timestamp...59
      * from_duration -> from_duration...60
      New names:
      * from...1 -> from...2
      * to...2 -> to...3
      * timestamp...3 -> timestamp...4
      * from_duration...4 -> from_duration...5
      * from...5 -> from...6
      * ...
      New names:
      * from -> from...1
      * to -> to...2
      * timestamp -> timestamp...3
      * from_duration -> from_duration...4
      * from -> from...5
      * ...
      New names:
      * from -> from...9
      * to -> to...10
      * timestamp -> timestamp...11
      * from_duration -> from_duration...12
      New names:
      * from -> from...13
      * to -> to...14
      * timestamp -> timestamp...15
      * from_duration -> from_duration...16
      New names:
      * from -> from...17
      * to -> to...18
      * timestamp -> timestamp...19
      * from_duration -> from_duration...20
      New names:
      * from -> from...21
      * to -> to...22
      * timestamp -> timestamp...23
      * from_duration -> from_duration...24
      New names:
      * from -> from...25
      * to -> to...26
      * timestamp -> timestamp...27
      * from_duration -> from_duration...28
      New names:
      * from -> from...29
      * to -> to...30
      * timestamp -> timestamp...31
      * from_duration -> from_duration...32
      New names:
      * from -> from...33
      * to -> to...34
      * timestamp -> timestamp...35
      * from_duration -> from_duration...36
      New names:
      * from -> from...37
      * to -> to...38
      * timestamp -> timestamp...39
      * from_duration -> from_duration...40
      New names:
      * from -> from...41
      * to -> to...42
      * timestamp -> timestamp...43
      * from_duration -> from_duration...44
      New names:
      * from -> from...45
      * to -> to...46
      * timestamp -> timestamp...47
      * from_duration -> from_duration...48
      New names:
      * from -> from...49
      * to -> to...50
      * timestamp -> timestamp...51
      * from_duration -> from_duration...52
      New names:
      * from -> from...53
      * to -> to...54
      * timestamp -> timestamp...55
      * from_duration -> from_duration...56
      New names:
      * from -> from...57
      * to -> to...58
      * timestamp -> timestamp...59
      * from_duration -> from_duration...60
      New names:
      * from -> from...61
      * to -> to...62
      * timestamp -> timestamp...63
      * from_duration -> from_duration...64
      New names:
      * from -> from...65
      * to -> to...66
      * timestamp -> timestamp...67
      * from_duration -> from_duration...68
      New names:
      * from -> from...69
      * to -> to...70
      * timestamp -> timestamp...71
      * from_duration -> from_duration...72
      New names:
      * from -> from...73
      * to -> to...74
      * timestamp -> timestamp...75
      * from_duration -> from_duration...76
      New names:
      * from...1 -> from...2
      * to...2 -> to...3
      * timestamp...3 -> timestamp...4
      * from_duration...4 -> from_duration...5
      * from...5 -> from...6
      * ...
      New names:
      * id -> id...1
      * id -> id...62
      * from...2 -> from...63
      * to...3 -> to...64
      * timestamp...4 -> timestamp...65
      * ...
      New names:
      * from -> from...1
      * to -> to...2
      * timestamp -> timestamp...3
      * from_duration -> from_duration...4
      * from -> from...5
      * ...
      New names:
      * from -> from...9
      * to -> to...10
      * timestamp -> timestamp...11
      * from_duration -> from_duration...12
      New names:
      * from -> from...13
      * to -> to...14
      * timestamp -> timestamp...15
      * from_duration -> from_duration...16
      New names:
      * from -> from...17
      * to -> to...18
      * timestamp -> timestamp...19
      * from_duration -> from_duration...20
      New names:
      * from -> from...21
      * to -> to...22
      * timestamp -> timestamp...23
      * from_duration -> from_duration...24
      New names:
      * from -> from...25
      * to -> to...26
      * timestamp -> timestamp...27
      * from_duration -> from_duration...28
      New names:
      * from -> from...29
      * to -> to...30
      * timestamp -> timestamp...31
      * from_duration -> from_duration...32
      New names:
      * from -> from...33
      * to -> to...34
      * timestamp -> timestamp...35
      * from_duration -> from_duration...36
      New names:
      * from -> from...37
      * to -> to...38
      * timestamp -> timestamp...39
      * from_duration -> from_duration...40
      New names:
      * from -> from...41
      * to -> to...42
      * timestamp -> timestamp...43
      * from_duration -> from_duration...44
      New names:
      * from...1 -> from...2
      * to...2 -> to...3
      * timestamp...3 -> timestamp...4
      * from_duration...4 -> from_duration...5
      * from...5 -> from...6
      * ...
      New names:
      * id -> id...139
      * from...2 -> from...140
      * to...3 -> to...141
      * timestamp...4 -> timestamp...142
      * from_duration...5 -> from_duration...143
      * ...
      New names:
      * from -> from...1
      * to -> to...2
      * timestamp -> timestamp...3
      * from_duration -> from_duration...4
      * from -> from...5
      * ...
      New names:
      * from -> from...9
      * to -> to...10
      * timestamp -> timestamp...11
      * from_duration -> from_duration...12
      New names:
      * from -> from...13
      * to -> to...14
      * timestamp -> timestamp...15
      * from_duration -> from_duration...16
      New names:
      * from -> from...17
      * to -> to...18
      * timestamp -> timestamp...19
      * from_duration -> from_duration...20
      New names:
      * from -> from...21
      * to -> to...22
      * timestamp -> timestamp...23
      * from_duration -> from_duration...24
      New names:
      * from -> from...25
      * to -> to...26
      * timestamp -> timestamp...27
      * from_duration -> from_duration...28
      New names:
      * from -> from...29
      * to -> to...30
      * timestamp -> timestamp...31
      * from_duration -> from_duration...32
      New names:
      * from -> from...33
      * to -> to...34
      * timestamp -> timestamp...35
      * from_duration -> from_duration...36
      New names:
      * from -> from...37
      * to -> to...38
      * timestamp -> timestamp...39
      * from_duration -> from_duration...40
      New names:
      * from -> from...41
      * to -> to...42
      * timestamp -> timestamp...43
      * from_duration -> from_duration...44
      New names:
      * from -> from...45
      * to -> to...46
      * timestamp -> timestamp...47
      * from_duration -> from_duration...48
      New names:
      * from -> from...49
      * to -> to...50
      * timestamp -> timestamp...51
      * from_duration -> from_duration...52
      New names:
      * from -> from...53
      * to -> to...54
      * timestamp -> timestamp...55
      * from_duration -> from_duration...56
      New names:
      * from -> from...57
      * to -> to...58
      * timestamp -> timestamp...59
      * from_duration -> from_duration...60
      New names:
      * from -> from...61
      * to -> to...62
      * timestamp -> timestamp...63
      * from_duration -> from_duration...64
      New names:
      * from...1 -> from...2
      * to...2 -> to...3
      * timestamp...3 -> timestamp...4
      * from_duration...4 -> from_duration...5
      * from...5 -> from...6
      * ...
      New names:
      * id -> id...184
      * from...2 -> from...185
      * to...3 -> to...186
      * timestamp...4 -> timestamp...187
      * from_duration...5 -> from_duration...188
      * ...
      New names:
      * from -> from...1
      * to -> to...2
      * timestamp -> timestamp...3
      * from_duration -> from_duration...4
      * from -> from...5
      * ...
      New names:
      * from -> from...9
      * to -> to...10
      * timestamp -> timestamp...11
      * from_duration -> from_duration...12
      New names:
      * from -> from...13
      * to -> to...14
      * timestamp -> timestamp...15
      * from_duration -> from_duration...16
      New names:
      * from -> from...17
      * to -> to...18
      * timestamp -> timestamp...19
      * from_duration -> from_duration...20
      New names:
      * from -> from...21
      * to -> to...22
      * timestamp -> timestamp...23
      * from_duration -> from_duration...24
      New names:
      * from -> from...25
      * to -> to...26
      * timestamp -> timestamp...27
      * from_duration -> from_duration...28
      New names:
      * from -> from...29
      * to -> to...30
      * timestamp -> timestamp...31
      * from_duration -> from_duration...32
      New names:
      * from -> from...33
      * to -> to...34
      * timestamp -> timestamp...35
      * from_duration -> from_duration...36
      New names:
      * from -> from...37
      * to -> to...38
      * timestamp -> timestamp...39
      * from_duration -> from_duration...40
      New names:
      * from -> from...41
      * to -> to...42
      * timestamp -> timestamp...43
      * from_duration -> from_duration...44
      New names:
      * from -> from...45
      * to -> to...46
      * timestamp -> timestamp...47
      * from_duration -> from_duration...48
      New names:
      * from -> from...49
      * to -> to...50
      * timestamp -> timestamp...51
      * from_duration -> from_duration...52
      New names:
      * from...1 -> from...2
      * to...2 -> to...3
      * timestamp...3 -> timestamp...4
      * from_duration...4 -> from_duration...5
      * from...5 -> from...6
      * ...
      New names:
      * id -> id...249
      * from...2 -> from...250
      * to...3 -> to...251
      * timestamp...4 -> timestamp...252
      * from_duration...5 -> from_duration...253
      * ...
      New names:
      * from -> from...1
      * to -> to...2
      * timestamp -> timestamp...3
      * from_duration -> from_duration...4
      * from -> from...5
      * ...
      New names:
      * from -> from...9
      * to -> to...10
      * timestamp -> timestamp...11
      * from_duration -> from_duration...12
      New names:
      * from -> from...13
      * to -> to...14
      * timestamp -> timestamp...15
      * from_duration -> from_duration...16
      New names:
      * from -> from...17
      * to -> to...18
      * timestamp -> timestamp...19
      * from_duration -> from_duration...20
      New names:
      * from -> from...21
      * to -> to...22
      * timestamp -> timestamp...23
      * from_duration -> from_duration...24
      New names:
      * from -> from...25
      * to -> to...26
      * timestamp -> timestamp...27
      * from_duration -> from_duration...28
      New names:
      * from -> from...29
      * to -> to...30
      * timestamp -> timestamp...31
      * from_duration -> from_duration...32
      New names:
      * from -> from...33
      * to -> to...34
      * timestamp -> timestamp...35
      * from_duration -> from_duration...36
      New names:
      * from -> from...37
      * to -> to...38
      * timestamp -> timestamp...39
      * from_duration -> from_duration...40
      New names:
      * from -> from...41
      * to -> to...42
      * timestamp -> timestamp...43
      * from_duration -> from_duration...44
      New names:
      * from -> from...45
      * to -> to...46
      * timestamp -> timestamp...47
      * from_duration -> from_duration...48
      New names:
      * from -> from...49
      * to -> to...50
      * timestamp -> timestamp...51
      * from_duration -> from_duration...52
      New names:
      * from -> from...53
      * to -> to...54
      * timestamp -> timestamp...55
      * from_duration -> from_duration...56
      New names:
      * from -> from...57
      * to -> to...58
      * timestamp -> timestamp...59
      * from_duration -> from_duration...60
      New names:
      * from -> from...61
      * to -> to...62
      * timestamp -> timestamp...63
      * from_duration -> from_duration...64
      New names:
      * from...1 -> from...2
      * to...2 -> to...3
      * timestamp...3 -> timestamp...4
      * from_duration...4 -> from_duration...5
      * from...5 -> from...6
      * ...
      New names:
      * id -> id...302
      * from...2 -> from...303
      * to...3 -> to...304
      * timestamp...4 -> timestamp...305
      * from_duration...5 -> from_duration...306
      * ...
      New names:
      * from -> from...1
      * to -> to...2
      * timestamp -> timestamp...3
      * from_duration -> from_duration...4
      * from -> from...5
      * ...
      New names:
      * from -> from...9
      * to -> to...10
      * timestamp -> timestamp...11
      * from_duration -> from_duration...12
      New names:
      * from -> from...13
      * to -> to...14
      * timestamp -> timestamp...15
      * from_duration -> from_duration...16
      New names:
      * from -> from...17
      * to -> to...18
      * timestamp -> timestamp...19
      * from_duration -> from_duration...20
      New names:
      * from -> from...21
      * to -> to...22
      * timestamp -> timestamp...23
      * from_duration -> from_duration...24
      New names:
      * from -> from...25
      * to -> to...26
      * timestamp -> timestamp...27
      * from_duration -> from_duration...28
      New names:
      * from -> from...29
      * to -> to...30
      * timestamp -> timestamp...31
      * from_duration -> from_duration...32
      New names:
      * from -> from...33
      * to -> to...34
      * timestamp -> timestamp...35
      * from_duration -> from_duration...36
      New names:
      * from -> from...37
      * to -> to...38
      * timestamp -> timestamp...39
      * from_duration -> from_duration...40
      New names:
      * from -> from...41
      * to -> to...42
      * timestamp -> timestamp...43
      * from_duration -> from_duration...44
      New names:
      * from -> from...45
      * to -> to...46
      * timestamp -> timestamp...47
      * from_duration -> from_duration...48
      New names:
      * from -> from...49
      * to -> to...50
      * timestamp -> timestamp...51
      * from_duration -> from_duration...52
      New names:
      * from -> from...53
      * to -> to...54
      * timestamp -> timestamp...55
      * from_duration -> from_duration...56
      New names:
      * from...1 -> from...2
      * to...2 -> to...3
      * timestamp...3 -> timestamp...4
      * from_duration...4 -> from_duration...5
      * from...5 -> from...6
      * ...
      New names:
      * id -> id...367
      * from...2 -> from...368
      * to...3 -> to...369
      * timestamp...4 -> timestamp...370
      * from_duration...5 -> from_duration...371
      * ...
      New names:
      * from -> from...1
      * to -> to...2
      * timestamp -> timestamp...3
      * from_duration -> from_duration...4
      * from -> from...5
      * ...
      New names:
      * from -> from...9
      * to -> to...10
      * timestamp -> timestamp...11
      * from_duration -> from_duration...12
      New names:
      * from -> from...13
      * to -> to...14
      * timestamp -> timestamp...15
      * from_duration -> from_duration...16
      New names:
      * from -> from...17
      * to -> to...18
      * timestamp -> timestamp...19
      * from_duration -> from_duration...20
      New names:
      * from -> from...21
      * to -> to...22
      * timestamp -> timestamp...23
      * from_duration -> from_duration...24
      New names:
      * from -> from...25
      * to -> to...26
      * timestamp -> timestamp...27
      * from_duration -> from_duration...28
      New names:
      * from -> from...29
      * to -> to...30
      * timestamp -> timestamp...31
      * from_duration -> from_duration...32
      New names:
      * from -> from...33
      * to -> to...34
      * timestamp -> timestamp...35
      * from_duration -> from_duration...36
      New names:
      * from -> from...37
      * to -> to...38
      * timestamp -> timestamp...39
      * from_duration -> from_duration...40
      New names:
      * from -> from...41
      * to -> to...42
      * timestamp -> timestamp...43
      * from_duration -> from_duration...44
      New names:
      * from -> from...45
      * to -> to...46
      * timestamp -> timestamp...47
      * from_duration -> from_duration...48
      New names:
      * from -> from...49
      * to -> to...50
      * timestamp -> timestamp...51
      * from_duration -> from_duration...52
      New names:
      * from -> from...53
      * to -> to...54
      * timestamp -> timestamp...55
      * from_duration -> from_duration...56
      New names:
      * from -> from...57
      * to -> to...58
      * timestamp -> timestamp...59
      * from_duration -> from_duration...60
      New names:
      * from -> from...61
      * to -> to...62
      * timestamp -> timestamp...63
      * from_duration -> from_duration...64
      New names:
      * from -> from...65
      * to -> to...66
      * timestamp -> timestamp...67
      * from_duration -> from_duration...68
      New names:
      * from -> from...69
      * to -> to...70
      * timestamp -> timestamp...71
      * from_duration -> from_duration...72
      New names:
      * from -> from...73
      * to -> to...74
      * timestamp -> timestamp...75
      * from_duration -> from_duration...76
      New names:
      * from -> from...77
      * to -> to...78
      * timestamp -> timestamp...79
      * from_duration -> from_duration...80
      New names:
      * from...1 -> from...2
      * to...2 -> to...3
      * timestamp...3 -> timestamp...4
      * from_duration...4 -> from_duration...5
      * from...5 -> from...6
      * ...
      New names:
      * id -> id...424
      * from...2 -> from...425
      * to...3 -> to...426
      * timestamp...4 -> timestamp...427
      * from_duration...5 -> from_duration...428
      * ...
      New names:
      * from -> from...1
      * to -> to...2
      * timestamp -> timestamp...3
      * from_duration -> from_duration...4
      * from -> from...5
      * ...
      New names:
      * from -> from...9
      * to -> to...10
      * timestamp -> timestamp...11
      * from_duration -> from_duration...12
      New names:
      * from -> from...13
      * to -> to...14
      * timestamp -> timestamp...15
      * from_duration -> from_duration...16
      New names:
      * from -> from...17
      * to -> to...18
      * timestamp -> timestamp...19
      * from_duration -> from_duration...20
      New names:
      * from -> from...21
      * to -> to...22
      * timestamp -> timestamp...23
      * from_duration -> from_duration...24
      New names:
      * from -> from...25
      * to -> to...26
      * timestamp -> timestamp...27
      * from_duration -> from_duration...28
      New names:
      * from -> from...29
      * to -> to...30
      * timestamp -> timestamp...31
      * from_duration -> from_duration...32
      New names:
      * from -> from...33
      * to -> to...34
      * timestamp -> timestamp...35
      * from_duration -> from_duration...36
      New names:
      * from -> from...37
      * to -> to...38
      * timestamp -> timestamp...39
      * from_duration -> from_duration...40
      New names:
      * from -> from...41
      * to -> to...42
      * timestamp -> timestamp...43
      * from_duration -> from_duration...44
      New names:
      * from...1 -> from...2
      * to...2 -> to...3
      * timestamp...3 -> timestamp...4
      * from_duration...4 -> from_duration...5
      * from...5 -> from...6
      * ...
      New names:
      * id -> id...505
      * from...2 -> from...506
      * to...3 -> to...507
      * timestamp...4 -> timestamp...508
      * from_duration...5 -> from_duration...509
      * ...
      New names:
      * from -> from...1
      * to -> to...2
      * timestamp -> timestamp...3
      * from_duration -> from_duration...4
      * from -> from...5
      * ...
      New names:
      * from -> from...9
      * to -> to...10
      * timestamp -> timestamp...11
      * from_duration -> from_duration...12
      New names:
      * from -> from...13
      * to -> to...14
      * timestamp -> timestamp...15
      * from_duration -> from_duration...16
      New names:
      * from -> from...17
      * to -> to...18
      * timestamp -> timestamp...19
      * from_duration -> from_duration...20
      New names:
      * from -> from...21
      * to -> to...22
      * timestamp -> timestamp...23
      * from_duration -> from_duration...24
      New names:
      * from -> from...25
      * to -> to...26
      * timestamp -> timestamp...27
      * from_duration -> from_duration...28
      New names:
      * from -> from...29
      * to -> to...30
      * timestamp -> timestamp...31
      * from_duration -> from_duration...32
      New names:
      * from -> from...33
      * to -> to...34
      * timestamp -> timestamp...35
      * from_duration -> from_duration...36
      New names:
      * from -> from...37
      * to -> to...38
      * timestamp -> timestamp...39
      * from_duration -> from_duration...40
      New names:
      * from -> from...41
      * to -> to...42
      * timestamp -> timestamp...43
      * from_duration -> from_duration...44
      New names:
      * from -> from...45
      * to -> to...46
      * timestamp -> timestamp...47
      * from_duration -> from_duration...48
      New names:
      * from -> from...49
      * to -> to...50
      * timestamp -> timestamp...51
      * from_duration -> from_duration...52
      New names:
      * from -> from...53
      * to -> to...54
      * timestamp -> timestamp...55
      * from_duration -> from_duration...56
      New names:
      * from -> from...57
      * to -> to...58
      * timestamp -> timestamp...59
      * from_duration -> from_duration...60
      New names:
      * from -> from...61
      * to -> to...62
      * timestamp -> timestamp...63
      * from_duration -> from_duration...64
      New names:
      * from -> from...65
      * to -> to...66
      * timestamp -> timestamp...67
      * from_duration -> from_duration...68
      New names:
      * from -> from...69
      * to -> to...70
      * timestamp -> timestamp...71
      * from_duration -> from_duration...72
      New names:
      * from -> from...73
      * to -> to...74
      * timestamp -> timestamp...75
      * from_duration -> from_duration...76
      New names:
      * from -> from...77
      * to -> to...78
      * timestamp -> timestamp...79
      * from_duration -> from_duration...80
      New names:
      * from -> from...81
      * to -> to...82
      * timestamp -> timestamp...83
      * from_duration -> from_duration...84
      New names:
      * from...1 -> from...2
      * to...2 -> to...3
      * timestamp...3 -> timestamp...4
      * from_duration...4 -> from_duration...5
      * from...5 -> from...6
      * ...
      New names:
      * id -> id...550
      * from...2 -> from...551
      * to...3 -> to...552
      * timestamp...4 -> timestamp...553
      * from_duration...5 -> from_duration...554
      * ...
    Output
      # A tibble: 1 x 634
        id...1 from...2 to...3 timestamp...4       from_duration...5 from...6 to...7
        <chr>     <int>  <int> <dttm>                          <dbl>    <int>  <int>
      1 34        16775  16775 2020-04-19 08:00:00              3599    16775  16775
      # ... with 627 more variables: timestamp...8 <dttm>, from_duration...9 <dbl>,
      #   from...10 <int>, to...11 <int>, timestamp...12 <dttm>,
      #   from_duration...13 <dbl>, from...14 <int>, to...15 <int>,
      #   timestamp...16 <dttm>, from_duration...17 <dbl>, from...18 <int>,
      #   to...19 <int>, timestamp...20 <dttm>, from_duration...21 <dbl>,
      #   from...22 <int>, to...23 <int>, timestamp...24 <dttm>,
      #   from_duration...25 <dbl>, from...26 <int>, to...27 <int>,
      #   timestamp...28 <dttm>, from_duration...29 <dbl>, from...30 <int>,
      #   to...31 <int>, timestamp...32 <dttm>, from_duration...33 <dbl>,
      #   from...34 <int>, to...35 <int>, timestamp...36 <dttm>,
      #   from_duration...37 <dbl>, from...38 <int>, to...39 <int>,
      #   timestamp...40 <dttm>, from_duration...41 <dbl>, from...42 <int>,
      #   to...43 <int>, timestamp...44 <dttm>, from_duration...45 <dbl>,
      #   from...46 <int>, to...47 <int>, timestamp...48 <dttm>,
      #   from_duration...49 <dbl>, from...50 <int>, to...51 <int>,
      #   timestamp...52 <dttm>, from_duration...53 <dbl>, from...54 <int>,
      #   to...55 <int>, timestamp...56 <dttm>, from_duration...57 <dbl>,
      #   from...58 <int>, to...59 <int>, timestamp...60 <dttm>,
      #   from_duration...61 <dbl>, id...62 <chr>, from...63 <int>, to...64 <int>,
      #   timestamp...65 <dttm>, from_duration...66 <dbl>, from...67 <int>,
      #   to...68 <int>, timestamp...69 <dttm>, from_duration...70 <dbl>,
      #   from...71 <int>, to...72 <int>, timestamp...73 <dttm>,
      #   from_duration...74 <dbl>, from...75 <int>, to...76 <int>,
      #   timestamp...77 <dttm>, from_duration...78 <dbl>, from...79 <int>,
      #   to...80 <int>, timestamp...81 <dttm>, from_duration...82 <dbl>,
      #   from...83 <int>, to...84 <int>, timestamp...85 <dttm>,
      #   from_duration...86 <dbl>, from...87 <int>, to...88 <int>,
      #   timestamp...89 <dttm>, from_duration...90 <dbl>, from...91 <int>,
      #   to...92 <int>, timestamp...93 <dttm>, from_duration...94 <dbl>,
      #   from...95 <int>, to...96 <int>, timestamp...97 <dttm>,
      #   from_duration...98 <dbl>, from...99 <int>, to...100 <int>,
      #   timestamp...101 <dttm>, from_duration...102 <dbl>, from...103 <int>,
      #   to...104 <int>, timestamp...105 <dttm>, from_duration...106 <dbl>,
      #   from...107 <int>, ...

