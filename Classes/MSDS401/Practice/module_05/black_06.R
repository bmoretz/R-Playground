normal_z <- function(pct, mean = 0, sd = 1) {
	qnorm(1 - ((1 - pct) / 2), mean, sd, lower.tail = T)
}

# Calculate Confidence Interval for the mean: Known Variance

ci.pct = .99

n <- 10
mu <- 1.58
var <- 1.664
std <- sqrt(var)
se <- sqrt(var / n)

margin.of.error <- round(normal_z(ci.pct) * std / sqrt(n), 2)

c(mu - margin.of.error, mu + margin.of.error)

# Example 2,

ci.pct <- .9
n <- 16
std <- 4

z <- normal_z(ci.pct)
