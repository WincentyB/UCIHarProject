# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each
#    variable for each activity and each subject.


##############
# packages
if (!require("data.table")) {
   install.packages("data.table")
}
require("data.table")
library(data.table)
# library(plyr)

##############
# download file and unzip it
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"HarTest.zip")
unzip("HarTest.zip")

##############
## test data pre-processing
##############
# read test data
fTest <- "./UCI HAR Dataset/test/X_test.txt"
X_test <- read.table(fTest)

# read test labels
fyTest <- "./UCI HAR Dataset/test/Y_test.txt"
Y_test <- read.table(fyTest)

# read test subjects
fsubjectTest <- "./UCI HAR Dataset/test/subject_test.txt"
subject_test <- read.table(fsubjectTest)
names(subject_test) = "subject"

# read columns names
fcolNames <- "./UCI HAR Dataset/features.txt"
colNames <- read.table(fcolNames)[,2]

# only mean and std columns
m_std_colNames <- grepl("mean|std", colNames)

#subset of test data
names(X_test) <- colNames
X_test = X_test[,m_std_colNames]

# set activity labels
factivity_l <-"./UCI HAR Dataset/activity_labels.txt"
activity_l <- read.table(factivity_l)[,2]
Y_test[,2] = activity_l[Y_test[,1]]
names(Y_test) = c("ActivityLabel", "ActivityName")

# merge test column
test_dt <- cbind(as.data.table(subject_test),Y_test,X_test)

##############
## train data pre-processing
# read train data
fTrain <- "./UCI HAR Dataset/train/X_train.txt"
X_train <- read.table(fTrain)

# read train labels
fyTrain <- "./UCI HAR Dataset/train/Y_train.txt"
Y_train <- read.table(fyTrain)

# read train subjects
fsubjectTrain <- "./UCI HAR Dataset/train/subject_train.txt"
subject_train <- read.table(fsubjectTrain)
names(subject_train) = "subject"

#subset of train data
names(X_train) <- colNames
X_train = X_train[,m_std_colNames]

# set activity labels
Y_train[,2] = activity_l[Y_train[,1]]
names(Y_train) = c("ActivityLabel", "ActivityName")

# merge train column
train_dt <- cbind(as.data.table(subject_train),Y_train,X_train)

##############
# merge rows test and train
all_data <- rbind(test_dt,train_dt)

# tidy data
tData <- aggregate(. ~subject + ActivityName, data = all_data, mean)
tData<-tData[order(tData$subject,tData$ActivityLabel),]
write.table(tData, file = "./tidydata.txt",row.name=FALSE)


        
        
        
        