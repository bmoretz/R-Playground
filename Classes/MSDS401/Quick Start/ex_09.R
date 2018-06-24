data()

# 1. Use the dataset women and find the mean height and mean weight for individuals in the dataset 
# (type help(women) for a description of the variables available).

help(women)

head(women)

mean(women$height)
mean(women$weight)

summary(women)
