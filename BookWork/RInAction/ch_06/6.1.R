library(vcd)
library(ggplot2)

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