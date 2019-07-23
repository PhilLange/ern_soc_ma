library(dplyr)
setwd("/Users/philipplange/Desktop/analysis_ma/")

#load all files and convert to dataframe
files  <- list.files(pattern = '\\.tsv')
tables <- lapply(files, read.table, header = TRUE, sep = "\t")
behav_data <- do.call(rbind , tables)
 

# round reaction time  to 3 digits
behav_data[,'rt'] <- round(behav_data[,1],3)

# condition as factor
data$condition <- as.factor(data$condition)

uebung <- subset(data,condition == '0')
behav_data <- subset(data,condition != "0")




                          