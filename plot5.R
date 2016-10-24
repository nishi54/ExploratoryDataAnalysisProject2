setwd("/Users/Daniel/Documents/exdata%2Fdata%2FNEI_data")
library(ggplot2)

png("plot5.png",width=480,height=480)

upload1 <- readRDS("summarySCC_PM25.rds")
NEI <- upload1[upload1$fips=="24510",]
upload2 <- readRDS("Source_Classification_Code.rds")
SCC <- upload2

vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicleSCC <- SCC[vehicle,]$SCC
vehicleNEI <- NEI[NEI$SCC %in% vehicleSCC,]

baltimoreVehicleNEI <- vehicleNEI[vehicleNEI$fips=="24510",]

plot <- ggplot(baltimoreVehicleNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="blue",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (100,000 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Emissions in Baltimore Between 1999-2008"))

print(plot)

dev.off()