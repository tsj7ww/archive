#MERGE R FILE#
setwd('~/Desktop/ECON_DMP/R/data_final')
library(data.table)
library(dtplyr)
      library(dplyr)
#############################################################
#############################################################
#############################################################

final_education = readRDS('final_education.rds')
      final_education = final_education %>%
                        mutate(year_when_15=birthyr+15)

final_unemployment = readRDS('final_unemployment.rds')
      edu.unemp = final_unemployment %>%
                        rename(year_when_15=year) %>%
                        rename(bpl=statefip) %>%
                        inner_join(final_education,
                                   by=c('year_when_15', 'bpl'))
                        #maps unemp rate by bpl/state when individual=15 y-o

final_medicaid = readRDS('final_medicaid.rds')
      final_medicaid = final_medicaid %>%
                  rename(bpl=statefip)
      edu.unemp.med = edu.unemp %>% 
                  inner_join(final_medicaid)

saveRDS(edu.unemp.med, '../final_dmp.rds')

################################
rm(list=ls())
################################