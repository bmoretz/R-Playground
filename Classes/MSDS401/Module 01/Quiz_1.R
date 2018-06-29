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

range(scores)

values <- table(scores)

n <- max( values )
lapply(values, function(x) x[which.max(values)])

values[which.max[max(values)]]

getmode( values )

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
