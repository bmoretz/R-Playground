library(reshape2)

companyData <- data.frame(Factor = character(), Tickers = character, stringsAsFactors = FALSE)
#companyData <- data.frame(Factor = c("Growth"), Tickers = c("STR IN Equity", "ALPM IN Equity", "RJEX IN Equity", "SOTL IN Equity", "DBEL IN Equity", "PVRL IN Equity", "ADE IN Equity", "SCNL IN Equity", "TXMRE IN Equity", "SKSM IN Equity", "SUEL IN Equity", "TC IN Equity", "ESOIL IN Equity", "RSI IN Equity", "KMB IN Equity", "MOFS IN Equity", "RPGR IN Equity", "BAF IN Equity", "DITV IN Equity", "LPC IN Equity"), stringsAsFactors = FALSE )
#companyData <- rbind(companyData, data.frame(Factor = "Leverage", Tickers = c("PIPV IN Equity", "OPTC IN Equity", "DBRL IN Equity", "HCBA IN Equity", "SHRS IN Equity", "LANCI IN Equity", "MOIL IN Equity", "KSI IN Equity", "VCLF IN Equity", "MTNL IN Equity", "TTSP IN Equity", "BHUS IN Equity", "SWAN IN Equity", "MCX IN Equity", "GVKP IN Equity", "JSP IN Equity", "ENGR IN Equity", "JPIN IN Equity", "PMCF IN Equity", "KSK IN Equity"), stringsAsFactors = FALSE))

companyData <- data.frame(Factor = c("Growth"), Ticker = c("STR IN Equity", "ALPM IN Equity"), stringsAsFactors = FALSE)
companyData <- rbind(companyData, data.frame(Factor = "Leverage", Ticker = c("PIPV IN Equity", "OPTC IN Equity"), stringsAsFactors = FALSE))

startDates <- seq(as.Date(format(Sys.Date(), "%Y-%m-1")), length = 25, by = "-1 month")
endDates <- seq(as.Date(format(Sys.Date(), "%Y-%m-1")), length = 25, by = "-1 month") - 1

dates <- data.frame(StartDate = startDates[-1], EndDate = endDates[ - length(endDates)])

getCustomReturn <- function(tickers, startDate, endDate, label) {
	startDate <- as.Date(startDate)
	endDate <- as.Date(endDate)

	custom_ret <- data.frame(rnorm(1.0, 4, 1.5))

	colnames(custom_ret) <- c(label)

	return(custom_ret)
}

output <- data.frame(Factor = companyData$Factor, Ticker = companyData$Tickers, stringsAsFactors = FALSE)
output

for (i in 1:length(dates)) {
	output[, format(dates$StartDate, "%m-%y")] <- NA
}

output

getCustomReturn(output$Ticker, dates$StartDate, dates$EndDate, label = format(dates$EndDate, "%m-%y"))

by(companyData, 1:nrow(companyData),
	function(company) {
	by(dates, 1:nrow(dates), function(d) {
		ret <- getCustomReturn(company$Ticker, d[1], d[2], label = format(d[1], "%m-%y"))
		val <- data.frame(Ticker = company$Ticker, Factor = company$Factor, ret = ret[1,])
		values <- list(values, val)

		values

	})
})

getCustomReturn("test", dates$StartDate, dates$EndDate, label = format(dates$EndDate, "%m-%y"))

outer(companyData$Ticker, dates$StartDate, dates$EndDate)

returns <- data.frame( Ticker = companyData$Ticker, Factor = companyData$Factor, dates )

cbind(returns, f = mapply(function(factor, ticker, startDate, endDate) {
	return(a)
}))


returns
