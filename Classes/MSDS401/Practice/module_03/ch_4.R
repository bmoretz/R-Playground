
binomial <- dbinom(x, 100, 0.01, log = FALSE)

hist(binomial, breaks = pretty(binomial))

dpois(x, 1.0, log = FALSE)
dhyper(x, 20, 2000, 100, log = FALSE)

pbinom(10, size = 23, prob = .64)
dbinom(10, size = 23, prob = .64)

n <- 20
p <- .86
q <- 1 - p
sqrt(n * q * p)

# Basic Statistics

x <- c(1, 5, 10)
p <- c(.2, .5, .3)

ev <- sum(x * p)

x <- 0:3
p <- c(.1, .3, .4, .2)

ev <- sum(x * p)
var <- sum((x - ev) ** 2 * p)

x <- c(0, 1, 2, 3)
p <- c(0.779, 0.195, 0.024, 0.002)

ev <- sum(x * p)
var <- sum((x - ev) ** 2 * p)
