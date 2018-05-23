library(data.table)
library(ggplot2)
library(ggthemes)

theme_set(theme_fivethirtyeight())

data_path <- "data/" #access public dataset on Kaggle
population_csv <- "data/PopulationUS.csv" 

#access public dataset on Kaggle
gun.incidents <- as.data.table(fread(paste0(data_path, "gun-violence-data_01-2013_03-2018.csv"),
	header = TRUE, stringsAsFactors = FALSE, na.strings = c("NA", "")))

gun.incidents$month <- month(gun.incidents$date)
gun.incidents$quarter <- quarter(gun.incidents$date)
gun.incidents$year <- year(gun.incidents$date)
gun.incidents$gang <- grepl("Gang", gun.incidents$incident_characteristics)
gun.incidents$mass <- grepl("Mass Shooting", gun.incidents$incident_characteristics)

gang_related <- gun.incidents[, .(victims = sum(n_killed) + sum(n_injured), gang = sum(gang), mass = sum(mass), total = .N), by = year]
gang_related[, gang_pct := gang / total, by = year]

ggplot(gang_related, aes(x = year, y = victims, fill = gang_pct)) +
	geom_bar(stat = 'identity')

grid.arrange(q1, q2)