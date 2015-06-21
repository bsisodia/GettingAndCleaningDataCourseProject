# Getting And Cleaning Data Course Project
This repo is for my submission of 'Getting and Cleaning Data' Course Project. The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
It is having 3 files:

1. **run_analysis.R**: It is the main script to generate the tidy data as required. 
2. **CodeBook.md**: It is code book that describes the variables, the data, and any transformations or work that I performed to clean up the data
3. **README.md**: This explains how all of the scripts work and how they are connected

##About various functions of run_analysis.R to generate tidy data set 
1. **mergedata**: It is merging all the training and test data into one data set. It checks if rows and cols during rbind and cbind are matching to avoid any issue.
2. **filterMeanStdWithLabels**: It is filtering out all other data and keeping only those which are for mean() and std(). It is also adding Labels to all the columns. 
3. **addDescriptiveActivityNames**: It is adding descriptive names for activity IDs.
4. **generateTidyDataset**: It is generating the independent tidy data set with the average of each variable for each activity and each subject. It is storing the tidy dataset in the parent directory of 'UCI HAR Dataset'. The output filename is 'tidyDataSet.txt'
5. **performCleaningData**: This is the wrapper function which calls other functions as mentioned above.

##How to run the script
1. Change working dir to location where you have *UCI HAR Dataset*
2. Source run_analysis.R by mentioning complete path if it is not in current dir
3. Call performCleaningData function
```r
tidy<-performCleaningData()
```
4. Do a quick check with following commands:
  * Quick dimension check  
```r
dim(tidy)
[1] 180  68
```
  * Quick head check
```r
head(tidy[,1:5],12)
   subject           activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z
1        1             LAYING         0.2215982      -0.040513953        -0.1132036
2        1            SITTING         0.2612376      -0.001308288        -0.1045442
3        1           STANDING         0.2789176      -0.016137590        -0.1106018
4        1            WALKING         0.2773308      -0.017383819        -0.1111481
5        1 WALKING_DOWNSTAIRS         0.2891883      -0.009918505        -0.1075662
6        1   WALKING_UPSTAIRS         0.2554617      -0.023953149        -0.0973020
7        2             LAYING         0.2813734      -0.018158740        -0.1072456
8        2            SITTING         0.2770874      -0.015687994        -0.1092183
9        2           STANDING         0.2779115      -0.018420827        -0.1059085
10       2            WALKING         0.2764266      -0.018594920        -0.1055004
11       2 WALKING_DOWNSTAIRS         0.2776153      -0.022661416        -0.1168129
12       2   WALKING_UPSTAIRS         0.2471648      -0.021412113        -0.1525139
```

  * Quick tail check
```r
tail(tidy[,1:5],12)
    subject           activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z
169      29             LAYING         0.2872952      -0.017196548       -0.10946207
170      29            SITTING         0.2771800      -0.016630680       -0.11041182
171      29           STANDING         0.2779651      -0.017260587       -0.10865907
172      29            WALKING         0.2719999      -0.016291560       -0.10663243
173      29 WALKING_DOWNSTAIRS         0.2931404      -0.014941215       -0.09813400
174      29   WALKING_UPSTAIRS         0.2654231      -0.029946531       -0.11800059
175      30             LAYING         0.2810339      -0.019449410       -0.10365815
176      30            SITTING         0.2683361      -0.008047313       -0.09951545
177      30           STANDING         0.2771127      -0.017016389       -0.10875621
178      30            WALKING         0.2764068      -0.017588039       -0.09862471
179      30 WALKING_DOWNSTAIRS         0.2831906      -0.017438390       -0.09997814
180      30   WALKING_UPSTAIRS         0.2714156      -0.025331170       -0.12469749
```
