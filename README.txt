README for 200 Level week 4 project
=================================

This project includes source for ingesting and transforming the Samsung telemetry
data into a tidy format for use in analysis.

The Samsung data should exist in a directory with your current working directory in the following
directory structure:

{working_dir}/UCI HAR Dataset/…


Files Included:
========================
README.txt <- this readme file
run_analysis.R <- script the transforms the data
Tidyaverages.txt <- example output data from a successful run of the script
run_analysis.md <-- a markdown file with information on the source data and how it was collected




How the Script Works:
============================

The R script start by loading a set of train and test raw data into two variables.
The raw data has it's column names stored in a separate file and those names are read in
And then join to the raw data.

The fully names raw data set are then merged together into one clean set.

From this set, only the column that include the mean or std from the observations is subsetted out.

A separate file lists the names of the activities that are reference by ID's in the raw data. This file
Is loaded and joined into the raw data so that that activity that each observation describes is easy to understand.

Finally all the cleaned up data is grouped by the activity being performed and averaged across all columns. This final data set is then written to file.


Inline comments are included in the R script that explain where the code is doing each of the steps listed above. 

Markdown File:
=====================================
Please review the markdown file for information on the source data and how it was collected