library(moments)

homeuser = file.path("C:", "Projects", "Books")
chap <- "ChapIII"
setwd(paste(homeuser, "/FinAnalytics/", chap, sep = ""))

deck.cards <- 52
deck.hand <- 5
deck.faces <- 13

options(digits = 13)

choose.long <- function(n, k) {
	as.integer( factorial( n )/ ( factorial( k ) * factorial( n - k ) ) )
}

short <- choose(deck.cards, deck.hand)
long <- choose.long(deck.cards, deck.hand)

stopifnot(short == long)

# 4 of same card (aces, for example) =
# 52 cards, take 4 we need (aces), + *any* 1 additional resulting card to fill the hand.
prob.card <- ( deck.cards - ( deck.hand - 1 ) ) / choose(deck.cards, deck.hand)
round(prob.card * 100, 4)

# 4 of a kind (same face)
# 13 faces, 1 way to get it to be all the same.
prob.kind <- ( deck.faces * deck.cards - ( deck.hand - 1 ) ) / choose(deck.cards, deck.hand)
round(prob.kind * 100, 4)


# single pair in a 5 card hand
# prob pair = 13, 4 choose 2 ways of picking the pair, 13 choose 2 for picking the non-pair, 4^3 ways of choosing from non-pair faces
prob.onepair <- deck.faces * choose(4, 2) * choose(12, 3) * 4 ^ 3 / choose(deck.cards, deck.hand)
round(prob.onepair * 100, 2)

# Annualized historic volatility from a time series (1 yr, monthly)

S = c(1.3, 1.2, 1.3, 1.4, 1.5, 1.4, 1.3, 1.4, 1.5)

volatility <- function( R ) {
	diffLogR <- diff( log( R ) ) 
	diffLogRmean <- mean(diffLogR)

	N = length(diffLogR)

	histVol = sqrt(1 / (N - 1) * sum((diffLogR - diffLogRmean) ^ 2))
	annHistVol = histVol * sqrt(length(R))
	annHistVol
}

volatility(S)

# moments
skewness(S)
kurtosis(S)

