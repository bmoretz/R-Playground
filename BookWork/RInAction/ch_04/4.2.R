# 4.2

mydata <- data.frame(x1 = c(2, 2, 6, 4),
					x2 = c(3, 4, 2, 8))

mydata <- transform(mydata,
	 sumx = x1 + x2,
	 meanx = (x1 + x2) / 2)

mydata