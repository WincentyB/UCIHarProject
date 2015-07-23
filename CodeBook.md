# CodeBook

Information about the variables  
Information about the summary choices  
Information about the steps in the project  

## The data

Original Data Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
Data description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

Following files was used from data folder:  

main folder:  
- 'features_info.txt': Shows information about the variables used on the feature vector.  
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.  

train folder:  
- 'train/X_train.txt': Training set.  
- 'train/y_train.txt': Training labels.  

test folder:  
- 'test/X_test.txt': Test set.  
- 'test/y_test.txt': Test labels.  

## The variables

Following are the most significant variables used in the r script:  

colNames     - names of columns names from file features.txt  
m_std_colNames    * - columns names restricted to mean and std  
activity_l     - activity names  

X_test     - test data; data frame (row- activity,subject; col - sensors values)  
Y_test     - test activity data; data frame 2 columns( row activity for X_test,  col[1] - activity label, col[2] - activity name)   
subject_test     - test subjects; data frame 1 column (row subject for X_test, col subject label)  
test_dt     - test data with proper column names and subject, activities columns  

X_train     - train data; data frame (row- activity,subject; col - sensors values)    
Y_train     - train activity data; data frame 2 columns( row activity for X_train, col[1] - activity label, col[2] - activity name)  
subject_train     - train subjects; data frame 1 column (row subject for X_train, col subject label)  
train_dt     - train data with proper column names and subject, activities columns  

all_data     - merged test and train data   
tData     - tidy data, aggregated means for activities and subjects  


## Script steps

1. test if data.table package is installed if not install it, load data.table library  
2. download zip file from given URL and unzip file in the working directory  
3. test data pre-processing  
  3.1 read test data from X_test.txt as a data.frame  
  3.2 read test activity labels from Y_test.txt as a data.frame  
  3.3 read test subjects labels from subject_test.txt as a data.frame, and name column as a "subject"  
  3.4 read columns names (for both test and train data) from features.txt as a data.frame, use the names for setting appriopriate columns names in test data         frame  
  3.5 restrict column names only to columns with mean and std  
  3.6 subset test data to the column names with mean and std  
  3.7 read activity names/labels relation (for both test and train data) from  activity_labels.txt as a data.frame  
  3.8 create two columns with activity labels and activity names relative to test data, name the columns: "ActivityLabel", "ActivityName"  
  3.9 merge activities, subjects, and data test  

4. train data pre-processing  
  4.1 read train data from X_train.txt as a data.frame  
  4.2 read train activity labels from Y_train.txt as a data.frame  
  4.3 read train subjects labels from subject_train.txt as a data.frame, and name    column as a "subject"  
  4.4 set appriopriate columns names in train data frame based on the test columns  
  4.5 subset train data to the column names with mean and std  
  4.6 create two columns with activity labels and activity names relative to train  data, name the columns: "ActivityLabel", "ActivityName"  
  4.7 merge activities, subjects, and data train  

5. merge test and train data  
6. aggregate/summarize data using mean function relatively to subject an activity  
7. write result to the file tidydata.txt in the working directory  

