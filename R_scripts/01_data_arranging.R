library(dplyr)
library(ggplot2)
library(psych)
library(car)

# === 1) get behavioural data =============================
setwd("/Users/philipplange/Desktop/analysis_ma/behav/")

#load all reaction time files and convert to dataframe
files  <- list.files(pattern = '\\.tsv')
tables <- lapply(files, read.table, header = TRUE, sep = "\t")
behav_data <- do.call(dplyr::bind_rows, tables)
 
# round reaction time  to 3 digits
behav_data[,'rt'] <- round(behav_data[, 'rt'], 3)

#condition as int
behav_data$condition <- as.integer(behav_data$condition)
#subject as int
behav_data$subject <- as.integer(behav_data$subject)
# add epoch column
behav_data <- behav_data %>% 
  group_by(subject) %>%
  mutate(epoch = (1:sum(!is.na(rt))-1))


# === 2) get eeg data ==========================================
setwd("/Users/philipplange/Desktop/analysis_ma/epochs/")

#load all eeg files and convert to dataframe
files  <- list.files(pattern = '\\.tsv')
tables <- lapply(files, read.table, 
                 header = T, 
                 sep = "\t",
                 colClasses = c('numeric', 'numeric',
                                'character', 
                                'numeric', 'numeric'))
eeg_data <- do.call(dplyr::bind_rows, tables)

# groupy by subject, condition, epoch to compute mean amplitude
eeg_data <- eeg_data %>% 
  group_by(epoch, condition, subject) %>%
  dplyr::summarise(mean_amp_FCz = mean(FCz),
            mean_amp_Cz  = mean(Cz)) %>%
  arrange(subject, epoch)


# === 3) check number of eppchs and index ======================
n_eeg_epochs <- xtabs(data = eeg_data, ~ subject)
n_behav_epochs <- xtabs(data = behav_data, ~ subject)
n_eeg_epochs == n_behav_epochs

# === 4) merge ======================
# subject as factor
eeg_data$subject <- as.integer(eeg_data$subject)
eeg_data$epoch <- as.integer(eeg_data$epoch)

eeg_data <- data.frame(eeg_data)
names(eeg_data)[2] <- 'halp'

# bind both dataframes
ern_soc <- merge(eeg_data, behav_data, c('subject', 'epoch')) 


# eeg_soc <- eeg_data %>% rename(halp = "condition")
ern_soc$flanker <- as.factor(ern_soc$flanker)
ern_soc$halp <-  ern_soc$halp %>% as.factor()
ern_soc$reaction <- ern_soc$reaction %>% as.factor()
ern_soc$condition <-  as.factor(ern_soc$condition)
ern_soc <- ern_soc %>% 
  dplyr::rename(id = subject)

table <- ern_soc %>% 
  group_by(halp, condition) %>% 
  dplyr::summarise(mean_rt = mean(rt),
                   mean_FcZ = mean(mean_amp_FCz))




# wrong_answ$condition <- as.factor(wrong_answ$condition)
# ggplot(wrong_answ, aes(x = condition, y = mean_amp_FCz))+
#   geom_violin()
# 
# mod <- lm(mean_amp_FCz ~ condition, data = wrong_answ)
# anova(mod)
# mod2 <- aov(mean_amp_FCz ~ condition, data = wrong_answ)
# TukeyHSD(mod2)
