library(data.table)

# The 'keyed' data.table DT
DT <- data.table(A = letters[c(2, 1, 2, 3, 1, 2, 3)],
				 B = c(5, 4, 1, 9, 8, 8, 6),
				 C = 6:12)

setkey(DT, A, B)

# Select the "b" group

DT["b",]

# "b" and "c" groups

DT[c("b","c")]

# The first row of the "b" and "c" groups


# First and last row of the "b" and "c" groups


# Copy and extend code for instruction 4: add printout
