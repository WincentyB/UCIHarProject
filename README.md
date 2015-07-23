# Getting and Cleaning Data Course Project

## Peer Assessments

One of the most exciting areas in all of data science right now is wearable computing.
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms
to attract new users. The data linked to from the course website represent data collected
from the accelerometers from the Samsung Galaxy S smartphone. A full description is available
at the site where the data was obtained:  

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

You should create one R script called run_analysis.R that does the following.  

1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.  
3. Uses descriptive activity names to name the activities in the data set  
4. Appropriately labels the data set with descriptive activity names.  
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  


## Original Data Source

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip   

## Files Included in Repository

1. README.md        - general information about project  
2. CodeBook.md      - codebook describing variables, the data and transformations  
3. run_analysis.R   - R script solving this project  
4. tidydata.txt     - tidy data set with the average of each variable for each   activity and each subject  


## project steps

1. Instal and load necessary packages  
2. Download dataset file   
3. Unzip downloded file  
4. Read necessery data   
5. Preprocess the data and merge necessary info to one data.frame  
6. Create and write to the disk tidy data file  

More specific description is included in "CodeBook.md"

## Dependencies
1. Script run_analysis.R installs additional package: data.table; there is test if package is already installed  
2. R shoud be set to working directory  
3. This script is tested only in R studio  



