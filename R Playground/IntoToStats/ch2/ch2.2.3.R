# standard empty plot, initialize the region
plot(x, y, type = "n", xlab = "", ylab = "", axes = F)

# set custom margins in the sub system
par(mar = c(4, 4, 2, 2) + 0.1)

points(x, y)
axis(1)
axis(2, at = seq(0.2, 1.8, 0.2))

box()

title(main = "Main Title", sub = "subtitle", xlab = "x-label", ylab = "y-label")