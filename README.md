# Getting and Cleaning Data – Project readme

## Introduction

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

## Requirements for the assignment

You should create one R script called run\_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variablenames.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Procedure followed:

1. Merging the training and the test sets to create one data set.
  1. Firstly the test data (subject\_test, X\_test and y\_test) was read into R.
  2. The test data was concatenated column wise in the order mentioned above to form a new dataframe named 'test'.
  3. Train data (subject\_test, X\_test and y\_test) was read into R.
  4. The train data was concatenated column wise in the order mentioned above to form a new dataframe named 'train'.
  5. The dataframes 'test' and 'train' were bound along rows to form a new dataframe 'data'.

2. Extracting only the measurements on the mean and standard deviation for each measurement.
  1. Features file was read into R as 'features' dataframe.
  2. The column names for the 'data' dataframe was set. The first two columns had names "volunteer\_id" and "activity\_id" and the rest of the column names were taken from the second row of the 'features' dataframe.
  3. The names of columns which had "mean()" and "std()" were found using the 'grepl' function. Only these columns were transferred to a new dataframe 'reqdata'.

3. Using descriptive activity names to name the activities in the data set
  1. Descriptive activity labels corresponding to the activity numbers were specified in the 'reqdata' dataframe.

4. Appropriately labelling the data set with descriptive variablenames.
  1. In the names of the columns in the 'reqdata' dataframe, all '-' were replaced by '.' And all "()" were removed to make the names descriptive.

5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject.
  1. The dataframe 'melteddata' was created which had the melted form of the 'reqdata' dataframe for the 'volunteer\_id' and 'activity\_id' columns.
  2. Casting was done for the two columns and the resulting dataframe was named 'tidydata'. This dataframe is the required dataframe.