
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

convertTime <- function(t) {
	t <- t / 1000
	class(t) = c("POSIXt", "POSIXct")
	t
}

readData <- function(file.path) {

	txt <- readLines(file.path)
	tmp <- lapply(lines, processLine) # ignore header

	output <- as.data.frame(do.call("rbind", tmp), stringsAsFactors = FALSE)

	names(output) <- c("time", "scanMac", "posX", "posY", "posZ", "orientation", "mac", "signal", "channel", "type")

	numVars <- c("time", "posX", "posY", "posZ", "orientation", "signal")

	output[numVars] = lapply(output[numVars], as.numeric)

	output = output[output$type == 3,]
	output = output[, "type" != names(output)]

	output$rawTime <- output$time
	output$time <- convertTime(output$time)

	output$angle = roundOrientation(output$orientation)

	output = output[, !(names(output) %in% c("scanMac", "posZ"))]

	submacs = names(sort(table(output$mac), decreasing = TRUE))[1:7]
	output = output[output$mac %in% submacs,]

	output = output[, "channel" != names(output)]

	output
}