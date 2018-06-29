library(data.table)
library(ggplot2)
library(ggthemes)
library(gridExtra)

theme_set(theme_economist())

data_path <- "data/"

data.raw <- as.data.table(fread(paste0(data_path, "home_prices.csv"),
  header = TRUE, stringsAsFactors = FALSE, na.strings = c("NA", "")))

home.sales <- setNames(data.raw, c("Price", "Sqft", "Year", "Baths", "Feats", "NBR", "Corner", "Tax"))

str(home.sales)

# a) What are the measurement levels of each of the eight variables ?

variable_types = data.frame(
      Variable = colnames(home.sales),
      Type = c( "Ratio",
                "Ratio",
                "Ordinal",
                "Ordinal",
                "Ratio",
                "Nominal",
                "Nominal",
                "Ratio"))

print(variable_types)

# b) Should any variable have its values changed to better reflect its true nature ?

home.sales$Year <- as.Date(paste(home.sales$Year, 12, 31, sep = "-"))
home.sales$Baths <- factor(home.sales$Baths, ordered = TRUE)
home.sales$Feats <- factor(home.sales$Feats, ordered = TRUE)
home.sales$NBR <- home.sales$NBR == "YES"
home.sales$Corner <- home.sales$Corner == "YES"

str(home.sales)

# c) From the vector “price”, select a simple random sample of size 12. Assign the sample to the name “SRS.”" 
# Print SRS and determine the mean value.

set.seed(999)
SRS <- sample(home.sales$Price, 12)

print(SRS)

mu_SRS <- mean(SRS)
print(mu_SRS)

# d) From the vector “price”, select a systematic sample of twelve observations. Start with the seventh
# observation and pick every 10 th observation thereafter(i.e. 7, 17, 27,) . You should end with the 117 th
# observation. Assign the sample vector to “SS.”" Print the values of SS and compute the mean value.

obs <- seq(from = 7, to = 117, by = 10)
obs
SS <- home.sales[obs]$Price

print(SS)

mu_SS <- mean(SS)
print(paste("SS Mean: ", round(mu_SS,2)))

# e) Examine the printed values and mean values obtained from the two sampling procedures. Do you see a
# difference ? Try the commands summary(SRS) and summary(SS) .

summary(SRS)
summary(SS)

# f) Create histograms and stem - and - leaf plots for
#  SRS and SS using hist() and stem() . How do the two
# samples compare ?

stem(SRS)

pSRS <- qplot(SRS,
      geom = "histogram",
      bins = 5,
      main = "Histogram for Random Sample Price",
      xlab = "Price")

stem(SS)

pSS <- qplot(SS,
      geom = "histogram",
      bins = 5,
      main = "Histogram for Systematic Sample Price",
      xlab = "Price")

grid.arrange(pSRS, pSS, nrow = 1)