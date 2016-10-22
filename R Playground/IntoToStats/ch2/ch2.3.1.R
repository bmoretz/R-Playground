# Newton's method for calculating the square root of y

y <- 100

sqrt_while <- function(y) { 
	x <- y / 2

	while (abs(x * x - y) > 1e-10)
		x <- (x + y / x) / 2
	
	x
}

stopifnot(sqrt_while(y) == sqrt(y))

# alternative implementation

sqrt_repeat <- function(y) {

	x <- y / 2

	repeat {
		x <- (x + y / x) / 2
		if( abs(x*x-y) < 1e-10) break
	}

	x
}

stopifnot(sqrt_repeat(y) == sqrt(y))

# ploting power curves

x <- seq(0, 1, .05)
plot(x, x, ylab = "y", type = "l")
for (j in 2:8)
	lines(x, x ^ j)

