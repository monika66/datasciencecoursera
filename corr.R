corr <- function(directory, threshold = 0){
#-----------------------------------------------------------------
# Coursera: Data Sciences Specialization - Course 2: R Programming
# Week 2:   Programming Assignment 1: Air Pollution
# Student:  Monika Hunkeler
# Date:     23.04.2017
# Version:  1.0 
#-----------------------------------------------------------------
# The function corr takes a directory of data files and a threshold 
# for complete cases and calculates the correlation between 
# sulfate and nitrate for monitor locations where the number of 
# completely observed cases (on all variables) is greater than 
# the threshold. The function should return a vector of correlations
# for the monitors that meet the threshold requirement. 
# If no monitors meet the threshold requirement, then the function 
# should return a numeric vector of length 0
#
# 'directory' is a character vector of length 1, 
# indicating location of monitor file
#
# 'threshold' is a numeric vector of length 1 indicating the number
# of completely observed observations (on all variables) 
# required to compute the correlation between
# nitrate and sulfate, the default is 0
#
# The function corr returns a numeric vector of correlations. 
#-----------------------------------------------------------------

    corr_data <- data.frame()
    corr_data <- (complete(directory, 1:332))
    monitor <- list.files(directory, full.name = TRUE)
    monitordat <- data.frame()  
    vec_cor <- vector("numeric", length = 332)
    n <- 0

    for (i in 1:332){
        nobs <- corr_data[i,2]
       
        if (nobs > threshold) {
             monitordat  <- read.csv(monitor[i])
             monitordat <- subset(monitordat,(!is.na(sulfate) & !is.na(nitrate))) 	
             vec_sulfate <- monitordat[,2]
 		 vec_nitrate <- monitordat[,3]  
             vec_cor[i] <-  cor(vec_nitrate, vec_sulfate)
             n <- 1
          }       
        else  {      
		vec_cor[i] <-  NA     
          }      
      }
        if (n < 1) {
            vec_cor <- vector("numeric", length = 0)
        }
    good <- complete.cases(vec_cor)
    print(vec_cor[good])
}