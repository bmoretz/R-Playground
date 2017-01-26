require(data.table)

DT <- data.table(A = c("c", "b", "a"), B = 1:6)


DT[, A == "a" ]
DT[ A == "a"]

# Convert iris to a data.table

iris <- as.data.table( iris )

# Species is "virginica"

iris[ Species == "virginica"]

# Species is either "virginica" or "versicolor"

iris[Species %in% c("virginica", "versicolor")]

# reset

iris <- as.data.table(iris)

# Remove the "Sepal." prefix

setnames(iris, colnames(iris), gsub("Sepal.", "", colnames(iris), fixed = TRUE))

# Remove the two columns starting with "Petal"

iris[, grep("Petal", colnames(iris)) := NULL ]

# Area is greater than 20 square centimeters

iris[Length * Width > 20]

# Add new boolean column

iris[, is_large := (Length * Width > 25)]

# Now large observations with is_large

iris[is_large == TRUE]