# 1
# Define the vectors, “x” and “y”. Determine the answers to (a) through (g) and check with R.

x <- seq(1, 6)
y <- rep(1:3, 2)

# (a) print(x) and print(y)
print(x)
print(y)

# (b) combine the elements of y with x

z <- c(x, y)

# (c) find the length of c(x, y)
length(z)

# (d) sum the elements in c(x, y)
sum(z)

# (e) calculate x + y, x * y, x - 1, x ^ 2
x + y
x * y
x - 1
x ^ 2


# 2

seq(2, 9)
seq(2, 9, length = 8)
seq(9, 2, -1)
rep(c(1, 2), 4)
rep(c(1, 2), c(4, 4))
rep(1:4, rep(3, 4))

# 3
# Use the rep function to define the following vectors in R.

# (a) 6, 6, 6, 6, 6, 6
rep(6, 6)

# (b) 5, 8, 5, 8, 5, 8, 5, 8
rep( c( 5, 8 ), 4 )

# (c) 5, 5, 5, 5, 8, 8, 8, 8
rep(c(5, 8), c(4, 4))
