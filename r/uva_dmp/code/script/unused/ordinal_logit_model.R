setwd('~/Desktop/ECON_DMP/R/')
library(MASS) #masks dplyr::select
library(effects)
#############################################################
#############################################################
#############################################################
final = readRDS('final_dmp.rds')
      #statefip does note include DC
      #female==1, male==2
      #educ states at grade10==1
#############################################################
#############################################################
#############################################################
noFE = polr(educ ~ hyde:exp_per_pop + race + sex,
      data=final, Hess=TRUE)
state = polr(educ ~ hyde:exp_per_pop + race + sex + statefip,
       data=final, Hess=TRUE)
time = polr(educ ~ hyde:exp_per_pop + race + sex + birthyr,
      data=final, Hess=TRUE)
unemp = polr(educ ~ hyde:exp_per_pop + race + sex + unemployment,
      data=final, Hess=TRUE)
reg1 = polr(educ ~ hyde:exp_per_pop + race + sex + unemployment + statefip + birthyr,
      data=final, Hess=TRUE)
reg2 = polr(educ ~ hyde:exp_per_enroll + race + sex + unemployment + statefip + birthyr,
      data=final, Hess=TRUE)
#############################################################
#############################################################
#############################################################
reg1.eff = Effect(
            focal.predictors=c('hyde','exp_per_pop'),
            mod=reg1)
#exp(coef(reg1)[1]*100)
#john fox - paper on ordinal logistic reg
      #effects displays in R for multinomial proportional odds ...


################################
detach("package:MASS", unload=TRUE)
rm(list=ls())
################################