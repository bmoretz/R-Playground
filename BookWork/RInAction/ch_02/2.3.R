# Keyboard Entry

mydata <- data.frame(age = numeric(0), gender = character(0), weight = numeric(0))
mydata <- edit(mydata)

# Inline

mydatatxt <- "
age gender weight
25 m 166
60 f 115
18 f 120"

mydata <- read.table(header = TRUE, text = mydatatxt)

