setwd("/Users/Daniel/Documents/exdata%2Fdata%2FNEI_data")
library(ggplot2)

upload1 <- readRDS("summarySCC_PM25.rds")
NEI <- upload1
upload2 <- readRDS("Source_Classification_Code.rds")
SCC <- upload2

png("plot4.png",width=480,height=480)

combRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalComb <- (combRelated & coalRelated)
combSCC <- SCC[coalComb,]$SCC
combNEI <- NEI[NEI$SCC %in% combSCC,]

plot <- ggplot(combNEI,aes(factor(year),Emissions/100000)) +
  geom_bar(stat="identity",fill="blue",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Hundred Thousand Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion-Related Source Emissions In US Between 1999-2008"))

print(plot)

dev.off()