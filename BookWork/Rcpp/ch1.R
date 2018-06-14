# ex 1
xx <- faithful$eruptions
fit <- density(xx)
plot(fit)

# ex2

xx <- faithful$eruptions
fit1 <- density(xx)
fit2  <- replicate( 10000, {
	x <- sample( xx, replace = TRUE); 
	density( x, from = min( fit1 $ x),  to = max( fit1 $ x))$y 
}) 

fit3 <- apply( fit2, 1, quantile, c( 0.025,0.975)) 
plot( fit1, ylim = range( fit3)) 
polygon( c( fit1 $ x, rev( fit1 $ x)), c( fit3[ 1,], rev( fit3[ 2,])), col ='grey', border = F)
lines(fit1)

head(faithful)

# fibR

fibR <- function(n) {
	if (n == 0) return( 0 )
	if (n == 1) return( 1 )

	return( fibR(n - 1 ) + fibR(n - 2) )
}

for( seq in 1:10)
	print( fibR(seq) )


