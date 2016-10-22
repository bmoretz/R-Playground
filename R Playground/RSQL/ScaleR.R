sampleDataDir <- rxGetOption("sampleDataDir")

getwd()

inputFile <- file.path(sampleDataDir, "AirlineDemoSmall.csv")

colInfo <- list(DayOfWeek = list(type = "factor", levels = c("Monday", "Tuesday", "Wednesday", "Thursday","Friday", "Saturday", "Sunday")))

airDS <- rxImport(inData = inputFile, outFile = "ADS.xdf", missingValueString = "M", colInfo = colInfo, overwrite = TRUE)

nrow(airDS)
ncol(airDS)
head(airDS)

rxGetVarInfo(airDS)

myData <- rxReadXdf(airDS, numRows = 10, startRow = 100000)

myData

levels(myData$DayOfWeek)

adsSummary <- rxSummary( ~ ArrDelay + CRSDepTime + DayOfWeek, data = airDS)

adsSummary

rxSummary( ~ ArrDelay:DayOfWeek, data = airDS)

options("device.ask.default" = T)
rxHistogram( ~ ArrDelay, data = airDS)
rxHistogram( ~ CRSDepTime, data = airDS)
rxHistogram( ~ DayOfWeek, data = airDS)

myData <- rxDataStep(inData = airDS,
rowSelection = ArrDelay > 240 & ArrDelay <= 300,
	varsToKeep = c("ArrDelay", "DayOfWeek"))
	rxHistogram( ~ ArrDelay, data = myData)


arrDelayLm1 <- rxLinMod(ArrDelay ~ DayOfWeek, data = airDS)
summary(arrDelayLm1)

arrDelayLm2 <- rxLinMod(ArrDelay ~ DayOfWeek, data = airDS,cube = TRUE)
summary(arrDelayLm2)

countsDF <- rxResultsDF(arrDelayLm2, type = "counts")
countsDF

rxLinePlot(ArrDelay ~ DayOfWeek, data = countsDF, main = "Average Arrival Delay by Day of Week")

arrDelayLm3 <- rxLinMod(ArrDelay ~ DayOfWeek:F(CRSDepTime),data = airDS, cube = TRUE)
arrDelayDT <- rxResultsDF(arrDelayLm3, type = "counts")
head(arrDelayDT, 15)

rxLinePlot(ArrDelay ~ CRSDepTime | DayOfWeek, data = arrDelayDT, title = "Average Arrival Delay by Day of Week by Departure Hour")

bigDataDir <- "C:/Data/mortDefault"

getwd()

mortCsvDataName <- file.path(bigDataDir, "mortDefault")
mortXdfFileName <- file.path( bigDataDir, "mortDefault.xdf")

append <- "none"
for (i in 2000:2009) {
	fileName <- paste(mortCsvDataName, i, ".csv", sep = "")
	importFile <- fileName
	mortDS <- rxImport(importFile, mortXdfFileName,
		append = append)
	append <- "rows"
}

## Compute context
connection_string <- "Driver=SQL Server;Server=WORKSTATION;Database=Playground;Trusted_Connection=yes;"

sql_share_directory <- paste("c:\\AllShare\\", Sys.getenv("USERNAME"), sep = "")

dir.create(sql_share_directory, recursive = TRUE, showWarnings = FALSE)

sql <- RxInSqlServer(connectionString = connection_string, shareDir = sql_share_directory)

local <- RxLocalSeq()

mort_data_columns <- c(
  CreditScore = "numeric",
  HosueAge = "numeric",
  YearsEmploy = "numeric",
  CCDebt = "numeric",
  Year = "factor",
  default = "logical")

mortage_data_table <- RxSqlServerData(table = "mortage_data",
										  connectionString = connection_string,
										  colClasses = mort_data_columns)

rxSetComputeContext(local)

rxDataStep(inData = mortDS,
		   outFile = mortage_data_table,
		   overwrite = T)

head(mortDS)
colnames(mortDS)
