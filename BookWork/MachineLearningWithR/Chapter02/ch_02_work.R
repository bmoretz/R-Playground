usedcars <- read.csv("usedcars.csv", stringsAsFactors = F)

str(usedcars)

summary(usedcars)

range(usedcars$price)

diff(range(usedcars$price))

quantile(usedcars$price)

quantile(usedcars$price, probs = c(0.01, .99))

quantile(usedcars$price, seq(from = 0, to = 1, by = .2))

qqnorm(usedcars$price)

boxplot(usedcars$price, main = "Boxplot of Used Car Prices",
        ylab = "Price ($)")

boxplot(usedcars$mileage, main = "Boxplot of Used Car Milage",
        ylab = "Odometer (mi.)")

hist(usedcars$price, main = "Histogram of Used Car Prices",
     xlab = "Price ($)")

hist(usedcars$mileage, main = "Boxplot of Used Car Milage",
        xlab = "Odometer (mi.)")

var(usedcars$price)
sd(usedcars$price)

var(usedcars$mileage)
sd(usedcars$mileage)

table(usedcars$year)

table(usedcars$model)

table(usedcars$color)

model_table <- table(usedcars$model)
prop.table(model_table)

color_table <- table(usedcars$color)
color_pct <- prop.table(color_table) * 100
round(color_pct, digits = 1)

plot(x = usedcars$mileage, y = usedcars$price,
     main = "Scatterplot of Price vs. Milage",
     xlab = "Used Car Odometer (mi.)",
     ylab = "Used Car Price ($)") +
     abline(lm(price ~ mileage, usedcars))

