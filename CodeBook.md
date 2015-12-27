#Code Book for the Course Project file (Tidy.txt)

Raw data, design, objectives and process made to obtain Tidy.txt can be found in README.md file in this repo. 
/rtomasc/GettingCleaningCourseProject.git/README.md

## Dimensions and variables of Tidy.txt
180 rows and 88 columns. No row names. 
For each subject (1-30) and each activity (6 activities), there are 86 mean values. 
These mean values are the means for each mean and standard deviation feature among the 561 features of the (more extense) raw dataset. There are Time domain variables, Frequency domain variables, and angle between two vectors. 
Each variable deriving from 3-axial signals (XYZ), results in 3 variables, indicated here by -XYZ. Each -XYZ means 3 variables: -X, -Y and -Z. 

###Subject. Character.
The subject number (1 to 30).Character.

###Activity. 
Character. 6 different activities: 
  * WALKING
  * WALKING_UPSTAIRS
  * WALKING_DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING

###Mean values. Numeric. 

86 mean values. -XYZ means 3 variables: -X, -Y and -Z.

* TimeBodyAccelerometerMean()-XYZ
* TimeBodyAccelerometerSTD()-XYZ
* TimeGravityAccelerometerMean()-XYZ
* TimeGravityAccelerometerSTD()-XYZ
* TimeBodyAccelerometerJerkMean()-XYZ
* TimeBodyAccelerometerJerkSTD()-XYZ
* TimeBodyGyroscopeMean()-XYZ
* TimeBodyGyroscopeSTD()-XYZ
* TimeBodyGyroscopeJerkMean()-XYZ
* TimeBodyGyroscopeJerkSTD()-XYZ
* TimeBodyAccelerometerMagnitudeMean()
* TimeBodyAccelerometerMagnitudeSTD()
* TimeGravityAccelerometerMagnitudeMean()
* TimeGravityAccelerometerMagnitudeSTD()
* TimeBodyAccelerometerJerkMagnitudeMean()
* TimeBodyAccelerometerJerkMagnitudeSTD()
* TimeBodyGyroscopeMagnitudeMean()
* TimeBodyGyroscopeMagnitudeSTD()
* TimeBodyGyroscopeJerkMagnitudeMean()
* TimeBodyGyroscopeJerkMagnitudeSTD()
* FrequencyBodyAccelerometerMean()-XYZ
* FrequencyBodyAccelerometerSTD()-XYZ
* FrequencyBodyAccelerometerMeanFreq()-XYZ
* FrequencyBodyAccelerometerJerkMean()-XYZ
* FrequencyBodyAccelerometerJerkSTD()-XYZ
* FrequencyBodyAccelerometerJerkMeanFreq()-XYZ
* FrequencyBodyGyroscopeMean()-XYZ
* FrequencyBodyGyroscopeSTD()-XYZ
* FrequencyBodyGyroscopeMeanFreq()-XYZ
* FrequencyBodyAccelerometerMagnitudeMean()
* FrequencyBodyAccelerometerMagnitudeSTD()
* FrequencyBodyAccelerometerMagnitudeMeanFreq()
* FrequencyBodyAccelerometerJerkMagnitudeMean()
* FrequencyBodyAccelerometerJerkMagnitudeSTD()
* FrequencyBodyAccelerometerJerkMagnitudeMeanFreq()
* FrequencyBodyGyroscopeMagnitudeMean()
* FrequencyBodyGyroscopeMagnitudeSTD()
* FrequencyBodyGyroscopeMagnitudeMeanFreq()
* FrequencyBodyGyroscopeJerkMagnitudeMean()
* FrequencyBodyGyroscopeJerkMagnitudeSTD()
* FrequencyBodyGyroscopeJerkMagnitudeMeanFreq()
* Angle(TimeBodyAccelerometerMean,Gravity)
* Angle(TimeBodyAccelerometerJerkMean),GravityMean)
* Angle(TimeBodyGyroscopeMean,GravityMean)
* Angle(TimeBodyGyroscopeJerkMean,GravityMean)
* Angle(X,GravityMean)
* Angle(Y,GravityMean)
* Angle(Z,GravityMean)

