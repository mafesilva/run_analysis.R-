library(reshape2)

# Read all the files, and add names to columns
features_N <- read.table("features.txt", col.names = c("a", "names"))
activities <- read.table("activity_labels.txt", col.names = c("ID", "activity"))

subject_train <- read.table("subject_train.txt", col.names = "subject")
subject_test <- read.table("subject_test.txt", col.names = "subject")
X_train <- read.table("X_train.txt", col.names = features_N$names)
X_test <- read.table("X_test.txt", col.names = features_N$names)
y_train <- read.table("y_train.txt", col.names = "ID")
y_test <- read.table("y_test.txt", col.names = "ID")


# combine and make one dataset
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
data_all <- rbind(train, test)

# Extracts only the measurements on the mean and standard deviation for each measurement
Mean_and_Std <- data_all %>% select(subject, ID, contains("mean"), contains("std"))
# Uses descriptive activity names to name the activities in the data set
Mean_and_Std$ID <- activities[Mean_and_Std$ID, 2]

# Appropriately labels the data set with descriptive activity names
names(Mean_and_Std) <- gsub("Acc", "Accelerometer", names(Mean_and_Std))
names(Mean_and_Std) <- gsub("Gyro", "Gyroscope", names(Mean_and_Std))
names(Mean_and_Std) <- gsub("BodyBody", "Body", names(Mean_and_Std))
names(Mean_and_Std) <- gsub("Mag", "Magnitude", names(Mean_and_Std))
names(Mean_and_Std) <- gsub("^t", "Time", names(Mean_and_Std))
names(Mean_and_Std) <- gsub("^f", "Frequency", names(Mean_and_Std))
names(Mean_and_Std) <- gsub("tBody", "TimeBody", names(Mean_and_Std))

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
TheData <- Mean_and_Std %>% group_by(subject, ID) %>% summarise_all(funs(mean))
write.table(TheData, "CleanData.txt", row.name=FALSE)
