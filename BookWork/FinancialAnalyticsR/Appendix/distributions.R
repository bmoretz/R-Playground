library(ggplot2)

# Flip a fair coin 100 times and calculate the probability of getting exactly 50 heads.

# ( n | x ) * p^x * ( 1 - p )^( n - x )
choose(100, 50) * .5 ^ 50 * (1 - .5) ^ (100 - 50)

# poisson distribution
hist(rpois(200, lambda = 5))

par(mfrow = c(2, 2))
hist(rpois(200, lambda = 5), main = "")
hist(rpois(200, lambda = 5), main = "")
hist(rpois(200, lambda = 5), main = "")
hist(rpois(200, lambda = 5), main = "")

