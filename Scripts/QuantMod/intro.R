library(quantmod)

getSymbols("YHOO", src = "google")

getSymbols("AAPL", src = "yahoo")
barChart(AAPL)

getSymbols("YESBANK.NS", src = "yahoo")
barChart(YESBANK.NS)
candleChart(YESBANK.NS, multi.col = TRUE, theme = "white")

getSymbols("XPT/USD", src = "Oanda") # Platinum from Oanda 
setSymbolLookup(XPTUSD = list(name = "XPT/USD", src = "oanda"))
chartSeries(XPTUSD, name = "Platinum (.oz) in $USD")

getSymbols("XPT/USD", src = "oanda")
chartSeries(XPTUSD, name = "Platinum (.oz) in $USD")

`chart.ex` <-
function() {
	par(ask = TRUE)
	require(quantmod)
	getSymbols("AAPL", src = "yahoo")
	barChart(AAPL)
	candleChart(AAPL, multi.col = TRUE, theme = "white")
	getSymbols("XPT/USD", src = "oanda")
	chartSeries(XPTUSD, name = "Platinum (.oz) in $USD")
	chartSeries(to.weekly(XPTUSD), name = "Platinum (.oz) in $USD", up.col = "white", dn.col = "blue")
	par(ask = FALSE)
}

chart.ex()


require(TTR)
getSymbols("AAPL")
chartSeries(AAPL)
addMACD()
addBBands()

setSymbolLookup(SPY = 'yahoo', VXN = list(name = '^VIX', src = 'yahoo'))
mm <- specifyModel(Next(OpCl(SPY)) ~ OpCl(SPY) + Cl(VIX))
modelData(mm)

# Quick returns - quantmod style 
getSymbols("SBUX")
dailyReturn(SBUX) # returns by day 
weeklyReturn(SBUX) # returns by week 
monthlyReturn(SBUX) # returns by month, indexed by yearmon 

# daily,weekly,monthly,quarterly, and yearly 
sbux <- allReturns(SBUX) # note the plural

str( sbux )