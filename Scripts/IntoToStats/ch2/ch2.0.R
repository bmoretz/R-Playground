x <- rnorm(50)

mean(x)
sd(x)
var(x)
median(x)

quantile(x)

pvec <- seq(0, 1, 0.1)

quantile(x, pvec)

library(package = ISwR)
data(juul)

attach(juul)

mean(igf1, na.rm = T)

length(igf1)

sum(!is.na(igf1))

summary(igf1)

summary(juul)