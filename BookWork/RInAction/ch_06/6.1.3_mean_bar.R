library(data.table)
library(ggplot2)

# Base R
states <- data.frame(state.region, state.x77)
means1 <- aggregate(states$Illiteracy, by = list(state.region), FUN = mean)

# data.table
states <- as.data.table(states)
means2 <- states[, .(state.region, Mean = mean(Illiteracy)), by = list(state.region)]

means <- means2[order(means$Mean)]

# Base R
barplot(means$Mean, names.arg = means$state.region)
title("Mean Illiteracy Rate")

# ggplot
library(ggplot2)
library(data.table)
library(ggthemes)

theme_set(theme_fivethirtyeight())

# Left -> Right
ggplot(states, aes(x = reorder(state.region, Illiteracy, mean), y = Illiteracy)) +
	geom_bar(stat = "summary", fun.y = "mean", position = "dodge") +
	labs(title = "Mean Illiteracy Rate") +
	theme(plot.title = element_text(hjust = 0.5))

# Right -> Left
ggplot(states, aes(x = reorder(state.region, - Illiteracy, mean), y = Illiteracy)) +
  geom_bar(stat = "summary", fun.y = "mean", position = "dodge") +
  labs(title = "Mean Illiteracy Rate") +
  theme(plot.title = element_text(hjust = 0.5)

