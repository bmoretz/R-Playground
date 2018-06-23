x <- 5
y <- 6
z <- x + y

ls()

rm(list = ls())

ls()

z <- c(1, 2, 3, 1.4, 1.7, 3.1)
z

x <- 1:11
x

seq(1, 11, by = 2)
seq(1, 11, length = 6)

rep(0, 11)

rep(1:3, 6)

rep(1:3, each = 6)

rep(1:3, rep(6, 3))

rep(1:3, c(6, 6, 6))

x <- c(1, 2, 3)
y <- c(1.4, 1.7, 3.1)
z <- c(x, y)

x + y

x + 2

x <- append(x, y, after = 1)
x

x <- append(x, z, after = 5)

