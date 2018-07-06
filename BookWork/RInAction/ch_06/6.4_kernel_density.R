opar = par(mfrow = c(2, 1))

d <- density(mtcars$mpg)

plot(d)

d <- density(mtcars$mpg)
plot(d, main = "Kernel Density of Miles Per Gallon")
polygon(d, col = "red", border = "blue")

par(opar)

library(sm)

attach(mtcars)

cyl.f <- factor(cyl, levels = c(4, 6, 8),
	labels = c("4 Cylinder", "6 cylinder",
		"8 Cylinder"))

sm.density.compare(mpg, cyl, xlab = "Miles Per Gallon")
title(main = "MPG Distribution by Car Cylinders")

colfil <- c(2:(1 + length(levels(cyl.f))))
legend(locator(1), levels(cyl.f), fill = colfil)

detach(mtcars)