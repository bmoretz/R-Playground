a <- 5
sqrt(a)

b <- c(1.243, 5.654, 2.99)
round(b)

c <- matrix(runif(12), nrow = 3)
c

log(c)

# Scalar for avg of all elements in c.
mean(c)

apply(c, 1, mean) # row means
apply(c, 2, mean) # column means

mydata <- matrix(rnorm(30), nrow = 6)
mydata

apply(mydata, 1, mean)

apply(mydata, 2, mean)

apply(mydata, 2, mean, trim = 0.2)