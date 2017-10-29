
a <- c(1, 2, 3)

a

b <- c(4, 5, 6)

b

# C
c <- matrix(c(3, 2, 1), 3, 1, byrow = TRUE)

# C' (transpose)
matrix(c(3, 2, 1), 1, 3, byrow = TRUE)

matrix(c(3, 2, 1), 1, 3)

d <- matrix(c(6, 5, 4), nrow = 3, ncol = 1, byrow = TRUE)

class(b)

b <- as.matrix(b)

class(b)

# 2.3.2

U <- matrix(c(1, 2, 3, 4), 2, 2, byrow = T)
V <- matrix(c(5, 6, 7, 8), 2, 2, byrow = T)
W <- matrix(c(2, 2, 3, 5), 2, 2, byrow = T)
A <- matrix(c(1, 2, 3, 4, 5, 6), 2, 3, byrow = T)
B <- matrix(c(1, 2, 3, 4, 5, 6), 3, 2, byrow = T)

U;
V;
W

A;
B

U + V
2 * U

U %*% V

# simple properties

# simple vector dot product
A <- c(1, 2, 3)
B <- c(-2, 0, 5)

A %*% B


# || A ||
magnitude <- function(vec) {
	sqrt( vec %*% vec )
}

magnitude(A)

# dot product commutative
A %*% B
B %*% A

C <- c(5, 6, 7)

# distributive property
( B + C ) %*% A
(A %*% B) + (A %*% C)

