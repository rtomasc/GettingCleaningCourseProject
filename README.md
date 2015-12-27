# Getting&Cleaning CourseProject

##Introduction

This Course Project is based on the "Human Activity Recognition Using Smartphones Dataset", Version 1.0, available in: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The "README.txt" file provided with the dataset explains the study design and how data were processed and organized in several txt files

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

##Objective
Create one R script called run_analysis.R that does the following. 
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Results
The script "run_analysis.R" can be found in the current repo, with comments for each part. 

###PART 0. 
Downloads the zip file, loads libraries and gets data from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
Taking a look at the file names in Dataset.zip, we get the file names to extract them. Not all the files are extracted: according to the README.txt file, files in "Inertial Signals" directories are not needed. Train (for 21 subjects) and test (for 9 subjects) datasets are organized in 3 files each: subject, activity and features (measurements themselves). Files must be merged to obtain the complete dataset (step 1). These 6 files, along with activity labels (activity_labels.txt) and feature names (features.txt) files, are extracted. 

### PART 1
Adding test+train datasets we obtain 3 complete files for all the 30 subjects: subject, activity and features. 
We name the features dataset columns using the dataset got from features.txt. 
We add activity and subject as additional columns to features.
The result is the "completeData" dataset.

###PART 2
Extracts only the column numbers of the mean or std of each measurement("mean" and "std" in variable names).
Te result is the "extractedData" dataset, with 10299 rows and 88 variables (86 mean and standard deviation for each measurement,  Subject -subject number- and Activity -activity code-.

###PART 3 
The variable Activity is renamed with activity names from the activityLabels dataset (6 activities)

###PART 4
Labels the data set columns with more descriptive variable names. The result is the "extractedData" dataset with new variable names. 

###PART 5 
From "extractedData" creates a second, independent tidy data set with the average of each variable, 
for each activity and each subject (considered as factors).
The result is the "tidyData" dataset, with 180 rows (30 subjects * 6 activities) and 88 columns (subject, activity, and 86 mean values, one for each measurement. 
The tidyData dataset is written in a txt file: Tidy.txt. 









