hist.with.normal <- function(x, xlab = deparse(substitute(x)), ...) { 
	h <- hist(x, plot = F, ...)
	s <- sd(x)
	m <- mean(x)

	ylim <- range(0, h$density, dnorm(0, sd = s))

	hist(x, freq = F, ylim = ylim, xlab = xlab, ...)
	curve( dnorm( x, m, s), add = T)
}

hist.with.normal(rnorm(200))

