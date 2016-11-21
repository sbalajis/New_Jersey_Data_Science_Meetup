## Read/Write Excel File

# install.packages(xlsx)
library(xlsx)

## Set working directory here.
# Set Working Directory, so that we can open the files - You should be able to see all the files under "FILES" on the right side pane.
setwd("C:/downloads")

## load the data through file explorer (For short files use xlsx)
Charitydf <- read.xlsx("Charity.xlsx", sheetIndex = 1)   # In sheet you can specifiy how many sheets you want to import.

## If the excel file has 100K+ cells, use xlsx2 instead of xlsx.
Charitydf <- read.xlsx2("Charity.xlsx", sheetIndex = 1)   # In sheet you can specifiy how many sheets you want to import.

## Once you set the dataframe (df), you can use R functions to check. 
head(Charitydf)
tail(Charitydf)

## Write to CharityBackup.xlsx file.
write.xlsx(Charitydf, "CharityBackup.xlsx", sheetName = "Charity", col.names = TRUE)

## Confirm your writing by checking for the file in FILES in the right pane OR by using read_excel function.
read_excel("CharityBackup.xlsx")

#############################################################
## To load excel file with multiple sheets, we can use
#############################################################
Charitydf1 <- read.xlsx2("Charity.xlsx", sheetIndex = 1)
Charitydf2 <- read.xlsx2("Charity.xlsx", sheetIndex = 2)