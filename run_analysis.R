#Getting and Cleaning Data Course Project
#Downloading the file
link <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file(link, destfile = "dataset.zip")
#unzip
unzip("dataset.zip")

X_test <- read.table("~/UCI HAR Dataset/test/X_test.txt", header = F)
Xtest <- as.data.frame(X_test)
dim(Xtest)

features <- read.table("~/UCI HAR Dataset/features.txt", header = F)
features <- as.data.frame(features)

X_train <- read.table("~/UCI HAR Dataset/train/X_train.txt", header = F)
Xtrain <- as.data.frame(X_train)
dim(Xtrain)

ytrain <- read.table("~/UCI HAR Dataset/train/y_train.txt", header = F)
ytrain <- as.data.frame(ytrain)

y_test <- read.table("~/UCI HAR Dataset/test/y_test.txt", header = F)
ytest <- as.data.frame(y_test)

stest <- read.table("~/UCI HAR Dataset/subject_test.txt", header = F)
stest <- as.data.frame(stest)

strain <- read.table("~/UCI HAR Dataset/subject_train.txt", header = F)
strain <- as.data.frame(strain)




#/*****************************************************************
# Step 1. Merges the training and the test sets to create one data set.
# create 'x' data set
x_data <- rbind(x_train, x_test)

# create 'y' data set
y_data <- rbind(y_train, y_test)

# create 'subject' data set
subject_data <- rbind(strain, stest)



data <- cbind(x_data,y_data)

#***************************************************
# Step 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

mean_and_std <- grep("-(mean|std)\\(\\)", features$V2)
lmean_and_std <- length(grep("-(mean|std)\\(\\)", features$V2))

x_data <- x_data[, mean_and_std]
dim(x_data)


#****************************************************
#Step 3. Uses descriptive activity names to name the activities in the data set
activity <- read.table("activity_labels.txt", sep = "")

y_data[,1] <- activity[y_data[,1],2]

names(y_data) <- "activity"




#****************************************************
#Step 4.  Appropriately labels the data set with descriptive variable names


mean_and_std_names <- grep("-(mean|std)\\(\\)", features$V2, value = TRUE)


names(x_data) <- mean_and_std_names

names(subject_data) <- "subject"

data <- cbind(x_data, y_data, subject_data)


#******************************************************
#Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


averages_data <- ddply(data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "averages_data.txt", row.name=FALSE)
head(averages_data )
averages_data$subject[176]
View(averages_data)
