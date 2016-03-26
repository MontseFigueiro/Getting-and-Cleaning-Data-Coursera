#Download the dataset
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
data<-download.file(fileUrl, "dataset.zip")

#Unzip the dataset
dataset<-unzip("dataset.zip")

#Read'activity_labels.txt': Links the class labels with their activity name.
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
#'features.txt': List of all features.
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

#We want features: mean and std
featuresmeanstd <- grep(".*mean.*|.*std.*", features[,2])
features.names<-features[featuresmeanstd,2]

#Change the name of the features delete "-mean" by "Mean"
features.names = gsub("-mean", "Mean", features.names)
features.names = gsub("-std", "Std", features.names)
#Delete -()
features.names <- gsub("[-()]", "", features.names)
#Load datasets Train
Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresmeanstd]
Ytrain <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject<- read.table("UCI HAR Dataset/train/subject_train.txt")

#Load datasets Test
Xtest<- read.table("UCI HAR Dataset/test/X_test.txt")[featuresmeanstd]
Ytest<- read.table("UCI HAR Dataset/test/Y_test.txt")
Sub<- read.table("UCI HAR Dataset/test/subject_test.txt")
#Join train datasets and test datasets, firts subject, second activity and the 79 col of Xtrain/Xtest 
train<-cbind(subject,Ytrain,Xtrain)
test<-cbind(Sub,Ytest,Xtest)

#See dim() is the same than the sum dim(Ytest) dim(Xtest) and dim(Sub)
dim(test)
dim(train)
#train 7352 rows and 81 col, test 2947 rows and 81 col

#Merges the training and the test sets to create one data set.
completedata<- rbind(train, test)
dim(completedata)

#Dim(features.names) has 79 names
dim(features.names)

#Put the names of the columns
colnames(completedata)<-c("subject","activity",features.names)
#Change the rows information for "activity" with the names of activityLabels
completedata$activity <- factor(completedata$activity, activityLabels[,1], activityLabels[,2])
completedata$subject <- as.factor(completedata$subject)

#Save the first tidydata1.txt
write.table(completedata, "tidydata1.txt", row.names = FALSE, quote = FALSE)

#creates a second, independent tidy data set with the average of each variable for each activity and each subject.
install.packages("reshape")
library(reshape)
#The melt function takes data in wide format and stacks a set of columns into a single column of data
completedata.melted <- melt(completedata, id = c("subject", "activity"))
dim(completedata.melted)

#the mean for each activity and each subject
install.packages("reshape2")
library(reshape2)
completedata.mean <- dcast(completedata.melted, subject + activity ~ variable, mean)
write.table(completedata.mean, "tidydata2_average.txt", row.names = FALSE, quote = FALSE)