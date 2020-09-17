#ANALYSIS R FILE#
setwd('~/Desktop/ECON_DMP/R/')
      final = readRDS('final_dmp.rds')
      #statefip does note include DC
      #female==1, male==2
      #educ states at grade10==1
library(data.table)
library(dtplyr)
      library(dplyr)
library(ggplot2)
library(lattice)
library(stargazer)
library(xtable)
#############################################################
#############################################################
#############################################################
noFE = lm(c.educ ~ hyde:exp_per_pop + race + sex,
      data=final)
state = lm(c.educ ~ hyde:exp_per_pop + race + sex + bpl,
      data=final)
time = lm(c.educ ~ hyde:exp_per_pop + race + sex + birthyr,
      data=final)
unemp = lm(c.educ ~ hyde:exp_per_pop + race + sex + unemployment,
      data=final)
reg1 = lm(c.educ ~ hyde:exp_per_pop + race + sex + unemployment + bpl + birthyr,
      data=final)
reg2 = lm(c.educ ~ hyde:exp_per_enroll + race + sex + unemployment + bpl + birthyr,
      data=final)
#############################################################
#############################################################
#############################################################
stargazer(noFE,
            unemp, title='Absent & State-Time FE Regression Results',
            no.space=TRUE,
            font.size='tiny', 
            column.sep.width='0pt',
            digits = 6,
            digit.separator="")
stargazer(state, time,
            title='State & Time FE Regression Results',
            no.space=TRUE,
            font.size='tiny', 
            column.sep.width='0pt',
            digits = 6,
            digit.separator="")
stargazer(reg1, reg2,
            title='Full Regression Results',
            no.space=TRUE,
            font.size='tiny', 
            column.sep.width='0pt',
            digits = 6,
            digit.separator="")
#############################################################
#############################################################
#############################################################
summary(final)
# B(pop) = 0.008105 - mean = $67.27
      final %>% filter(exp_per_pop==0)
      #min = $0 (by population) = Arizona = $0 (by enrollment)
      final %>% filter(exp_per_pop==13.25)
      #min (!Arizona) = $13.25 (by population) = Wyoming = $327.30 (by enrollment)
      final %>% filter(exp_per_pop==40.20)
      #25 percentile = $40.20 (by population) = Alabama = $445.17 (by enrollment)
      final %>% filter(exp_per_pop==86.89)
      #75 percentile = $86.89 (by population) = Michigan = $705.99 (by enrollment)
      final %>% filter(exp_per_pop==217.22)
      #max = $217.22 (by population) = D.C. = $1,393.38 (by enrollment)
# B(enroll) = 0.001002 - mean = $730.30
      final %>% filter(exp_per_enroll==0)
      #min = $0 (by population) = Arizona = $0 (by population)
      final %>% filter(exp_per_enroll==314.44)
      #min (!Arizona) = $314.44 (by enrollment) = Florida = $24.00 (by population)
      a=final %>% filter(exp_per_enroll==532.61)
      #25 percentile = $532.61 (by enrollment) = Tennessee = $45.86 (by population)
      final %>% filter(exp_per_enroll==854.82)
      #75 percentile = $854.82 (by enrollment) = New Jersey = $64.38 (by population)
      final %>% filter(exp_per_enroll==1393.38)
      #max = $1,393.38 (by enrollment) = D.C. = $217.22 (by population)
b_pop=0.008105
b_enroll=0.001002
      ####(delta)Y(1) = (beta)*(delta)Medicaid for Hyde==1
      b_pop*(86.69-13.25) #75%-25%
            #(delta)Y = 0.60
      b_enroll*(854.82-532.61) #75%-25%
            #(delta)Y = 0.32
      b_pop*(217.22-13.25) # max-min
            #(delta)Y = 1.65
      b_enroll*(1393.38-314.44) # max-min
            #(delta)Y = 1.08
      ####(delta)Y(2) = (beta)*(delta)Hyde*(Medicaid) for a given bpl
      b_pop*(13.25) #min
            #(delta)Y = 0.11
      b_pop*(40.20) #25%
            #(delta)Y = 0.33
      b_pop*(86.89) #75%
            #(delta)Y = 0.70
      b_pop*(217.22) #max
            #(delta)Y = 1.76
      b_enroll*(314.44) #min
            #(delta)Y = 0.32
      b_enroll*(532.61) #25%
            #(delta)Y = 0.53
      b_enroll*(854.80) #75%
            #(delta)Y = 0.86
      b_enroll*(1393.38) #max
            #(delta)Y = 1.40

type1=c('Min','Min(!Arizona)','25th Percentile','75th Percentile','Max')
medicaid_by_pop1=c(0,13.25,40.20,86.89,217.22)
state1=c('Arizona','Wyoming','Alabama','Michigan','D.C.')
medicaid_by_enroll1=c(0,327.30,445.17,705.99,1393.38)

type2=c('Min','Min(!Arizona)','25th Percentile','75th Percentile','Max')
medicaid_by_enroll2=c(0,314.44,532.61,854.82,1393.38)
state2=c('Arizona','Florida','Tennessee','New Jersey','D.C.')
medicaid_by_pop2=c(0,24.00,45.86,64.38,217.22)

medicaid_data_pop = data.frame(type1, medicaid_by_pop1, state1, medicaid_by_enroll1, stringsAsFactors=FALSE)
medicaid_data_enroll = data.frame(type2, medicaid_by_enroll2, state2, medicaid_by_pop2, stringsAsFactors=FALSE)
      xtable(medicaid_data_pop)
      xtable(medicaid_data_enroll)



#############################################################
#############################################################
#############################################################
# summary(reg1)
# coefficients(reg1)
# confint(reg1, level=0.95)
# fitted(reg1)
# residuals(reg1)
# anova(reg1)
# vcov(reg1)
# influence(reg1)

#REGULAR - stargazer(linear.1, linear.2, probit.model, title="Regression Results",
#align=TRUE, dep.var.labels=c("Overall Rating","High Rating"),
#covariate.labels=c("Handling of Complaints","No Special Privileges",
#                   "Opportunity to Learn","Performance-Based Raises","Too Critical","Advancement"),
#omit.stat=c("LL","ser","f"), no.space=TRUE)
#CONFIDENCE INTERVALS - stargazer(linear.1, linear.2, title="Regression Results",
#dep.var.labels=c("Overall Rating","High Rating"),
#covariate.labels=c("Handling of Complaints","No Special Privileges",
#                   "Opportunity to Learn","Performance-Based Raises","Too Critical","Advancement"),
#omit.stat=c("LL","ser","f"), ci=TRUE, ci.level=0.90, single.row=TRUE)


################################
rm(list=ls())
################################