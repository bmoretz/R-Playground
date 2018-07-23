# Utility Functions

library(data.table)

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
		Statistic = c("Mean",
					"Median",
					"Min",
					"Max",
					"Range",
					"Mode",
					"ModeFreq",
					"StdDev",
					"Variance",
					"Q1",
					"Q3",
					"P10"),

		Value = c(mean(values, na.rm = T),
			  median(values, na.rm = T),
			  min(values, na.rm = T),
			  max(values, na.rm = T),
			  max(values, na.rm = T) - min(values, na.rm = T),
			  ifelse(mode$Freq != 1, mode$Value, NA),
			  ifelse(mode$Freq != 1, mode$Freq, NA),
			  sd(values, na.rm = T),
			  var(values, na.rm = T),
			  quantile(values, probs = c(0.25), na.rm = T),
			  quantile(values, probs = c(0.75), na.rm = T),
			  quantile(values, probs = c(0.10), na.rm = T))
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

# Computational Formula
group_statistics <- function(data) {
	colnames(data) <- c("Low", "High", "F")

	data[, M := (Low + High) / 2][, FM := M * F]
	data[, FMS := F * M ** 2]

	n <- sum(data$F)
	sFMS <- sum(data$FMS)
	sFS <- sum(data$FM) ** 2 / n

	var <- (sFMS - sFS) / n
	sd <- sqrt(var)

	data.table(Variance = round(var, 2), StdDev = round(sd, 2))
}

# Question 1
# Consider the values below. Using the boxplot rule, is the value 200 an extreme outlier ?

values <- c(80, 121, 132, 145, 151, 119, 133, 134, 200, 195, 90, 121, 132, 123, 145, 151, 119, 133, 134, 151, 168)

boxplot(values)

# boxplot rule
q1 <- quantile(values, .25)
q2 <- quantile(values, .75)

outlier_range <- q2 + 3 * (q2 - q1)

200 > outlier_range

# Question 2
# Determine which of the four levels of measurement (nominal, ordinal, interval, ratio) is most appropriate for calendar years.

# Years <- Interval

# Question 3
# Here are some scores from a quiz.  Find the range for the given data.

scores <- c(31, 47, 29, 31, 16, 48, 41, 50, 54, 37, 22)

getSummary(scores)[c(5,6),]
summary(scores)

# Question 4
# Find the sample standard deviation for the given sample data.  
# Round your answer to one more decimal place than is present in the original data.

sample <- c(18, 18, 17, 9, 15, 5, 10, 5, 15, 17, 7, 12, 12)

getSummary(sample)[8]
round(sd(sample),1)


# Question 5
# Find the median for the given sample data.
# The normal monthly precipitation(in inches) for August is listed for
# 20 different U.S. cities. Find the median of the data.

monthly_precipitation <- c(3.6, 1.6, 2.4, 3.7, 4.1, 3.9, 1.0, 3.6, 4.2, 3.4, 3.7, 2.2, 1.5, 4.2, 3.5, 2.7, 0.4, 3.7, 2.0, 3.6)
getSummary(monthly_precipitation)[2]

# Question 6
# Multiple Choice 
# Which of the following is not a reason for
# eliminating an identified outlier from a data set prior to further statistical analysis ?

print('')

# Question 7
# The heights of the adults in one town have a mean of 67.1 inches and a standard deviation of 3.5 inches.
# What can you conclude from Chebyshev's theorem about the percentage of adults in the town whose heights are 
# between 60.1 and 74.1 inches?  (Hint-study the section in Business Statistics that deals with this.)

mu <- 67.1
sd <- 3.5
mu + sd * 2
mu - sd * 2

# The percentage is at least 75%, 2 standard deviations of the mean.


# Question 8
# The data below consists of the heights (in inches) of 20 randomly selected women. 
# Find the 20% trimmed mean of the data set.  Round to two decimal places. 

values <- c(69, 68, 64, 61, 65, 64, 71, 67, 62, 63, 61, 64, 75, 67, 60, 59, 64, 69, 65, 72)

# Base R
round(mean(values, trim = .2), 2)

# Custom Fun
round( trimmed_mean(values, pct = .2), 2 )

# Question 9
# Find the standard deviation of the sample data summarized in the given frequency distribution.

student.data <- data.table(
	Low = c(50, 60, 70, 80, 90),
	High = c(59, 69, 79, 89, 99),
	Students = c(5, 7, 9, 10, 9))

student.data[, Mid := (Low + High) / 2][, Freq := Mid * Students]
student.data[, Mf := Mid * Students][, MsF := ( Mid ** 2 ) * Students]

mu <- sum(student.data$Mf) / sum(student.data$Students)

n <- sum(student.data$Students)
smsf <- sum(student.data$MsF)
smfs <- sum(student.data$Mf) ** 2 / n

var <- ( smsf - smfs ) / ( n - 1 )

round(sqrt(var), 1)

group_statistics(student.data)

# Question 10
# Find the range, variance, and standard deviation for each of the two samples, 
# then compare the two sets of results.

# When investigating times required for drive-through service, 
# the following results (in seconds) were obtained.

restaurantA <- c(120, 67, 89, 97, 124, 68, 72, 96)
restaurantB <- c(115, 126, 49, 56, 98, 76, 78, 95)

sum_cols <- c("Range", "Variance", "StdDev")

getSummary(restaurantA)[which(Statistic %in% sum_cols)]
getSummary(restaurantB)[which(Statistic %in% sum_cols)] 