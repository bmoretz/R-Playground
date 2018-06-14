library(data.table)
library(ggplot2)
library(ggthemes)
library(gridExtra)

theme_set(theme_dark())

data_path <- "data/"

#access public dataset on Kaggle
hayward <- as.data.table(fread(paste0(data_path, "Consol_2017_HP.csv"),
  header = TRUE, stringsAsFactors = FALSE, na.strings = c("NA", "")))

sub <- hayward[, 2:3]
colnames(sub) <- ( c("Distro", "City"))

peek <- head(hayward, 1000)

sub[, dis2 := substr(Distro, 0, 8)]

sum( grepl(paste0( "", sub$dis2, "" ), sub$Distro ) )