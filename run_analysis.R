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