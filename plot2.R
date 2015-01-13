plot2 <- function() {
    
    # Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
    # from 1999 to 2008? Use the base plotting system to make a plot answering this question.    
    
    # Read input files 
    
    # row.names    fips	SCC	Pollutant	Emissions	type	year
    df.NEI <- readRDS(paste(getwd(), "NEI_data", "summarySCC_PM25.rds", sep="/"))
    df.NEI <- transform(df.NEI, year=factor(year))
 
    # filter data frame to just Baltimore, MD data
    df.NEI.subset <- subset(df.NEI, fips == "24510", select=c(Emissions, year))
    
    # SCC Data.Category Short.Name EI.Sector Option.Group Option.Set SCC.Level.One 
    # SCC.Level.Two SCC.Level.Three	SCC.Level.Four	Map.To	Last.Inventory.Year	
    # Created_Date Revised_Date Usage.Notes
    # df.SCC <- readRDS(paste(getwd(), "NEI_data", "Source_Classification_Code.rds", sep="/"))
    
    # set path for plot output file
    f.out <- paste(getwd(), "plot2.png", sep="/")
    
    # define graphics device
    png(filename = f.out,
        width = 640, height = 640, units = "px", 
        pointsize = 12, bg = "white")
    
    # set up the plot
    # exclude outlier values
    boxplot(Emissions ~ year,
         data = df.NEI.subset,
         outline = FALSE,
         xlab = "Year",
         ylab = "Emissions"
    )
    
    # close graphics device
    dev.off()
    
    return("complete")    
}