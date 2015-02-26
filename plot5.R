# QUESTION 5
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(ggplot2)

# Unzip the files
if (!file.exists('data/exdata-data-NEI_data.zip')) {
        unzip('data/exdata_data_NEI_data.zip', exdir='./data')
}

#Read NEI file
NEI <- readRDS('./data/summarySCC_PM25.rds')

#Read SCC file
SCC <- readRDS('./data/Source_Classification_Code.rds')

#Subset the motor vehicles in Baltimora
data <- NEI[(NEI$type=="ON-ROAD") & (NEI$fips=="24510"),]

#Plot 5
png('plot5.png', width = 500, height = 500)

g <- ggplot(data,aes(factor(year),Emissions))

ggp <- g +
        geom_bar(stat="identity",fill="red",width=.7) +
        theme_bw() +
        guides(fill=FALSE) +
        xlab("Year") +
        ylab("Total PM Emission (Tons)") +
        scale_y_continuous(breaks=seq(0, 500, 10)) +
        ggtitle("PM2.5 Motor Vehicle Source Emissions in Baltimore from 1999-2008")

print(ggp)
dev.off()

