# chapter 3.1 exercises

mtcars[mtcars$cyl == 4,]
mtcars[ - c(1:4)]
mtcars[mtcars$cyl <= 5,]
mtcars[ mtcars$cyl == c(4,6), ]

# because none are NA

x <- 1:5;
x

x[1] = NA
x

x[NA]

# 3, returns the upper/lower triangle diag in a matrix
x <- outer(1:5, 1:5, FUN = "*")
x[ upper.tri(x) ]

help(upper.tri)

(m2 <- matrix(1:20, 4, 5))
upper.tri(m2, diag = TRUE)

# 4, can't index into a matrix with a single vector
mtcars[1:20,] #correct

# 5

mat <- outer(1:5, 1:5, FUN = "*" )
mat

tri <- function(mat) {
    return ( mat )
}

tri(mat)

# 6 
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df

df[1, 1] = NA
df

df[is.na(df)] <- 0
df

a <- list(a = 1, b = 2)
a[[2]]

b <- list(a = list(b = list(c = list(d = 1))))

b[[c("a", "b", "c", "d")]]

b[["a"]][["b"]][["c"]][["d"]]

mtcars[[1]]

mtcars[["mpg"]]

mod <- lm(mpg ~ wt, data = mtcars)
summary(mod)
str(mod)

mod$df.residual
summary(mod)$r.squared

x <- 1:5
x[c(1, 2)] <- 2:3
x[-1] <- 4:1

df <- data.frame(a = c(1, 10, NA))
df$a[df$a < 5] <- 0

mtcars[] <- lapply(mtcars, as.integer)
mtcars

mtcars <- lapply(mtcars, as.integer)
mtcars

x <- list(a = 1, b = 2)
x
x[["b"]] <- NULL

y <- list(a = 1)
y["b"] <- list(NULL)

str(y)

df <- data.frame(x = rep(1:3), each = 2, y = 6:1, z = letters[1:6])

set.seed(10)

df[sample(nrow(df)),]

df[sample(nrow(df), 3),]

df[sample(nrow(df), 6, rep = TRUE),]

x <- c("a", "b", "c")
order(x)

x[order(x)]

df2 <- df[sample(nrow(df)), 3:1]
ddf2[order(df2$x),]
df2[, order(names(df2))]

df <- data.frame(x = c(2, 4, 1), y = c(9, 11, 6), n = c(3, 5, 1))
df

rep(1:nrow(df), df$n)
df[rep(1:nrow(df), df$n),]

mtcars[mtcars$gear == 5,]

mtcars[mtcars$gear == 5 & mtcars$cyl == 4,]

subset(mtcars, gear == 5 & cyl == 4)

x <- sample(10) < 4
which(x)

unwhich <- function(x, n) {
    out <- rep_len(FALSE, n)
    out[x] <- TRUE
    out
}

unwhich(which(x), 10)

( x1 <- 1:10 %% 2 == 0 )
( x2 <- which(x1))

(y1 <- 1:10 %% 5 == 0)
(y2 <- which(y1))

x1 & y1
x1 | y1

union(x2, y2)

x1 & !y1

setdiff(x2, y2)

xor(x1, y1)

setdiff(union(x2, y2), intersect(x2, y2))
