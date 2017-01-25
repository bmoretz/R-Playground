x <- 1:25
y <- sapply(x, FUN = function(x) { x * x} )

sqrt(y[25]) == x[25] # test

plot(x, y)


