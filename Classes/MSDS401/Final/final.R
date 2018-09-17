# 1

1 / 3

# 2

x <- c(0, 1, 2, 3, 4, 5, 6, 7)
P.x <- c(0.200, 0.239, 0.245, 0.182, 0.100, 0.030, 0.003, 0.001)

ev <- sum(x * P.x)
var <- sum(P.x * (x - ev) ^ 2)
sd <- sqrt(var)

avg <- round(sum(x * P.x), digits = 3)
var <- round(sum(P.x * (x - avg) ^ 2), digits = 3)
sd <- round(sqrt(var), digits = 2)
mode = x[P.x == max(P.x)]

pretty_vector(c("Mean" = ev, "Variance" = var, "Standard Deviation" = sd, "Median" = med, "Mode" = mode))
plot(x, cumsum(P.x), main = "cdf for P.x", type = "h", ylim = c(0, 1.0))
abline(h = 0.5, col = "red")

# 3

values <- matrix(c(23, 35, 42, 45, 30, 25), ncol = 3, byrow = TRUE)
results <- chisq.test(values, correct = FALSE)

round(results$statistic, 3)
round(results$p.value, 3)

# 4

alpha <- 0.01

before <- c(255, 230, 290, 242, 300, 250, 215, 230, 225, 219, 236)
after <- c(197, 225, 215, 215, 240, 235, 190, 240, 200, 203, 223)

delta <- after - before

t <- qt(1 - alpha, 10, lower.tail = T, )

sd(delta)
round( qt(0.99, length(before) - 1, lower.tail = F), 3)

result <- t.test(delta, alternative = c("less"), mu = 0, paired = FALSE, conf.level = 0.99)

?t.test
round(result$p.value, 3)

# 5

x <- seq(0, 17)
n <- 17
p <- .35
m <- which.max(dbinom(x, n, p))

round( dbinom(0, n, p), 3 )

round(dbinom(m - 1, n, p), 4)

pbinom(9, n, p, lower.tail = FALSE)

round( sum(dbinom(seq(10, n), n, p)), 4 )

# 6

alpha <- 0.01

ss.factor <- 100
ss.error <- 60
ss.total <- ss.factor + ss.error

ms.factor <- 25.0
ms.error <- 6.0

factor <- ss.factor / ms.factor
error <- ss.error / ms.error

total <- factor + error

f.stat <- ms.factor / factor

q5 <- data.frame(rbind(
	c(factor, ss.factor, ms.factor, f.stat),
	c(error, ss.error, ms.error, ""),
	c(total, ss.total, "", " ")))

q5

p <- pf(f.stat, factor, error, lower.tail = FALSE) # p-value = 0.0001607934
# 99% Critical Value
crit <- qf(0.99, factor, error, lower.tail = TRUE) # critical value = 4.938

f.stat > crit

p < alpha

# 7

alpha <- 0.05

x <- c(9, 2, 3, 4, 2, 5, 9, 10)
y <- c(85, 52, 55, 68, 67, 86, 83, 73)

lm.fit <- lm(x ~ y)
lm.sum <- summary(lm.fit)

p.value <- 0.04954

p.value < alpha # statistically significant

round(cor(x, y, method = c("pearson")), 3)

# 8

alpha <- 0.05

x <- c(2.2, 2.4, 2.6, 2.8, 3.0, 3.2)
y <- c(44, 43, 45, 44.5, 46, 45.5)

lm.fit <- lm(x ~ y)
summary(lm.fit)
round( cor(x, y), 2 )

p.value <- 0.06051

p.value < alpha

# 9

city_1 <- c(3.30, 3.44, 3.39, 3.56, 3.50, 3.39, 3.35, 3.47, 3.36, 3.38)
city_2 <- c(3.43, 3.40, 3.39, 3.32, 3.39, 3.38, 3.34, 3.38, 3.38, 3.28)

sd(city_1)

sA <- sd(city_1)
sB <- sd(city_2)

nA <- length(city_1)
nB <- length(city_2)

dfA <- nA - 1
dfB <- nB - 1

f_stat <- round( (sA / sB) ^ 2, 3 ) 
f_crit <- qf(0.95, dfA, dfB, lower.tail = TRUE) 

prob <- round(pf(f_stat, dfA, dfB, lower.tail = FALSE), 3)

f_stat > f_crit

# 10

alpha <- 0.05 / 2

n <- 24
sd1 <- 65
sd2 <- 81

chi <- (n - 1) * (sd / (n - 1)) ^ 2

p <- round( pchisq(chi, n - 1, lower.tail = FALSE), 4 )

qchisq(.95, n - 1, lower.tail = T)

p <- round( dchisq(n, n - 1 ), 3 )