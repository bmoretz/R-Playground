sample(1:40, 5)

# flips of a coin
sample(c("H", "T"), 10, replace = T)

# 90% chance of success
sample(c("succ", "fail"), 10, replace = T, prob = c(0.9, 0.1))

# product vector
1 / prod(40:36)

# density

	x <- seq(-4, 4, 0.1)
	plot(x, dnorm(x), type = "l")

	curve(dnorm(x), from = -4, to = 4)

	x <- 0:50
	plot(x, dbinom(x, size = 50, prob = .25), type = "h")

# probability

	# pnorm = chance of getting a value smaller than arg1, given mean and sd
	(1 - pnorm(160, mean = 132, sd = 13))

	# t-test

	pbinom(16, size = 20, prob = .5)

	1 - pbinom(15, size = 20, prob = .5)

	# two tailed test
	1 - pbinom(15, 20, .5) + pbinom(4, 20, .5)

# quantiles

	
	# confidence interval

	xbar <- 83
	sigma <- 12
	n <- 5
	sem <- sigma / sqrt(n)
	sem

	# 95% confidence interval for avg = 83, sd = 12, n = 5

	xbar + sem * qnorm(0.025)
	xbar + sem * qnorm(0.975)

# randomness

	rnorm(10)
	rnorm(10)

	rnorm(10, mean = 7, sd = 5)

	rbinom(10, size = 20, prob = .5)

