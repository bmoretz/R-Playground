pizza = data.frame(Name = c("Main Plaza 1",
	"Main Plaza 2",
	"Main Plaza 3",
	"Main Plaza 1",
	"Main Plaza 5"),
	stringsAsFactors = FALSE)

pizza[which(pizza$Name == "Main Plaza 1"),][2] <- "Main Lane Plaza 1(second)"

pizza


lists <- replicate(10, as.data.frame(matrix(rnorm(100), 10, 10)), simplify = FALSE)
names(lists) <- LETTERS[1:10]
