# 5.6, Aggregation and reshaping

# 5.6.1, Transpose

cars <- mtcars[1:5, 1:4]

t(cars)

# 5.6.2, Aggregating data

options(digits = 2)
with(mtcars, {
	aggdata <- aggregate(mtcars, by = list(cyl, gear), FUN = mean, na.rm = TRUE)
	aggdata
})

# 5.6.3, reshape2

mydata <- data.frame(ID = rep(c(1, 2), c(2, 2)),
					Time = rep(c(1, 2), c(2, 2)),
					X1 = c(5, 3, 6, 2),
					X2 = c(6, 5, 1, 4))

library(reshape2)

md <- melt(mydata, id = c("ID", "Time"))


newdata <- 