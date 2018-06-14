
natural_log <- function(x) {
  if (x == 0) {
    -Inf
  } else {

    n <- 100
    i <- seq_len(n)

    sum( rep_len( c( 1, -1 ), n ) * ( x - 1 ) ^ i / i )
  }
}

natural_log(1)
log(1)

log(0.5)
natural_log(0.5)

log(0)
natural_log(0)