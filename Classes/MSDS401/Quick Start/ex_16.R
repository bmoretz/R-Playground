color <- colors()


color <- palette("default")
palette(c("red", "purple", "blue", "green3", "yellow", "orange"))
color <- palette(c("red", "purple", "blue", "green3", "yellow", "orange"))
pie(rep(1, 6), labels = c(color[1:6]), col = c(color[1:6]), main = "Color Wheel")

if (!require("RColorBrewer")) {
	install.packages("RColorBrewer")
	library(RColorBrewer)
}
display.brewer.all()

require("RColorBrewer")
set.seed(123)
sample <- table(rbinom(10000, 10, 0.5)) / 10000
successes <- (seq(0, 10))
barplot(sample, main = "Binomial Sample Proportions", ylab = "Frequency",
	ylim = c(0, 0.3), xlab = "Number of Successes", names.arg = c(factor(seq(0, 10))),
	col = c(brewer.pal(11, "Spectral")))

set.seed(123)
variable <- rnorm(500, mean = 0, sd = 1)
par(mfrow = c(1, 3))
hist(variable, ylim = c(0, 120), col = rgb(1, 0, 0, 0.25))
hist(variable, ylim = c(0, 120), col = rgb(1, 0, 0, 0.5))
hist(variable, ylim = c(0, 120), col = rgb(1, 0, 0))
par(mfrow = c(1, 1))


sales <- c(0.70, 0.74, 0.64, 0.39, 0.70, 2.20, 1.98, 0.64, 1.22, 0.20, 1.64, 1.02, 2.95,
	0.90, 1.76, 1.00, 1.05, 0.10, 3.45, 1.56, 1.62, 1.83, 0.99, 1.56, 0.40, 1.28,
	0.83, 1.24, 0.54, 1.44, 0.92, 1.00, 0.79, 0.79, 1.54, 1.00, 2.24, 2.50, 1.79,
	1.25, 1.49, 0.84, 1.42, 1.00, 1.25, 1.42, 1.15, 0.93, 0.40, 1.39, 0.30, 0.35)

sales <- jitter(sort(sales, decreasing = FALSE), 75)
week <- seq(1:length(sales))
c <- week / length(week) # This is a use-defined function that specifies a proportion.
coly <- rgb(c, 0, 0) # This assigns a color to each week.
plot(week, sales, col = coly, pch = 19, cex = 1, main = "Sales per Week")


data(mtcars)
col.list <- numeric(0)
cylinders <- factor(mtcars$cyl)
hp <- mtcars$hp
mpg <- mtcars$mpg
color <- c("red", "blue", "green")
col.list[cylinders == "4"] <- 1 # Denotes "red" from the palette.
col.list[cylinders == "6"] <- 2 # Denotes "blue" from the palette.
col.list[cylinders == "8"] <- 3 # Denotes "green" from the palette.
plot(hp, mpg, pch = 16, col = c(color[col.list]), main = "MPG vs HP")
legend(x = 250, y = 30, legend = paste("Cylinders", seq(4, 8, 2)),
	col = c(color), pch = 16)
lines(lowess(mtcars$hp, mtcars$mpg, 0.5), lwd = 2)


data(ChickWeight)
m.weight <- aggregate(weight ~ Time + Diet, data = ChickWeight, mean)
m.weight <- subset(m.weight, (Time >= 10) & (Time <= 20))
time <- m.weight$Time
weight <- m.weight$weight
diet <- m.weight$Diet
c <- seq(8, 20, 2) / 24 # creates color variation by week using rgb()
plot(time[diet == "1"], weight[diet == "1"], type = "b", ylim = c(0, 300), pch = 16,
xlab = "Week", ylab = "Mean Weight", main = "Weight by Week", col = rgb(c, c, 0), lwd = 2)
lines(time[diet == "2"], weight[diet == "2"], type = 'b', col = rgb(c, 0, + 0), pch = 16, lwd = 2)
lines(time[diet == "3"], weight[diet == "3"], type = 'b', col = rgb(0, c, + 0), pch = 16, lwd = 2)
lines(time[diet == "4"], weight[diet == "4"], type = 'b', col = rgb(0, 0, + c), pch = 16, lwd = 2)
legend(x = 18, y = 100, legend = paste(c("Diet 1, yellow", "Diet 2, red",
	"Diet 3, blue", "Diet 4, green")))

# 1. Use RColorBrewer and six colors from the Accent scheme to produce a pie chart with equal area slices. 
# This will require use of brewer.pal() .

pie(rep(1, 6), labels = "", col = c(brewer.pal(6, "Accent")), main = "Accent Color Wheel")

# 2. Use set.seed(123) and rnorm(100, 100, sd = 1.5) to generate six random samples. Use the color scheme from(1) above to produce six side - by - side boxplots.

set.seed(123)
sample <- rnorm(100, 100, 1.5)

barplot(head(sample, 6), main = "Accent Color Bars",
	col = c(brewer.pal(6, "Accent")))

# 3. Produce six histograms using the samples from(2) . Color each with a different color from the palette(c("red", "purple", "blue", "green3", "yellow", "orange")).

palette(c("red", "purple", "blue", "green3", "yellow", "orange"))
par(mfrow = c(2, 3))
hist(sample, ylim = c(0, 120), col = "red")
hist(sample, ylim = c(0, 120), col = "purple")
hist(sample, ylim = c(0, 120), col = "blue")
hist(sample, ylim = c(0, 120), col = "green3")
hist(sample, ylim = c(0, 120), col = "yellow")
hist(sample, ylim = c(0, 120), col = "orange")
par(mfrow = c(1, 1))

# 4. Use col2rgb() and determine the rgb() representation for
#	the six colors in the palette used in (3) above. Convert the rgb codes into hex codes.

rgbcols <- sapply(c("red", "purple", "blue", "green3", "yellow", "orange"), col2rgb)

apply(rgbcols, 2, FUN = function(x) {
	return(rgb(x[1], x[2], x[3], max = 255))
})
