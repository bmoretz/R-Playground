library(lattice)

source("CaseStudies\\IndoorPositioningSystems\\Common.R")

###########################################################
# Predicting Location via Indoor Positioning Systems
###########################################################

offline.filePath <- "CaseStudies\\IndoorPositioningSystems\\data\\offline.final.trace.txt"
online.filePath <- "CaseStudies\\IndoorPositioningSystems\\data\\online.final.trace.txt"

# load offline signal data
offline <- readData(offline.filePath)

unique(offline$mac)

# Signal Strength by Angle for each Access Point
bwplot(signal ~ factor(angle) | mac, data = offline,
	subset = posX == 2 & posY == 12 & mac != "00:0f:a3:39:dd:cd",
	layout = c(2, 3))

# signal strength varies in degrees of negative values
summary(offline$signal) 

# inspect distributions from a central location
midX <- mean(offline$posX)
midY <- mean(offline$posY)

densityplot( ~signal | mac + factor(angle), data = offline,
	subset = posX == midX & posY == midY & mac != "00:0f:a3:39:dd:cd",
	bw = 0.5, plot.points = FALSE)

# summary of signal by location angle & access point
offline$posXY = paste(offline$posX, offline$posY, "-")

byLocAngleAP = with(offline,
	by(offline, list(posXY, angle, mac),
		function(x) x))

signalSummary = lapply(byLocAngleAP,
	function(oneLoc) {
		ans = oneLoc[1,]
		ans$medSignal = median(oneLoc$signal)
		ans$avgSignal = mean(oneLoc$signal)
		ans$num = length(oneLoc$signal)
		ans$sdSignal = sd(oneLoc$signal)
		ans$iqrSignal = IQR(oneLoc$signal)
		ans
	})

offlineSummary = do.call("rbind", signalSummary)

breaks <- seq(-90, -30, by = 5)

bwplot(sdSignal ~ cut(avgSignal, breaks = breaks), data = offlineSummary,
	subset = mac != "00:0f:a3:39:dd:cd",
	xlab = "Mean Signal", ylab = "SD Signal")

# Relationship between signal strength & distance

with(offlineSummary,
	smoothScatter((avgSignal - medSignal) ~ num,
		xlab = "Number of Observations",
		ylab = "mean - median"))
abline(h = 0, col = "#984ea3", lwd = 2)

lo.obj = with(offlineSummary,
	loess(diff ~ num,
		data = data.frame(diff = (avgSignal - medSignal), num = num)))

lo.obj.pr = predict(lo.obj, newdata = data.frame(num = (70:120)))
lines(x = 70:120, y = lo.obj.pr, col = "#4daf4a", lwd = 2)