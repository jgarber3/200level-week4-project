#Load the test  and label raw data set into dataframes
library(readr)
library(data.table)
library(dplyr)

#Set working directory to be where the Samsumg data is
setwd("/Users/jgarber/downloads")

raw_test <- read.csv("./UCI HAR Dataset/test/X_test.txt", header=FALSE, sep="")
test_labels <- read.csv("./UCI HAR Dataset/test/Y_test.txt", header=FALSE, sep="")

#load the train raw data set into a datafromae
raw_train <- read.csv("./UCI HAR Dataset/train/X_train.txt", header=FALSE, sep="")
train_labels <- read.csv("./UCI HAR Dataset/train/Y_train.txt", header=FALSE, sep="")

#Process the raw test and train data
#merge the raw test and train datasets into one.
raw_combined <- rbind(raw_test, raw_train)
labels_combined <- rbind(test_labels, train_labels)

#delete the individual data set frames to free memory once we have the combined dataframes
remove(raw_test)
remove(raw_train)
remove(test_labels)
remove(train_labels)

#load the names of the features/columns into a vector
raw_features <- read.csv("./UCI HAR Dataset/features.txt", header=FALSE, sep="")
#set the column names in the combined table to match the feature names
colnames(raw_combined) <- raw_features[[2]]

#load the names of the activities into a vector
raw_labels <- read.csv("./UCI HAR Dataset/activity_labels.txt", header=FALSE, sep="")
#merge the names of the activites to the people in labels
activities <- merge(labels_combined,raw_labels, by="V1", all.x=TRUE)
names(activities) <- c("activityId","activityDescription")


#subset only the features that are means or standard deviations
mean_and_std <- raw_combined[grep("mean\\(\\)|std\\(\\)", colnames(raw_combined))]

#clean up more memory
remove(raw_combined)
remove(labels_combined)

#join the test data to the labels data 
clean_data <- merge(mean_and_std,activities[2], by="row.names")
clean_data <- select(clean_data, -"Row.names")

#create a dataset with the average of each variable for each person and activity
averages <- clean_data %>% group_by(activityDescription) %>% summarise_all(mean)

write.table(clean_data, "./tidydataoutput.txt", row.name=FALSE)
write.table(averages, "./tidyaverages.txt", row.name=FALSE)
