# 1. Using the following code, create the matrices x and y. Perform the indicated calculations
# and check your answers in R.

x <- c(4, 3, 2, 1)
x <- matrix(x, nrow = 2)
y <- c(4, 9, 1, 16)
y <- matrix(x, nrow = 2)

# (a) 2*x
2 * x

# (b) sqrt(y)
sqrt(y)

# (c) x * x
x * x

# (d) x %*% x

x %*% x

# (e) solve(y)
solve(y)

# (f) round(solve(y) %*% y, digits = 1)
round(solve(y) %*% y, digits = 1)

# (g) y[1,]
y[1,]

# (h) y[, 2]
y[, 2]

# 2. Define z <- c(2, 1). Calculate z%*%y and y%*%z. Check your answers in R.

z <- c(2, 1)

z %*% y

y %*% z

