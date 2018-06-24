data(women)

str(women)

apply(women, 2, mean)

# 1. Repeat the analyses shown above with apply() using the height and age in the Loblolly dataset. 

data(Loblolly)

str(Loblolly)
head(Loblolly)

apply(Loblolly[c("height", "age")], 2, mean)

# Repeat using the speed and distance data in the cars dataset. 
# Compare your results to what is obtained using the summary() function.

summary(Loblolly)

data(cars)

head(cars)

apply(cars, 2, mean)

summary(cars)