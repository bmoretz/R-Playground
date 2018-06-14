# 1

df <- data.frame(x = 1:3, y = 1:3, z = 1:3)

df1 <- df[, sample(ncol(df))]

df <- data.frame(x = rnorm(10), y = rnorm(10))
df[1,] <- 0
df[10,] <- 1
df


df <- data.frame(z = 1:3, x = 1:3, y = 1:3)

df1 <- df[, order(names(df))]

df1
