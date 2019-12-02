library(dplyr)
library(Hmisc) # cut2
library(car)
library(stats)
library(lme4)
library(lmerTest)
library(psycho)
library(report)

mydata <- ern_soc
mydata <- mydata %>% arrange(id, w_block, epoch) %>%
  dplyr::filter(grepl(halp, pattern = "orrect incongr.")) %>%
  dplyr::group_by(condition, id, halp, w_block) %>%
  dplyr::summarise(amp_fcz = mean(mean_amp_FCz),
            amp_cz  = mean(mean_amp_Cz)) %>%
  dplyr::arrange(id, condition, w_block) %>%
  dplyr::group_by(id, condition, w_block) %>%
  dplyr::mutate(d_ern_fcz = ifelse(grepl(halp, pattern = "Incorrect"), amp_fcz-lag(amp_fcz), NA),
         d_ern_cz  = ifelse(grepl(halp, pattern = "Incorrect"), amp_cz-lag(amp_cz), NA)) %>%
  dplyr::filter(!is.na(d_ern_fcz),
         !is.na(d_ern_cz))

mydata <- merge(mydata, survey, "id")


#mydata$flanker <- as.factor(mydata$flanker)
mydata$condition <- as.factor(mydata$condition)
mydata$SD01 <- as.factor(mydata$SD01)
mydata$SD07 <- as.factor(mydata$SD07)
mydata$SD09_01 <- as.factor(mydata$SD09_01)

mydata <- filter(mydata, condition != "0") 
ern_soc <- filter(ern_soc, condition != "0")
mydata$w_block <-  as.factor(mydata$w_block)
mydata$first <- as.factor(mydata$first)
ern_soc$condition <- as.factor(ern_soc$condition)

ern_soc <- merge(ern_soc, survey, "id")
ern_soc <- mutate(ern_soc, spsc = sps - mean(sps),
                 bdic = bdi - mean(bdi),
                 DESc = DES - mean(DES),
                 scc  = sc  - mean(sc),
                 neuroc  = neuro - mean(neuro),
                 affilc  = affil - mean(affil),
                 extrac  = extra - mean(extra),
                 maec   = mae   -  mean(mae[1238:30390]))
ern_soc$id <- as.factor(ern_soc$id)

setwd("/Users/philipplange/Desktop/analysis_ma/")

stimmung <- read.csv("stimmung.csv", header = T, sep = ";")
stimmung$condition <- as.factor(stimmung$condition)

mydata <- merge(mydata, stimmung, by = c("id", "condition"))
ern_soc$id <- as.factor(ern_soc$id)


ern_soc <-  merge(ern_soc, stimmung, by = c("id", "condition"))
library(plyr)
mydata$condition <- plyr::revalue(mydata$condition, c("1"="Neutral", "2"="Negativ", "3" = "Positiv"))
ern_soc$condition <- plyr::revalue(ern_soc$condition, c("1"="Neutral", "2"="Negativ", "3" = "Positiv"))
ern_soc$reaction <- plyr::revalue(ern_soc$reaction, c("1"="Korrekt", "0"="Fehler"))
ern_soc$flanker <- plyr::revalue(ern_soc$flanker, c("0"="Inkongr.", "1"="Kongr."))
library(dplyr)
mydata <- mydata %>% 
  dplyr::rename(BDI = bdi,
                SPS = sps,
                Extraversion = extra,
                Vertraeglichkeit = affil,
                Neurotizismus = neuro,
                Agentische_Extraversion = mae,
                Soziale_Naehe = sc) 
  


# mydata_incorrect<- filter(mydata, grepl(halp, pattern = "Incorrect incongr.") & condition != "0")
# 
# mydata_correct<- filter(mydata, grepl(halp, pattern = "Correct incongr.") & condition != "0")
# # 
# intervals_incorrect <- split(mydata_incorrect, cut2(mydata_incorrect$epoch,cuts = c() ,g=30))
# intervals_correct <-  split(mydata_correct, cut2(mydata_correct$epoch, g=30))


# try 1
# mydata_incorrect <- mutate(mydata_incorrect, ints = cut(mydata_incorrect$epoch, 
#                                     c(40, 80, 120 , 160, 200 , 240, 280, 320, 360, 400,
#                                       440, 480, 520, 560, 600, 640, 680, 720, 760, 800,
#                                       840, 880, 920, 960, 1000, 1040, 1080, 1120, 1160, 1200),digits = 3) ) 

# ints_incorrect <- mydata_incorrect %>% mutate( ints = cut(epoch ,breaks = 30)) %>%
#   group_by(ints, id) %>%
#   summarise( mean.FCz = mean(mean_amp_FCz))

# ints_correct <- mydata_correct %>% mutate( ints = cut(epoch ,breaks = 30)) %>% 
#   group_by(ints, id) %>% 
#   summarise( mean.FCz = mean(mean_amp_FCz))







# mydata_incorrect <- mydata %>% select("mean_amp_FCz", everything())
# mydata_correct <- mydata %>% select("mean_amp_FCz", everything())
# 
# 
# 
# mydata$id <- as.factor(mydata$id)
# mydata$SD09_01 <-  as.factor(mydata$SD09_01)
# mydata$SD22 <- as.factor(mydata$SD22)
# 
# 
# library(rpart)
# library(caret)
# library(rpart.plot)
# library(Metrics)
# mydata$mean_amp_Cz <- NULL
# mydata$id <-          NULL
# mydata$SD08_01 <-     NULL
# mydata$SD09_01 <-     NULL
# mydata$age <-         NULL
# 
# # Regression Trees
# set.seed(100000)
# assignment <- sample(1:3, size = nrow(mydata), prob = c(0.6,0.2,0.2), replace = T)
# 
# ern_train <- mydata[assignment == 1, ]   
# ern_valid <- mydata[assignment == 2, ]  
# ern_test <-  mydata[assignment ==  3, ]   
# 
# ern_model <- rpart(formula = mean_amp_FCz ~ ., 
#                      data = ern_train, 
#                      method = "anova")
# 
# rpart.plot(x = ern_model, yesno = 1, type = 1, extra = 1)
# plotcp(ern_model)
# 
# pred <- predict(object = ern_model,   # model object 
#                 newdata = ern_test)
# 
# rmse(ern_test$mean_amp_FCz,
#      pred)

