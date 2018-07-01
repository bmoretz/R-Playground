library(vcd)

attach(Arthritis)
counts <- table(Treatment, Improved)
spine(counts, main = "Spinogram Example")
detach(Arthritis)

# ggplot
library(ggplot2)
library(data.table)
library(ggthemes)

theme_set(theme_fivethirtyeight())

# Spinogram needs 
data <- as.data.table(Arthritis)

# summarize the data pre-plot
data.summary <- data[, .(Count = .N), by = list(Treatment, Improved)][,
	Pct := Count / sum(Count), by = list(Treatment)]

# re-order the factors for stacking display
data.summary$Improved <- factor(data.summary$Improved, levels = rev(levels(data.summary$Improved)))

# final result
ggplot(data.summary, aes(x = Treatment, y = Pct, fill = Improved)) +
	geom_bar(stat = "identity") +
	scale_y_continuous(labels = scales::percent) +
	labs(title = "Spinogram Example") +
	theme(plot.title = element_text(hjust = 0.5))
