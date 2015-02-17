# Set working dir where the data folder is
setwd("~/Documents/Online_Courses/Coursera/GettingAndCleaningData/Project/")

# Import data - train
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", quote="\"")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", quote="\"")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", quote="\"")

# Import data - test
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", quote="\"")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", quote="\"")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", quote="\"")


# Merge data

x_dataset <- rbind(x_train, x_test)
y_dataset <- rbind(y_train, y_test)

# create 'subject' data set

subject_dataset <- rbind(subject_train, subject_test)
names(subject_dataset) <- c("Subject")


# Extracts only the measurements on the mean and standard deviation for each measurement

# Get column name from features.txt

features <- read.table("UCI HAR Dataset/features.txt", quote="\"")
filter <- c("mean", "std")

# Name the columns with the respective measured feature
names(x_dataset) <- features$V2

colindex <- grep(paste(filter, collapse = "|"), features$V2)

x_dataset_mean_sd <- x_dataset[, colindex]


# Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", quote="\"")

y_dataset_activity <- cbind(y_dataset, activity_labels[y_dataset[,1],2])
names(y_dataset_activity) <- c("Activity_ID", "Activity")

# Merge the data to tidy data set
library(reshape2)

dataset <- cbind(as.data.table(subject_dataset), y_dataset_activity, x_dataset_mean_sd)

id_columns <- c("Subject", "Activity_ID", "Activity")
measure_labels = setdiff(colnames(dataset), id_columns)


dataset_melt <- melt(dataset, id.vars = id_columns, measure.vars = measure_labels)
tidy_data <- dcast(dataset_melt, Subject + Activity ~ variable, mean)

# Export - write to file the tidy_data 

write.table(tidy_data, file = "./tidy_data.txt", row.name=FALSE)



