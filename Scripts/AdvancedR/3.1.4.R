mat <- outer(1:5, 1:5, FUN = "*")

tri <- function(mat, diag = FALSE) {

    x <- as.matrix(mat)

    if (diag) {
        return ( mat[ ( col(x) < row(x) ), 1 ]
    } else {
        return ( row(x) < col(x) )
    }
}

mat
mc = col(mat)
mr = row(mat)

