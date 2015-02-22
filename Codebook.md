## Code Book for Course Project

* Please follow the README file to run the run_analysis R script

* There is a function to "read and rbind" data. This function is called 3 times.
  Once it is done for X_train.txt and X_test.txt. This is placed into a data frme called xs.
  "xs" is a data frame with 10299 instances and 561 attributes.
  Call the function again; this time with Y_train.txt and Y_test.txt. We end up getting a 
  data frame called ys. "ys" is a data frame with 10299 instances and 1 attribute.
  Finally call the function with subject_train.txt and subject_test.txt. We end up getting a 
  data frame called ss. "ss" is a data frame with 10299 instances and 1 attribute.
  We create a list of these 3 data frames.

* The next stage of the script is to read the "features.txt" file.
  We get a data frame with dimensions of 561 x 2. The second column has the names of all the 
  various measurements. We run the grep command twice to find all the "mean" and "standard deviation"
  measurements. The mean measurements are palces into "m". Similarly the standard deviation
  measurements are placed into "s". We do this as we have been asked to extract mean and std only.
  The 2 sets of indices have been combined so as to not transform the original "xs" data frame too much.
  We have a new "xsn" data frame that contains only the required mean and standard deviation measurements.
  "xsn" is a new data frame with 10299 instances and 66 attributes.

* In the R studio environment we can clearly see that out of the 66 atributes in the "xsn" data frame;
  there is a even split of 33 attributes each for mean and standard deviation.
  We give names to the "xsn" data frame with appropriate mean and standard deviation names.

* There are essentially 6 activites;
  walking
  walking upstairs
  walking downstairs
  sitting
  standing
  laying

  The activity labels are read from the "activity_labels.txt" file.
  We give these appropriate activity names to the data set.

* We then use cbind to combine the data into a data frame. This "combined" data frame has 
  10299 rows and 68 columns. This is then written to a text file called "combined_data.txt".
  This is not the final independent tidy data set. The reason this was created was due to the fact that
  the project asks to creat a second, independent tidy data set with the average of each variable
  for each activity and each subject.

* To accomplish the final requirement of the project, we use "ddply" that is part of the "plyr" package.
  The column numbers used in this final step are critical. The correct column indices are from 3 to 68.
  The final independent tidy data set is written to the text file "tidy_data.txt".
  The script will create a "final" data frame with 180 rows. The reason for this number is because we have
  6 activities and 30 subjects.
