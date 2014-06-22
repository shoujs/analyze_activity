trainingData <- read.table("UCI HAR Dataset/train/X_train.txt",  header=F)

testingData <- read.table("UCI HAR Dataset/test/X_test.txt", header=F)

#step 1. merge training and tesing data sets
allData <- rbind(trainingData, testingData)

#step 2. extracts only the measurements on the mean and standard deviation
#read features vector
trainingFeatures <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=F)
names(trainingFeatures) <- c("index", "feature")
#extract mean and std value
trainingFeatures <- trainingFeatures[grepl(".*std\\(\\).*", trainingFeatures$feature) | grepl(".*mean\\(\\).*", trainingFeatures$feature),]
extractedData <- allData[, trainingFeatures$index]

#step 3. use descriptive activity names to name the activities in the data set
trainingActivityValue <- read.table("UCI HAR Dataset/train/y_train.txt")
names(trainingActivityValue) <- c("value")
testingActivityValue <- read.table("UCI HAR Dataset/test/y_test.txt")
names(testingActivityValue) <- c("value")
activityLabel <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activityLabel) <- c("value", "label")
trainingActivityLabelRows <- merge(trainingActivityValue, activityLabel, by.x="value", by.y="value", sort=F)
testingActivityLabelRows <- merge(testingActivityValue, activityLabel, by.x="value", by.y="value", sort=F)
activityLabelCol <- rbind(trainingActivityLabelRows, testingActivityLabelRows)
extractedData <- cbind(extractedData, activityLabelCol$label)

#step 4. label the data set
names(extractedData) <- c(trainingFeatures$feature, "activity")