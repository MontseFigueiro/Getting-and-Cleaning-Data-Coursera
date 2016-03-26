# Getting-and-Cleaning-Data-Coursera
Getting and Cleaning Data Course Project

The Data for the project is here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This project is for join diferent files in one, there are 6 files with the observations, another file with features and the last with activity_labels. At the end we get a single file with the observations for each subject for each activity, mean and standard deviation, adding the names of the columns found in the file "activity_labels".

"run_analysis.R" file mades:

    Download and unzip the Dataset.zip file.
    Extracts only the measurements on the mean and standard deviation for each measurement.
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names.
    Merges the training and the test sets to create one data set.
    Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

"CodeBook.md" explain:

    Describes the variables, the data, and any transformations or work that you performed to clean up the data

"tidydata1.txt":

    This data.frame has 10299 rows and 81 columns, 79 types of variables with "mean" and "std"
    Extracts only the measurements on the mean and standard deviation for each measurement.
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names
    
"tidydata2_average.txt":

    Independent tidy data set (from tidydata1.txt) with the average of each variable for each activity and each subject. It has 180   
    rows and 81 columns.
