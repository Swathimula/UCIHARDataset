#Loading the dplyr package
library(dplyr)

#Following are the file paths for the Test data set
subject_test = "subject_test.txt"
X_test = "test/X_test.txt"
Y_test = "test/y_test.txt"

#The file path for the "features.txt" file that contains column names of the test/training data sets 
Features = "features.txt"

#Reading the column names of the test/training data sets from "features.txt". 
#Note that at this step we ensure that we are also appropriately labeling the variables with descriptive names
Features_names = gsub(",",".",gsub("[)(-]","", read.table(Features, stringsAsFactors = FALSE)[,2]))

#Reading the Subject_ID for the test data set 
Subject_ID_Test = read.table(subject_test, col.names = "Subject_ID") 

#Reading the Test set  
TestFeatures = read.table(X_test, col.names =  Features_names)

#Reading the Activity for the test data set  
TestActivity = read.table(Y_test, col.names = "Activity")

#Forming the data frame of the test data set with Subject_ID, Activity and Test set   
Testset = data.frame(Subject_ID,TestActivity,TestFeatures)

#Following are the file paths for the Test data set
subject_train = "train/subject_train.txt"
X_train = "train/X_train.txt"
Y_train = "train/y_train.txt"

#Reading the Subject_ID for the train data set 
Subject_ID_Train = read.table(subject_train, col.names = "Subject_ID") 

#Reading the Test set  
TrainFeatures = read.table(X_train, col.names =  Features_names)

#Reading the Activity for the test data set  
TrainActivity = read.table(Y_train, col.names = "Activity")

#Forming the data frame of the test data set with Subject_ID, Activity and Test set
Trainset = data.frame(Subject_ID_Train,TrainActivity,TrainFeatures)

#Merging the training and the test sets to create one data set
mergeddata = merge(Testset, Trainset, all = TRUE)

#Extracting column names of the measurements on the mean and standard deviation for each measurement
extractcol = grep("([Mm]ean|[Ss]td)", names(mergeddata))

#Extracting only the measurements on the mean and standard deviation for each measurement
mergeddata2 = mergeddata[, c(1,2,extractcol)]

#Using descriptive activity names to name the activities in the data set
mergeddata2 = mutate(mergeddata2, Activity = factor(Activity, labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")))

#Grouping the data based on Subject_ID and Activity
groupeddata = group_by(mergeddata2,Subject_ID,Activity)

#Creating and independent tidy data set with the average of each variable for each activity and each subject.
summarizeddata = summarise_all(groupeddata, .funs = mean)

#The file path/file name where the above independent tidy data will be saved
sdatafile = "tidydata.txt"

#Writing the tidy data at the above file path
write.table(summarizeddata,sdatafile,row.names = FALSE)