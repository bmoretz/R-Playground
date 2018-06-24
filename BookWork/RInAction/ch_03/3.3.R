# data from 3.2
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

# using "par"
opar <- par(no.readonly = TRUE)
par(lty = 2, pch = 17)
plot(dose, drugA, type = "b")
par(opar)

# inline
plot(dose, drugA, type = "b", lty = 2, pch = 17)

# color scales, out-of-the-box

n <- 20
mycolors <- rainbow(n)
pie(rep(1, n), labels = mycolors, col = mycolors)
mygrays <- gray(0:n / n)
pie(rep(1, n), labels = mygrays, col = mygrays)

# R Color Brewer
library(RColorBrewer)

n <- 7
mycolors <- brewer.pal(n, "Set1")
barplot(rep(1, n), col = mycolors)

# 3.3.3, Text Characteristics

par(font.lab = 3, cex.lab = 1.5, font.main = 4, cex.main = 2)


opar <- par(no.readonly = TRUE)
par(pin = c(2, 3))
par(lwd = 2, cex = 1.5)
par(cex.axis = .75, font.axis = 3)
plot(dose, drugA, type = "b", pch = 19, lty = 2, col = "red")
plot(dose, drugB, type = "b", pch = 23, lty = 6, col = "blue", bg = "green")
par(opar)

# 3.4, text, customized axes and legends

plot(dose, drugA, type = "b",
  col = "red", lty = 2, pch = 2, lwd = 2,
  main = "Clinical Trials for Drug A",
  sub = "This is hypothetical data",
  xlab = "Dosage", ylab = "Drug Response",
  xlim = c(0, 60), ylim = c(0, 70))

x <- c(1:10)
y <- x
z <- 10 / x

# 3.4.2, Creative Axes
opar <- par(no.readonly = TRUE)

par(mar = c(5, 4, 4, 8) + 0.1)
plot(x, y, type = "b",
  pch = 21, col = "red",
  yaxt = "n", lty = 3, ann = FALSE)

lines(x, z, type = "b", pch = 22, col = "blue", lty = 2)

axis(2, at = x, labels = x, col.axis = "red", las = 2)

axis(4, at = z, labels = round(z, digits = 2),
  col.axis = "blue", las = 2, cex.axis = 0.7, tck = -0.01)

mtext("y=1/x", side = 4, lines = 3, cex.lab = 1, las = 2, col = "blue")

title("An Example of Creative Axes",
   xlab = "X Values",
   ylab = "Y=X")

par(opar)

# 3.4.4, Legends

opar <- par(no.readonly = TRUE)
par(lwd = 2, cex = 1.5, font.lab = 2)
plot(dose, drugA, type = "b",
  pch = 15, lty = 1, col = "red", ylim = c(0, 60),
  main = "Drug A vs. Drug B",
  xlab = "Drug Dosage", ylab = "Drug Response")

lines(dose, drugB, type = "b",
   pch = 17, lty = 2, col = "gray")

library(Hmisc)

minor.tick(nx = 3, ny = 3, tick.ratio = 0.5)

legend("topleft", inset = 0.05, title = "Drug Type", c("A", "B"),
	lty = c(1, 2), pch = c(15, 17), col = c("red", "blue"))

par(opar)

# 3.4.6, Annotations
with(mtcars, {
	plot(wt, mpg,
		main = "Milage vs. Car Weight",
		xlab = "Weight", ylab = "Milage",
		pch = 18, col = "blue")
	text(wt, mpg,
		row.names(mtcars),
		cex = 0.6, pos = 4, col = "red")
})

# 3.5, Combining Graphs

with(mtcars, {
	opar <- par(no.readonly = TRUE)
	par(mfrow = c(2, 2))
	plot(wt, mpg, main = "Scatterplot of wt vs mpg")
	plot(wt, disp, main = "Scatterplot of wt vs disp")
	hist(wt, main = "Histogram of wt")
	boxplot(wt, main = "Boxplot of wt")
	par(opar)
})

with(mtcars, {
	opar <- par(no.readonly = TRUE)
	par(mfrow = c(3, 1))
	hist(wt)
	hist(mpg)
	hist(disp)
	par(opar)
})

with(mtcars, {
	layout(matrix(c(1, 1, 2, 3), 2, 2, byrow = TRUE),
			widths = c(3, 1), heights = c(1, 2))
	hist(wt)
	hist(mpg)
	hist(disp)
})

# 3.5.1, Figure Arrangment

with(mtcars, {
	opar = par(no.readonly = TRUE)

	par(fig = c(0, 0.8, 0, 0.8))
	plot(mtcars$mpg, mtcars$wt,
		xlab = "Miles Per Gallon",
		ylab = "Car Weight")

	par(fig = c(0, 0.8, 0.55, 1), new = TRUE)
	boxplot(mtcars$mpg, horizontal = TRUE, axes = FALSE)

	par(fig = c(0.65, 1, 0, 0.8), new = TRUE)
	boxplot(mtcars$wt, axes = FALSE)

	mtext("Enhanced Scatterplot", side = 3, outer = TRUE, line = -3)

	par(opar)
})


