library(data.table)
library(ggplot2)
library(ggthemes)
library(gridExtra)

theme_set(theme_economist())

data_path <- "/data/"

data.raw <- as.data.table(fread(paste0(data_path, "home_prices.csv"),
  header = TRUE, stringsAsFactors = FALSE, na.strings = c("NA", "")))

home.sales <- setNames(data.raw, tools::toTitleCase(tolower(names(data.raw))))

