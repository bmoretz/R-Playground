options(digits = 12)

prob_4a <- c(-1, 03, 0, 2, -5)
summary(prob_4a)

prob_4b <- c(2, 2, 3, 10, 100, 1000)
summary(prob_4b)

exam <- c(73, 74, 92, 98, 100, 72, 74, 85, 76, 94, 89, 73, 76, 99)
mean(exam)

presidents <- c(3, 9, 10, 4, 7, 8, 9, 5, 7, 8)
sd(presidents)
var(presidents)

sd(presidents) ** 2

presidents - var(presidents)


plants <- c(12, 6, 15, 3, 12, 6, 21, 15, 18, 12)
mu <- sd(plants)
hat <- var(plants)

sum( plants - mu )

max(plants) - min(plants)

var(presidents)
median(presidents)
mean(presidents)

sum(presidents - mean(presidents))

# Outlier Detection

values <- c(rep(c(2, 3, 4), c(5, 5, 5)), 1000)

values

mu <- mean(values)
std.dev <- sd(values)

(1000 - mu) / std.dev

# Boxplot Rule

values <- c(seq(from = 1, to = 14, by = 1), 100, 500)

q1 <- quantile(values, .25)
q2 <- quantile(values, .75)

summary(values)

q2 + 1.5 * (q2 - q1)

# 20

values <- c(20, 121, 132, 123, 145, 151, 119, 133, 134, 130)

q1 <- quantile(values, .25)
q2 <- quantile(values, .75)

outlier_range <- q2 + 1.5 * (q2 - q1)

values > outlier_range
values < outlier_range

# trimmed mean

# 20% example

values <- c(46, 12, 33, 15, 29, 19, 4, 24, 11, 31, 38, 69, 10)
values <- sort(values)

trimmed_mean <- function(vals, pct) {
	vals <- sort(vals)
	n <- length(vals)
	
	trim_vals <- floor(n * pct)

	trimmed <- head(vals, length(vals) - trim_vals)
	trimmed <- tail(trimmed, length(trimmed) - trim_vals)

	mean(trimmed)
}

trimmed_mean( values, pct = .2)
mean(values, trim = .2)

pct = .2
vals <- values

n <- length(vals)

trim_vals <- floor(n * pct)

trimmed <- head(vals, length(vals) - trim_vals)
trimmed <- tail(trimmed, length(trimmed) - trim_vals)

mean(trimmed)

# Winsorized Mean

pct = .2

# Ex. 1
values <- c(seq(2, 10, 1), 50)

winsorize <- function(vals, pct) {
	vals <- sort(vals)
	g <- floor(length(vals) * pct)

	bottom <- vals[g + 1]
	top <- vals[length(vals) - g]

	trimmed <- head(vals, length(vals) - g)
	trimmed <- tail(trimmed, length(trimmed) - g)

	c(rep(bottom, g), trimmed, rep(top, g))
}

winsorize(values, pct)

# Ex. 2

values <- c(10, 8, 22, 35, 42, 2, 9, 18, 27, 1, 16, 29)
winsor_vals <- winsorize(values, pct)

mean(winsor_vals)
sd(winsor_vals)
var(winsor_vals)

# Ex. 3

values <- c(1, 2, 8, 9, 10, 16, 18, 22, 27, 29, 35, 42)
winsor_vals <- winsorize(values, pct)

mean(winsor_vals)

