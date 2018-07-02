
milage.raw <- as.data.table(fread(paste0(data.path, "mileage.csv"),
  header = TRUE, stringsAsFactors = FALSE, na.strings = c("NA", "")))

milage <- setNames(milage.raw, tools::toTitleCase(tolower(names(milage.raw))))

milage$Class <- factor(milage$Class, ordered = TRUE)


loadDataFile <- function(file_name) {
	data.raw <- as.data.table(fread(paste0(data.path, file_name),
		header = TRUE, stringsAsFactors = FALSE, na.strings = c("NA", "")))

	data <- setNames(data.raw, tools::toTitleCase(tolower(names(data.raw))))

	return(data)
}

getMode <- function(values) {
	tbl.vals <- data.frame(table(values))
	tbl.vals$values <- as.numeric(levels(tbl.vals$values))[tbl.vals$values]
	mode <- tbl.vals[which.max(tbl.vals$Freq),]

	names(mode)[1] <- "Value"

	mode
}

getSummary <- function(values) {
	mode <- getMode(values)

	data.table(
		Mean = mean(values),
		Median = median(values),
		Min = min(values),
		Max = max(values),
		Sum = sum(values),
		Mode = mode[1,],
		Count = length(values),
		StdDev = sd(values),
		Variance = var(values),
	)
}