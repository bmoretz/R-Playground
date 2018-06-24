# 1. Suppose X has a normal distribution with mean 2 and variance 0.25. 
# Denote by f and F the density and distribution functions.

var = .25
sd = sqrt( var )
mu = 2
X <- 0.5

# (a) Calculate the density function value at 0.5, f(0.5)(use dnorm())

dnorm(X, mu, sd)

# (b) Calculate the distribution function value at 2.0, F(2.0)(use pnorm())

pnorm(X, mu, sd)

# (c) Calculate the 95 th percentile(use qnorm())
qnorm(X, mu, sd)

# (d) Calculate the probability that X is between - 1 and, Pr(1 <= X <= 3)

# 2. Repeat question 1 in the case that X has a t - distribution with 5 degrees of freedom.

DF <- 5

# (a) Calculate the density function value at 0.5, f(0.5)(use dnorm())

rt(X, DF)

# (b) Calculate the distribution function value at 2.0, F(2.0)(use pnorm())

pnorm(X, mu, sd)

# (c) Calculate the 95 th percentile(use qnorm())
qnorm(X, mu, sd)

# (d) Calculate the probability that X is between - 1 and, Pr(1 <= X <= 3)