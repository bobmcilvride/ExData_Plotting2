plot1 <- function() {
    
    #library(data.table)
    
    # Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
    # Using the base plotting system, make a plot showing the total PM2.5 emission from 
    # all sources for each of the years 1999, 2002, 2005, and 2008.
    
    # Read input files 
    #if (!file.exists("dir_ename")) {
    #    dir.create("dir_name")
    #}
    
    #fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
    #path <- paste(getwd(), "3 - Getting and Cleaning Data", sep="/")
    #f <- paste(path, "idaho.csv", sep="/")
    #download.file(fileUrl, destfile = f, method="curl")
    #dateDownloaded <- date()
    
    # row.names    fips	SCC	Pollutant	Emissions	type	year
    df.NEI <- readRDS(paste(getwd(), "NEI_data", "summarySCC_PM25.rds", sep="/"))
    df.NEI <- transform(df.NEI, year=factor(year))
    
    # SCC Data.Category Short.Name EI.Sector Option.Group Option.Set SCC.Level.One 
    # SCC.Level.Two SCC.Level.Three	SCC.Level.Four	Map.To	Last.Inventory.Year	
    # Created_Date Revised_Date Usage.Notes
    # df.SCC <- readRDS(paste(getwd(), "NEI_data", "Source_Classification_Code.rds", sep="/"))
    
    # set path for plot output file
    f.out <- paste(getwd(), "plot1.png", sep="/")
    
    # define graphics device
    png(filename = f.out,
        width = 640, height = 640, units = "px", 
        pointsize = 12, bg = "white")
    
    # set up the plot
    # exclude outlier values
    barplot(Emissions ~ year,
         data = df.NEI,
         outline = FALSE,
         xlab = "Year",
         ylab = "Emissions"
    )
    
    # close graphics device
    dev.off()
    
    return("complete")    
}