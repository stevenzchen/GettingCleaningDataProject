# Generate tidy data sets using the raw UCI HAR dataset
# Steven Chen

# load files from directory
# NOTE: assumes that the data set is within the folder "./UCI HAR Dataset"

subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")

subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")

# connect subject data with label and observation data

trainSet <- cbind(subjectTrain, yTrain, xTrain)
testSet <- cbind(subjectTest, yTest, xTest)

# merge training and testing sets

fullSet <- rbind(trainSet, testSet)

# label dataset with descriptive variable names

featuresRaw <- read.table("UCI HAR Dataset/features.txt", 
                          stringsAsFactors = FALSE)
names(fullSet) <- c("subject", "activity", featuresRaw[[2]])

activitiesRaw <- read.table("UCI HAR Dataset/activity_labels.txt",
                            stringsAsFactors = FALSE)
fullSet$activity <- factor(fullSet$activity)
levels(fullSet$activity) <- activitiesRaw[[2]]
fullSet$subject <- factor(fullSet$subject)

# extract mean and standard deviation measurements
indices <- grepl("mean|Mean|std|Std", names(fullSet))
indices[1] = TRUE
indices[2] = TRUE
firstDataset <- fullSet[, indices]

# generate second dataset with var averages for each activity and subject
secondDataset <- firstDataset %>% 
        group_by_(.dots = lapply(names(firstDataset)[c(1, 2)], as.symbol)) %>%
        summarize_each(funs(mean))
