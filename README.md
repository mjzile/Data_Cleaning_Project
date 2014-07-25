Getting and Cleaning Data Project
=====================

### Introduction
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The project includes 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

The R script called run_analysis.R  does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Raw Data
The raw data used in this analysis represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data used is located here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


### How the Script works
The run_analysis.R script loads in the accelerometer data which it assumes has been downloaded to the current working directory.  After the data has been loaded, some formatting is done to add labels to the columns and limit it to the mean and standard deviation measures.  Then the data is merged together.  Finally a tidy data table is created and exported.  


### Tidy Data Set
The Tidy Data Set which is outputted is an average of each variable for each activity and each subject.

### Code Book
The Code Book describes the variables, the data, and any transformations and any work  performed to clean up the data. 
