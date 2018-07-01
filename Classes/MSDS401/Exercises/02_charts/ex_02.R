library(data.table)
library(ggplot2)
library(ggthemes)
library(gridExtra)

theme_set(theme_fivethirtyeight())

data.path <- "C:/Projects/R/Playground/Classes/MSDS401/Exercises/02_charts/data/"

data.raw <- as.data.table(fread(paste0(data.path, "home_prices.csv"),
  header = TRUE, stringsAsFactors = FALSE, na.strings = c("NA", "")))

home.sales <- setNames(data.raw, tools::toTitleCase(tolower(names(data.raw))))

home.sales$Year <- as.Date(paste(home.sales$Year, 12, 31, sep = "-"))
home.sales$Baths <- factor(home.sales$Baths, ordered = TRUE)
home.sales$Feats <- factor(home.sales$Feats, ordered = TRUE)
home.sales$Nbr <- home.sales$Nbr == "YES"
home.sales$Corner <- home.sales$Corner == "YES"

glimpse(home.sales)

?