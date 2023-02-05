# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()
# Data Import and Cleaning
raw_df <- read.csv(file = "../data/week3.csv")
raw_df$timeStart <- as.POSIXct(raw_df$timeStart)
raw_df$timeEnd <- as.POSIXct(raw_df$timeEnd)
clean_df <- raw_df[!grepl("2017-06", raw_df$timeEnd),]
clean_df <- clean_df[clean_df$q6 == 1,]

# Analysis
clean_df$timeSpent <- as.numeric(difftime(clean_df$timeEnd, clean_df$timeStart, units = "secs"))
hist(clean_df$timeSpent)
