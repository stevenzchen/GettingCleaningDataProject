# GettingCleaningDataProject

This repository contains the Getting and Cleaning Data course project.

## Files

* **run_analysis.R**: Contains code to read from the UCI HAR Dataset and generate
two dataset variables in the environment, named "firstDataset" and "secondDataset".
The code assumes that the UCI HAR Dataset is within a directory in R's working
directory named "UCI HAR Dataset".

* **firstDataset.txt**: Contains the firstDataset generated by run_analysis.R, with
mean and standard deviation measurements from the training and testing data in
the UCI HAR Dataset. The dataset contains 10,299 observations of subject label,
activity label, and 86 mean/standard deviation variables. See the code book for
more detail on format.

* **secondDataset.txt**: Contains the firstDataset generated by run_analysis.R, with
mean and standard deviation averages from the training and testing data in
the UCI HAR Dataset grouped by subject and activity. The dataset contains 180 observations of subject label,
activity label, and 86 mean/standard deviation average variables. See the code book
for more detail on format. This is the tidy dataset created in step 5 that is uploaded.

* **CodeBook.md**: Provides a description of the dataset, including transformation
information from the original UCI HAR Dataset.
