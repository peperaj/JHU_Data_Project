setwd("C:/Users/peper/OneDrive/Documents/Coursera JHU Data Science Specialization/Getting and Cleaning Data/Peer Assignment/JHU_Data_Project")

library(dplyr)

#read in features text file to use as column names for training & test datasets
column.names <- read.table("./data/UCI HAR Dataset/features.txt", col.names = c("featurenumber", "featurename"))


##Create the training dataset

#read in training data, activity labels, and subject label text files
train.data <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names = column.names$featurename)
train.labels <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names = c("activitylabel"))
train.subjects <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names = c("testsubject"))

#combine the labels and data into a single training dataset
training <- cbind(train.subjects, train.labels, train.data)


##Create the test dataset

#read in test data, activity labels, and subject label text files
test.data <- read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names = column.names$featurename)
test.labels <- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names = c("activitylabel"))
test.subjects <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names = c("testsubject"))

#combine the labels and data into a single test dataset
test <- cbind(test.subjects, test.labels, test.data)


##Combine training and test datasets
combine.data <- rbind(training, test)


##Process the combined dataset, subsetting columns, adding activity labels

#create a TRUE/FALSE vector of the column names representing mean or std deviation + subject & label columns
mean.std.ind <- grepl("^testsubject$|^activitylabel$|mean[^Freq]|std", names(combine.data))

#subset the dataset, keeping only mean, std deviation, subject, & label columns
mean.std.data <- combine.data[, mean.std.ind]

#read in activity label names from provided file for attachment to dataset
activity.labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names = c("activitynumber", "activityname"))

#merge activity label names with main dataset
label.data <- merge(mean.std.data, activity.labels, by.x = "activitylabel", by.y = "activitynumber")

#remove activity label code column since we now have the activity name
label.data <- select(label.data, -activitylabel)

#reorder columns so testsubject & activityname are first, followed by the data reading elements
label.data <- label.data[c(1,68,2:67)]


##Create the summarized dataset showing mean readings for each subject & activity

#group the dataset by testsubject & activityname
grouped.data <- group_by(label.data, testsubject, activityname)

#summarize the grouped data, calculating means for all readings
summarydata <- summarize_all(grouped.data, funs(mean))

#clean up the column names by removing periods & duplicate "Body" in names
removeperiods <- gsub("\\.","",names(summarydata))
removedupbody <- gsub("BodyBody", "Body", removeperiods)
names(summarydata) <- removedupbody

write.table(summarydata, "tidydata.txt")
