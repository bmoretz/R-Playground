# 1. Use the dataset “faithful” and create a scatter plot of the variables.

data(faithful)

head(faithful)

with(faithful, {
  plot( eruptions, waiting )
})

# 2. Use x <- rnorm(250) to generate 250 standard normal random variables. 
# Produce the histogram and compare to a stem-and-leaf plot of the data. 
# The function stem() will produce the stem-and-leaf plot.

x <- rnorm(250)

hist(x)
stem(x)
