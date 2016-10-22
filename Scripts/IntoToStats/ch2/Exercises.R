# 2.1

vec <- seq(0, 10, 1)

insert <- function(x, v, pos = 0) {
	append(x, v, after = pos)
}

insert(vec, 3.14, 8)

# 2.2
filePath <- file.path(getwd(), "Data/thusen.txt")

read.table(filePath)