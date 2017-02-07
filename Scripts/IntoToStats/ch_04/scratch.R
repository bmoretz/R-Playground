library(ISwR)

x <- rnorm(50)

# summary statistics

mean(x)

sd(x)

var(x)

median(x)

# quantiles

quantile(x)

pvec <- seq(0, 1, 0.1)

pvec

quantile(x, pvec)

# juul

attach(juul)

mean(igf1) # mean of set with any na is na

mean(igf1, na.rm = T)

sum(!is.na(igf1)) # counting non-na values of a set

summary(igf1)

summary(juul)

detach(juul)

juul$sex <- factor(juul$sex, labels = c("M", "F"))
juul$menarche <- factor(juul$menarche, labels = c("Yes", "No"))
juul$tanner <- factor(juul$tanner, labels = c("I", "II", "III", "IV", "V"))

attach(juul)

summary(juul)

detach(juul)

juul <- transform(juul,
	sex = factor(sex, labels = c("M", "F")),
	menarche <- factor(menarche, labels = c("Yes", "No")),
	tanner <- factor(juul$tanner, c("I", "II", "III", "IV", "V"))
)

# histograms

x <- rnorm(50)
hist(x)

mid.age <- c(2.5, 7.5, 13, 16.5, 17, 19, 22.5, 44.5, 70.5)
acc.count <- c(28, 46, 58, 20, 31, 64, 149, 316, 103)
age.acc <- rep(mid.age, acc.count)

brk <- c(0, 5, 10, 16, 17, 18, 20, 25, 60, 80)

hist(age.acc, breaks = brk)

n <- length(x)
plot(sort(x), (1:n) / n, type = "s", ylim = c(0, 1))

?ecdf

##-- Simple didactical  ecdf  example :
x <- rnorm(12)
Fn <- ecdf(x)
Fn # a *function*
Fn(x) # returns the percentiles for x
tt <- seq(-2, 2, by = 0.1)
12 * Fn(tt) # Fn is a 'simple' function {with values k/12}
summary(Fn)
##--> see below for graphics
knots(Fn) # the unique data values {12 of them if there were no ties}

y <- round(rnorm(12), 1);
y[3] <- y[1]
Fn12 <- ecdf(y)
Fn12
knots(Fn12) # unique values (always less than 12!)
summary(Fn12)
summary.stepfun(Fn12)

## Advanced: What's inside the function closure?
ls(environment(Fn12))
##[1] "f"  "method"  "n"  "x"  "y"  "yleft"  "yright"
utils::ls.str(environment(Fn12))
stopifnot(all.equal(quantile(Fn12), quantile(y)))

###----------------- Plotting --------------------------
require(graphics)

op <- par(mfrow = c(3, 1), mgp = c(1.5, 0.8, 0), mar = .1 + c(3, 3, 2, 1))

F10 <- ecdf(rnorm(10))
summary(F10)

plot(F10)
plot(F10, verticals = TRUE, do.points = FALSE)

plot(Fn12, lwd = 2);
mtext("lwd = 2", adj = 1)
xx <- unique(sort(c(seq(-3, 2, length = 201), knots(Fn12))))
lines(xx, Fn12(xx), col = "blue")
abline(v = knots(Fn12), lty = 2, col = "gray70")

plot(xx, Fn12(xx), type = "o", cex = .1) #- plot.default {ugly}
plot(Fn12, col.hor = "red", add = TRUE) #- plot method
abline(v = knots(Fn12), lty = 2, col = "gray70")
## luxury plot
plot(Fn12, verticals = TRUE, col.points = "blue",
	 col.hor = "red", col.vert = "bisque")

##-- this works too (automatic call to  ecdf(.)):
plot.ecdf(rnorm(24))
title("via  simple  plot.ecdf(x)", adj = 1)

par(op)

qqnorm(x)

par(mfrow = c(1, 2))
boxplot(IgM)
boxplot(log(IgM))
par(mfrow = c(1, 1))

attach(red.cell.folate)

tapply(folate, ventilation, mean)
tapply(folate, ventilation, sd)
tapply(folate, ventilation, length)

xbar <- tapply(folate, ventilation, mean)
s <- tapply(folate, ventilation, sd)
n <- tapply(folate, ventilation, length)

cbind(mean = xbar, std.devs = s, n = n)

attach(juul)
tapply(igf1, tanner, mean)

tapply(igf1, tanner, mean, na.rm = T)

aggregate(juul[c("age", "igf1")],
	list(sex = juul$sex), mean, na.rm = T)

aggregate(juul[c("age", "igf1")], juul["sex"], mean, na.rm = T)

by(juul, juul["sex"], summary)

attach(energy)

expend.lean <- expend[stature == "lean"]
expend.obese <- expend[stature == "obese"]

par(mfrow = c(2, 1))
hist(expend.lean, breaks = 10, xlim = c(5, 13), ylim = c(0, 4), col = "white")
hist(expend.obese, breaks = 10, xlim = c(5, 13), ylim = c(0, 4), col = "grey")
par(mfrow = c(1, 1))

boxplot(expend ~ stature)

boxplot(expend.lean, expend.obese)

detach(juul)

# sec 4.4.3