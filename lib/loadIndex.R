

# This function gets a data frame with eye metrics for 10s windows
# in a session, and calculates the Load Index for each window in that session,
# returning the same dataset with added columns
# Since in some cases the field labels may vary, they can also be specified explicitly
calculateLoadIndexSession <- function(data, meanlabel="value.pupilMean", sdlabel="value.pupilSD", fixlabel="value.longFix", saclabel="value.sacSpd"){
    
    # We find out the median value for each parameter, and do the median cut
    meansessionmed <- median(data[,meanlabel])
    data$Above.Mean <- as.numeric(data[,meanlabel] > meansessionmed)
    sdsessionmed <- median(data[,sdlabel])
    data$Above.SD <- as.numeric(data[,sdlabel] > sdsessionmed)
    longsessionmed <- median(data[,fixlabel])
    data$Above.Fix <- as.numeric(data[,fixlabel] > longsessionmed)
    sacsessionmed <- median(data[,saclabel])
    data$Above.Sac <- as.numeric(data[,saclabel] > sacsessionmed)
    # We calculate the Load Index simply summing the different median cuts
    data$Load <- data$Above.Mean + data$Above.SD + data$Above.Fix + data$Above.Sac
    
    data
}