#---------------- load packages-------------------------------------------------------------
library(apaTables)
library(dplyr)
library(lmerTest)
library(sjPlot)
library(sjstats)
library(texreg)
library(MuMIn)
library(corrplot)
library(psycho)
library(Rmisc)
library(table1)
library(tidyr)
tion table  independent variables-------------------------------
apaTables::apa.cor.table(mydata[,12:19], filename = "Korrelationsmatrixperso", table.number = 1)
apaTables::apa.cor.table(mydata[,12:19], filename = "Korrelationsmatrixern", table.number = 1)
corrdf <- select(mydata, d_ern_cz, bdi, sps, DES, extra, affil, neuro, sc)
corrplot::corrplot(cor(corrdf))
#---------------- grand mean centering for multilevel analysis-----------------------------
mydata <- mutate(mydata, spsc = sps - mean(sps),
                         bdic = bdi - mean(bdi),
                         DESc = DES - mean(DES),
                         scc  = sc  - mean(sc),
                      neuroc  = neuro - mean(neuro),
                      affilc  = affil - mean(affil),
                      extrac  = extra - mean(extra),
                       maec   = mae   -  mean(mae[30:567]))

#---------------- multilevel model ERN
mod <- lmer(d_ern_fcz~condition*mydata$Bitte.schätzen.Sie.ein..wie.Sie.im.nächsten.Durchlauf.der.Aufgabe.abschneiden.werden. + (1|id), data = mydata)
summary(mod)
anova(mod)
get_contrasts(mod)
results <- psycho::analyze(mod)
mydata %>% group_by(condition)
plot_model(mod,type = "diag")




#---------------- Plot for BDI--------------------------------
bdidf <- Rmisc::summarySE(data= mydata,measurevar = "'bdi'", groupvars = "id", na.rm = T)
ggplot(data = bdidf)+
  geom_bar(aes(x=as.factor(id),y = bdi),stat = "identity", fill = "#FF6666")+
  scale_x_discrete(labels = c("2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "13",
                              "14", "15", "16", "17", "18", "19", "20", "21", "22", "23",
                              "24", "27", "28"))+
  xlab(label = "Versuchsperson")+
  ylab(label = " Becks Depressions Inventar")+
  geom_hline(yintercept = 13, linetype = "dashed")+
  geom_hline(yintercept = 20, linetype = "dashed")+
  geom_hline(yintercept = 29, linetype = "dashed")+
  theme_linedraw()
  
#---------------- descriptives for survey----------------------
mydata$SD08_01 <- as.integer(mydata$SD08_01)

label(mydata$sps) <- "Social Phobia Scale" 
label(mydata$DES) <-  "Depressive Expectations Scale"
label(mydata$extra) <- "Extraversion"
label(mydata$affil) <-  "Verträglichkeit"
label(mydata$neuro) <-  "Neurotizismus"
label(mydata$sc)    <-  "Soziale Nähe"
label(mydata$mae)   <-  "Agentische Extraversion"
label(mydata$SD08_01) <-"Abschlussnote"
table1::table1(data = mydata, ~ sps + DES + extra + affil+ neuro + sc + mae + SD08_01)

#---------------- correlation table for Survey
corrdf <- aggregate(mydata[c( "BDI", "SPS","DES", "Extraversion", 
                              "Vertraeglichkeit", "Neurotizismus", "Soziale_Naehe", "Agentische_Extraversion")], 
                    by= mydata["id"], FUN = mean)
corrdf$id <- NULL
corrdf <- corrdf[-1,]

corr_table <- psych::corr.test(corrdf, adjust = 'holm')

corrplot::corrplot(corr_table$r,
                   p.mat = corr_table$p, 
                   type='upper', method = 'color', tl.col = "black")
