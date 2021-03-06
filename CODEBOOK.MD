---
title: "Codebook run_analysis"
author: "Remco Ligthart"
date: "Wednesday, January 21, 2015"
output: html_document
---
###Org codebook
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

###Simple codebook
'data.frame':  180 obs. of  20 variables:
 $ subjectno                              : Factor w/ 30 levels "1", "2", "3", etc. values 1, 2, 3, etc.
 $ activity                               : Factor w/ 6 levels
                                                1 "WALKING"
                                                2 "WALKING_UPSTAIRS"
                                                3 "WALKING_DOWNSTAIRS"
                                                4 "SITTING"
                                                5 "STANDING"
                                                6 "LAYING"

All other variables are means of the means or std (standard deviations) from all the different measurements in the original file.
The variables refer to the original variable by its original number seperated by a "-" and the name of that variable in the original codebook. It always has the suffix "-colMean" to make clear that it is NOT the original value of the mean but a aggragate.
 $ 201-tBodyAccMag-mean()-colMean         : num  -0.2904 -0.3121 -0.0981 -0.1274 -0.1022 ...
 $ 202-tBodyAccMag-std()-colMean          : num  -0.423 -0.528 -0.379 -0.186 -0.237 ...
 $ 214-tGravityAccMag-mean()-colMean      : num  -0.2904 -0.3121 -0.0981 -0.1274 -0.1022 ...
 $ 215-tGravityAccMag-std()-colMean       : num  -0.423 -0.528 -0.379 -0.186 -0.237 ...
 $ 227-tBodyAccJerkMag-mean()-colMean     : num  -0.281 -0.367 -0.204 -0.133 -0.144 ...
 $ 228-tBodyAccJerkMag-std()-colMean      : num  -0.1642 -0.3169 -0.3171 0.0376 -0.0203 ...
 $ 240-tBodyGyroMag-mean()-colMean        : num  -0.447 -0.498 -0.295 -0.156 -0.356 ...
 $ 241-tBodyGyroMag-std()-colMean         : num  -0.553 -0.553 -0.49 -0.402 -0.413 ...
 $ 253-tBodyGyroJerkMag-mean()-colMean    : num  -0.548 -0.681 -0.51 -0.44 -0.517 ...
 $ 254-tBodyGyroJerkMag-std()-colMean     : num  -0.558 -0.73 -0.6 -0.501 -0.549 ...
 $ 503-fBodyAccMag-mean()-colMean         : num  -0.324 -0.451 -0.319 -0.093 -0.153 ...
 $ 504-fBodyAccMag-std()-colMean          : num  -0.577 -0.651 -0.514 -0.37 -0.409 ...
 $ 516-fBodyBodyAccJerkMag-mean()-colMean : num  -0.1691 -0.3186 -0.3169 0.0205 -0.0299 ...
 $ 517-fBodyBodyAccJerkMag-std()-colMean  : num  -0.1641 -0.3205 -0.3223 0.0502 -0.014 ...
 $ 529-fBodyBodyGyroMag-mean()-colMean    : num  -0.531 -0.609 -0.514 -0.413 -0.443 ...
 $ 530-fBodyBodyGyroMag-std()-colMean     : num  -0.652 -0.594 -0.563 -0.5 -0.495 ...
 $ 542-fBodyBodyGyroJerkMag-mean()-colMean: num  -0.583 -0.724 -0.603 -0.515 -0.561 ...
 $ 543-fBodyBodyGyroJerkMag-std()-colMean : num  -0.558 -0.758 -0.624 -0.518 -0.565 ...
