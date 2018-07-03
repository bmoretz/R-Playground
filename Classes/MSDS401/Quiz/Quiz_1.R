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

	data.table(
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

trimmed_mean <- function(vals, pct) {
	vals <- sort(vals)
	n <- length(vals)

	trim_vals <- floor(n * pct)

	trimmed <- head(vals, length(vals) - trim_vals)
	trimmed <- tail(trimmed, length(trimmed) - trim_vals)

	mean(trimmed)
}

winsorize <- function(vals, pct) {
	vals <- sort(vals)
	g <- floor(length(vals) * pct)

	bottom <- vals[g + 1]
	top <- vals[length(vals) - g]

	trimmed <- head(vals, length(vals) - g)
	trimmed <- tail(trimmed, length(trimmed) - g)

	c(rep(bottom, g), trimmed, rep(top, g))
}

# Question 1
# Consider the values below. Using the boxplot rule, is the value 200 an extreme outlier ?

values <- c(80, 121, 132, 145, 151, 119, 133, 134, 200, 195, 90, 121, 132, 123, 145, 151, 119, 133, 134, 151, 168)

boxplot(values)

# boxplot rule
q1 <- quantile(values, .25)
q2 <- quantile(values, .75)

summary(values)

outlier_range <- q2 + 1.5 * (q2 - q1)

200 > outlier_range

# Question 2
# Determine which of the four levels of measurement (nominal, ordinal, interval, ratio) is most appropriate for calendar years.

# Years <- Interval

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

print('Intentional falsification')

# Question 7
# The heights of the adults in one town have a mean of 67.1 inches and a standard deviation of 3.5 inches.
# What can you conclude from Chebyshev's theorem about the percentage of adults in the town whose heights are 
# between 60.1 and 74.1 inches?  (Hint-study the section in Business Statistics that deals with this.)


# Question 8
# The data below consists of the heights (in inches) of 20 randomly selected women. 
# Find the 20% trimmed mean of the data set.  Round to two decimal places. 

values <- c(69, 68, 64, 61, 65, 64, 71, 67, 62, 63, 61, 64, 75, 67, 60, 59, 64, 69, 65, 72)

# Base R
round(mean(values, trim = .2), 2)

# Custom Fun
round( trimmed_mean(values, pct = .2), 2 )
