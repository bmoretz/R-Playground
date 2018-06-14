library(codetools)
source("CaseStudies\\IndoorPositioningSystems\\Common.R")

###########################################################
# Predicting Location via Indoor Positioning Systems
###########################################################

file.path <- "CaseStudies\\IndoorPositioningSystems\\data\\offline.final.trace.txt"
txt <- readLines(file.path)

offlineRedo <- readData(file.path)

identical(offline, offlineRedo)

unlist(lapply(offline, class))

# Total Number of cases
sum(substr(txt, 1, 1) == "#")

# Lines, expecting 146,080 observations
length(txt)

# data exploration

strsplit(txt[4], ";")[[1]]

unlist(lapply(strsplit(txt[4], ";")[[1]],
	FUN = function(x) {
		sapply(strsplit(x, "=")[[1]], strsplit, ",")
}))

tokens <- strsplit(txt[4], "[;=,]")[[1]]

tokens[1:10]

tokens[c(2, 4, 6:8, 10)]

tokens[-(1:10)]

tmp = matrix(tokens[-c(1:10)], ncol = 4, byrow = TRUE)
mat = cbind(matrix(tokens[c(2, 4, 6:8, 10)], nrow = nrow(tmp), ncol = 6, byrow = TRUE), tmp)

dim(mat)

processLine <- function(x) {

	tokens <- strsplit(x, "[;=,]")[[1]]

	if (length(tokens) == 10)
		return(NULL)

	tmp = matrix(tokens[-c(1:10)], ncol = 4, byrow = TRUE)
	cbind(matrix(tokens[c(2, 4, 6:8, 10)], nrow = nrow(tmp), ncol = 6, byrow = TRUE), tmp)
}

roundOrientation <- function(angles) {
	refs = seq(0, by = 45, length = 9)
	q = sapply(angles, function(o) which.min(abs(o - refs)))
	c(refs[1:8], 0)[q]
}

line <- txt[5]

out <- processLine(txt[5])

tmp <- lapply(txt[4:20], processLine)

# observations per end point
sapply(tmp, nrow)

offline <- as.data.frame(do.call("rbind", tmp))

dim(offline)

# read the full set
lines = txt[substr(txt, 1, 1) != "#"]

#options(error = recover, warn = 1)
tmp = lapply(lines, processLine)

offline <- as.data.frame(do.call("rbind", tmp), stringsAsFactors = FALSE)

dim(offline)

names(offline) <- c("time", "scanMac", "posX", "posY", "posZ", "orientation", "mac", "signal", "channel", "type")

numVars <- c("time", "posX", "posY", "posZ", "orientation", "signal")

convertTime <- function(t) {
	tmp <- as.numeric(t) / 1000
	class(tmp) = c("POSIXt", "POSIXct")
	tmp
}

offline[numVars] = lapply(offline[numVars], as.numeric)

offline = offline[offline$type == 3,]
offline = offline[, "type" != names(offline)]

dim(offline)

offline$rawTime <- offline$time

offline$time <- offline$time / 1000
class(offline$time) = c("POSIXt", "POSIXct")

unlist(lapply(offline, class))

summary(offline[, numVars])

summary(sapply(offline[, c("mac", "channel", "scanMac")], as.factor))

offline = offline[, !(names(offline) %in% c("scanMac", "posZ"))]

length(unique(offline$orientation))

plot(ecdf(offline$orientation))

offline$angle = roundOrientation(offline$orientation)

with(offline, boxplot(orientation ~ angle, xlab = "nearest 45 degree angle", ylab = "orientation"))

c(length(unique(offline$mac)), length(unique(offline$channel)))

table(offline$mac)

submacs = names(sort(table(offline$mac), decreasing = TRUE))[1:7]

offline = offline[offline$mac %in% submacs,]

table(offline$mac)

macChannel = with(offline, table(mac, channel))

apply(macChannel, 1, function(x) sum(x > 0))

offline = offline[, "channel" != names(offline)]

locDF = with(offline, by(offline, list(posX, posY), function(x) x))

length(locDF)

sum(sapply(locDF, is.null))

locDF = locDF[!sapply(locDF, is.null)]

length(locDF)

locCounts = sapply(locDF, nrow)

locCounts = sapply(locDF, function(df)
	c(df[1, c("posX", "posY")], count = nrow(df)))

class(locCounts)

dim(locCounts)

locCounts[, 1:8]

locCounts = t(locCounts)
plot(locCounts, type = "n", xlab = "", ylab = "")
text(locCounts, labels = locCounts[, 3], cex = .8, srt = 45)

