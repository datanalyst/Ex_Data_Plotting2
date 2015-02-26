# QUESTION 1

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission from
# all sources for each of the years 1999, 2002, 2005, and 2008.

# Unzip the files
if (!file.exists('data/exdata-data-NEI_data.zip')) {
        unzip('data/exdata_data_NEI_data.zip', exdir='./data')
}

# Read NEI file
NEI <- readRDS('./data/summarySCC_PM25.rds')

# Read SCC file
SCC <- readRDS('./data/Source_Classification_Code.rds')

# Aggregate total PM2.5 emission from all sources for each year
data <- aggregate(Emissions ~ year, data= NEI, sum)

# Plot1
png('plot1.png', width = 480, height = 480)
barplot(data$Emissions/10^3, names.arg=data$year,
        xlab='Year',
        ylab='PM2.5 Emissions (Kilotons)', ylim = c(0,8000),
        col = 'darkblue',
        main='Total PM2.5 Emissions per Year from All US Sources')
dev.off()
