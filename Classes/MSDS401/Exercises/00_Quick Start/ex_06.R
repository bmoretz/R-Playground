
# 1

x <- c(8.75, 9.45, 4.35, 6.85, 9.45, 10.55, 7.75, 8.25, 10.55, 2.45, 15.75, 7.45)

# Determine the following and check with R.

# (a) x[6] + x[7]

x[6] + x[7]

# (b) x[c(5, 6, 7, 8)]
x[ c( 5, 6, 7 ) ]

# (c) x[5:8]
x[ 5:8 ]

# (d) x[c(1:4, 9:12)]
x[c(1:4, 9:12)]

# (e) The combination of the results from(c) and(d).

x

# 2

x <- c(8.75, 9.45, 9.35, 9.85, 9.45, 10.55, 9.75, 8.25, 10.55, 9.45, 9.75, 8.45)

# The vector “x” contains birth weights in ounces of puppies from two different litters. 
# Each litter had six puppies. The first six values are fromthe first litter, and the last six fromthe second litter. 
# Produce a statistical summary of the birth weights for each litter.

summary(x[1:6])
summary(x[7:12])
