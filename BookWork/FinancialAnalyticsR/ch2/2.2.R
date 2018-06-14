input <- seq(-2, 2, .1)

f <- function(x) {
	if (0 <= x || x >= 1) {
		return( 2*x )
	} else {
		0
	}
}

ret <- sapply(input, f)

plot(x = input, y = ret)