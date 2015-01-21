---
title: "Scrip discription run_analysis.R"
author: "Remco Ligthart"
date: "Wednesday, January 21, 2015"
output: html_document
---



###This file discribes the functions in and working of "run_analysis.R"

First: the script prints a "what is done" message for every step it finishes.

This script reads the nesscesary data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. It starts by declaring the function "project()" which needs the url of the dataset and the filename for the locally stored zip.

Starting with FUN:project, first the file is downloaded (by FUN:getzipfromweb) and unzipped in ./data. If the file and unzipped folder allready exist this step is skipped with a message sent to console.

After the unzip two dataframes are created by calling FUN:readfilesfromzip containing only the values of the "mean" or "standard deviation" of the every recorded activity.

These dataframes are joined within FUN:project(). Next step is making a group_by variable, which contains "all the subjects and all their activities - making 180 unique rows in this example")

A single file is made with all the "means" of both the meassured "mean" and meassured "standard deviation" by FUN:getmeansp (so we have a single variable per subject-activity combination). 

This file is named using the names stated below, it is saved as "tidydata.csv" in the workingdirectory, and returend as a variable to the global environment named "returndata" by calling (or sourcing) the script.

