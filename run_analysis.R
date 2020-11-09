library(reshape2)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "../getting_cleaning-course_project/rawData.zip")
unzip(zipfile = "../getting_cleaning-course_project/rawData.zip")


features <- read.table(paste("../getting_cleaning-course_project/UCI HAR Dataset/features.txt",
                            sep = ""))
activities <- read.table(paste("../getting_cleaning-course_project/UCI HAR Dataset/activity_labels.txt",
                          sep = ""))

## 1. Merge data

#train
df_train <- read.table("../getting_cleaning-course_project/UCI HAR Dataset/train/X_train.txt",
                      sep = "")
y_train <- read.table("../getting_cleaning-course_project/UCI HAR Dataset/train/y_train.txt",
                      sep = )
subject_train <- read.table("../getting_cleaning-course_project/UCI HAR Dataset/train/subject_train.txt",
                            sep = "")

colnames(df_train ) <- features$V2
df_train$activity <- y_train$V1
df_train$subject <- factor(subject_train$V1)



#test
df_test <- read.table("../getting_cleaning-course_project/UCI HAR Dataset/test/X_test.txt",
                     sep = "")
y_test <- read.table("../getting_cleaning-course_project/UCI HAR Dataset/test/y_test.txt",
                     sep = "")
subject_test <- read.table("../getting_cleaning-course_project/UCI HAR Dataset/test/subject_test.txt",
                           sep = "")

colnames(df_test) <- features$V2
df_test$activity <- y_test$V1
df_test$subject <- factor(subject_test$V1) 


df <- rbind(df_train, df_test)

## 2. Measurements

Col.Names <- colnames(df)
Col.Names.filtered <- grep("std\\(\\)|mean\\(\\)|activity|subject",
                           Col.Names, 
                           value=TRUE)
df.filtered <- df[,Col.Names.filtered]

## 3. Descriptive activity names

df.filtered$activitylabel <- factor(df.filtered$activity, 
                                         labels= c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))



## 4. Already done in the 1 step


## 5


features.colnames = grep("std\\(\\)|mean\\(\\)", Col.Names, value=TRUE)
df.melt <-melt(df.filtered, id = c("activitylabel", "subject"), measure.vars = features.colnames)
df.tidy <- dcast(df.melt, activitylabel + subject ~ variable, mean)

write.table(df.tidy, file = "../getting_cleaning-course_project/tidy_data.text", row.names = F)




        

