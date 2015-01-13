plot3 <- function() {
    
    #library(lattice)
    library(ggplot2)
    library(plyr)
    #library(reshape2)
    
    # Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variables,
    # which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
    # Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make 
    # a plot answer this question.    
    
    # Read input files
    df.NEI <- readRDS(paste(getwd(), "NEI_data", "summarySCC_PM25.rds", sep="/"))
    df.NEI <- transform(df.NEI, year=factor(year))
    df.NEI <- transform(df.NEI, type=factor(type))

    # filter data frame to just Baltimore, MD data
    df.NEI.subset <- subset(df.NEI, fips == "24510", select=c("year","type","Emissions"))
    
    # summarize data by year and emissions type
    df.NEI.sum <- ddply(df.NEI.subset, c("year", "type"), summarise, sum = sum(Emissions))
    #df.NEI.mean <- ddply(df.NEI.subset, c("year", "type"), summarise, mean = mean(Emissions))
    
    #df.SCC <- readRDS(paste(getwd(), "NEI_data", "Source_Classification_Code.rds", sep="/"))

    # print plot to PDF
    f.out <- paste(getwd(), "plot3.png", sep="/")
    png(filename = f.out,
        width = 640, height = 640, units = "px", 
        pointsize = 12, bg = "white")
    
    # Setup ggplot with data frame
    p <- ggplot(df.NEI.sum, aes(year, sum)) + 
        geom_line(aes(colour = type, group = type)) +
        stat_smooth(aes(group=1), method="lm") +
        facet_grid(. ~type)

    # add a plot based on mean?
    
    # @dev.copy...    
    print(p) 
    
    dev.off()
    
    return("complete")    
}