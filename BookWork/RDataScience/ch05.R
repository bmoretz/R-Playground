library(tidyverse)

# Exploring Diamonds

ggplot(data = diamonds) +
	geom_bar( mapping = aes( x = cut ) )

diamonds %>%
	count(cut)

ggplot(data = diamonds) +
geom_histogram(mapping = aes(x = carat), binwidth = 0.5)

diamonds %>%
	count(cut_width(carat, 0.5))

smaller <-
	filter(diamonds, carat < 3)

# notice clusters around the peaks
ggplot(data = smaller, mapping = aes(x = carat)) +
	geom_histogram(binwidth = 0.5)

# "stacked" histogram
ggplot(data = smaller, mapping = aes(x = carat, color = cut)) +
	geom_freqpoly(binwidth = 0.1)

# clustering around common sizes
ggplot(data = smaller, mapping = aes(x = carat)) +
	geom_histogram(binwidth = 0.01)

ggplot(data = faithful, mapping = aes(x = eruptions)) +
	geom_histogram(binwidth = 0.25)

# notice the dot at zero
ggplot(diamonds) +
	geom_histogram(mapping = aes(x = y), binwidth = 0.5)

# Zoom in

ggplot(data = diamonds) +
	geom_histogram(mapping = aes(x = y), binwidth = 0.5) +
	coord_cartesian(ylim = c(0, 50))

unusual <- diamonds %>%
	filter(y < 3 | y > 20) %>%
	arrange(y)

unusual

# Exercises

# 1

diamonds %>%
	group_by(color) %>%
	summarise(
		x_avg = mean(x), x_sd = sd(x),
		y_avg = mean(y), y_sd = sd(y),
		z_avg = mean(z), z_sd = sd(z)
	)

# 2

ggplot(data = diamonds) +
	geom_histogram(aes(x = price), binwidth = 100)

ggplot(data = diamonds) +
	geom_freqpoly(aes(x = price, color = color), binwidth = 100)

ggplot(data = diamonds) +
	geom_freqpoly(aes(x = price, color = color), binwidth = 1000 )

ggplot(data = diamonds) +
	geom_freqpoly(aes(x = price, color = color), binwidth = 10000)

# 3

diamonds %>%
	filter(carat == .99) %>%
	count()

diamonds %>%
	filter(carat == 1) %>%
	count()

# Missing Values

# remove rows with bad values ( not recommended )
diamonds2 <- diamonds %>%
	filter(between(y, 3, 10))

# replace (recommended)
diamonds2 <- diamonds %>%
	mutate(y = ifelse(y < 3 | y > 20, NA, y))

ggplot(data = diamonds2) +
	geom_point(mapping = aes(x = x, y = y))

ggplot(data = diamonds2) +
	geom_point(mapping = aes(x = x, y = y), na.rm = TRUE)

# flight data

nycflights13::flights %>%
	mutate(
		cancelled = is.na(dep_time),
		sched_hour = sched_dep_time %/% 100,
		sched_min = sched_dep_time %% 100,
		sched_dep_time = sched_hour + sched_min / 60
) %>%
ggplot(mapping = aes(sched_dep_time)) +
	geom_freqpoly(
		mapping = aes(color = cancelled),
		binwidth = 1 / 4
	)

# Covariation

# price vs cut

ggplot(data = diamonds, mapping = aes(x = price)) +
	geom_freqpoly(mapping = aes(color = cut), binwidth = 500)

ggplot(data = diamonds, mapping = aes(x = cut)) +
	geom_bar()

ggplot(data = diamonds, mapping = aes(x = price, y = ..density.. )) +
	geom_freqpoly(mapping = aes(color = cut), binwidth = 500)

ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
	geom_boxplot()

# Reording classificaion variables

# standard
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
	geom_boxplot()

# emphasize patter with reorder
ggplot(data = mpg) +
	geom_boxplot(
		mapping = aes(
			x = reorder(class, hwy, FUN = median),
			y = hwy
		)
	)

# emphasize patter with reorder
ggplot(data = mpg) +
	geom_boxplot(
		mapping = aes(
			x = reorder(class, hwy, FUN = median),
			y = hwy
		)
) + coord_flip()

# Exercises

# 1, impvove the NYC flight data

nycflights13::flights %>%
	mutate(
		cancelled = is.na(dep_time),
		sched_hour = sched_dep_time %/% 100,
		sched_min = sched_dep_time %% 100,
		sched_dep_time = sched_hour + sched_min / 60
) %>%
ggplot(mapping = aes(sched_dep_time)) +
	geom_boxplot(
		mapping = aes(
			x = cancelled,
			y = sched_dep_time,
			color = cancelled
		)
	) + coord_flip()

# 2, 