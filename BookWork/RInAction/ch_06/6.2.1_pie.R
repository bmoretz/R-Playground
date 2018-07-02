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

library(ggplot2)
library(data.table)
library(ggthemes)

theme_set(theme_fivethirtyeight())

# Theme Overrides
theme_update(plot.title = element_text(hjust = 0.5),
             axis.text.x = element_text(face = "bold", size = 12),
             axis.text.y = element_text(face = "bold", size = 12),
             legend.position = "top", legend.title = element_blank())