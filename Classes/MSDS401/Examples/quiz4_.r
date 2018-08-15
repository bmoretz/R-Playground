#############################
#
#
#############################

library(ggplot2)
library(data.table)

#1 - True

#2 
n1 <- 100
x1 <- 39

n2 <- 100
x2 <- 49

p1hat <- x1 / n1
p2hat <- x2 / n2

phat <- (x1 + x2) / (n1 + n2)

z <- (p1hat - p2hat) / sqrt(phat * (1 - phat) * ((1 / n1) + (1 / n2))) 

#3
n1 <- 35
mu1 <- 19.4
sd1 <- 1.4

n2 <- 40
mu2 <- 15.1
sd2 <- 1.3

# Point estimate 
diff <- mu1 - mu2

std.error <- sqrt(((sd1 ^ 2) / n1) + ((sd2 ^ 2) / n2))

# z score for 95% is 1.96
# Thus the confidence interval becomes
lower <- diff - (1.96 * std.error)
upper <- diff + (1.96 * std.error)

#4 is correct, I have done similar calculations and have verified

#5 - False

#6
qf(0.95, 3, 16, lower.tail = T)

#7
#The statistic F=s1^2/s2^2 has an F distribution with (n1-1) and (n2-1) deg. freedom. 
s1 <- 2.1
s2 <- 1.1
f <- (2.1 ^ 2) /  (1.1 ^ 2)

qf((1 - 0.01), 12, 15)

#From an F table (.01) with 12 and 15 deg. freedom, the critical value is 3.67. 
#So our computed value of 3.64 is close, 
#but a little less than the .01 critical value of 3.64. 
#So our p-value must be a  larger than .01 


#8 - skipping this as you said

#9

x <- c(2, 4, 5, 6, 8)
y <- c(7, 11, 13, 20, 24)

linear.model <- lm(x ~ y)

intercept = coef(linear.model)[[ 1 ]]
slope <- coef(linear.model)[[ 2 ]]

data1 <- data.table(x = c(2, 4, 5, 6, 8), y = c(7, 11, 13, 20, 24))

predict(linear.model)

ggplot(data = data1, aes(x, y)) +
  geom_point() +
  geom_smooth(method='lm')

#10 - True