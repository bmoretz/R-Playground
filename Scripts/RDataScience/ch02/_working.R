library(nycflights13)
library(tidyverse)

attach(flights)

# filter

jan1 <- filter(flights, month == 1, day == 1 )

(dec25 <- filter(flights, month == 12, day = 25))

sqrt(2) ^ 2 == 2

near(sqrt(2) ^ 2, 2)

nov_dec <- filter(flights, month %in% c(11, 12))

df <- tibble( x = c(1, NA, 3))

filter(df, x > 1)

filter(df, is.na(x) | x > 1)

# Excersise

head(flights)

#a
filter(flights, arr_delay >= 2)

#b
filter(flights, dest %in% c("IAH", "HOU"))

#c
unique(flights$carrier)
filter(flights, carrier %in% c("UA", "AA", "DL"))

#d

filter(flights, month %in% c(7, 8, 9))

#e
filter(flights, arr_delay >= 2 & dep_delay == 0)

#f
flights$early_arrival <- arr_time - sched_arr_time

flights[ which(flights$early_arrival <= 0 ),] %>% select( sched_arr_time, arr_time, early_arrival )

filter(flights, dep_delay >= 30 & early_arrival > -30)

#g
flights[between(flights$hour, 6, 12),]

#3
length(is.na(flights$dep_time))

# arrange

arrange(flights, year, month, day)

arrange(flights, desc(arr_delay))

df <- tibble(x = c(5, 2, NA))

arrange(df, x)
arrange(df, desc(x))

# Exercises

# 1

arrange(df, !is.na(x))

# 2
arrange(flights, desc(dep_delay))
arrange(flights, dep_delay)

# 3

arrange(flights, air_time)

# select

select(flights, year:day)

select(flights, - (year:day))

select(flights, time_hour, air_time, everything())

# Exercises

# 1

select(flights, dep_time)
select(flights, 4)

# 2

select(flights, c(dep_time, dep_time))


# 3

vars <- c("year", "month", "day", "dep_delay", "arr_delay")

? one_of

select(flights, one_of(vars))

# 4

select(flights, contains("TIME"))

# Mutate

flights_sml <- select(flights,
	year:day,
	ends_with("delay"),
	distance,
	air_time
)

mutate(flights_sml,
	gain = arr_delay - dep_delay,
	speed = distance / air_time * 60,
)

mutate(flights_sml,
	gain = arr_delay - dep_delay,
	hours = air_time / 60,
	gain_hours = gain / hours
)

transmute(flights,
	gain = arr_delay - dep_delay,
	hours = air_time / 60,
	gain_per_hour = gain / hours
)

transmute(flights,
	dep_time,
	hour = dep_time %/% 100,
	minute = dep_time %% 100
)

( x <- 1:10 )
lag(x)
lead(x)

y <- c(1, 2, 2, NA, 3, 4)
min_rank(y)
min_rank(desc(y))

row_number(y)
dense_rank(y)
percent_rank(y)
cume_dist(y)

# Exercises

# 1

head(flights)

transmute(flights,
	sched_dep_elapsed = sched_dep_time / 60,
	dep_time_elapsed = dep_time / 60
)

# 2

transmute(flights,
	arr_time = arr_time,
	arr_time2 = arr_time - dep_time
)

# 3
arrange( transmute(flights,
	flight = flight,
	dep_delay = dep_delay,
	delay_rank = min_rank(desc(dep_delay))
), delay_rank )

# Summarize

summarise(flights, mean(dep_delay, na.rm = TRUE))

by_day <- group_by(flights, year, month, day)

summarise(by_day, mean(dep_delay, na.rm = TRUE))

delays <- flights %>%
	group_by(dest) %>%
	summarise(
		count = n(),
		dist = mean(distance, na.rm = TRUE),
		delay = mean(arr_delay, na.rm = TRUE)
) %>% filter(count > 20, dest != "HNL")

ggplot(data = delays, mapping = aes(x = dist, y = delay)) +
	geom_point(aes(size = count), alpha = 1 / 2) +
	geom_smooth(se = FALSE)

not_canceled <- filter(flights, !is.na(dep_delay), !is.na(arr_delay))

not_canceled %>%
	group_by(year, month, day) %>%
	summarise(mean = mean(dep_delay))

delays <- not_canceled %>%
	group_by(tailnum) %>%
	summarise(delay = mean(arr_delay))

ggplot(data = delays, mapping = aes(x = delay)) +
	geom_freqpoly(binwidth = 10)

delays <- not_canceled %>%
	group_by(tailnum) %>%
	summarise(
		delay = mean(arr_delay, na.rm = TRUE),
		count = n()
)

head(delays)

ggplot(data = delays, mapping = aes(x = count, y = delay)) +
	geom_point(alpha = 1 / 10)

delays %>%
	filter(count >= 25) %>%
	ggplot(mapping = aes(x = count, y = delay)) +
	geom_point(alpha = 1 / 10)

not_canceled %>%
	group_by(year, month, day) %>%
	summarise(
		avg_delay1 = mean(arr_delay),
		avg_delay2 = mean(arr_delay[arr_delay > 0])
	)

not_canceled %>%
	group_by(dest) %>%
	summarise(distance_sd = sd(distance)) %>%
	arrange(desc(distance_sd))

not_canceled %>%
	group_by(year, month, day) %>%
	summarise(
		first = min(dep_time),
		last = max(dep_time)
	)

not_canceled %>%
	group_by(year, month, day) %>%
	summarise(
		first = first(dep_time),
		last = last(dep_time)
	)

not_canceled %>%
	group_by(year, month, day) %>%
	mutate(r = min_rank(desc(dep_time))) %>%
	filter(r %in% range(r))

not_canceled %>%
	group_by(dest) %>%
	summarise(carriers = n_distinct(carrier)) %>%
	arrange(desc(carriers))

not_canceled %>%
	count(dest)

not_canceled %>%
	count(tailnum, wt = distance)

not_canceled %>%
	group_by(year, month, day) %>%
	summarise(n = sum(dep_time < 500))

not_canceled %>%
	group_by(year, month, day) %>%
	summarise(hour_perc = mean(arr_delay > 60))

daily <- group_by(flights, year, month, day)

(per_day <- summarise(daily, flights = n()))
(per_month <- summarise(per_day, flights = sum(flights)))
(per_year <- summarise(per_month, flights = sum(flights)))

daily %>%
	ungroup() %>%
	summarise(flights = n())

daily

# Exercises

# 3

not_canceled %>%
	group_by(year, month, day) %>%
	mutate(date = as.Date(paste0(year, "-", month, "-", day), flights = n())) %>%
	select( c(date, flights))
	ggplot(aes(x = date, y = flights)) +
	geom_point()
