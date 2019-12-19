#Coursera Getting and Cleaning Data Assignment
#Getting and Cleaning Data collected from Samsung Galaxy S accelerometers

#Getting the data and assigning data frames
library(dplyr)
filename <- "Getting_Cleaning_Data_Assignment.zip"

if(!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}

if(!file.exists("UCI HAR Dataset")){
  unzip(filename)
}

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions")) 
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity")) 
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject") 
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions) 
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code") 
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject") 
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions) 
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#Merging the training and test sets into one data set
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merged_data <- cbind(subject, x, y)

#Extracting measurements on mean and standard deviation for each measurement
extracted_data <- merged_data %>% select(subject, code, contains("mean"), contains("std"))

#Using descriptive acitivty names to name the activites in the data set
extracted_data$code <- activities[extracted_data$code, 2]

#Labeling data set with descriptive variable names
names(extracted_data)[2] = "activity"
names(extracted_data) <- gsub("Acc", "Accelerometer", names(extracted_data))
names(extracted_data) <- gsub("Gyro", "Gyroscope", names(extracted_data))
names(extracted_data) <- gsub("BodyBody", "Body", names(extracted_data))
names(extracted_data) <- gsub("Mag", "Magnitude", names(extracted_data))
names(extracted_data) <- gsub("^t", "Time", names(extracted_data))
names(extracted_data) <- gsub("^f", "Frequency", names(extracted_data))
names(extracted_data) <- gsub("tBody", "TimeBody", names(extracted_data))
names(extracted_data) <- gsub("-mean()", "Mean", names(extracted_data), ignore.case = TRUE)
names(extracted_data) <- gsub("-std()", "STD", names(extracted_data), ignore.case = TRUE)
names(extracted_data) <- gsub("-freq()", "Frequency", names(extracted_data), ignore.case = TRUE)
names(extracted_data) <- gsub("angle", "Angle", names(extracted_data))
names(extracted_data) <- gsub("gravity", "Gravity", names(extracted_data))

#Creating a second tidy data set with average of each variable for each activity and subject
average_data <- extracted_data %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean))
write.table(average_data, "AverageData.txt", row.name = FALSE)

average_data
