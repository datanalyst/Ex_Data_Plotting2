# QUESTION 2

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008?
# Use the base plotting system to make a plot answering this question.

# Unzip the files
if (!file.exists('data/exdata-data-NEI_data.zip')) {
        unzip('data/exdata_data_NEI_data.zip', exdir='./data')
}

# Read NEI file
NEI <- readRDS('./data/summarySCC_PM25.rds')

# Read SCC file
SCC <- readRDS('./data/Source_Classification_Code.rds')

# Subset NEI dataset to select Baltimore City
BALT <- NEI[NEI$fips == "24510",]

# Aggregate the total PM2.5 emission from all sources for each year
data <- aggregate(Emissions ~ year, data= BALT, sum)

# Plot 2
png('plot2.png', width = 480, height = 480)
barplot(data$Emissions,
        names.arg=data$year,
        xlab='Year',
        ylab='PM2.5 Emissions (Tons)',
        ylim = c(0, 3500),
        col= 'red',
        main='Total PM2.5 Emissions From All Baltimore City Sources')
dev.off()

