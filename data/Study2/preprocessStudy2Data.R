# This function loads the time series pupil data from the eyetracker, the fixation and saccade details (in separate
# txt/csv files), and calculates the averages/counts of multiple eyetracking metrics
# and game variables for rolling windows of 10s (5s of slide between windows)
preprocessStudy2 <- function(datadir="."){
    
    # Some basic parameters for the sliding windows (in seconds)
    window <- 10
    slide <- 5
    totaldata <- data.frame()
    
    sessions <- c("JDC2014-Session1-eyetracking","JDC2014-Session2-eyetracking","JDC2014-Session3-eyetracking")
    for (session in sessions){
        
        # We check whether the clean data is already in place - if so, we skip this pre-processing
        if(!file.exists(paste(datadir,"/",session,".EyetrackerEvents.rda",sep="")) ||
               !file.exists(paste(datadir,"/",session,".EyetrackerFixations.rda",sep="")) ||
               !file.exists(paste(datadir,"/",session,".EyetrackerSaccades.rda",sep=""))){
            
            # We load the raw events export
            filename = paste(datadir,"/",session,"-eventexport.txt", sep="")
            filedata <- read.csv(filename,as.is=T,comment.char="#")
            
            # From all the data, we only need timestamp, pupil diameter (L,R, in mm)
            filedata <- filedata[c(1,6,9)]
            filedata$Session <- session
            pupildata <- data.frame(filedata)
            
            # We calculate the time baseline of the session
            time0 <- min(pupildata$Time)
            pupildata$Time.ms <- (pupildata$Time - time0) / 1000
            
            # We load the fixation details file
            filename = paste(datadir,"/",session,"-fixationDetails.txt", sep="")
            filedata <- read.csv(filename,comment.char="#")
            
            # we select the meaningful columns (for now, only fixation start, duration, end in ms)
            # it is different in the exports we have for different teachers!
            filedata <- filedata[,c(8,9,10)]

            filedata$Session <- session
            fixdata <- data.frame(filedata)
            
            #We set the time of the fixation in the middle of the fixation
            fixdata$Time.ms <- (fixdata$Fixation.Start..ms. + (fixdata$Fixation.Duration..ms./2)) 
            # We create a Time field so that we have the time in both timestamp and ms formats
            fixdata$Time <- time0 + (fixdata$Time.ms)*1000
            
            # We load the saccade details file
            filename = paste(datadir,"/",session,"-saccadeDetails.txt", sep="")
            filedata <- read.csv(filename,comment.char="#")
            
            # we select the meaningful columns (for now, only saccade start, duration, end in ms and amplitude in degrees)
            # it is different in the exports we have for different teachers!
            filedata <- filedata[,c(8,9,10,15)]
            filedata$Session <- session
            sacdata <- data.frame(filedata)
            # We add the saccade speed for each saccade
            sacdata$Saccade.Speed <- sacdata$Amplitude.... / sacdata$Saccade.Duration..ms.
            
            #We set the time of saccade in the middle of the fixation
            sacdata$Time.ms <- (sacdata$Saccade.Start..ms. + (sacdata$Saccade.Duration..ms./2)) 
            # We create a Time field so that we have the time in both timestamp and ms formats
            sacdata$Time <- time0 + (sacdata$Time.ms)*1000
            
            # We save the clean(er) data to smaller, more efficient rda files
            save(pupildata,file=paste(datadir,"/",session,".EyetrackerEvents.rda",sep=""),compress=TRUE)
            save(fixdata,file=paste(datadir,"/",session,".EyetrackerFixations.rda",sep=""),compress=TRUE)
            save(sacdata,file=paste(datadir,"/",session,".EyetrackerSaccades.rda",sep=""),compress=TRUE)
            
        }
        
        # We load the clean data, just in case we did not the previous steps
        pupildata <- get(load(paste(datadir,"/",session,".EyetrackerEvents.rda",sep="")))
        fixdata <- get(load(paste(datadir,"/",session,".EyetrackerFixations.rda",sep="")))
        sacdata <- get(load(paste(datadir,"/",session,".EyetrackerSaccades.rda",sep="")))
        
        # We get the rolling window for the mean pupil diameter, and its median value for a median cut
        meandata <- rollingMean(pupildata$Time.ms,pupildata$L.Pupil.Diameter..mm.,window*1000,slide*1000)
        
        # We get the rolling window for the SD of pupil diameter, and its median value for a median cut
        sddata <- rollingSd(pupildata$Time.ms,pupildata$L.Pupil.Diameter..mm.,window*1000,slide*1000)
        
        # We get the number of long fixations in the window, and its median
        longdata <- rollingLong(fixdata$Time.ms,fixdata$Fixation.Duration..ms.,window*1000,slide*1000,inittime=0)
        
        # We get the saccade speed in the window
        sacspdata <- rollingMean(sacdata$Time.ms,sacdata$Saccade.Speed,window*1000,slide*1000, inittime=0)
        
        data <- merge(meandata,sddata,by="time",suffixes = c(".Mean",".SD"),all=T)
        data <- merge(data,longdata,by="time",all=T)
        names(data)[[4]] <- paste(names(data)[[4]],"Fix",sep=".")
        data <- merge(data,sacspdata,by="time",all=T)
        names(data)[[5]] <- paste(names(data)[[5]],"Sac",sep=".")
        data$Session <- session

        # We join the game data to our global dataset
        if(length(totaldata)==0) totaldata <- data
        else totaldata <- rbind(totaldata,data)


    }

    print("Preprocessing finished. Writing clean datafile: Study2ProcessedData.Rda")
    save(totaldata,file=paste(datadir,"/Study2ProcessedData.Rda",sep=""))
    #unlink("Study2ProcessedData.Rda")
    
    totaldata
    
}
