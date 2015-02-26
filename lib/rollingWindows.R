

# We get the number of values over a value in a rolling window with the parameters set when calling the function (everything in ms)
# Returns a data frame with the time of each window (halfway point of each window) and the mean of the points within that window
# times and values should have the same length
rollingLong <- function(times,values,window,slide,inittime=min(times),threshold=500){
    

    
    endtime <- inittime+window
    
    rolllong <- data.frame(time=numeric(), value=numeric())
    
    # We calculate the window at least once
    repeat{
        
        tim <- inittime + (window/2)
        
        val <- sum(times >= inittime & times <= endtime & values > threshold)
        
        if(nrow(rolllong)==0) rolllong <- data.frame(time=tim,value=val)
        else rolllong <- rbind(rolllong,c(time=tim,value=val))
        
        inittime <- inittime+slide
        endtime <- endtime+slide
        
        if(endtime >= max(times)){
            break  
        } 
        
    }
    
    rolllong
    
}


# We get the mean over a rolling window with the parameters set when calling the function (everything in ms)
# Returns a data frame with the time of each window (halfway point of each window) and the mean of the points within that window
# times and values should have the same length
rollingMean <- function(times,values,window,slide,inittime=min(times)){
    
    endtime <- inittime+window
    
    rollmean <- data.frame(time=numeric(), value=numeric())
    
    repeat{
        
        tim <- inittime + (window/2)
        
        val <- mean(values[times >= inittime & times <= endtime])
        
        if(nrow(rollmean)==0) rollmean <- data.frame(time=tim,value=val)
        else rollmean <- rbind(rollmean,c(time=tim,value=val))
        
        inittime <- inittime+slide
        endtime <- endtime+slide
        
        if(endtime >= max(times)){
            break  
        } 
        
    }
    
    rollmean
    
}

# We get the PD mean over a rolling window with the parameters set when calling the function (everything in ms)
# Returns a data frame with the time of each window (halfway point of each window) and the mean of the points within that window
# times and values should have the same length
rollingSd <- function(times,values,window,slide,inittime=min(times)){
    
    endtime <- inittime+window
    
    rollsd <- data.frame(time=numeric(), value=numeric())
    
    repeat{
        
        tim <- inittime + (window/2)
        
        val <- sd(values[times >= inittime & times <= endtime])
        
        if(nrow(rollsd)==0) rollsd <- data.frame(time=tim,value=val)
        else rollsd <- rbind(rollsd,c(time=tim,value=val))
        
        inittime <- inittime+slide
        endtime <- endtime+slide
        
        if(endtime >= max(times)){
            break  
        } 
        
    }
    
    rollsd
    
}