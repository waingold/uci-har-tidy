# UCI HAR Dataset (Tidy)

This repository contains the script used to clean & aggregate the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Besides this README file, the repo contains the following:

- `run_analysis.R`.  An R script that implements the cleaning & aggregation.
- `UCI HAR Dataset (Tidy).csv`.  The results of the cleaning & aggregation.
- `CodeBook.md`.  A code book that describes the results.

The R script performs the following steps to achieve the results:

- Download the compressed dataset to a temporary location.
- Decompress the dataset to another temporary location.
- Read the activity & feature mappings from activity_labels.txt & features.txt, respectively.
- Read & concatenate the subjects (`*/subject_*.txt`), activities (`*/y_*.txt`), & measurement vectors (`*/X_*.txt`) from the training & test subsets.
- Map the activitiy IDs to activity labels.
- Filter down the variables to just the mean & stddev for each measurement.
- Stitch together the subject column, activity label column, & measurement vector.
- Group the data by subject & activity, using mean for aggregation.
- Write the new dataset and print its location.
