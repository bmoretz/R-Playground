# Assume the mean weight of 1 year-old girls in the us is normally distributed with a mean of
# about 9.5kg, with a sd of 1.1kg. graph the following:

# Less than 8.4kg

mean <- 9.5
sd <- 1.1

lb <- 0
ub <- 8.4

x <- seq(-4, 4, length = 100) * sd + mean
hx <- dnorm(x, mean, sd)

par(mar = c(2, 2, 4, 2))

plot(x, hx, type = "n", xlab = "", ylab = "", axes = F)

mtext( side = 3, text = "Normal Distribution", line = 2, cex = 1.5)
mtext( side = 3, text = "1-year old baby weights", line = 1, cex = .8)

i <- x >= lb & x <= ub;

lines(x, hx, col = "#ff7633", lwd = 2)
polygon(c(lb, x[i], ub), c(0, hx[i], 0), col = "skyblue")

# abline(v = mean, lty = 3)

area <- pnorm(ub, mean, sd) - pnorm(lb, mean, sd)

result <- paste("P(", lb, "< Weight <", ub, ") =",
   signif(area, digits = 3))

mtext(result, 3)

axis(1, at = seq(4, 15, sd), pos = 0)