# Exercises

# calculate the probablity of the following events

# a standard normally distributed variable is larget than 3
pnorm(3,lower.tail=FALSE)

# a normally distribtued variable with mean 35 and standard deviation 6 is larger than 42?
pnorm(42,mean=35,sd=6,lower.tail=FALSE)

# getting 10 out of 10 successes in a binamial distribution with probability 0.8
dbinom(10,size=10,prob=.8,log=FALSE)

# X > 0.9 when X has the standard uniform distrubtuion
punif(.09)

# X > 6.5 in a X^2 distrubtion with 2 degreese of freedom
pchisq(6.5,df=2,lower.tail=FALSE)

# execute a coin toss using rbinom
ifelse(rbinom(10,1,.5),"head","tail") 