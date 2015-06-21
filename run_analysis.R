#Merges the training and the test sets to create one data set.
#############################################################################################
#1. mergedata function merges the various training and test data sets into one single data set
#############################################################################################
mergedata<-function(directory) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files UCI HAR Dataset
  
  ## Read training data set
  subject_train<-read.table(file.path(directory,"UCI HAR Dataset/train/subject_train.txt"))
  activity_train<-read.table(file.path(directory,"UCI HAR Dataset/train/Y_train.txt"))
  set_train<-read.table(file.path(directory,"UCI HAR Dataset/train/X_train.txt"))
  
  ## Read test data set
  subject_test<-read.table(file.path(directory,"UCI HAR Dataset/test/subject_test.txt"))
  activity_test<-read.table(file.path(directory,"UCI HAR Dataset/test/Y_test.txt"))
  set_test<-read.table(file.path(directory,"UCI HAR Dataset/test/X_test.txt"))
  
  #Ensure that subject,data and activity have same number of rows
  # create one data set for training
  if(nrow(subject_train)==nrow(set_train) & nrow(set_train)==nrow(activity_train)) {
      training_dat<-cbind(subject_train,activity_train,set_train)
  } else {
      print("Mismatch training data sets for col bind")
  }
  
  # create one data set for test
  if(nrow(subject_test)==nrow(set_test) & nrow(set_test)==nrow(activity_test)) {
    testing_dat<-cbind(subject_test,activity_test,set_test)
  } else {
    print("Mismatch test data sets for col bind")
  }
  
  #Ensure that training and test data are having same number of columns
  if(ncol(training_dat)==ncol(testing_dat)) {
    combined_dat<-rbind(training_dat,testing_dat)
  } else {
    print("Mismatch data sets for row bind")
  }
  combined_dat
}
#######################################################################################
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#4. Appropriately labels the data set with descriptive variable names. 
#######################################################################################

filterMeanStdWithLabels<-function(directory,training_test_data){
   featureNames <-read.table(file.path(directory,"UCI HAR Dataset/features.txt"))[,2]
   meanCols<-grep("mean()",featureNames,fixed=T)
   stdCols<-grep("std()",featureNames,fixed=T)
   selectCols<-sort(c(meanCols,stdCols))
   mean_std_data<-training_test_data[,c(1:2,selectCols+2)]
   # Set Column Names
   colnames(mean_std_data)<-c("subject","activity",as.character(featureNames[selectCols]))
   mean_std_data
}

#######################################################################################
#3. Uses descriptive activity names to name the activities in the data set
#######################################################################################
addDescriptiveActivityNames <-function(directory,training_test_data){
  activityNames <-read.table(file.path(directory,"UCI HAR Dataset/activity_labels.txt"))
  training_test_data[,2]<-activityNames[training_test_data[,2],2]
  training_test_data
}

#######################################################################################
#4.Appropriately labels the data set with descriptive variable names. 
# Already done in Step2
#######################################################################################

#######################################################################################
#5From the data set in step 4, creates a second, independent tidy data set with the 
#average of each variable for each activity and each subject.
#######################################################################################
generateTidyDataset<-function(directory,training_test_data){
  library(dplyr)
  g <- group_by(training_test_data, subject, activity)
  tidyDataSet <- as.data.frame(summarise_each(g, funs(mean)))
  write.table(tidyDataSet, file=file.path(directory,"tidyDataSet.txt"), row.names=F)
  tidyDataSet
}
#######################################################################################
#Combine all the functions and perform end to end activities 
#######################################################################################

performCleaningData<-function(directory="."){
#1. Merges the training and the test sets to create one data set.
    dat<-mergedata(directory)
    
#2  Extracts only the measurements on the mean and standard deviation for each measurement. 
#4   Appropriately labels the data set with descriptive variable names. 
    dat<-filterMeanStdWithLabels(directory,dat)

#3  Uses descriptive activity names to name the activities in the data set
    dat<-addDescriptiveActivityNames(directory,dat)
#5 Generate tidy data set with the average of each variable for each activity and each subject.
    generateTidyDataset(directory,dat)
  
}

