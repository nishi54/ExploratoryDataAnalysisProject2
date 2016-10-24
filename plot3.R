setwd("/Users/Daniel/Documents/exdata%2Fdata%2FNEI_data")
library(ggplot2)

upload <- readRDS("summarySCC_PM25.rds")
BaltimoreNEI <- upload[upload$fips=="24510",]

png('plot3.png', width=480, height=480)

data <- aggregate(BaltimoreNEI[c("Emissions")], list(type = BaltimoreNEI$type, year = BaltimoreNEI$year), sum)

g <- ggplot(data, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("Year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore between 1999 to 2008')
print(g)

dev.off()

