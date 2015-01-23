#Coursera Getting and Cleaning Data Course Project

This repository is my submission for the Getting and Cleaning Data Course Project.

##Original Problem Statement
>One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

>Here are the data for the project: 

>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

>You should create one R script called run_analysis.R that does the following. 

>1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

--Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD

##Underlying Assumptions:
* The files ```run_analysis.R``` and ```variables.txt``` will be placed in the parent directory of the data set
* The data set will be named ```UCI HAR Dataset``
* The following packages are installed: ```dplyr``` and ```data.table```

##How to run this file
From the ```R``` command line, source the ```R``` script and then run the function ```run_analysis```

##How the measurements were chosen
The instructions for this project specified that only measurements that were means and stds of each measurement should be included. Thus I selected 79 variables(not counting subject and activity)  from the ```features.txt``` file which pertained to a mean or a std. Measurements 555-561 did contain the word "mean" or "std" but they were angle calculations so I decided to omit these. For a list of the 79 variables see the file ```CodeBook.md```.

##General Overview
The first thing that I did for this project was to decide which measurements to use. Based on the reasoning above, I decided on the total of 81 measurements described in the code book. Once I had done this, I extracted the 79 measurement names from ```features.txt``` and added them to my file ```variables.txt```. I used this file as a dataframe containing my measurement info including columns for:

* The number of the measurement(```colNumber```)
* The original name of the measurement(```feature```)
* The edited name of the measurement for use in the final tidy dataset(```finalName``)

Once I had my measurements defined in this file, I loaded them into my dataset as a data.frame(```features```). 

On lines 13-19 I set about loading the ```X_train.txt, subject_train.txt , y_train.txt, X_test.txt, subject_test.txt,``` and ```y_test.txt``` files into the workspace. The general structure of how these files fit together is best described [here](https://coursera-forum-screenshots.s3.amazonaws.com/ab/a2776024af11e4a69d5576f8bc8459/Slide2.png) (credit to David Hood for providing this figure). Note that I immediately subsetted the ```X_(train|test)``` files on lines 18 and 19 so that we only stored the rows corresponding to the measurements that I decided to keep.

With the data in the workspace I combined training and test data(by row) on lines 25-27. Lines 30-47 are focused on applying better names to the columns and values from the dataset to make everything more readable. Line 50 puts the ```X, y, subject,``` and ```activity``` datasets together into ```mergedDataSet```, satisfying step 4. This ```data.frame``` consists of 10,299 observations of 81 variables.

Finally on line 57 we begin step 5 by grouping ```mergedDataSet``` by the ```subject``` and ```activity``` columns into the ```bySubAct``` ```data.frame```. From here we use ```summary_each``` to create ```tidyDataSet``` which contains the average of each variable for each activity(6 total) and each subject(30 total). Line 69 prints this dataset, consisting of ```6*30 = 180``` observations of 81 variables, to the parent directory as required.

##Why the output forms a tidy dataset
* Each variable is in one column(81 columns corresponding to the 81 variables described in the code book)
* Each different observation of each variable is in a different row(there are 180 possible ```(observation, activity)``` pairs or observations, each one is represented as its own row in the outputted dataset)
