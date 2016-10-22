x <- rnorm(100)

# inaccurate combined render
hist(x, freq = F)
curve(dnorm(x), add = T)

# accurate combined render
h <- hist(x, plot = F)
ylimit <- range(0, h$density, dnorm(0))
hist(x, freq = F, ylim = ylimit)
curve(dnorm(x), add = T)
