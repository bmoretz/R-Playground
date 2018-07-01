library(vcd)
library(ggplot2)
library(data.table)
library(ggthemes)

theme_set(theme_fivethirtyeight())

# 6.1, Bar Blots 

counts <- table(Arthritis$Improved)
counts

# Base R 

barplot(counts,
  main = "Simple Bar Plot",
  xlab = "Improvement", ylab = "Frequency")

barplot(counts,
  main = "Horizontal Bar Plot",
  xlab = "Frequency", ylab = "Improvement",
  horiz = TRUE)

# ggplot2

results <- as.data.table(Arthritis$Improved)
colnames(results) <- c("Status")

ggplot(results, aes(x = Status)) +
	geom_bar() +
	labs(title = "Simple Bar Plot", x = "Improvement", y = "Frequency") +
	theme(plot.title = element_text(hjust = 0.5))

ggplot(results, aes(x = Status)) +
	geom_bar() +
	coord_flip() +
	labs(title = "Simple Bar Plot", x = "Improvement", y = "Frequency") +
	theme(plot.title = element_text(hjust = 0.5))
