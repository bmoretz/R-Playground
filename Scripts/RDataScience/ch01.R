library(tidyverse)

ggplot(data = mpg) +
	geom_point( mapping = aes(x = displ, y = hwy))

# Exercises 1.1

# 1.1.1
ggplot(data = mpg)

# 1.1.2
nrow(mpg)
ncol(mpg)

# 1.1.3
? mpg # drive train

# 1.1.4
ggplot(data = mpg) +
	geom_point(aes(x = cyl, y = hwy))

# 1.1.5
ggplot(data = mpg) +
	geom_point(aes(x = class, y = drv))

ggplot(data = mpg) +
	geom_point(mapping = aes(x = displ, y = hwy, color = class))

summary(mpg$displ)

# bubble plot of engine size vs mpg, bubble size = type factor
ggplot(data = mpg) +
	geom_point(mapping = aes(x = displ, y = hwy, size = class))

ggplot(data = mpg) +
	geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

ggplot(data = mpg) +
	geom_point(mapping = aes(x = displ, y = hwy, shape = class))

mpgplot <- function(mapping) {
	ggplot(data = mpg) +
		geom_point(mapping)
}

mpgplot(aes(x = displ, y = hwy, shape = class))


ggplot(data = mpg) +
	geom_point(mapping = aes(x = displ, y = hwy), color = "Blue")

# Exercises 1.2

# 1.2.1

ggplot(data = mpg) +
	geom_point(aes(x = displ, y = hwy), color = "blue")

# 1.2.2
? mpg

# categorical = model, year, cyl, trans, 

# Facets

ggplot(data = mpg) +
	geom_point(aes(x = displ, y = hwy)) +
	facet_wrap(~class, nrow = 2)

ggplot(data = mpg) +
	geom_point(aes(x = displ, y = hwy)) +
	facet_grid(drv ~ cyl)

ggplot(data = mpg) +
	geom_point(aes(x = displ, y = hwy)) +
	facet_grid(. ~ cyl)

# Exercises 1.3

# 1.3.1

ggplot(data = mpg) +
	geom_point(aes(x = displ, y = hwy)) +
	facet_grid(. ~ cty)

# 1.3.2

ggplot(data = mpg) +
	geom_point(aes(x = displ, y = hwy)) +
	facet_grid(drv ~ cyl)

ggplot(data = mpg) +
	geom_point(aes(x = drv, y = cyl))

# 1.3.3

ggplot(data = mpg) +
	geom_point(aes(x = displ, y = hwy)) +
	facet_grid(drv ~ .)

ggplot(data = mpg) +
	geom_point(aes(x = displ, y = hwy)) +
	facet_grid(. ~ cyl)

# Geometric Objects

ggplot(data = mpg) +
	geom_point(aes(x = displ, y = hwy))

ggplot(data = mpg) +
	geom_smooth(aes(x = displ, y = hwy))

ggplot(data = mpg) +
	geom_smooth(aes(x = displ, y = hwy, linetype = drv))

ggplot(data = mpg) +
	geom_smooth(aes(x = displ, y = hwy))

ggplot(data = mpg) +
	geom_smooth(aes(x = displ, y = hwy, linetype = drv))

ggplot(data = mpg) +
	geom_smooth(
		mapping = aes(x = displ, y = hwy, color = drv),
		show.legend = FALSE
)

ggplot(data = mpg) +
	geom_point(aes(x = displ, y = hwy)) +
	geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
	geom_point() +
	geom_smooth()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
	geom_point( mapping = aes( color = class)) +
	geom_smooth()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
	geom_point(mapping = aes(color = class)) +
	geom_smooth( data = filter(mpg, class=="subcompact"), se = FALSE)

# Exercises 1.4

# 1.1.4
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
	geom_boxplot()

ggplot(data = mpg, mapping = aes(x = displ)) +
	geom_histogram()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
	geom_line()

# 1.4.2

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) +
	geom_point() +
	geom_smooth(se = FALSE)

# 1.4.3

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) +
	geom_point() +
	geom_smooth(se = FALSE)

# 1.4.4
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) +
	geom_point() +
	geom_smooth()

# 1.4.5

# no, same data + anestetics

# Statistical Transformations

attach(diamonds)

ggplot(data = diamonds) +
	geom_bar(mapping = aes(x = cut))

ggplot(data = diamonds) +
	stat_count(mapping = aes(x = cut))

demo <- tribble(
	~a, ~ b,
	"bar_1", 20,
	"bar_2", 30,
	"bar_3", 40
)

ggplot(data = demo) +
	geom_bar(
		mapping = aes(x = a, y = b),
		stat = "identity"
	)

ggplot(data = demo) +
	geom_bar(
		mapping = aes(x = a)
	)

ggplot(data = diamonds) +
	geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))

ggplot(data = diamonds) +
	stat_summary(
		mapping = aes(x = cut, y = depth),
		fun.ymin = min,
		fun.ymax = max,
		fun.y = median
	)

# Exercises 1.5

# 1.5.1

ggplot(data = diamonds, mapping = aes(x = cut, y = depth)) +
	geom_boxplot()

ggplot(data = diamonds) +
	geom_bar(mapping = aes(x = cut, color = cut))

ggplot(data = diamonds) +
	geom_bar(mapping = aes(x = cut, fill= cut))

ggplot(data = diamonds) +
	geom_bar(mapping = aes(x = cut, fill = clarity))

eom_bar(mapping = aes(x = cut, fill = cut))

ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) +
	geom_bar( alpha = 1/5, position = "identity")

ggplot(data = diamonds, mapping = aes(x = cut, color = clarity)) +
	geom_bar(fill = NA, position = "identity")

ggplot(data = diamonds, mapping = aes(x = cut, color = clarity)) +
	geom_bar(position = "fill")

ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) +
	geom_bar(position = "fill")

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
	geom_point(position = "jitter")


# Exercises 1.6

# 1.6.1

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
	geom_jitter()

# 1.6.2

? geom_jitter

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
	geom_jitter(width = .5)

# 1.6.3

? geom_jitter

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
	geom_jitter(width = .5)

# 1.6.4

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
	geom_boxplot()

# Coordinate Systems

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
	geom_boxplot()

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
	geom_boxplot() +
	coord_flip()

nz <- map_data("nz")

ggplot(nz, aes(long, lat, group = group)) +
	geom_polygon(fill = "white", color = "black")

ggplot(nz, aes(long, lat, group = group)) +
	geom_polygon(fill = "white", color = "black") +
	coord_quickmap()

bar <- ggplot(data = diamonds) +
	geom_bar(mapping = aes(x = cut, fill = cut), show.legend = FALSE, width = 1) +
	theme(aspect.ratio = 1) +
	labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()

# Exercises 1.7

# 1.7.1
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) +
	geom_bar(position = "fill") +
	coord_polar()

# 1.7.2
? labs

# 1.7.3
?coord_map
?coord_quickmap

# 1.7.4
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
	geom_point() +
	geom_abline() + # draws the linear path
	coord_fixed()

