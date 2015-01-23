

#My process:
    #Import x_train, subject_train, y_train, x_test, subject_test, y_test
    #Merge x_train and y_test
    #Merge suject_train and subject_train
    #Merge y_train and y_test
    #Apply labels subset from features.txt
    #Make subjects factors
    #Make activities factors using activity_labels

#Not including values 555-561 because they are calculated values that take mean values as a parameter rather than being means of measurements themselves.

require("data.table")
require("dplyr")

run_analysis <- function()
{
    setwd("./UCI HAR Dataset/")
    
    #Loads information from my 'variables' file where I define which rows to use
    features <- read.table("../variables.txt", header=TRUE)
    
    #Loads all of the data sets
    print("Loading Data Sets...")
    subjectTrain <- read.table("./train/subject_train.txt")
    subjectTest <- read.table("./test/subject_test.txt")
    yTrain <- read.table("./train/y_train.txt")
    yTest <- read.table("./test/y_test.txt")
    #subsetting right away to the variables with mead or std in the name
    xTrain <- read.table("./train/X_train.txt")[, features$colNumber]
    xTest <- read.table("./test/X_test.txt")[, features$colNumber]
    print("Done.")
    
    print("Merging, reshaping, and summarizing data")
    
    #Merges the datasets which share columns
    xMerged <- rbind(xTrain, xTest)
    subjectMerged <- rbind(subjectTrain, subjectTest)
    yMerged <- rbind(yTrain, yTest)
    
    #Grabs the final row names as defined in my variables file
    finalRowNames = as.character(features$finalName)
    
    #converts the activity numbers into descriptive names
    activityNames <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
    yMerged[,] <- as.factor(activityNames[yMerged[,]])
    
    #converts the subject numbers into descriptive names
    subjectNames  <- vector(mode = "character", length=30)
    for (i in 1:30)
    {
        subjectNames[i] <- paste("SUBJECT", i, sep=" ")
    }
    subjectMerged[,] <- as.factor(subjectNames[subjectMerged[,]])
    
    #Applies the variable names from the features file
    setnames(xMerged, as.character(features$feature))
    setnames(subjectMerged, "subject")
    setnames(yMerged, "activity")
    
    #Finally puts all the data together
    mergedDataSet <- data.table(cbind(xMerged, subjectMerged, yMerged))
    
    #Cleans up variables that are no longer used
    rm(list=setdiff(ls(), c("mergedDataSet", "finalRowNames")))
    
    #Now that we have the data entirely merged, we can build the desired tidy data set.
    #First we group the data by subject and activity
    bySubAct <- group_by(mergedDataSet, subject, activity)
    
    #Now we get the mean of each of the 79 variables by subject and activity
    tidySummary <- summarise_each(bySubAct, funs(mean))
    
    #Finally we apply the appropriate variable names, completing the tidy dataset
    setnames(tidySummary, c("subject", "activity", finalRowNames))
    
    print("Done")
    
    #Outputs the summary file to the parent directory(i.e. the directory with the run_analysis script)
    print("Outputing summary file")
    write.table(tidySummary, file="../tidySummary.txt", row.name = FALSE)
    print("Done.")
}