require(RevoScaleR)
require(data.table)

homeuser = file.path("C:", "Projects", "Books")
chap <- "ChapIII"
setwd(paste(homeuser, "/FinAnalytics/", chap, sep = ""))

# SQL

sqlConnection <- "Driver=SQL Server; Server=DATACENTER; Database=Playground; Uid=bmoretz; Pwd=letmein;";

sqlReturnData <- RxSqlServerData(
	connectionString = sqlConnection,
	sqlQuery = sprintf('
		SELECT
			[tsymbol],
			[ret]
		FROM
			dbo.[msf]
		WHERE\
			[date] BETWEEN \'%s\' AND \'%s\' 
			AND
			[tsymbol] in (\'%s\', \'%s\' )
	;', '2005-01-01', '2013-12-31', 'AAPL', 'SPY'),
	stringsAsFactors = FALSE,
	useFastRead = TRUE
)

raw.data <- as.data.table(rxImport(sqlReturnData, overwrite = TRUE, stringsAsFactors = FALSE))

y <- raw.data[raw.data$tsymbol == 'AAPL',]$ret
x <- raw.data[raw.data$tsymbol == 'SPY',]$ret

beta_ratio <- cov(x, y) / var(x)

beta_lm <- summary(lm(y ~ x + 1))

shapiro.test(x)

shapiro.test(y)

plot(x,y)