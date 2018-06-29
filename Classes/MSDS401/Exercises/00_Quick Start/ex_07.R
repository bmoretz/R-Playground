
# 1
# find the minimum and maximum of y and their location in the vector.

y <- c(33, 44, 29, 16, 25, 45, 33, 19, 54, 22, 21, 49, 11, 24, 56)

min(y)
which(y == min(y))

max(y)
which(y == max(y))

# 2. 
# Find the median of y and use logicals to split y into two subsets. 
# One subset will have all values in y strictly less than the median, and the other subset all values strictly greater than the median. 
# Print the resulting subsets.

median(y)

y[which(y < median(y))]
y[which(y > median(y))]
