library(ISwR)

attach(thuesen)

plot(blood.glucose, short.velocity)

with(thuesen, plot(blood.glucose, short.velocity))

thue2 <- subset(thuesen, blood.glucose < 7)
thue2

thue3 <- transform(thuesen, log.gluc = log(blood.glucose))
thue3

short.velocity[blood.glucose < 7]

thue4 <- within(thuesen, {
	log.gluc <- log(blood.glucose)
	m <- mean(log.gluc)
	centered.log.gluc <- log.gluc - m
	rm(m)
})

thue4