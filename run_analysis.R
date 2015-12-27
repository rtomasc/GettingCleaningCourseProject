#PART 0. Downloading the zip file, loading libraries and getting data

#FileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(FileUrl, destfile="Dataset.zip")
#downloaded<-date()
# Look at the file names in Dataset.zip. Get the file names to extract them. 
#unzip("Dataset.zip", files=NULL,list=TRUE )
#unzip("Dataset.zip", files="UCI HAR Dataset/test/X_test.txt") 
#unzip("Dataset.zip", files="UCI HAR Dataset/train/X_train.txt")
#unzip("Dataset.zip", files="UCI HAR Dataset/test/Y_test.txt") 
#unzip("Dataset.zip", files="UCI HAR Dataset/train/Y_train.txt")
#unzip("Dataset.zip", files="UCI HAR Dataset/activity_labels.txt")
#unzip("Dataset.zip", files="UCI HAR Dataset/test/subject_test.txt")
#unzip("Dataset.zip", files="UCI HAR Dataset/features.txt")
#unzip("Dataset.zip", files="UCI HAR Dataset/train/subject_train.txt")

#Loading libraries
library(data.table)
library(dplyr)

#Reading variable names for features(measurements) and activity labels
featureNames <- read.table("UCI HAR Dataset/features.txt")
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

#Reading 2 datasets: train (21 subjects) and test (9 subjects). 
#Each dataset is splitted into subject, activity and features (measurements), same length each
#Reading train data
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
activityTrain <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
featuresTrain <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
#Read test data
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activityTest <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
featuresTest <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)

#PART 1 - Merge the training and the test sets to create one data set for each: subject, activity and features
#Get featureNames as column names for features, and adding the 3 datasets in one dataset (completeData)
subject <- rbind(subjectTrain, subjectTest)
activity <- rbind(activityTrain, activityTest)
features <- rbind(featuresTrain, featuresTest)

#Name the column names from the features file in variable featureNames
colnames(features) <- t(featureNames[2])

#Add activity and subject as a column to features
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
completeData <- cbind(features,activity,subject)


#PART 2 - Extracts only the column numbers of the mean or std of each measurement("mean" and "std" in variable names).
#Adds Activity and Subject columns
columnsWithMeanSTD <- grep(".*Mean.*|.*Std.*", names(completeData), ignore.case=TRUE)
#Look at the number of variables in completeData
dim(completeData)
#building a vector with the required columns numbers, adding Activity and Subject columns  (the last 2 columns) 
requiredColumns <- c(columnsWithMeanSTD, 562, 563)
#extracting the required columns
extractedData <- completeData[,requiredColumns]
#Look at the number of variables in extractedData
dim(extractedData)

#PART 3 - Renaming variable Activity with activity names from activityLabels dataset (6 activities)
extractedData$Activity <- as.character(extractedData$Activity)
for (i in 1:6){
  extractedData$Activity[extractedData$Activity == i] <- as.character(activityLabels[i,2])
}
#Set the activity variable in the data as a factor
extractedData$Activity <- as.factor(extractedData$Activity)

#PART 4 - Appropriately labelling the data set with more descriptive variable names.
#Look at variable names
names(extractedData)
#Acc to be replaced with Accelerometer
#Gyro to be replaced with Gyroscope
#BodyBody to be replaced with Body
#Mag to be replaced with Magnitude
#Character 'f' to be replaced with Frequency
#Character 't' to be replaced with Time
#-mean() to be replaced with Mean
#-std() to be replaced with STD
#-freq() to be replaced with Frequency
#-angle to be replaced with Angle
#gravity to be replaced with Gravity
names(extractedData)<-gsub("Acc", "Accelerometer", names(extractedData))
names(extractedData)<-gsub("Gyro", "Gyroscope", names(extractedData))
names(extractedData)<-gsub("BodyBody", "Body", names(extractedData))
names(extractedData)<-gsub("Mag", "Magnitude", names(extractedData))
names(extractedData)<-gsub("^t", "Time", names(extractedData))
names(extractedData)<-gsub("^f", "Frequency", names(extractedData))
names(extractedData)<-gsub("tBody", "TimeBody", names(extractedData))
names(extractedData)<-gsub("-mean()", "Mean", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("-std()", "STD", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("-freq()", "Frequency", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("angle", "Angle", names(extractedData))
names(extractedData)<-gsub("gravity", "Gravity", names(extractedData))
#Look at new resulting variable names
names(extractedData)

#PART 5 - From the data set in step 4, creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject.
#Set the subject variable in the data as a factor. Activity is already a factor (PART 3)
extractedData$Subject <- as.factor(extractedData$Subject)
extractedData <- data.table(extractedData)
#Create tidyData as a set with average for each activity and subject
tidyData <- aggregate(. ~Subject + Activity, extractedData, mean)
#Order tidayData according to subject and activity
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]
#Writing tidyData into a text file
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)

#Making a txt with variable names. to be used in the CodeBook
write.table(tidyData_variables, file = "CodeBook.txt", row.names = FALSE)
