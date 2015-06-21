#Code Book for Getting and Cleaning Data Course Project
This is code book for **'Getting and Cleaning Data'** Course Project. It describes the variables, the data, and any transformations or work that was performed to clean up the data.




## About Data Features
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

1. tBodyAcc-XYZ
1. tGravityAcc-XYZ
1. tBodyAccJerk-XYZ
1. tBodyGyro-XYZ
1. tBodyGyroJerk-XYZ
1. tBodyAccMag
1. tGravityAccMag
1. tBodyAccJerkMag
1. tBodyGyroMag
1. tBodyGyroJerkMag
1. fBodyAcc-XYZ
1. fBodyAccJerk-XYZ
1. fBodyGyro-XYZ
1. fBodyAccMag
1. fBodyAccJerkMag
1. fBodyGyroMag
1. fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

1. mean(): Mean value
1. std(): Standard deviation

##Transformations: About various functions of run_analysis.R to generate tidy data set 
1. **mergedata**: It is merging all the training and test data into one data set. It checks if rows and cols during rbind and cbind are matching to avoid any issue. 
2. **filterMeanStdWithLabels**: It is filtering out all other data and keeping only those which are for mean() and std(). It is also adding Labels to all the columns. 
3. **addDescriptiveActivityNames**: It is adding descriptive names for activity IDs.
4. **generateTidyDataset**: It is generating the independent tidy data set with the average of each variable for each activity and each subject. It is storing the tidy dataset in the parent directory of 'UCI HAR Dataset'. The output filename is 'tidyDataSet.txt'
5. **performCleaningData**: This is the wrapper function which calls other functions as mentioned above.

Transformation was done to find **average of each variable for each activity and each subject**

##Final Feature List 
The complete list of variables in tidyDataSet.txt :


