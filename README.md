# Course-Project-Getting-and-Cleaning-Data
This is the Course Project. From Getting and Cleanind Data

This repository has 3 Files, 

1. README.md describes how the run_analysis.R file works.
2. CodeBook.md,  describing the variables
3. averages_data.txt, shows results of run_analysis.R

The script run_analysis.R works in the below order

* First, we merged the similar variables using the rbind() function. By similar, we address those files having the same number of columns and referring to the same entities.

* Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.

* As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.

* On the whole dataset, those columns with vague column names are corrected.

*Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called averages_data.txt, and uploaded to this repository.
