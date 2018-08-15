z <- qnorm(1 - (1 - 0.98) / 2)
moe <- 0.025
n = .25 * round((z / moe) ** 2)

round(n)