# Getting and Cleaning Data - Project

## Overview

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

## Introduction

The purpose of this project is to demnstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

In the following sections is presented the basic code explanations.

To run the code is necessary to set the working directory on the parent folder of where the data-folder is placed. The downloaded data folder must be unzipped before doing anything. Besides we have to include the R script (run_analysis.R) in the commented parent folder.

## Read the data

The first section of the code will set the directory (change the path according to your workspace) and read the data.

Once the data is read, the code merges the training and test data sets based on X-Y. 

Once the data has been read, we have to proceed to read the subjects files corresponding to training and test data sets and merge as before to one data set (subject_dataset)

## Extract features

In this section we extract the desired features for our customized data set (mean, std).

We filter the data set, which has been merged before (x_dataset) according to the previous features.

## Label Activities

We have to label the numeric activities, so we have to read the features.txt file and bind with the corresponding merged data frame (y_dataset).

## Tidy data set

Once we have the data sets (x,y) correct labeled, the last part of the script will merge both datasets and calculate the average of the measured variables according to the Subject and Activity.

## Exporting results

In this section we export the previous tidy data set to a file named:

tidy_data.txt


The exported file will be saved in the current directory.
 
