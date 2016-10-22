# graphics subsystem overview

# standard plot regions

x <- runif(50, 0, 2)
y <- runif(50, 0, 2)

plot(x, y, main = "Main Title", 
	sub = "subtitle", xlab = "x-label", ylab = "y-label")

text(0.6, 0.6, "text at (0.6,0.6)")
abline(h = .6, v = .6)

for (side in 1:4)
	mtext(-1:4, side = side, at = .7, line = -1:4)

mtext(paste("side", 1:4), side = 1:4, line = -1, font = 2)

# standard empty plot, initialize the region
plot(x, y, type = "n", xlab = "", ylab = "", axes = F)

points(x, y)
axis(1)
axis(2, at = seq(0.2, 1.8, 0.2))

box()

title(main = "Main Title", sub = "subtitle", xlab = "x-label", ylab = "y-label")