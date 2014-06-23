Code Book
================
This repo is to merge to data sets(training, tesing data) to a tidy data set. Calcuate the average of the variables by the subject and activity pairs.

The program follows the steps:

1. merge training and tesing data sets, the data sets are named as `trainingData` and `testingData`.
2. extracts only the measurements on the mean and standard deviation. Use function `grepl` to filter out the mean and std variables. Save data set to `extractedData`.
3. use descriptive activity names to name the activities in the data set. Merge data set with activity labels.
4. label the data set. Then name for the new column created on step 3 is `activity`.
5. create a second data set with the average of each variable for each activity and each subject. use function `aggregate` to calcuate the value for each pair.