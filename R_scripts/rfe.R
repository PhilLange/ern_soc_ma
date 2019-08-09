library(dplyr)

mydata <- merge(ern_soc, survey, "id")
mydata$flanker <- as.factor(mydata$flanker)
mydata$condition <- as.factor(mydata$condition)
mydata$SD01 <- as.factor(mydata$SD01)
mydata$SD07 <- as.factor(mydata$SD07)
mydata$SD09_01 <- as.factor(mydata$SD09_01)



mydata<- filter(mydata, grepl(halp, pattern = "Incorrect incongr.") & condition != "0")
mydata <- mydata %>% select("mean_amp_FCz", everything())
mydata$id <- as.factor(mydata$id)
mydata$SD09_01 <-  as.factor(mydata$SD09_01)
mydata$SD22 <- as.factor(mydata$SD22)


library(rpart)
library(caret)
library(rpart.plot)
library(Metrics)
mydata$mean_amp_Cz <- NULL
mydata$id <-  NULL
mydata$SD08_01 <-  NULL
mydata$SD09_01 <- NULL
mydata$age <- NULL

# Regression Trees
set.seed(100000)
assignment <- sample(1:3, size = nrow(mydata), prob = c(0.7,0.15,0.15), replace = F)

ern_train <- mydata[assignment == 1, ]   y
ern_valid <- mydata[assignment == 2, ]  
ern_test <-  mydata[assignment ==  3, ]   

ern_model <- rpart(formula = mean_amp_FCz ~ ., 
                     data = ern_train, 
                     method = "anova")

rpart.plot(x = ern_model, yesno = 1, type = 1, extra = 1)
plotcp(ern_model)

pred <- predict(object = ern_model,   # model object 
                newdata = ern_test)

rmse(ern_test$mean_amp_FCz,
     pred)

