# CodeBook
This is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

## The data source
Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip \
Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## The data
**The dataset includes the following files:**

* README.txt
* features_info.txt: Shows information about the variables used on the feature vector.
* features.txt: List of all features.
* activity_labels.txt: Links the class labels with their activity name.
* X_train.txt: Training set.
* y_train.txt: Training labels.
* X_test.txt: Test set.
* y_test.txt: Test labels.
* subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* total_acc_x_train.txt: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
* body_acc_x_train.txt: The body acceleration signal obtained by subtracting the gravity from the total acceleration.
* body_gyro_x_train.txt: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## Transformation details
**There are 5 parts:**

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set  
* Appropriately labels the data set with descriptive activity names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**How run_analysis.R implements the above steps:** 
* Require reshapre2 and data.table librareis.
* Load both test and train data
* Load the features and activity labels.
* Extract the mean and standard deviation column names and data.
* Process the data. There are two parts processing test and train data respectively.
* Merge data set.