print(corr)
summary(corr)
corr <- correlation(corrdf)
corrplot::corrplot(corrdf)
#---------------- Stimmungsabfrage-------------
label(mydata$Erfolg.Stolz) <- "Erfolg/Stolz"
label(mydata$traurig)      <- "Traurigkeit" 
label(mydata$Waerme.Zuneigung) <-  "Wärme/Zuneigung"
label(mydata$freude)           <-  "Freude"
label(mydata$peinlich)          <-  "Peinlichkeit/Scham"
label(mydata$arger)             <-  "Ärger/Wut"
label(mydata$erwartung_aufgabe) <-  "Leistungserwartung"
label(mydata$angenehm)          <-  "Angenehme Stimmung"
mydata$angenehm <- as.integer(mydata$angenehm)
table1::table1(data = mydata, ~ Erfolg.Stolz + traurig + Waerme.Zuneigung + Frustration + freude +
                                peinlich + arger+ erwartung_aufgabe + angenehm | condition)
stimmunregs <- aggregate(mydata[c( "Erfolg.Stolz", "traurig","Waerme.Zuneigung","Frustration", 
                                   "freude", "peinlich", "arger", "erwartung_aufgabe", "angenehm")], 
                         by= mydata[c("id", "condition")], FUN = mean)

erfolgmod <- lmer(Erfolg.Stolz ~ condition + (1|id), data = stimmunregs, contrasts = list(condition = "contr.treatment"))
summary(erfolgmod)
analyze(erfolgmod)
erfolgaov <- anova(erfolgmod)
get_contrasts(erfolgmod)

traurigmod <- lmer(traurig ~ condition + (1|id), data = stimmunregs, contrasts = list(condition = "contr.treatment"))
summary(traurigmod)
anova(traurigmod)  

zuneigmod <- lmer(Waerme.Zuneigung ~ condition + (1|id), data = stimmunregs, contrasts = list(condition = "contr.treatment"))  
summary(zuneigmod)
anova(zuneigmod)
get_contrasts(zuneigmod)  

frustmod <- lmer(Frustration ~ condition + (1|id), data = stimmunregs, contrasts = list(condition = "contr.treatment"))
summary(frustmod)
analyze(frustmod)
frustaov <- anova(frustmod)  
analyze(frustaov)
get_contrasts(frustmod)

freudemod <- lmer(freude ~ condition + (1|id), data = stimmunregs, contrasts = list(condition = "contr.treatment"))
summary(freudemod)
analyze(freudemod)
freudeaov <- anova(freudemod)
analyze(freudeaov)
get_contrasts(freudemod)

peinmod <- lmer(peinlich ~ condition + (1|id), data = stimmunregs, contrasts = list(condition = "contr.treatment"))
summary(peinmod)
anova(peinmod)
get_contrasts(peinmod)

angermod <-lmer(arger ~ condition + (1|id), data = stimmunregs, contrasts = list(condition = "contr.treatment"))
summary(angermod)
anova(angermod)
get_contrasts(angermod)

erwartungmod <- lmer(erwartung_aufgabe ~ condition + (1|id), data = stimmunregs, 
                      contrasts = list(condition = "contr.treatment"))
summary(erwartungmod)
anova(erwartungmod)
get_contrasts(erwartungmod)


texreg::htmlreg(list(angermod, peinmod, freudemod, frustmod, zuneigmod, traurigmod, erfolgmod, erwartungmod),
                  include.rsquared = T, custom.model.names = c("Ärger/Wut", "Peinlichkeit", "Freude",
                                                               "Frustration", "Zuneigung", "Traurigkeit",
                                                               "Erfolg/Stolz", "Leistungserwartung"),
                custom.coef.names = c("Intercept", "Bedingung: Negativ", "Bedingung: Positiv"),
                file="Tabelstimmungsmods",sideways = T)
analyze(frustcontr)
                  

#----------------Reaktionszeiten------------------
ern_soc$reaction <- as.factor(ern_soc$reaction)
ern_soc$flanker <- as.factor(ern_soc$flanker)
rtmod <- lmer(rt ~ condition*reaction*flanker + (1|id), data = ern_soc, contrasts = list(condition = "contr.sum", 
                                                                                reaction = "contr.sum",
                                                                                flanker = "contr.sum"))
anova(rtmod, ddf = "Kenward-Roger")
