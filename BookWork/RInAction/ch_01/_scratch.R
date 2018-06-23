# Listing 1.1, a sample R session.

age <- c(1, 3, 5, 2, 11, 9, 3, 9, 12, 3)
weight <- c(4.4, 5.3, 7.2, 5.2, 8.5, 7.3, 6.0, 10.4, 10.2, 6.1)

mean(weight)
sd(weight)
cor(age, weight)

plot(age, weight)

demo()

demo(Hershey)
demo(persp)
demo(plotmath)
demo(graphics)

# 1.6 Reusing output as input
lmfit <- lm(mpg ~ wt, data = mtcars)

summary(lmfit)

plot(lmfit)

cook <- cooks.distance(lmfit)

plot(cook)

help()

help.start()

install.packages("vcd")

help(package = "vcd")

library(vcd)

help(Arthritis)

data("Arthritis")
art <- xtabs(~Treatment + Improved, data = Arthritis, subset = Sex == "Female")
art

mosaic(art, gp = shading_Friendly)
mosaic(art, gp = shading_max)

Arthritis

example(Arthritis)