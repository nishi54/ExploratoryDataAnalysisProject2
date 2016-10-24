setwd("/Users/Daniel/Documents/exdata%2Fdata%2FNEI_data")

upload <- readRDS("summarySCC_PM25.rds")
NEI <- upload

png('plot1.png', width=480, height=480)

data <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum)

barplot(
  (data$Emissions)/1000000, names.arg=data$year, xlab="Year",
  ylab="Emissions", main="Total PM2.5 Emission in the US between 1999-2008")

dev.off()

