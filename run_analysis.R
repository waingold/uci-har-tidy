library(reshape2)

# Download the compressed dataset to a temporary location.
zipFile <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", zipFile)

# Decompress the dataset to another temporary location.
expansionDir <- tempfile()
unzip(zipFile, exdir = expansionDir)
tidyFile <- paste(getwd(), "UCI HAR Dataset (Tidy).csv", sep = "/")
setwd(paste(expansionDir, "UCI HAR Dataset", sep = "/"))

# Read the activity & feature mappings.
activity_labels <- read.table("activity_labels.txt", col.names = c("ID", "Label"))
features <- read.table("features.txt", col.names = c("Index", "Name"))

# Read & concatenate the observations from the training & test subsets.
readSet <- function(kind, name, colNames) {
    read.table(sprintf("%s/%s_%s.txt", kind, name, kind), col.names = colNames, check.names = F)
}
readMerged <- function(name, colNames) {
    rbind(readSet("test", name, colNames), readSet("train", name, colNames))
}
subject <- readMerged("subject", "Subject")
X <- readMerged("X", features$Name)
y <- readMerged("y", "ActivityID")

# Map activity ID to activity label.
y$Activity <- activity_labels[match(y$ActivityID, activity_labels$ID), "Label"]
# Filter down to just the mean & stddev for each measurement.
filteredX <- X[,grep("(-mean\\(\\)|-std\\(\\))", features$Name)]
# Stitch togther the subject column, activity label column, & measurement vector.
merged <- cbind(subject, Activity = y$Activity, filteredX)

# Group the dataset by subject & activity, aggregating 
melted <- melt(merged, id.vars = c("Subject", "Activity"))
dcasted <- dcast(melted, Subject + Activity ~ variable, mean)

# Write the new dataset and print its location.
write.csv(dcasted, tidyFile, row.names = F)
print(tidyFile)
