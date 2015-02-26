# QUESTION 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(ggplot2)

# Unzip the files
if (!file.exists('data/exdata-data-NEI_data.zip')) {
        unzip('data/exdata_data_NEI_data.zip', exdir='./data')
}

#Read NEI file
NEI <- readRDS('./data/summarySCC_PM25.rds')

#Read SCC file
SCC <- readRDS('./data/Source_Classification_Code.rds')

#Subset coal combustion source factors from NEI data
comb <- grepl("Fuel Comb.*Coal", SCC$EI.Sector, ignore.case=TRUE)
combSCC <- SCC[comb,]$SCC
data <- NEI[NEI$SCC %in% combSCC,]

#Plot4
png('plot4.png', width = 500, height = 500)
g <- ggplot(data,aes(x =factor(year), y =Emissions/10^3))

ggp <- g +
        geom_bar(stat="identity",fill="darkblue", width=.7) +
        theme_bw() +
        guides(fill=FALSE) +
        xlab("Year") +
        ylab("Total PM2.5 Emissions (Kilotons)") +
        scale_y_continuous(breaks=seq(0, 700, 25)) +
        ggtitle("PM2.5 Coal Combustion Source Emissions Across US from 1999-2008")

print(ggp)
dev.off()

# Answer: In the US over the overall period that goes from 1999 to 2008, coal combustion source emissions have
# decreased from about 600,000 Tons (in 1999) to below 350,000 Tons (in 2008).
