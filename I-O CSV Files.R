## CSV File

## Set working directory here.
# Set Working Directory, so that we can open the files
setwd("C:/downloads")

# # load the data through file explorer
CharityFile <- read.csv(file.choose()) 

## Read the CSV File
CharityCSV <- read.csv("charity.csv")          ## sep = ";" (if separated by Colon) - There are lot of options for this command, Refer Help.

## Now that you have read the file, do basic analysis
head(CharityCSV)
tail(CharityCSV)

colnames(CharityCSV)
str(CharityCSV)

## Read the content as data frame
df <- data.frame(CharityCSV)

head(df)
str(df)

## Now that we confirmed the input data, write the data back to keep a backup file, before we do any operation.

## Write the Backup CSV file 
write.csv(df, file = "charitybackup.csv")

## You can visit the directory and check 

