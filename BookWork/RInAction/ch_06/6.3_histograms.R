
# Base R
opar <- par(mfrow=(c(2, 2)))

hist(mtcars$mpg)

hist(mtcars$mpg,
  breaks = 12,
  col = "red",
  xlab = "Miles Per Gallon",
  main = "Colored histogram with 12 bins")

hist(mtcars$mpg,
  breaks = 12,
  freq = F,
  col = "red",
  xlab = "Miles Per Gallon",
  main = "Histogram, rug plot, density curve")
rug(jitter(mtcars$mpg))
lines(density(mtcars$mpg), col = "blue", lwd = 2)

x <- mtcars$mpg
h <- hist(x,
	breaks = 12,
	col = "red",
	xlab = "Miles Per Gallon",
	main = "Histogram with normal curve and box")
xfit <- seq(min(x), max(x), length = 40)
yfit <- dnorm(xfit, mean = mean(x), sd = sd(x))
yfit <- yfit * diff( h$mids[1:2] ) * length(x)
lines(xfit, yfit, col = "blue", lwd = 2)
box()

par(opar)

# ggplot
library(data.table)
library(ggplot2)
library(data.table)
library(ggthemes)
library(scales)
library(RColorBrewer)

theme_set(theme_fivethirtyeight())

# Theme Overrides
theme_update(plot.title = element_text(hjust = 0.5),
	axis.text.x = element_text(face = "bold", size = 12),
	axis.text.y = element_text(face = "bold", size = 12),
	legend.position = "top", legend.title = element_blank(),
	axis.line = element_line(colour = "black"),
	panel.border = element_rect(colour = "grey", fill = NA, size = 8))

ggplot(mtcars, aes(mpg, fill = ..density..)) +
	geom_histogram(breaks
	= pretty(mtcars$mpg)) +
	ggtitle("Histogram of MPG")

ggplot(mtcars, aes(mpg, fill = ..count..)) +
	geom_histogram(bins = 12) +
	ggtitle("Histogram of MPG, 12 bins")

bins <- 12
cols <- colorRampPalette(brewer.pal(9, "Set1"))

ggplot(mtcars, aes(x = mpg)) +
	geom_histogram(bins = 12, aes(y = ..density..), color = "black", fill = cols(bins)) +
	geom_density(aes(y = ..density..)) +
	geom_rug( aes( x = mpg ) ) +
	ggtitle("Histogram of MPG")