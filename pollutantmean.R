pollutantmean <- function(directory, pollutant, id = 1:332){
#-----------------------------------------------------------------
# Coursera: Data Sciences Specialization - Course 2: R Programming
# Week 2:   Programming Assignment 1: Air Pollution
# Student:  Monika Hunkeler
# Date:     23.04.2017
# Version:  1.0 
#----------------------------------------------------------------
# The function 'pollutantmean' calculates the mean (not rounded) 
# of a pollutant (sulfate or nitrate) across a specified list of 
# monitor data files
#
# 'directory' is a character vector of length 1, 
# indicating location of monitor file
#
# 'pollutant' is a character vector of length 1,
# value either "sulfate" or "nitrate"
# indicating the name of the pollutant
# 
# 'id' is a integer vector
# indicating all monitor list
#-----------------------------------------------------------------

    monitor <- list.files(directory, full.names = TRUE)
    monitordat <- data.frame()

    for (i in id) {
        monitordat <- rbind(monitordat,read.csv(monitor[i]))
    }
    
        mean(monitordat[, pollutant], na.rm=TRUE)
}