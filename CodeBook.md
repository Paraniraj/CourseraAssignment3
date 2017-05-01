# Code Book

This document describes the code inside `run_analysis.R`. The code is splitted (by comments) in some sections:

* Prepare Data and assign column name
* Merge Training and Test data
* Extract only mean and standard deviation
* Define Activity description on merged training and test data
* Label data with descriptive variable name
* Create Tidy data set

## Prepare Data and assign column name

Read testing and training dataset files from UCI HAR data set and load to data table. 

Examples:

* UCI HAR Dataset/train/X_train.txt
* UCI HAR Dataset/train/subject_train.txt`
* UCI HAR Dataset/test/X_test.txt
* UCI HAR Dataset/features.txt

Assign Column names for testing and tradining dataset files using the features data available in UCI HAR Dataset/features

Example : 

*   colnames(trainX)<-featureL[,2]

## Merge Training and Test data

Merge testing, training data and subject data

Example : 

*   merge_data<-rbind(merge_train,merge_test)

##  Extract only mean and standard deviation

Extract columns with mean and standard deviation values available in merged data 

## Define Activity description on merged training and test data

Define Activity description on the merged data 

Example 

* merge_mean_std<-merge(merge_mean_std,activityL,by="ActivityID",all.X=TRUE)

## Label data with descriptive variable name

Rename the column name on merged data and replace it with meaningful name

Example
* names(merge_mean_std)<-gsub("Acc", "Accelerometer", names(merge_mean_std))

## Create Tidy data set

Creates tidy data set called "tidydata.txt" and sort it by Activity, Subject and Description. 

Example

*SubjectID	ActivityID	ActivityDesc	timeBodyAccelerometer-mean()-X	timeBodyAccelerometer-mean()-Y
*1	1	WALKING	0.277330759	-0.017383819
*2	1	WALKING	0.276426586	-0.01859492