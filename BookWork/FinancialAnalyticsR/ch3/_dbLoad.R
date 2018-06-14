require(RevoScaleR)
require(data.table)
library(foreign)

homeuser = file.path("C:", "Projects", "Books")
chap <- "ChapIII"
setwd(paste(homeuser, "/FinAnalytics/", chap, sep = ""))

# SQL

sqlConnection <- "Driver=SQL Server; Server=DATACENTER; Database=Playground; Uid=bmoretz; Pwd=letmein;";

# Common

loadDtaFile <- function(sqlConnection, fileName, sqlTable) {
	data.file <- read.dta(fileName)

	data.table <- RxSqlServerData(
	  connectionString = sqlConnection,
	  table = sqlTable)

	rxDataStep(inData = data.file, outFile = data.table, overwrite = T)
}

loadDtaFile(sqlConnection, "funda.dta", "funda")
loadDtaFile(sqlConnection, "msf.dta", "msf")