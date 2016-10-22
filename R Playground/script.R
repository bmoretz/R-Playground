
# pick 5 random things from 40
sample(1:40, 5)

# flip a coin 10 times
sample(c("H", "T"), 10, replace = TRUE)

sample(c("succ", "fail"), 10, prob = c(.9, .1))

x <- seq(-4, 4, 0.1)

x <- list(1:3, "a", c(TRUE, FALSE, TRUE), c(2.3, 5.9))
str(x)

x <- list(list(list(list())))

str(x)

is.recursive(x)

x <- list(list(1, 2), c(3, 4))
str(x)

y <- c(list(1, 2), c(3, 4))
str(y)

is.list(mtcars)

mod <- lm(mpg ~ wt, data = mtcars)

mod
plot(mod)


y <- 1:10

attr(y, "my_attribute") <- "This is a vector"
str(attributes(y))

structure(1:10, my_attribute = "This is a vector")

attributes(y[1])
attributes(sum(y))

names(x)

dim(x)
class(x)
attr(x, "dim")
attr(x, "class")

# name a vector

x <- c(a = 1, b = 2, c = 3) # in place modification
names(x)

x <- 1:3; names(x) <- c("a", "b", "c") # modify an existing vector in place
names(x)

x <- setNames(1:5, c("a", "b", "c")) # modify a copy
names(x)

y <- c(a = 1, 2, 3)
names(y)

z <- c(1, 2, 3)
names(z)

x <- c(a = 1, b = 2, c = 3)
names(x)
names(x) <- NULL
names(x)
x <- c(a = 1, b = 2, c = 3)
u <- unname(x, force = TRUE)
names(x)


help(unname)

#factors

x <- factor(c("a", "b", "b", "a"))
x
class(x)
levels(x)

x[2] = "c'"

x

c(factor("a"), factor("b"))

sex_char <- c("m", "m", "m")
sex_factor <- factor(sex_char, levels = c("m", "f"))

table(sex_char)
table(sex_factor)

z <- read.csv(text = "value\n12\n1\n.\n9")
typeof(z$value)
as.double(z$v)

# data frames

df <- data.frame(x = 1:3, y = c("a", "b", "c"), stringsAsFactors=FALSE)
str(df)
df

typeof(df)
class(df)

is.data.frame(df)

as.data.frame(x)

as.data.frame(z)

cbind(df, data.frame(z = 3:1))

rbind(df, data.frame(x = 10, y = "z"))

bad <- data.frame(cbind(a = 1:2, b = c("a", "b")))

str(bad)

good <- data.frame(a = 1:2, b = c("a", "b"), stringsAsFactors = FALSE)

summary(good)

dfl <- data.frame(x = 1:3, y = I(list(1:2, 1:3, 1:4)))
str(dfl)

dfl[2, "y"]

dfm <- data.frame(x = 1:3, y = I(matrix(1:9, nrow = 3)))

str(dfm)

dfm[2, "y"]

dfm <- data.frame()
dfm
 x <- c( 2.1, 4.2, 3.3, 5.4 )
(y <- setNames(x, letters[1:4]))

y[c("d", "c", "a")]

y[c("a", "a", "a")]

z <- c(abc = 1, def = 2)
z[c("a", "d")]

a <- matrix(1:9, nrow = 3)
a
colnames(a) <- c("A", "B", "C")

a[1:2, ]

a[c(T, F, T), c("B", "A")]
a[0, -2]

(vals <- outer(1:5, 1:5, FUN = "paste", sep = ","))
vals[c(4, 15)]

vals <- outer(1:5, 1:5, FUN = "paste", sep = ",")
select <- matrix(ncol = 2, byrow = TRUE, c(
    1, 1,
    3, 1,
    2, 4
))
vals[select]

df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df
df[df$x == 2,]

df[c(1, 3),]

df[ c("x", "z")]

df[, c("x", "z")]

str(df["x"])
str(df[, "x"])
