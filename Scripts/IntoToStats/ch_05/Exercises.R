library(ISwR)
library(ggplot2)

# 5.1

# does react look reasonably normally distributed?
qplot(react) # yes
qqnorm(react)

# Does the mean differ significally from zero according to a t-test?
t.test(react) # mean = -0.7964072, no it does not

# 5.2

# compare vital capacity for the two groups using a t test
attach( vitcap )

df <- vitcap
df$group <- as.factor( vitcap$group )

t.test(group, vital.capacity, data = df)

# calcualate a 99% confidence interval

t.test(group, vital.capacity, data = df, conf.level = 0.99)

t.test(vital.capacity ~ group, data = vitcap, conf.level = .99)

"99 percent confidence interval:
 -3.257825 - 1.683842"

# 5.3 

wilcox.test(react)
wilcox.test(vital.capacity ~ group, data = vitcap)

# 5.4

# perform graphical checks for the assumptions for a paired t-test in the intake data set
attach(intake);

opar <- par( mfrow = c(2,2))

plot(post ~ pre); abline(0, 1 )
plot((post + pre) / 2, post - pre,
	ylim = range(0, post - pre)); abline( h = 0 )
hist(post - pre)
qqnorm(post - pre)
par(opar)

# 5.5 

shapiro.test(react)

qqnorm(react)
qplot(react)

shapiro.test(react[-c(1, 334)])
qplot(react[-c(1, 334)])

# 5.6

attach(ashina)
t.test(vas.active, vas.plac, paired = TRUE)
t.test((vas.active - vas.plac[grp == 1]), ((vas.plac - vas.active)[grp == 2]))

# 5.7

t.test(rnorm(25))$p.value
t.test(rt(25, df = 2))$p.value
t.test(rexp(25), mu = 1)$p.value
x <- replicate(5000, t.test(rexp(25), mu = 1)$p.value)
qqplot( sort(x), ppoints(5000), type = "l", log = "xy" )