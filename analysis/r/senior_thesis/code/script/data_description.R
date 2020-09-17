#DATA DESCRIPTION R FILE#
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
      library(xtable)
library(reporttools)
library(stargazer)
#############################################################
#############################################################
#############################################################
#plot.reg1 = ggplot(final, aes(exp_per_pop, c.educ))
#      plot.reg2 + geom_point()
#plot.reg2 = ggplot(final, aes(exp_per_enroll, c.educ))
#############################################################
#############################################################
#############################################################
final_numeric = final %>%
      select(c.educ, hyde, exp_per_pop, exp_per_enroll,
            birthyr, year_when_15, age, unemployment)
stargazer(final_numeric,
            title='Numeric Variables Summary Table', 
            no.space=TRUE,
            font.size='normalsize', 
            single.row=TRUE,
            column.sep.width='0pt',
            digit.separator="")

final_categorical = final %>%
            select(educ, sex, race, bpl)
tableNominal(final_categorical, font.size='tiny')


################################
rm(list=ls())
################################