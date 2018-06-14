library(ISwR)
library(MASS)

# 4.1

x <- 1:5; y <- rexp(5,1); opar <- par(mfrow=c(2,2))
plot(x, y, pch = 10)
plot(x, y, type = "b")
plot(x, y, lwd = 3)
plot(x, y, type = "o", col="grey40")
par(opar)

# 4.2
par(mfrow=c(1, 1))
plot(rnorm(10), type = "o", pch = 21, bg = "white")

# 4.3

x1 <- rnorm(20); x2 <- rnorm(10) + 1
x1 <-sort(x1); x2 <-sort(x2)

q1 <- qqnorm(x1, plot.it = F)
q2 <- qqnorm(x2, plot.it = F)

xr <- range(q1$x, q2$x)
yr <- range(q1$x, q2$y)

qqnorm(x1, xlim = xr, ylim = yr)
points(q2, col = "red", type = "l")

# 4.4
hist(react)

truehist(react, h = 1, x0 = .5)

# 4.5
z <- runif(5)
curve(quantile(z, x), from = 0, to = 1)
