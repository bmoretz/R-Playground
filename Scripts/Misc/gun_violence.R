library(data.table)
library(ggplot2)
library(ggthemes)
library(gridExtra)

theme_set(theme_dark())

data_path <- "data/"

#access public dataset on Kaggle
gun.incidents <- as.data.table(fread(paste0(data_path, "gun-violence-data_01-2013_03-2018.csv"),
	header = TRUE, stringsAsFactors = FALSE, na.strings = c("NA", "")))

# data clean-up & formatting
gun.incidents$date <- as.Date(gun.incidents$date)
gun.incidents$month <- month(gun.incidents$date)
gun.incidents$year <- year(gun.incidents$date)
gun.incidents$type <- 'Other'

# categorical values of interest

gun.incidents[grepl("Gang", gun.incidents$incident_characteristics)]$type = 'Gang Related'
gun.incidents[grepl("Mass Shooting", gun.incidents$incident_characteristics)]$type = 'Mass Shooting'
gun.incidents[grepl("suicide|accidental", gun.incidents$incident_characteristics)]$type = 'Suicide / Accidental'
gun.incidents[grepl("robbery|Violence", gun.incidents$incident_characteristics)]$type = 'Violent Crime'

by_month_type <- gun.incidents[,
  .(victims = sum(n_killed) + sum(n_injured)),
  by = c("year", "month", "type")][,
  total := sum(victims), by = c("year","month")][,
    pct := victims / total, by = c( "year", "month", "type")]

by_month_type[, date := as.Date(paste0( year, "-", month, "-01"))]

p1 <- ggplot() + geom_line(aes(y = victims, x = date, colour = type), size = 1.5,
                           data = by_month_type[year > 2013], stat = "identity")

p2 <- ggplot(by_month_type[, by = c("year", "type")], aes(x = year, y = victims, fill = type)) +
  geom_bar(stat = 'identity') + scale_fill_brewer(palette = 12)

grid.arrange(p1, p2)

# https://www2.census.gov/programs-surveys/popest/datasets/2010-2017/state/asrh/scprc-est2017-18+pop-res.csv
us.population <- as.data.table(fread(paste0(data_path, "PopulationUS.csv"),
  header = TRUE, stringsAsFactors = FALSE, na.strings = c("NA", "")))

by_state <- gun.incidents[, .(victims = sum(n_killed)), by = state]

by_state <- merge(by_state, us.population, by.x = c("state"), by.y = c("NAME"))
by_state[, per_100k := (victims / POPEST18PLUS2017) * 100000]

theme_set(theme_fivethirtyeight())

ggplot(by_state[state != "District of Columbia"], aes(x = reorder(state, - per_100k), y = per_100k)) + geom_bar(stat = 'identity') +
        labs(x = 'State', y = 'Incidents per 100,000 inhabitants') +
        theme(axis.text.x = element_text(angle = 45, hjust = 1))