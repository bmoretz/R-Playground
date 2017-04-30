library(lattice)

source("CaseStudies\\IndoorPositioningSystems\\Common.R")

###########################################################
# Predicting Location via Indoor Positioning Systems
###########################################################

offline.filePath <- "CaseStudies\\IndoorPositioningSystems\\data\\offline.final.trace.txt"
online.filePath <- "CaseStudies\\IndoorPositioningSystems\\data\\online.final.trace.txt"

offline <- readData(offline.filePath)

unique(offline$mac)

bwplot(signal ~ factor(angle) | mac, data = offline,
	subset = posX == 2 & posY == 12 & mac != "00:0f:a3:39:dd:cd",
	layout = c(2,3))