# Coursera Assignment - Getting-and-Cleaning-Data-Course-Project 

## Introduction

This repository contains the R modules associated with Coursera Getting and Cleaning Data project in R. Below are the objects available in the repository.

## Repository Objects

UCI HAR Dataset - Data files downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
* run_analysis.R - R script which contains the data preparation,  manipulation and tidy data set creation logic. 
* CodeBook.md - Outline of run_analysis.R script and tidy data set variable description
* tidydata.txt - Tidy data output based on Coursera project assignment
* README.md - Mark down files to provide high level information on the repository objects. 

## run_Analysis Performs the below
* Merges the training and the test sets to create one data set. :- Load data to table and use command cbind,rbind and combine training and test data sets
* Extracts only the measurements on the mean and standard deviation for each measurement. :- Use grep command to get column indexes for variable name contains "mean()" or "std()"
* Uses descriptive activity names to name the activities in the data set. :- Added new column activity description as factor using merge() and grep()
* Appropriately labels the data set with descriptive variable names. :- Replace with descriptive names using gsub()
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject : - Used aggregate() function and order by to arrange in sequence

## Execution

1. Clone this repo
2. Download the Data set and R script and place it in working directory. 
3. Execute the below commands
* source(run_analysis.R)
* run_analysis()
* head(tidy_data,3)
