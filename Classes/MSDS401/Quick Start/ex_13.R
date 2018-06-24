data(trees)

head(trees)

sv <- function(x) {
	mu <- mean(x)
	return( mean((x - mu) ^ 2) )
}

apply(trees, 2, sv)
