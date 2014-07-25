

# move into my class directory 
setwd("~/R/Data_Cleaning")

#load activity and features as lists not tables 
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

#find mean and standard deviation features based on the name 
lim_features <- grepl("mean|std", features)

#read in train files
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#name columns 
names(x_train) = features
names(sub_train) = "subject"

#read in test files 
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
sub_test  <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#name columns 
names(x_test) = features
names(sub_test) = "subject"

#limit to mean and std dev features for train and test 
x_train_lim <- x_train[,lim_features]
x_test_lim <- x_test[,lim_features]

#add column with activity name to y tables 
y_test[,2] = activity_labels[y_test[,1]]
y_train[,2] = activity_labels[y_train[,1]]

#label tables 
names(y_test) = c("activity_id", "activity_name")
names(y_train) = c("activity_id", "activity_name")

#put all three tables together for test/train

train_all <- cbind(y_train, x_train_lim, sub_train) 
test_all <- cbind(y_test, x_test_lim, sub_test) 

#merge the test and train tables into one 

merged_data <- rbind(train_all, test_all)


#tidy data section: 

subject_avg <-  aggregate(merged_data, by=list(activity_name_group = merged_data$activity_name, 
                                                subject_group = merged_data$subject), mean)

# remove duplicate columns: 

sub_clean <- cbind(subject_avg[,1:2], subject_avg[,5:83])
write.table (sub_clean, "tidy_data_set.txt", sep="\t")

