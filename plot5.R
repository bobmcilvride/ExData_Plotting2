plot5 <- function() {
    
    # How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
    
    # Read input files 
    
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
        width = 480, height = 480, units = "px", 
        pointsize = 12, bg = "white")
    
    # set up the plot
    # exclude outlier values
    boxplot(Emissions ~ year,
         data = df.NEI,
         notch = TRUE,
         outline = FALSE,
         xlab = "Year",
         ylab = "Emissions"
    )
    
    ################################################
    # create boxplot that includes outliers
    #p0 = ggplot(df, aes(y = y)) + geom_boxplot(aes(x = factor(1)))
    
    # compute lower and upper whiskers
    #ylim1 = boxplot.stats(df$y)$stats[c(1, 5)]
    
    # scale y limits based on ylim1
    #p1 = p0 + coord_cartesian(ylim = ylim1*1.05)
    ################################################
    
    # close graphics device
    dev.off()
    
    return("complete")    
}