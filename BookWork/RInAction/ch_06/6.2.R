library(vcd)
library(ggplot2)

# 6.2, stacked and grouped bar plots 

counts <- table(Arthritis$Improved, Arthritis$Treatment)
counts

# Stacked Bar 
barplot(counts,
  main = "Stacked Bar Plot",
  xlab = "Treatment", ylab = "Frequency",
  col = c("red", "yellow", "green"),
  legend = rownames(count))

# Grouped Bar 
barplot(counts,
  main = "Grouped Bar Plot",
  xlab = "Treatment", ylab = "Frequency",
  col = c("red", "yellow", "green"),
  legend = rownames(count), beside = TRUE)