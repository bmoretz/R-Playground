# 3.1

# a
pnorm(3, lower.tail = FALSE)

#b
pnorm(42, mean = 35, sd = 6, lower.tail = FALSE)

#c
dbinom(10, size = 10, prob = .8)

#d
punif(.9)

#e
pchisq(6.5, df = 2, lower.tail = FALSE)

# 3.2

pnorm(2) * 2

qnorm(1 - .01 / 2)
qnorm(1 - .005 / 2)
qnorm(1 - .001 / 2)

qnorm(.25)
qnorm(.75)

# 3.3

dbinom(0, 10, .2)

# 3.4

sapply(rbinom(10, size = 1, prob = .5), function(c) {
	ifelse(c, "Heads", "Tails")
})
