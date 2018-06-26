# Probability Distributions

x <- pretty(c(-3, 3), 30)
y <- dnorm(x)

plot(x, y,
  type = "l",
  xlab = "Normal Deviate",
  ylab = "Density",
  yaxs = "i"
)

# 5.2, Generating pseudo-random numbers

runif(5)
runif(5)

# Seed enabled reproduction of random numbers
set.seed(1234)
runif(5)

set.seed(1234)
runif(5)


