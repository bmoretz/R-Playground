data(ToothGrowth)

ToothGrowth$dose <- factor(ToothGrowth$dose)

str(ToothGrowth)

aggregate(ToothGrowth$len, by = list(ToothGrowth$supp, ToothGrowth$dose), mean)

result <- with(ToothGrowth, aggregate(len, by = list(supp, dose), mean))
colnames(result) <- c("supp", "dose", "mean")

result

addmargins(table(ToothGrowth$supp, ToothGrowth$dose))

