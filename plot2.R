setwd("/Users/Daniel/Documents/exdata%2Fdata%2FNEI_data")

upload <- readRDS("summarySCC_PM25.rds")
BaltimoreNEI <- upload[upload$fips=="24510",]

png('plot2.png', width=480, height=480)

data <- aggregate(BaltimoreNEI[c("Emissions")], list(year = BaltimoreNEI$year), sum)

barplot(
  (data$Emissions)/1000000, names.arg=data$year, xlab="Year",
  ylab="Emissions", main="Total PM2.5 Emission in Baltimore between 1999-2008")

dev.off()

