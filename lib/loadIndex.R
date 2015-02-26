

# This function gets a data frame with eye metrics for 10s windows
# in a session, and calculates the Load Index for each window in that session,
# returning the same dataset with added columns
calculateLoadIndexSession <- function(data){
    
    # We find out the median value for each parameter, and do the median cut
    meansessionmed <- median(data$value.pupilMean)
    data$Above.Mean <- as.numeric(data$value.pupilMean > meansessionmed)
    sdsessionmed <- median(data$value.pupilSD)
    data$Above.SD <- as.numeric(data$value.pupilSD > sdsessionmed)
    longsessionmed <- median(data$value.longFix)
    data$Above.Fix <- as.numeric(data$value.longFix > longsessionmed)
    sacsessionmed <- median(data$value.sacSpd)
    data$Above.Sac <- as.numeric(data$value.sacSpd > sacsessionmed)
    # We calculate the Load Index simply summing the different median cuts
    data$Load <- data$Above.Mean + data$Above.SD + data$Above.Fix + data$Above.Sac
    
    data
}