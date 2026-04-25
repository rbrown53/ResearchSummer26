################
# R Practice 5 #
################

#############
# Problem 1 #
#############

# Part a
# ======
# install.packages("nycflights13")
library(nycflights13)
flights
?flights

# Part b
# ======
flights <- flights |>
  mutate(speed = distance / air_time * 60)
View(flights)

# Part c
# ======
flights |> 
  group_by(origin) |>
  summarize(avg_speed = mean(speed, na.rm = T))

# Part d
# ======
flights |> 
  group_by(carrier) |>
  summarize(avg_speed = mean(speed, na.rm = T)) |> 
  arrange(desc(avg_speed))

# HA, which is Hawaiian, had the fastest average speed of 480 mph.
# YV, which is Mesa Airlines, a small regional airline, had the slowest at 
#   332 mph. 

# Part e
# ======
flights |>
  group_by(month) |>
  summarize(avg_delay = mean(arr_delay, na.rm = T),
            min_delay = min(arr_delay, na.rm = T),
            max_delay = max(arr_delay, na.rm = T)) |>
  arrange(avg_delay)
# September was the best and July was worse in terms of average delay.
# August was best in terms of lowest max delay

# Part f
# ======
flights |>
  group_by(carrier, month) |>
  filter(carrier %in% c("AA", "WN", "DL", "UA")) |>
  summarize(avg_delay = mean(arr_delay, na.rm = T)) |>
  print(n = 48)
# Southwest is the only airline of the four that has a positive average delay 
#   time (which is not good) in each month of the year.

# Part g
# ======
slc_flights <- flights |> 
  filter(dest == "SLC") |>
  select(carrier, origin, air_time, speed)
dim(slc_flights) # 2467 flights! 

# Part h
# ======
slc_flights_no_missing <- slc_flights |>
  filter(!is.na(air_time))

# Part i
# ======
slc_flights_no_missing |>
  summarize(min_time = min(air_time)/60,
            q1_time = quantile(air_time, 0.25)/60,
            med_time = median(air_time)/60,
            q3_time = quantile(air_time, 0.75)/60,
            max_time = max(air_time)/60
  )
slc_flights_no_missing |>
  summarize(min_speed = min(speed),
            q1_speed = quantile(speed, 0.25),
            med_speed = median(speed),
            q3_speed = quantile(speed, 0.75),
            max_speed = max(speed)
  )