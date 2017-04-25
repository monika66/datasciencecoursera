complete <- function(directory, id = 1:332){
#-----------------------------------------------------------------
# Coursera: Data Sciences Specialization - Course 2: R Programming
# Week 2:   Programming Assignment 1: Air Pollution
# Student:  Monika Hunkeler
# Date:     23.04.2017
# Version:  1.0 
#-----------------------------------------------------------------
# The function complete Write a function that reads a directory 
# full of files and reports the number of completely observed cases 
# in each data file. The function should return a data frame where 
# the first column is the name of the file and the second column is 
# the number of complete cases. 
#
# 'directory' is a character vector of length 1, 
# indicating location of monitor file
#
# 'id' is an integer vector 
# indicating the monitor ID numbers
#-----------------------------------------------------------------

    monitor <- list.files(directory, full.name = TRUE)
    monitordat <- data.frame()
    complete_file <- data.frame()
    id2 <- id

    for (i in id2) {
        monitordat  <- read.csv(monitor[i])
        monitordat <- subset(monitordat,(!is.na(sulfate) & !is.na(nitrate)))
        nobs = nrow(monitordat)
        id = i
        complete_case <- data.frame(id, nobs)
        complete_file <- rbind(complete_file, complete_case)     
 }
    print(complete_file) 
}
