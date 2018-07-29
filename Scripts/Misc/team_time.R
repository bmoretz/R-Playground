current_data <- data.frame(X = runif(100, 0, 1))

p1 <- ggplot(current_data, aes(X, fill = ..count..)) +
  geom_histogram(breaks = pretty(current_data$X)) +
  scale_y_continuous(limits = c(0, 28)) +
  labs(title = "Current State",
       y = "Hours Worked",
       x = "Area Worked") +
       annotate("text", x = 0.2, y = 26, label = "Front", color = "firebrick4", size = 6) +
       annotate("text", x = 0.5, y = 26, label = "Floating", color = "firebrick4", size = 6) +
       annotate("text", x = 0.9, y = 26, label = "Back", color = "firebrick4", size = 6) +
       theme(plot.title = element_text(face = "bold", size = 20, colour = "steelblue4", hjust = 0.5),
             axis.text.x = element_blank(),
             axis.text.y = element_blank())

future_data <- data.frame(X = runif(100, 0, 1))

p2 <- ggplot(future_data, aes(X, fill = ..count..)) +
  geom_histogram(breaks = pretty(future_data$X)) +
  scale_y_continuous(limits = c(0, 28)) +
  labs(title = "Future State",
       y = "Hours Worked",
       x = "Area Worked") +
       annotate("text", x = 0.2, y = 20, label = "Front", color = "firebrick4", size = 6) +
       annotate("text", x = 0.7, y = 26, label = "Automation & Data Modeling", color = "firebrick4", size = 6) +
       theme(plot.title = element_text(face = "bold", size = 20, colour = "steelblue4", hjust = 0.5),
             axis.text.x = element_blank(),
             axis.text.y = element_blank())

grid.arrange(p1, p2, ncol = 1 )