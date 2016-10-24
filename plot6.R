setwd("/Users/Daniel/Documents/exdata%2Fdata%2FNEI_data")
library(ggplot2)

png("plot6.png",width=480,height=480)

upload1 <- readRDS("summarySCC_PM25.rds")
upload2 <- readRDS("Source_Classification_Code.rds")
NEI <- upload1
SCC <- upload2

vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicleSCC <- SCC[vehicle,]$SCC
vehicleNEI <- NEI[NEI$SCC %in% vehicleSCC,]

BaltimoreNEI <- vehicleNEI[vehicleNEI$fips=="24510",]
LANEI <- vehicleNEI[vehicleNEI$fips=="06037",]
BaltimoreNEI$city <- "Baltimore City"
LANEI$city <- "Los Angeles County"

combine <- rbind(BaltimoreNEI,LANEI)

plot <- ggplot(combine, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

print(plot)

dev.off()
