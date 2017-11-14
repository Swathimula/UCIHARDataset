### Details of the R script “run_analysis.R”

The file “run_analysis.R” enables getting and cleaning data pertaining to test and tidy sets. 

1.Loads the data files of training and test sets and writes to the data frames “Testset” and “Trainset”, respectively. While writing to the “Testset” and “Trainset” data frames, appropriate labeling of the variables with descriptive names is done. 

2.Merges the training and the test sets to create one data frame called “mergeddata”.

3. From “mergeddata”, extracts only the measurements on the mean and standard deviation for each measurement to create a data frame called “mergeddata2”
 
4.Uses descriptive activity names to name the activities in the data set “mergeddata2”

5.Groups the data in “mergeddata2” based on Subject_ID and Activity to form a data frame called “groupeddata“

6.From the data set “groupeddata”, creates a data frame “summarizeddata” with the average of each variable for each activity and each subject.

7.Writes the tidy data “summarizeddata” to a text file named “tidydata.txt”