values <- c(106, 109, 114, 116, 121, 122, 125, 129)

quantile(values, .25)

summary(values)

quantile(values, .50)
mean(values)

accounting <- data.table(
	Firm = factor(c("Deloitte & Touche", "Ernst & Young", "PricewaterhouseCoopers", "KPMG", "RSM McGladrey", "Grant Thorton"), ordered = T),
	Partners = c(3030, 2700, 2691, 1813, 644, 529))

values <- accounting$Partners

mu <- mean(values)
ss <- sum((values - mu) ** 2)
s_var <- ss / (length(values) - 1)
s_sd <- sqrt(s_var)

print(paste("Variance :", prettyNum(round(s_var, 2), big.mark = ",")))
print(paste("Std Dev :", prettyNum(round(s_sd, 2), big.mark = ",")))

unemploy <- data.table(
	Low = c(1, 3, 5, 7, 9, 11),
	High = c(3, 5, 7, 9, 11, 13),
	Students = c(4, 12, 13, 19, 7, 5))

# Standard Method

unemploy[, Mid := (Low + High) / 2][, Freq := Mid * Students]
unemploy[, Mf := Mid * Students][, MsF := (Mid ** 2) * Students]

mu <- sum(unemploy$Mf) / sum(unemploy$Students)

n <- sum(unemploy$Students)
smsf <- sum(unemploy$MsF)
smfs <- sum(unemploy$Mf) ** 2 / n

var <- round( (smsf - smfs) / (n), 3)

round(sqrt(var), 1)

# Computational Formula
group_statistics <- function(data) {
	colnames(data) <- c("Low", "High", "F")

	
	data[, M := (Low + High) / 2][, FM := M * F]
	data[, FMS := F * M ** 2]

	n <- sum(data$F)
	sFMS <- sum(data$FMS)
	sFS <- sum(data$FM) ** 2 / n

	var <- (sFMS - sFS) / n
	sd <- sqrt(var)

	data.table( Variance = round(var, 2 ), StdDev = round(sd,2))
}

group_statistics(unemploy)