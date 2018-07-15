
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
