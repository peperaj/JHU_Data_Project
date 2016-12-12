# JHU_Data_Project
Peer Graded Assignment for Coursera JHU course on Getting and Cleaning Data
---------------------------------------------------------------------------

This repo contains the following files:

1.  tidydata.txt
2.  CodeBook.md
3.  run_analysis.R

The purpose of the repo is to fulfill the requirements of the peer graded assignment
for the Coursera JHU course on Getting and Cleaning data.  The assignment description
is at https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project .

The project involves the production of a tidy dataset derived from data obtained from the
accelerometer and gyroscope of Samsung Galaxy S smartphones from a group of test subjects.
The original data source is http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones .
Data for this project was derived from a .zip package provided with the assignment, which can
be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .

About these files
-----------------

tidydata.txt is the tidy dataset required in item 5 of the Peer Graded assignment
description, which displays the average readings for each of the variables, with the
averages shown for each subject in the study and each activity being performed.

CodeBook.md describes the tidydata.txt dataset, including information on the layout and
variable naming scheme.  It also includes a description of how the dataset was derived
from the source data.

run_analysis.R is the R script used to transform the source data obtained from the .zip
package described above into the final tidydata.txt file included in the repo.
