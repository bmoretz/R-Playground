usedcars <- read.csv("usedcars.csv", stringsAsFactors = F)

str(usedcars)

summary(usedcars)

range(usedcars$price)

diff(range(usedcars$price))

quantile(usedcars$price)

quantile(usedcars$price, probs = c(0.01, .99))

quantile(usedcars$price, seq(from = 0, to = 1, by = .2))

