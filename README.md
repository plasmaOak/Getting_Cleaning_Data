# Getting_Cleaning_Data
Coursera Getting and Cleaning Data Course Assignment

This repo contains a run_analysis.R script, which gets and cleans data collected from Samsung Galaxy S accelerometers.
The script first downloads the data, and assigns data frames. Then it merges the training data set with the test data set. It extracts measurements on mean and standard deviation, and labels the data with descriptive variable names. This is all put into a data set called extracted_data. Lastly, it takes the average of each variable for activites and subjects and puts those into a second data set called average_data, and writes it into a txt file called AverageData.txt.    

This repo also contains a code book, CodeBook.md which describes the variables in run_analysis.R
