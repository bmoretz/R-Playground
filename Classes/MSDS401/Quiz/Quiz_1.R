# Utility Functions

getMode <- function(values) {
	tbl.vals <- data.frame(table(values))
	tbl.vals$values <- as.numeric(levels(tbl.vals$values))[tbl.vals$values]
	mode <- tbl.vals[which.max(tbl.vals$Freq),]

	names(mode)[1] <- "Value"

	mode
}

getSummary <- function(values) {
	mode <- getMode(values)

	data.frame(
		Mean = mean(values),
		Median = median(values),
		Min = min(values),
		Max = max(values),
		Sum = sum(values),
		Mode = mode[1,],
		Count = length(values),
		StdDev = sd( values )
	)
}

# Question 1
# Consider the values below. Using the boxplot rule, is the value 200 an extreme outlier ?

values <- c(80, 121, 132, 145, 151, 119, 133, 134, 200, 195, 90, 121, 132, 123, 145, 151, 119, 133, 134, 151, 168)

boxplot(values)

# Question 2
# Determine which of the four levels of measurement (nominal, ordinal, interval, ratio) is most appropriate for calendar years.

# Years <- Ordinal

# Question 3
# Here are some scores from a quiz.  Find the range for the given data.

scores <- c(31, 47, 29, 31, 16, 48, 41, 50, 54, 37, 22)

getSummary(scores)

# Question 4
# Find the sample standard deviation for the given sample data.  
# Round your answer to one more decimal place than is present in the original data.

sample <- c(18, 18, 17, 9, 15, 5, 10, 5, 15, 17, 7, 12, 12)
sd(sample)


# Question 5
# Find the median for the given sample data.
# The normal monthly precipitation(in inches) for August is listed for
# 20 different U.S. cities. Find the median of the data.

monthly_precipitation <- c(3.6, 1.6, 2.4, 3.7, 4.1, 3.9, 1.0, 3.6, 4.2, 3.4, 3.7, 2.2, 1.5, 4.2, 3.5, 2.7, 0.4, 3.7, 2.0, 3.6)
getSummary(monthly_precipitation)

# Question 6
# Multiple Choice 
# Which of the following is not a reason for
# eliminating an identified outlier from a data set prior to further statistical analysis ?

