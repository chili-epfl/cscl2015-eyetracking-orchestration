require("ff")

# This function loads the time series pupil data from the eyetracker 
# (including Tetris game variables), the fixation details (in separate
# csv files), and calculates the averages of multiple eyetracking metrics
# and game variables for rolling windows of 10s (5s of slide between windows)
preprocessStudy1 <- function(){
    
    # We load the pupil time series data (BIG file!)
    tetrisPupil <- read.csv.ffdf(file="ALLCombinedVariables_timeseriesPupilEvolution.csv",header=T,VERBOSE=T,first.rows=10000,next.rows=50000,colClasses=NA)
    
    
    # The game IDs to iterate through
    games = unique(tetrisPupil$gameID[])
    window = 10000
    slide = 5000
    
    # This is the dataframe that will contain our processed dataset
    totaldata <- data.frame()
    
    # We process all the eyetracking and game variables for each game
    for (game in games){
        
        print(paste("Preprocessing game",game))
        
        gamepupil <- tetrisPupil[tetrisPupil$gameID[]==game,]
        
        # We get the game init time
        gameinit <- min(gamepupil$time.milliseconds.)
        
        # We filter out undesired columns, and the rows were there is no pupil measure (saccades)
        gamepupil <- gamepupil[gamepupil$Pupil.size!="saccade",-c(3,5,6,12:16)]
        gamepupil$Pupil.size <- as.numeric(as.character(gamepupil$Pupil.size))
        
        gamepupilMean <- rollingMean(gamepupil$time.milliseconds.,gamepupil$Pupil.size,window,slide)
        gamepupilSD <- rollingSd(gamepupil$time.milliseconds.,gamepupil$Pupil.size,window,slide)
        
        gamenumHoles <- rollingMean(gamepupil$time.milliseconds.,gamepupil$Number.Holes,window,slide)
        gamestackMin <- rollingMean(gamepupil$time.milliseconds.,gamepupil$Stack.height.min,window,slide)
        gamestackMax <- rollingMean(gamepupil$time.milliseconds.,gamepupil$Stack.height.max,window,slide)
        gamestackMean <- rollingMean(gamepupil$time.milliseconds.,gamepupil$Stack.height.mean,window,slide)
        gamestackVar <- rollingMean(gamepupil$time.milliseconds.,gamepupil$Stack.height.variance,window,slide)
        
        # We now try to get the fixation (and indirectly, saccade) information for the game
        gamefix <- read.csv(file=paste("ATESTvariables_",games[1],".csv",sep=""), header=T)
        gamefix$fixtime <- gamefix$start + (gamefix$end - gamefix$start)/2 # We make the Fixation time equal to the middle point of the fixation
        gamefix$duration <- gamefix$end - gamefix$start
        gamefixLong <- rollingLong(gamefix$fixtime,gamefix$duration,window,slide,inittime=gameinit)
        
        # We derive the approximate saccade measures from the fixations (the end of a fixation is the start of a saccade, and vice-versa)
        gamesac <- data.frame(start=gamefix$end[1:(length(gamefix$end)-1)])
        gamesac$end <- gamefix$start[2:(length(gamefix$end))]
        gamesac$duration <- gamesac$end - gamesac$start
        gamesac$sactime <- gamesac$start + gamesac$duration/2 # We make the Saccade timepoint equal to the middle point of the saccade
        gamesac$amplitude <- numeric(nrow(gamesac)) # This field will contain the amplitude of the saccade, measured in game cells
        for(i in 1:nrow(gamesac)){
            gamesac$amplitude[i] <- sqrt((gamefix$row[i+1]-gamefix$row[i])^2+(gamefix$col[i+1]-gamefix$col[i])^2)
        }
        gamesac$speed <- gamesac$amplitude / gamesac$duration
        gamesacSpd <- rollingMean(gamesac$sactime,gamesac$speed,window,slide,inittime=gameinit)
        
        # We merge all this game's data
        data <- merge(gamepupilMean,gamepupilSD,by="time",suffixes=c(".pupilMean",".pupilSD"))
        data <- merge(data,gamefixLong,by="time")
        names(data)[length(data)] <- "value.longFix"
        data <- merge(data,gamesacSpd,by="time")
        names(data)[length(data)] <- "value.sacSpd"
        data <- merge(data,gamenumHoles,by="time")
        names(data)[length(data)] <- "value.numHoles"
        data <- merge(data,gamestackMin,by="time")
        names(data)[length(data)] <- "value.stackMin"
        data <- merge(data,gamestackMax,by="time")
        names(data)[length(data)] <- "value.stackMax"
        data <- merge(data,gamestackMean,by="time")
        names(data)[length(data)] <- "value.stackMean"
        data <- merge(data,gamestackVar,by="time")
        names(data)[length(data)] <- "value.stackVar"
        
        data$gameID <- rep(game,nrow(data))
        
        # We join the game data to our global dataset
        if(length(totaldata)==0) totaldata <- data
        else totaldata <- rbind(totaldata,data)
        
    }
    
    print("Preprocessing finished. Writing clean datafile: Study1ProcessedData.Rda")
    save(totaldata,file="Study1ProcessedData.Rda")
    unlink("Study1ProcessedData.Rda")
    
    totaldata
    
}
