#Function that extracts the 10-second episodes with maximum and minimum load index for a session, 
# and creates a table with different dimensions to be video coded by a human coder, using
# the eyetracker's video feed from that session.
# It writes that table in a csv file, and returns the dataframe
extractExtremeLoadMoments <- function(sessions, totaldata, outputfile="TimesToVideoCode.csv"){
    
    interesting <- data.frame()
    
    for(session in sessions){
        #load(paste("./",cleandir,"/",session,"-LoadMetrics.Rda",sep=""))
        data <- totaldata[totaldata$Session == session,]
        data <- data[data$Load==max(data$Load) | data$Load==min(data$Load),c("Session", "time")]
        data$Time.min <- msToMinSec(data$time)
        
        if(nrow(interesting)==0) interesting <- data
        else interesting<-rbind(interesting,data)
    }
    
    # We add the rest of the fields, empty
    # Description: short narrative description
    interesting$Short.description <- character(nrow(interesting))
    # Activity: EXP/Explanation, REP/Repairs, of technical problems or solve student doubts , MON/Monitor, scan, awareness, QUEST/Ask questions to students and listen to answers, TDT/Task distribution or transitions
    interesting$Activity <- character(nrow(interesting))
    # Social Plane (the plane at which the current activity is done): IND/Individual work, GRP/Pairs or small groups, CLS/Classroom-level
    interesting$Social <- character(nrow(interesting))
    # Focus: FAC/student faces, BAK/student backs, TCOMP/teacher computer, SCOMP/student computer, PROJ/projector, WHIT/whiteboard
    interesting$Focus <- character(nrow(interesting)) 
    
    write.csv(interesting, file=outputfile)
    interesting
}

msToMinSec <- function(millis){
    mins <- floor(millis/60000)
    secs <- (millis - (mins*60000))/1000
    
    string <- paste(mins,"m",as.character(secs),"s",sep="")
    string
}
