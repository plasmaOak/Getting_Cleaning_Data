filename: The name of folder to download the data into 
fileURL: The link to download the data from 

features: data set from features.txt
activites: data set from activites.txt
subject_test: data set from subject_test.txt
x_test: data set from x_test.txt
y_test: data set from y_test.txt
subject_train: data set from subject_train.txt
x_train: data set from x_train.txt
y_train: data set from y_train.txt

x: data set merged from x_train and x_test
y: data set merged from y_train and y_test
subject: data set merged from subject_train and subject_test
merged_data: data set merged from x,y and subject

extracted_data: measurement on mean and standard deviation extracted from merged_data

average_data: average of each variable for each activity and subject taken fom extracted_data
