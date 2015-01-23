#Coursera Getting and Cleaning Data Course Project

#My process:
    #Import x_train, subject_train, y_train, x_test, subject_test, y_test
    #Merge x_train and y_test
    #Merge suject_train and subject_train
    #Merge y_train and y_test
    #Apply labels subset from features.txt
    #Make subjects factors
    #Make activities factors using activity_labels

#Not including values 555-561 because they are calculated values that take mean values as a parameter rather than being means of measurements themselves.