library(dplyr)
library(plyr)
library(ggplot2)
setwd("/Users/philipplange/Desktop/analysis_ma/behav/")

#load all reaction time files and convert to dataframe
files  <- list.files(pattern = '\\.tsv')
tables <- lapply(files, read.table, header = TRUE, sep = "\t")
behav_data <- do.call(rbind , tables)
 
# round reaction time  to 3 digits
behav_data[,'rt'] <- round(behav_data[,1],3)

#condition as factor
behav_data$condition <- as.factor(behav_data$condition)
#subject as factor
behav_data$subject <- as.factor(behav_data$subject)
setwd("/Users/philipplange/Desktop/analysis_ma/epochs/")

#load all eeg files and convert to dataframe
files  <- list.files(pattern = '\\.tsv')
tables <- lapply(files, read.table, header = TRUE, sep = "\t")
eeg_data <- do.call(dplyr::bind_rows , tables)

# groupy by subject, condition, epoch to compute mean amplitude
eeg_data <- eeg_data %>% group_by(condition, subject, epoch) %>% 
  group_by(epoch, condition, subject) %>%
  summarise(mean_amp_FCz = mean(FCz),
            mean_amo_Cz  = mean(Cz))

#subject as factor
eeg_data$subject <- as.factor(eeg_data$subject)

#arrange both frames in ascending order
eeg_data <- arrange(eeg_data, subject)
behav_data <- arrange(behav_data, subject)

#rename condition variable in eeg data
eeg_data <- eeg_data %>% rename(halp = "condition")

#bind both dataframes
ern_soc <- cbind(eeg_data, behav_data)

#remove subject duplicate
ern_soc <- ern_soc[,-10]

#halp and reaction as factor  as factor
ern_soc$halp <- as.factor(ern_soc$halp)
ern_soc$reaction <-  as.factor(ern_soc$reaction) 

#rename factor levels of reaction
ern_soc$reaction <- revalue(ern_soc$reaction, c("1" = "richtig", "0" = "falsch") ) 

# filter by wrong reactions
wrong_data <- filter(ern_soc, reaction == "falsch") 

#boxplot for mean amp of FCz by condition
ggplot(falsch_data, aes(condition, mean_amp_FCz))+
  geom_boxplot()

