plot4 <- function() {
    
    library(sqldf)
    library(ggplot2)
    library(plyr)
    #library(RH2)
    
    #library(checkpoint)
    #checkpoint("2014-10-08")
    
        # Across the United States, how have emissions from coal combustion-related 
    # sources changed from 1999–2008? 
    
    # Read input files 
    
    # read.. 
    df.NEI <- readRDS(paste(getwd(), "NEI_data", "summarySCC_PM25.rds", sep="/"))
    df.NEI <- transform(df.NEI, year=factor(year))
    
    # read ...
    df.SCC <- readRDS(paste(getwd(), "NEI_data", "Source_Classification_Code.rds", sep="/"))

    # merge datasets
    df.merge <- merge(df.NEI, df.SCC, by="SCC")
                       
    #with(df.merge, subset(Ozone, Temp > 80))
    #df.subset <- subset(df.merge, SCC.Level.One, SCC.Level.Three 
    #df.subset <- sqldf('select * from "df.merge" where "SC.Level.One" like "%ombustion%" and "SC.Level.Three" like "%oal%"')
    
    #df.subset <- df.merge[ which(gender=='F' & age > 65),]
    
    #df.subset <- df.merge[,grep("^[C|c]ombustion^",df.merge$SCC.Level.One) & grep("^[C|c]oal^",df.merge$SCC.Level.Three), ]
    df.subset <- df.merge[grep("^[C|c]ombustion^", df.merge$SCC.Level.One)]

    #ndf.subset <-     grep("[C|c]ombustion",df.merge$SCnC.Level.One) & grep("[C|c]oal",df.merge$SCC.Level.Three) 
    
    # set path for plot output filen
    f.out <- paste(getwd(), "plot4.png", sep="/")
    
    # define graphics device
    png(filename = f.out,
        width = 480, height = 480, units = "px", 
        pointsize = 12, bg = "white")
    
    #with(pollution, plot(latitude, pm25))
    
    # set up the plot
    # exclude outlier values
    #boxplot(Emissions ~ year,
    #     data = df.NEI,
    #     notch = TRUE,
    #     outline = FALSE,
    #     xlab = "Year",
    #     ylab = "Emissions"
    #)

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