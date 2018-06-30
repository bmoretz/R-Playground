require(data.table)
require(ggplot2)
require(dplyr)

mpg

# 1.) List fine functions that you could use to get more information about the mpg dataset.

head(mpg)
summary(mpg)
View(mpg)
str(mpg)
glimpse(mpg)
class(mpg)

# 2.) How can you find out what other datasets are included with ggplot2?
pkg.data <- data(package = "ggplot2")
pkgs <- as.data.table(pkg.data$results)[,3:4]

pkgs

# 2.3
ggplot(mpg, aes(x = displ, y = hwy)) +
	geom_point()

# 2.4

ggplot(mpg, aes(displ, cty, colour = class)) +
	geom_point()

ggplot(mpg, aes(displ, hwy)) + geom_point(aes(colour = "blue"))
ggplot(mpg, aes(displ, hwy)) + geom_point(colour = "blue")
