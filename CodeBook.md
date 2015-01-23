##Background
The data originated from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#. Here is the overall author summary:
>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

##Variables Used
I decided to use 79 of the 561 data types described above, as specified by the original problem statement(see README.md). Thus we are left the following 81 measurements being used the in final tidy summary output:

* ```activity```: One of six possible activities that were being performed when the data was collected. The are: ```WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING```
* ```subject```: One of 30 possible subjects that were used during the study. These are described as: ```SUBJECT i``` where ```i``` ranges from 1 to 30.

The following measurements are self explanatory as they are averages of the measures in the original dataset. See the data source website for more information.
* ```mean(tBodyAccMeanX)```
* ```mean(tBodyAccMeanY)```
* ```mean(tBodyAccMeanZ)```
* ```mean(tBodyAccStdX)```
* ```mean(tBodyAccStdY)```
* ```mean(tBodyAccStdZ)```
* ```mean(tGravityAccMeanX)```
* ```mean(tGravityAccMeanY)```
* ```mean(tGravityAccMeanZ)```
* ```mean(tGravityAccStdX)```
* ```mean(tGravityAccStdY)```
* ```mean(tBodyAccJerkMeanX)```
* ```mean(tBodyAccJerkMeanY)```
* ```mean(tBodyAccJerkMeanZ)```
* ```mean(tBodyAccJerkStdX)```
* ```mean(tBodyAccJerkStdY)```
* ```mean(tBodyAccJerkStdZ)```
* ```mean(tBodyGyroMeanX)```
* ```mean(tBodyGyroMeanY)```
* ```mean(tBodyGyroMeanZ)```
* ```mean(tBodyGyroStdX)```
* ```mean(tBodyGyroStdY)```
* ```mean(tBodyGyroStdZ)```
* ```mean(tBodyGyroJerkMeanX)```
* ```mean(tBodyGyroJerkMeanY)```
* ```mean(tBodyGyroJerkMeanZ)```
* ```mean(tBodyGyroJerkStdX)```
* ```mean(tBodyGyroJerkStdY)```
* ```mean(tBodyGyroJerkStdZ)```
* ```mean(tBodyAccMagMean)```
* ```mean(tBodyAccMagStd)```
* ```mean(tGravityAccMagMean)```
* ```mean(tGravityAccMagStd)```
* ```mean(tBodyAccJerkMagMean)```
* ```mean(tBodyAccJerkMagStd)```
* ```mean(tBodyGyroMagMean)```
* ```mean(tBodyGyroMagStd)```
* ```mean(tBodyGyroJerkMagMean)```
* ```mean(tBodyGyroJerkMagStd)```
* ```mean(fBodyAccMeanX)```
* ```mean(fBodyAccMeanY)```
* ```mean(fBodyAccMeanZ)```
* ```mean(fBodyAccStdX)```
* ```mean(fBodyAccStdY)```
* ```mean(fBodyAccStdZ)```
* ```mean(fBodyAccMeanFreqX)```
* ```mean(fBodyAccMeanFreqY)```
* ```mean(fBodyAccMeanFreqZ)```
* ```mean(fBodyAccJerkMeanX)```
* ```mean(fBodyAccJerkMeanY)```
* ```mean(fBodyAccJerkMeanZ)```
* ```mean(fBodyAccJerkStdX)```
* ```mean(fBodyAccJerkStdY)```
* ```mean(fBodyAccJerkStdZ)```
* ```mean(fBodyAccJerkMeanFreqX)```
* ```mean(fBodyAccJerkMeanFreqY)```
* ```mean(fBodyAccJerkMeanFreqZ)```
* ```mean(fBodyGyroMeanX)```
* ```mean(fBodyGyroMeanY)```
* ```mean(fBodyGyroMeanZ)```
* ```mean(fBodyGyroStdX)```
* ```mean(fBodyGyroStdY)```
* ```mean(fBodyGyroStdZ)```
* ```mean(fBodyGyroMeanFreqX)```
* ```mean(fBodyGyroMeanFreqY)```
* ```mean(fBodyGyroMeanFreqZ)```
* ```mean(fBodyAccMagMean)```
* ```mean(fBodyAccMagStd)```
* ```mean(fBodyAccMagMeanFreq)```
* ```mean(fBodyBodyAccJerkMagMean)```
* ```mean(fBodyBodyAccJerkMagStd)```
* ```mean(fBodyBodyAccJerkMagMeanFreq)```
* ```mean(fBodyBodyGyroMagMean)```
* ```mean(fBodyBodyGyroMagStd)```
* ```mean(fBodyBodyGyroMagMeanFreq)```
* ```mean(fBodyBodyGyroJerkMagMean)```
* ```mean(fBodyBodyGyroJerkMagStd)```
* ```mean(fBodyBodyGyroJerkMagMeanFreqq)```
