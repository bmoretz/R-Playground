library(data.table)

DT <- data.table(A = 1:6, B = c("a", "b", "c"), C = rnorm(6), D = TRUE)

DT[3:5]
