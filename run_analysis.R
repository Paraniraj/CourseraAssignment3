run_analysis <- function()
{
  
  ## Read raw data and assign to data table
  
  testX<-read.table("UCI HAR Dataset/test/X_test.txt")
  testY<-read.table("UCI HAR Dataset/test/Y_test.txt")
  testS<-read.table("UCI HAR Dataset/test/subject_test.txt")
  trainX<-read.table("UCI HAR Dataset/train/X_train.txt")
  trainY<-read.table("UCI HAR Dataset/train/Y_train.txt")
  trainS<-read.table("UCI HAR Dataset/train/subject_train.txt")
  activityL<-read.table("UCI HAR Dataset/activity_labels.txt")
  featureL<-read.table("UCI HAR Dataset/features.txt")
  
  ## Assign Column Names
  
  colnames(testX)<-featureL[,2]
  colnames(testY)<-"ActivityID"
  colnames(testS)<-"SubjectID"
  colnames(trainX)<-featureL[,2]
  colnames(trainY)<-"ActivityID"
  colnames(trainS)<-"SubjectID"
  colnames(activityL)<-c("ActivityID","ActivityDesc")
  
  ## 1.  Merges the training and the test sets to create one data set.
  
  merge_test<-cbind(testS,testY,testX)
  merge_train<-cbind(trainS,trainY,trainX)
  merge_data<-rbind(merge_train,merge_test)
  
  ## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  
  colNames<-colnames(merge_data)
  merge_mean_std<-cbind(merge_data[grepl("SubjectID",colNames)],merge_data[grepl("ActivityID",colNames)],merge_data[grepl("mean\\(\\)",colNames)], merge_data[grepl("std\\(\\)",colNames)])
  
  ## 3. Uses descriptive activity names to name the activities in the data set
  
  merge_mean_std<-merge(merge_mean_std,activityL,by="ActivityID",all.X=TRUE)
  
  ## 4. Appropriately labels the data set with descriptive variable names. 
  
  colNames<-colnames(merge_mean_std)
  names(merge_mean_std)<-gsub("^t", "time", names(merge_mean_std))
  names(merge_mean_std)<-gsub("^f", "frequency", names(merge_mean_std))
  names(merge_mean_std)<-gsub("Acc", "Accelerometer", names(merge_mean_std))
  names(merge_mean_std)<-gsub("Gyro", "Gyroscope", names(merge_mean_std))
  names(merge_mean_std)<-gsub("Mag", "Magnitude", names(merge_mean_std))
  names(merge_mean_std)<-gsub("BodyBody", "Body", names(merge_mean_std))
  
  ## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
  tidy_data<-aggregate(. ~SubjectID + ActivityID + ActivityDesc, merge_mean_std, mean)
  tidy_data<-tidy_data[order(tidy_data$ActivityID,tidy_data$SubjectID,tidy_data$ActivityDesc),]
  write.table(tidy_data,file="tidydata.txt", row.name=FALSE)
  
}
