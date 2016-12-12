This document describes the tidydata.txt dataset found in this repo.

This dataset is derived from data collected from test subjects using Samsung Galaxy S smartphones, with readings taken from the
accelerometer and gyroscope components.  The data package used to derive this dataset is from the .zip package found at
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and the original data source is at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones .  More detailed information on the original
data source can be found in the documentation in the .zip file.

To derive this tidydata.txt file from the source data from the .zip package, the following transformations were performed:

1.  Separate training and test datasets were combined into a single dataset, and test subject and activity labels were attached to the data.
2.  Only columns containing data on the mean readings or standard deviation readings from each sensor were retained, with all other columns
	discarded.
3.  The data was grouped by test subject and activity name and then summarized to show the mean value of each column for these groupings.
4.  Column names were cleaned to be more readable and understandable, with the general scheme described below.


How the data is layed out
-------------------------
tidydata.txt contains 68 columns and 180 rows.  It includes one row for each combination of testsubject and activityname in the data.  Aside from
these two descriptive columns, the rest of the columns include the mean values for the attribute readouts corresponding to the subject and activity
for each record.

Column naming conventions
-------------------------
General naming is mostly inherited from the source data, though some modification was performed.  The features_info.txt file from the .zip package 
linked above contains a description of the sensor measurements feeding the differenct variable measurements.  The general naming convention for the
attribute fields is as follows:

[t or f] + [Body or Gravity] + [Acc or Gyro] + [(optional) Jerk] + [(optional) Mag] + [mean or std] + [(optional) X or Y or Z]

with:

t or f: time domain signal (t) or frequency domain signal (f)
Body or Gravity: indicates whether the variable corresponds to a body measurement or gravitational measurement
Acc or Gyro: indicates whether the measurement was from the accelerometer (Acc) or the gyroscope (Gyro)
(optional) Jerk: indicates the variable corresponds to a Jerk signal (see referenced documentation)
(optional) Mag: indicates a magnitude measurement of the 3 dimensional signal using a Euclidean norm (see referenced documentation)
mean or std: indicates whether the variable represents the mean or the standard deviation of the specified measurement (note that all values in this
		dataset are means of the underlying fields, so a "std" variable displays the mean of the underlying standard devation measurement for
		a subject-activity combination)
(optional) X or Y or Z: indicates which dimension the variable reading corresponds to (fields without an X, Y, or Z correspond to the magnitude measures
		that calculate a Euclidean norm based on all 3 dimensional readings)

testsubject: the subject - numbered 1 to 30 - from which measurements were taken

activityname: activity being performed while measurements taken (WALKING
, WALKING_UPSTAIRS
, WALKING_DOWNSTAIRS
, SITTING
, STANDING
, LAYING
)


tidydata.txt includes the following columns:

 [1] "testsubject"          "activityname"         "tBodyAccmeanX"        "tBodyAccmeanY"        "tBodyAccmeanZ"       
 [6] "tBodyAccstdX"         "tBodyAccstdY"         "tBodyAccstdZ"         "tGravityAccmeanX"     "tGravityAccmeanY"    
[11] "tGravityAccmeanZ"     "tGravityAccstdX"      "tGravityAccstdY"      "tGravityAccstdZ"      "tBodyAccJerkmeanX"   
[16] "tBodyAccJerkmeanY"    "tBodyAccJerkmeanZ"    "tBodyAccJerkstdX"     "tBodyAccJerkstdY"     "tBodyAccJerkstdZ"    
[21] "tBodyGyromeanX"       "tBodyGyromeanY"       "tBodyGyromeanZ"       "tBodyGyrostdX"        "tBodyGyrostdY"       
[26] "tBodyGyrostdZ"        "tBodyGyroJerkmeanX"   "tBodyGyroJerkmeanY"   "tBodyGyroJerkmeanZ"   "tBodyGyroJerkstdX"   
[31] "tBodyGyroJerkstdY"    "tBodyGyroJerkstdZ"    "tBodyAccMagmean"      "tBodyAccMagstd"       "tGravityAccMagmean"  
[36] "tGravityAccMagstd"    "tBodyAccJerkMagmean"  "tBodyAccJerkMagstd"   "tBodyGyroMagmean"     "tBodyGyroMagstd"     
[41] "tBodyGyroJerkMagmean" "tBodyGyroJerkMagstd"  "fBodyAccmeanX"        "fBodyAccmeanY"        "fBodyAccmeanZ"       
[46] "fBodyAccstdX"         "fBodyAccstdY"         "fBodyAccstdZ"         "fBodyAccJerkmeanX"    "fBodyAccJerkmeanY"   
[51] "fBodyAccJerkmeanZ"    "fBodyAccJerkstdX"     "fBodyAccJerkstdY"     "fBodyAccJerkstdZ"     "fBodyGyromeanX"      
[56] "fBodyGyromeanY"       "fBodyGyromeanZ"       "fBodyGyrostdX"        "fBodyGyrostdY"        "fBodyGyrostdZ"       
[61] "fBodyAccMagmean"      "fBodyAccMagstd"       "fBodyAccJerkMagmean"  "fBodyAccJerkMagstd"   "fBodyGyroMagmean"    
[66] "fBodyGyroMagstd"      "fBodyGyroJerkMagmean" "fBodyGyroJerkMagstd" 