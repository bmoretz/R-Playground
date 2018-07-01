library(vcd)

# 6.2, stacked and grouped bar plots 

counts <- table(Arthritis$Improved, Arthritis$Treatment)
counts

# Stacked Bar 
barplot(counts,
  main = "Stacked Bar Plot",
  xlab = "Treatment", ylab = "Frequency",
  col = c("red", "yellow", "green"),
  legend = rownames(counts))

# Grouped Bar 
barplot(counts,
  main = "Grouped Bar Plot",
  xlab = "Treatment", ylab = "Frequency",
  col = c("red", "yellow", "green"),
  legend = rownames(counts), beside = TRUE)

# ggplot2

library(ggplot2)
library(data.table)
library(ggthemes)

theme_set(theme_fivethirtyeight())

data <- Arthritis

# Standard Stacked Bar

# Invert Sort the Factor levels for stacking FILO stacking.
data$Improved <- factor(data$Improved, levels = rev(levels(data$Improved)))

ggplot(data, aes(Treatment, fill = Improved)) +
	geom_bar() +
	labs(title = "Stacked Bar Plot", x = "Improvement", y = "Frequency") +
	theme(plot.title = element_text(hjust = 0.5))

# Grouped Bar Plot

# Standard Factor Ordering for side-by-side
data <- Arthritis
# Side-by-side Stacked
ggplot(data, aes(Improved, fill = Improved)) +
	geom_bar() +
	facet_grid(~Treatment) +
	labs(title = "Grouped Bar Plot", x = "Improvement", y = "Frequency") +
	theme(plot.title = element_text(hjust = 0.5))