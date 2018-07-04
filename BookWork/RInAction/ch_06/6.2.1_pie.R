# 6.2 Pie Charts

# Base R

par(mfrow = c(2, 2))
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls,
    main = "Simple Pie Chart")

pct <- round(slices / sum(slices) * 100)
lbls2 <- paste(lbls, " ", pct, "%", sep = "")
pie(slices, labels = lbls2, col = rainbow(length(lbls2)),
    main = "Pie Chart with Percentages")

library(plotrix)

pie3D(slices, labels = lbls, explode = 0.1,
      main = "3D Pie Chart ")
mytable <- table(state.region)
lbls3 <- paste(names(mytable), "\n", mytable, sep = "")
pie(mytable, labels = lbls3,
    main = "Pie Chart from a Table\n (with sample sizes)")

# ggplot
library(data.table)
library(ggplot2)
library(data.table)
library(ggthemes)
library(scales)

theme_set(theme_fivethirtyeight())

# Theme Overrides
theme_update(plot.title = element_text(hjust = 0.5),
             axis.text.x = element_text(face = "bold", size = 12),
             axis.text.y = element_text(face = "bold", size = 12),
			 legend.position = "top", legend.title = element_blank())

sample.data <- data.table(Value <- c(10, 12, 4, 16, 8),
	Label <- c("US", "UK", "Australia", "Germany", "France"))

ggplot(sample.data, aes(x = "", y = Value, fill = Label)) +
	geom_bar(width = 1, stat = "identity") +
	coord_polar("y", start = 0) +
	scale_fill_manual(values = c("#999999", "#E69F00", "#56B4E9", "#56D4C9", "#112CA9"))

ggplot(sample.data, aes(x = "", y = Value, fill = Label)) +
	geom_bar(width = 1, stat = "identity") +
	coord_polar("y", start = 0) +
	scale_fill_brewer(palette = "Dark2")

ggplot(sample.data, aes(x = "", y = Value, fill = Label)) +
	geom_bar(width = 1, stat = "identity") +
	coord_polar("y", start = 0) +
	scale_fill_brewer(palette = "Dark2") +
	theme(axis.text.x = element_blank()) +
	geom_text(aes(y = Value / 5 + c(0, cumsum(Value)[-length(Value)]),
			label = percent(Value / 100)), size = 5)

# Fan Plot
library(plotrix)
slices <- c(10, 12, 4, 16, 18)
lbls <- c("US", "UK", "Australia", "Germany", "France")
fan.plot(slices, labels = lbls, main = "Fan Plot")

