# the plyr library is needed for ddply

library(plyr)

# function to read 2 files into tables and row bind the 2 tables 
read_and_bind <- function(f1, f2) {
        r1 <- read.table(f1)
        r2 <- read.table(f2)
        b <- rbind(r1,r2)
        b
}

# appropriately call the funtion to read and bind
xs <- read_and_bind("train//X_train.txt", "test//X_test.txt")
ys <- read_and_bind("train//y_train.txt", "test//y_test.txt")
ss <- read_and_bind("train//subject_train.txt", "test//subject_test.txt")

# create a list
list(x=xs, y=ys, subject=ss)

# read the features
features <- read.table("features.txt")

# extract data that is a mean
m <- grep("-mean\\(\\)", features[, 2])
m1 <- c(m)

# extract data that is a standard deviation
s <- grep("-std\\(\\)", features[, 2])
s1 <- c(s)

# create a sorted set of indices
c1 <- c(m1,s1)
c2 <- sort(c1)

# extract appropriate data using the mean and std indices
xsn <- xs[,c2]

# add names
names(xsn) <- features[c2, 2]

# read the activity labels
activities <- read.table("activity_labels.txt")

# associate an activity with each observation
ys[,1] = activities[ys[,1], 2]

# give the first 2 columns appropriate names
names(ys) <- "activity"
names(ss) <- "subject"

# combine into one data set

combined <- cbind(ss, ys, xsn)
write.table(combined,"combined_data.txt", row.names = FALSE)

# use ddply to obtain the final tidy data
final <- ddply(combined, .(subject, activity), function(x) colMeans(x[,3:68]))
write.table(final,"tidy_data.txt", row.names = FALSE)

