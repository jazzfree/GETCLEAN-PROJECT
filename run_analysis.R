
project <- function(urlzip="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", localzip="getdatapfile.zip"){
  library(plyr)
  library(dplyr)
  library(stringr)
  library(data.table) #not used but i keep it here for reference (data.table creates the option of using fread, have yet to find out how to use it.)
  ##discription of dataset http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  print("first thing is downloading the file")
  filedone <- getzipfromweb(urlzip, localzip)
  
  ##combine 3 files in dir to one df
  testdata <- readfilesfromzip(testrain="test")
  print("testdata from folder test read into variable testdata")
  traindata <- readfilesfromzip(testrain="train")
  print("traindata from folder train read into variable traindatadata")
  ##join the two df´s
  datafromzip <- rbind(testdata, traindata)
  print("both files joined into datafromzip")
  datagroups <- arrange(unique(datafromzip[, 1:2]), activity)
  print("grouping file made (datagroups)")
  ##return whole df.
  tidydata <- getmeansp(datafromzip, datagroups)
  print("created the tidy dataset, grouped on datagroups")
  addname <- names(tidydata)[-(1:2)]
  names(tidydata)[-(1:2)] <- paste(addname, "colMean", sep="-")
  print("fixed names")
  return(tidydata)
}

getzipfromweb <- function(urlzip, localzip, localdir="./data"){
  
  if(!file.exists(localdir)){dir.create(localdir)}
  fileUrl <- urlzip
  localfile <- paste(localdir, localzip, sep = "/")
  ##only download if localfile does not yet exist.
  if(!file.exists(localfile)){ 
  download.file(fileUrl, destfile=localfile)
  unzip(localfile, exdir=localdir)
  }
  else{
    print("file allready downloaded in ./data using files in ./data/UCI HAR Dataset/")
    return()
  }
  ##text printed if  file is downloaded this session
  print("zip dowloaded in ./data and extracted in ./data/UCI HAR Dataset")
  return()
  
}

readfilesfromzip <- function(filesdir="./data/UCI HAR Dataset", testrain="test"){
  ##create vector of filenames
  filenames <- paste(filesdir, testrain, dir(paste(filesdir, testrain , sep="/"), pattern="\\.txt$"), sep="/")
  ##read all files with extension .txt
  data <- lapply(filenames, read.table)
  ##read data from `homezip´ dir with different colnames
  namesfeat <- read.table(paste(filesdir, "features.txt", sep = "/"))
  ismeanstd <- cbind(namesfeat, test=str_sub(namesfeat[,2], -5), selectname = paste(namesfeat[,1], namesfeat[,2], sep = "-"))
  settoget <- filter(ismeanstd, test == "std()" | test == "ean()")
  
  ##name columns
  names(data[[2]]) <- paste(namesfeat[,1], namesfeat[,2], sep = "-")
  names(data[[1]]) <- "subjectno"
  names(data[[3]]) <- "activity"
  ##full join 3 files based on nothing else than `each measure should be on the simmilar row in all files´.
  flatdata <- cbind(data[[3]], data[[1]], data[[2]])
  flatdata$subjectno <- as.factor(flatdata$subjectno )
  flatdata$activity <- factor(flatdata$activity,  labels=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")) 
  ##then only select the `settoget´ columns and 
  flatdata <- subset(flatdata, select = c("subjectno", "activity", as.vector(settoget[, 4])))
  ##and it is done - return only relevant columns.
  flatdata <- tbl_df(flatdata)
  return(flatdata)
}

getmeansp <- function(inputdataframe, inputgroups){
  
  #create list containing dataframes of means by subject by activiy
  inputdataframe.m <- by(inputdataframe[,-c(1:2)], inputdataframe[, (1:2)], FUN=colMeans)
  #create datafram from that list
  inputdataframe.md <- ldply(inputdataframe.m)
  #bind the columns containing subject number and activity names.
  inputdataframe.clean <- cbind(inputgroups, inputdataframe.md)
  #return the tidy set containing means of the values.
  return(inputdataframe.clean)
}
returndata <- project()
write.csv(returndata, "tidydata.csv")
print("output saved as ./tidydata.csv in workingdir")
print("data.frame added to global environment named returndata")
return(returndata)
detach("package:plyr")
detach("package:dplyr")
detach("package:stringr")
detach("package:data.table")