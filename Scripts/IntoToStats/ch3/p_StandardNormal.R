# Assume the mean weight of 1 year-old girls in the us is normally distributed with a mean of
# about 9.5kg, with a sd of 1.1kg. graph the following:

# Less than 8.4kg

mean <- 9.5
sd <- 1.1

min <- mean - sd * 4
max <- mean + sd * 4

dnorm(8.4, mean, sd)

#cord.x <- c(cord.x, 8, 8)
#cord.y <- c(cord.y, dnorm(8, mean = mean, sd = sd), 0)

curve(dnorm(x, mean, sd), xlim = c(min, max), main = 'Weight')
abline(h = 0)
abline(v = dnorm(.8, mean = mean, sd = sd) )

pnorm(10, mean = mean, sd = sd)

dnorm(.8, mean = mean, sd = sd)

#polygon(cord.x, cord.y, col = 'skyblue')


cord.x <- c(-3, seq(-3, -2, 0.01), -2)
cord.y <- c(0, dnorm(seq(-3, -2, 0.01)), 0)
curve(dnorm(x, 0, 1), xlim = c(-3, 3), main = 'Standard Normal')
polygon(cord.x, cord.y, col = 'skyblue')

normal <- function(x, mu = 0, sigma = 1) {
    # x: values on x-axis
    # mu: mean value
    # sigma: standard deviation

    # output
	1 / (sigma * sqrt(2 * pi)) * exp(-0.5 * ((x - mu) / sigma) ^ 2)
}

# x-y coordinates for Standard normal curve
x <- seq(-4, 4, length.out = 500)
y <- normal(x)

# standard normal curve plot
op = par(mar = c(2.5, 1, 1, 1))
plot(x, y, type = 'l', col = '#00ABFF', lwd = 3,
	 axes = FALSE, xlab = '', ylab = '')
axis(side = 1, at = seq(-4, 4, by = 1))

# coordinates of a normal distribution (mu = 5, sigma = 1)
x <- seq(2, 8, length.out = 500)
y <- normal(x, mu = 5)

# normal curve plot
op = par(mar = c(2.5, 1, 1, 1))
plot(x, y, type = 'l', col = '#ff7633', lwd = 4,
	 axes = FALSE, xlab = '', ylab = '')
abline(h = 0)
segments(x0 = 5, y0 = 0, x1 = 5, y1 = normal(5, mu = 5),
		 col = 'gray70', lwd = 4, lty = 2)
axis(side = 1, at = seq(2, 8, 1))
text(x = 5, y = 0.05, labels = "mean = 5")


x <- rnorm(200)
dd <- density(x)
plot(dd)
ind <- seq(100, 400, len = 6)
arrows(dd$x[ind], 0, dd$x[ind], dd$y[ind] - 0.015, length = 0.2)
