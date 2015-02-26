# QUESTION 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California
# (fips == "06037").  Which city has seen greater changes over time in motor vehicle emissions?

library(ggplot2)

# Unzip the files
if (!file.exists('data/exdata-data-NEI_data.zip')) {
        unzip('data/exdata_data_NEI_data.zip', exdir='./data')
}

#Read NEI file
NEI <- readRDS('./data/summarySCC_PM25.rds')

#Read SCC file
SCC <- readRDS('./data/Source_Classification_Code.rds')

#Subset the motor vehicles in Baltimora and LA
data <- NEI[(NEI$type=="ON-ROAD") & (NEI$fips %in% c("24510", "06037")),]

#Add city labels
data$city <- factor(data$fips, labels = c("Los Angeles County","Baltimore City"))

#Plot 6
png('plot6.png', width = 500, height = 500)

g <- ggplot(data,aes(factor(year),Emissions, fill = city))

ggp <- g +
        geom_bar( stat="identity") +
        facet_grid(city ~ ., scales="free") +
        guides(fill=FALSE) +
        xlab("Year") +
        ylab("Total PM Emission (Tons)") +
        ggtitle("PM2.5 Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008")

print(ggp)
dev.off()

