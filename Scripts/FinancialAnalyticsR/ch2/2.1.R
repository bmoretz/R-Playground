homeuser = file.path("C:", "Projects", "Books")
chap <- "ChapII"
setwd(paste(homeuser, "/FinAnalytics/", chap, sep = ""))

getwd()

x = c(1.3, 1.2, 1.3, NA, 1.4, 1.5)
plot(x, ylab = "EUR prices")
is.na(x)

x[x > 1.3]

y <- diff(log(x))

round(y, 3)

g <- function(x, y = 5) { return(x ^ y) }

g(4)

g(4, 6)

g(4, 7)

g(y = 8, x = 4)

g

x <- 1

assign("x", 2)

x <- 3

f <- function(x) {
	x = 4
	x
}

f(x)

x

# side effects

x <- 3

f <- function(x) {
	x <<- 4
	x
}

f(x)

# eval

call_type = 2

if (call_type == 1) {
	str = "f(2)"
} else {
	str = "g(2)"
}

eval(parse(text = str))

call_type <- 1

ifelse(call_type == 1, eval(parse(text = "f(2)")), eval(parse(text = "g(2)")))

vec <- c(1:3)
sqrt(vec)

set.seed(1)
vec <- c(1:3)
sapply(vec, rnorm)

# binding & arrays

A = cbind(rep(x, length(y)), y)
A

B = rbind(rep(x, length(y)), y)
B

t(A) == B

sum(t(A) == B)

B[, 4]
B[, -4]

t(A)[, -4] == B[, -4]

sum(t(A)[-2, -4] == B[-2, -4])

# Ranges and Loops

n <- 12
z <- 1:n
z

z <- c(1:n)

z

z <- vector(length = n)

for (i in 1:n)
	z[i] <- i

z

# Matrices and arrays:

mat2by4 <- matrix(1:8, nrow = 2, ncol = 4)
mat2by4

arr3by4by2 <- array(1:24, dim = c(2, 4, 3))
arr3by4by2

arr3by4by2[1,,]

arr3by4by2[1, c(-3, -4),]

length(c(-3, -4))

dim(arr3by4by2[1, c(-3, -4),])

A <- arr3by4by2[1, c(-3, -4),]
A
t(A)

A <- arr3by4by2[1, c(-3, -4),]
A
t(A)

A %*% t(A)

A
t(A)

# Exception Handling

fh <- 0

tryCatch({
	#block 
	
	fh <<- file("FinancialAnalyticsR/ch2/file1.txt", open = "r")
},
warning = function(w) { print(w) },
error = function(e) { print(e) },
finally = { print("clean-up")})

if (!is.na(fh)) readLines(fh)

# Numeric, Stats and Char

options(digits = 10)

pi <- 3.14159265358973284626
pi

plot(density(rbinom(50, 50, 1 / 2)))

options(digits = 6)
set.seed(99)
sample(10, replace = TRUE)

print(paste("PCLN", "UNP", "IBM", "MCD", "PFE", sep = ","))

date <- as.Date("2014-02-01")
substr(date, 9, 11)

tickers <- c("PCLN", "UNP", "IBM", "MCD", "PFE")
match('MCD', tickers) # 4

# Data Frames

L3 <- LETTERS[1:3]
L3

fac <- sample(L3, 10, replace = TRUE)

d <- data.frame(x = 1, y = 1:10, fac = fac)

d

d$fac

file.d <- file("FinancialAnalyticsR/ch2/d.txt")

write.csv(d, file = file.d, row.names = FALSE)

e <- read.csv(file = file.d, header = TRUE)

e[1:4,]

names(e)

names(e) <- c(names(e)[1:2], "factor")

e[-c(2:dim(e)[1]),]

typeof(e)

# Lists

v <- c(1, c(1, 2), 3, "A", c(4, 5))

l <- list(1, c(1, 2), 3, "A", list(4, 5))

l[2] # list of the vector
l[[2]] # vector itself

e[[1]]

e[[2]]

e[[3]]

obtainPrices <- function() {
	A <- matrix(c("VRSN", "UNP", "HPQ", "NSC"), nrow = 1)
	B <- matrix(c(37.61, 125.62, 50.48, 50.44), nrow = 1)

	list(A,B)
}

res <- obtainPrices()

res[[1]]
res[[2]]

pt <- data.frame(Ticker = t(res[[1]]), Price = t(res[[2]]))

pt