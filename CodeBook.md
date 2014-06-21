# UCI HAR Dataset (Tidy)

This dataset represents an aggregation of the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Study design

The raw data for this study was downloaded from [this location](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) as part of the course project for the [Getting and Cleaning Data](https://www.coursera.org/course/getdata) course hosted at [Coursera](http://www.coursera.org).

## Code book

This dataset consists of a single table of 180 observations.  Each obersvation includes the following variables:

- `Subject`.  The subject who performed the activity, an integer ID ranging from 1 to 30.
- `Activity`.  The activity being performed, a categorical variable drawn from {LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS}.
- A 66-feature vector of variables with names of the form *signal*-*function*[-*axis*].  Examples: `tBodyAcc-mean()-X` & `tGravityAccMag-std()`.
   - Consult the [original study](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) for detailed information regarding these variables.
   - Each value represents the mean of the associated variable aggregated over all observations for the given subject & activity.
