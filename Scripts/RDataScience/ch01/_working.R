library(tidyverse)

ggplot(data = mpg) +
	geom_point( mapping = aes(x = displ, y = hwy))

# Exercises 1.1

# 1.1.1
ggplot(data = mpg)

# 1.1.2
nrow(mpg)
ncol(mpg)

# 1.1.3
? mpg # drive train

# 1.1.4
ggplot(data = mpg) +
	geom_point(aes(x = cyl, y = hwy))

# 1.1.5
ggplot(data = mpg) +
	geom_point(aes(x = class, y = drv))

ggplot(data = mpg) +
	geom_point(mapping = aes(x = displ, y = hwy, color = class))

summary(mpg$displ)

# bubble plot of engine size vs mpg, bubble size = type factor
ggplot(data = mpg) +
	geom_point(mapping = aes(x = displ, y = hwy, size = class))

ggplot(data = mpg) +
	geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

ggplot(data = mpg) +
	geom_point(mapping = aes(x = displ, y = hwy, shape = class))

mpgplot <- function(mapping) {
	ggplot(data = mpg) +
		geom_point(mapping)
}

mpgplot(aes(x = displ, y = hwy, shape = class))


ggplot(data = mpg) +
	geom_point(mapping = aes(x = displ, y = hwy), color = "Blue")

# Exercises 1.2

# 1.2.1

ggplot(data = mpg) +
	geom_point( aes(x = displ, y = hwy), color = "blue" )

# 1.2.2
?mpg
# categorical = model, year, cyl, trans, 