library(dplyr)
#read in data of vp 21 and bind by conditions------
setwd("/Users/philipplange/Desktop/analysis_ma/")
solo <- read.table("1021_FTA.txt", header = T)
solo <-  mutate(solo, bedingung = "solo",
                             id = "21")
neg <- read.table("3021_FTA.txt", header = T)
neg <-  mutate(neg, bedingung = "neg",
                id = "21")

pos <- read.table("2021_FTA.txt", header = T)
pos <-  mutate(neg, bedingung = "pos",
               id = "21")
rt_21 <- rbind(solo, neg, pos) 
rt_21 <-select(rt_21, - "Index")
#add coloumn for correct and incorrect responses
dat_R <- rt_21 %>% dplyr::filter(Halp == 'R-C' | Halp =='R-I') %>% 
  dplyr::mutate(reaction = ifelse(Resp == 2, 'Correct', 'Incorrect'))

dat_L <- rt_21 %>% dplyr::filter(Halp == 'L-C' | Halp =='L-I') %>% 
  dplyr::mutate(reaction = ifelse(Resp == 1, 'Correct', 'Incorrect'))

rt_21 <- rbind(dat_R, dat_L) %>% # reorder data frane
  select(id, everything()) 

rt_21$bedingung <- factor(rt_21$bedingung) 
rt_21$reaction <- as.factor(rt_21$reaction)
rm(list=setdiff(ls(), "rt_21"))


