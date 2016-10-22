x <- rnorm(100)

hist(x, freq = F)
curve(dnorm(x), add = T)