library(dplyr)
library(ggplot2)
test <- read.table("/Volumes/Recovery/ern_soc_eeg/derivatives/segmentation/epochs/sub-1002.tsv",
                   header = T, sep = "\t" )

test <- test %>% group_by(condition, subject, epoch) %>% 
  mutate(trial = 1:sum(!is.na(unique(epoch)))) %>% 
  arrange(epoch)
  filter(grepl('incongr.', condition)) %>% 
          group_by(epoch, condition, subject) %>%
          summarise(mean_amp = mean(FCz)) 

ggplot(test, aes(x = epoch,y = mean_amp, color = condition))+
  geom_bar(stat = 'identity')+
  facet_wrap(~condition, ncol= 4)