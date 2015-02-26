# QUESTION 3

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen
# decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2
# plotting system to make a plot answer this question

library(ggplot2)

# Unzip the files
if (!file.exists('data/exdata-data-NEI_data.zip')) {
        unzip('data/exdata_data_NEI_data.zip', exdir='./data')
}

#Read NEI file
NEI <- readRDS('./data/summarySCC_PM25.rds')

#Read SCC file
SCC <- readRDS('./data/Source_Classification_Code.rds')

# Select Baltimore City
data <- NEI[NEI$fips == "24510",]

# Plot 3
png('plot3.png', width = 550, height = 550)
g <- ggplot(data, aes(factor(year),Emissions,fill=type))

ggp <- g +
        geom_bar(stat="identity") +
        theme_bw() +
        guides(fill=FALSE) +
        facet_grid(.~type,scales = "free",space="free") +
        xlab("Year") +
        ylab("Total PM2.5 Emissions (Tons)") +
        scale_y_continuous(breaks=seq(0, 3000, 100)) +
        ggtitle("PM2.5 Emissions, Baltimore City 1999-2008 by Source Type")
 
print(ggp)
dev.off()

# Answer1: The non-road, nonpoint, on-road source types have all seen an overall decrease in the emissions from 1999-2008 in Baltimore City.
