# Children's IQ scores are normally distributed with a
# mean of 100 and a standard deviation of 15. What
# proportion of children are expected to have an IQ between
# 80 and 120?

mean = 100;
sd = 15

lb = 80;
ub = 120

x <- seq(-4, 4, length = 100) * sd + mean
hx <- dnorm(x, mean, sd)

par(mar = c(9, 3, 5, 2))

plot(x, hx, type = "n", ylab = "", axes = FALSE, col = '#ff7633')

mtext(side = 3, "Normal Distribution", line = 2, cex = 2)
mtext(side = 3, "IQ Values", line = 1, cex = 1.5)

i <- x >= lb & x <= ub

lines(x, hx)
polygon(c(lb, x[i], ub), c(0, hx[i], 0), col = "skyblue")

area <- pnorm(ub, mean, sd) - pnorm(lb, mean, sd)

result <- paste("P(", lb, "< IQ <", ub, ") =",
   signif(area, digits = 3))

mtext(result, 3)

axis(1, at = seq(40, 160, 20), pos = 0)