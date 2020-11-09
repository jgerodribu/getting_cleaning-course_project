library(reshape2)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "../getting_cleaning-course_project/rawData.zip")
unzip(zipfile = "../getting_cleaning-course_project/rawData.zip")


## 1. Merge data

#train
x_train <- read.table("../getting_cleaning-course_project/UCI HAR Dataset/train/X_train.txt",
                      sep = "")
y_train <- read.table("../getting_cleaning-course_project/UCI HAR Dataset/train/y_train.txt",
                      sep = )
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", sep = "")

#test






        