| Variables           | Description    | 
| ------------------- | ---------------| 
| subject  | Subject IDs 1 to 30  | 
| activity | Activity labels :  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  |   
| tBodyAcc-mean()-X |  Average Mean of body acceleration signals in X direction |          
| tBodyAcc-mean()-Y |  Average Mean of body acceleration signals in Y direction |
| tBodyAcc-mean()-Z |  Average Mean of body acceleration signals in Z direction |
| tBodyAcc-std()-X |  Average Standard Deviation of body acceleration signals in X direction |     
| tBodyAcc-std()-Y |  Average Standard Deviation of body acceleration signals in Y direction |            
| tBodyAcc-std()-Z |  Average Standard Deviation of body acceleration signals in Z direction |           
| tGravityAcc-mean()-X | Average Mean of gravity acceleration signals in X direction  |       
| tGravityAcc-mean()-Y | Average Mean of gravity acceleration signals in Y direction  |        
| tGravityAcc-mean()-Z | Average Mean of gravity acceleration signals in Z direction  |        
| tGravityAcc-std()-X | Average Standard Deviation of gravity acceleration signals in X direction  |        
| tGravityAcc-std()-Y | Average Standard Deviation of gravity acceleration signals in Y direction  |
| tGravityAcc-std()-Z | Average Standard Deviation of gravity acceleration signals in Z direction  |
| tBodyAccJerk-mean()-X | Average Mean of body acceleration Jerk signals in X direction   |      
| tBodyAccJerk-mean()-Y | Average Mean of body acceleration Jerk signals in Y direction  |
| tBodyAccJerk-mean()-Z  | Average Mean of body acceleration Jerk signals in Z direction  |       
| tBodyAccJerk-std()-X | Average Standard Deviation of body acceleration Jerk signals in X direction  |      
| tBodyAccJerk-std()-Y | Average Standard Deviation of body acceleration Jerk signals in Y direction   |
| tBodyAccJerk-std()-Z |  Average Standard Deviation of body acceleration Jerk signals in Z direction |
| tBodyGyro-mean()-X |  Average Mean of body Gyro signals in X direction |
| tBodyGyro-mean()-Y |  Average Mean of body Gyro signals in Y direction |          
| tBodyGyro-mean()-Z | Average Mean of body Gyro signals in Z direction  |          
| tBodyGyro-std()-X | Average Standard Deviation of body Gyro signals in X direction  |     
| tBodyGyro-std()-Y | Average Standard Deviation of body Gyro signals in Y direction  |           
| tBodyGyro-std()-Z  | Average Standard Deviation of body Gyro signals in Z direction   |           
| tBodyGyroJerk-mean()-X | Average Mean of body jerk Gyro signals in X direction | 
| tBodyGyroJerk-mean()-Y | Average Mean of body jerk Gyro signals in Y direction  |
| tBodyGyroJerk-mean()-Z | Average Mean of body jerk Gyro signals in Z direction   |      
| tBodyGyroJerk-std()-X | Average Standard Deviation of body jerk Gyro signals in X direction  |      
| tBodyGyroJerk-std()-Y | Average Standard Deviation of body jerk Gyro signals in Y direction  |       
| tBodyGyroJerk-std()-Z | Average Standard Deviation of body jerk Gyro signals in Z direction  |
| tBodyAccMag-mean() | Average Mean of body acceleration signals magnitude |         
| tBodyAccMag-std() |  Average Standard Deviation of body acceleration signals magnitude |           
| tGravityAccMag-mean() | Average Mean of gravity acceleration signals magnitude  |       
| tGravityAccMag-std() |  Average Standard Deviation of gravity acceleration signals magnitude |       
| tBodyAccJerkMag-mean() | Average Mean of body acceleration jerk signals magnitude  |
| tBodyAccJerkMag-std()  |  Average Standard Deviation of body acceleration jerk signals magnitude |       
| tBodyGyroMag-mean() | Average Mean of body gyro signals magnitude  |        
| tBodyGyroMag-std() | Average Standard Deviation of body gyro signals magnitude  |
| tBodyGyroJerkMag-mean() | Average Mean of body jerk gyro signals magnitude  |     
| tBodyGyroJerkMag-std() | Average Standard Deviation of body jerk gyro signals magnitude  |    
| fBodyAcc-mean()-X | Average mean of FFT body acceleration signals in X direction |           
| fBodyAcc-mean()-Y | Average mean of FFT body acceleration signals in Y direction   |
| fBodyAcc-mean()-Z | Average mean of FFT body acceleration signals in Z direction   |          
| fBodyAcc-std()-X |  Average Standard Deviation of FFT body acceleration signals in X direction  |
| fBodyAcc-std()-Y |  Average Standard Deviation of FFT body acceleration signals in Y direction  |
| fBodyAcc-std()-Z |  Average Standard Deviation of FFT body acceleration signals in Z direction  |           
| fBodyAccJerk-mean()-X | Average mean of FFT body acceleration jerk signals in X direction   |
| fBodyAccJerk-mean()-Y | Average mean of FFT body acceleration jerk signals in Y direction  |
| fBodyAccJerk-mean()-Z | Average mean of FFT body acceleration jerk signals in Z direction  |     
| fBodyAccJerk-std()-X |  Average Standard Deviation of FFT body acceleration jerk signals in X direction |
| fBodyAccJerk-std()-Y |  Average Standard Deviation of FFT body acceleration jerk signals in Y direction |        
| fBodyAccJerk-std()-Z |  Average Standard Deviation of FFT body acceleration jerk signals in Z direction |       
| fBodyGyro-mean()-X | Average mean of FFT body acceleration gyro signals in X direction   |
| fBodyGyro-mean()-Y | Average mean of FFT body acceleration gyro signals in Y direction  |
| fBodyGyro-mean()-Z | Average mean of FFT body acceleration gyro signals in Z direction  |         
| fBodyGyro-std()-X  | Average Standard Deviation of FFT body acceleration gyro signals in X direction  |          
| fBodyGyro-std()-Y  | Average Standard Deviation of FFT body acceleration gyro signals in Y direction  |           
| fBodyGyro-std()-Z |  Average Standard Deviation of FFT body acceleration gyro signals in Z direction |          
| fBodyAccMag-mean() | Average mean of FFT body acceleration magnitude   |         
| fBodyAccMag-std() | Average Standard Deviation of FFT body acceleration magnitude  |          
| fBodyBodyAccJerkMag-mean() | Average mean of FFT body acceleration jerk magnitude  |
| fBodyBodyAccJerkMag-std() | Average Standard Deviation of FFT body acceleration jerk magnitude  |
| fBodyBodyGyroMag-mean() | Average mean of FFT body gyro magnitude  |     
| fBodyBodyGyroMag-std() |  Average Standard Deviation of FFT body gyro magnitude |     
| fBodyBodyGyroJerkMag-mean() | Average mean of FFT body gyro jerk magnitude  | 
| fBodyBodyGyroJerkMag-std()  | Average Standard Deviation of FFT body gyro jerk magnitude  |