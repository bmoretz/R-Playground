x <- c(0, 1, 2, 3, 4, 5, 6)

binomial <- dbinom(x, 100, 0.01, log = FALSE)

hist(binomial, breaks = pretty(binomial))

dpois(x, 1.0, log = FALSE)
dhyper(x, 20, 2000, 100, log = FALSE)
