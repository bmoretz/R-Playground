options(digits = 12)

prob_4a <- c(-1, 03, 0, 2, -5)
summary(prob_4a)

prob_4b <- c(2, 2, 3, 10, 100, 1000)
summary(prob_4b)

exam <- c(73, 74, 92, 98, 100, 72, 74, 85, 76, 94, 89, 73, 76, 99)
mean(exam)

presidents <- c(3, 9, 10, 4, 7, 8, 9, 5, 7, 8)
sd(presidents)
var(presidents)

sd(presidents) ** 2

presidents - var(presidents)


plants <- c(12, 6, 15, 3, 12, 6, 21, 15, 18, 12)
mu <- sd(plants)
hat <- var(plants)

sum( plants - mu )

max(plants) - min(plants)
