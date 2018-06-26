x <- c(1, 2, 3, 4, 5, 6, 7, 8)

# Short Way
mean(x)
sd(x)

# Long Way
n <- length(x)
meanx <- sum(x) / n
css <- sum((x - meanx) ^ 2)
sdx <- sqrt(css / (n - 1))

