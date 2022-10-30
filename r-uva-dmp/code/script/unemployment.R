#UNEMPLOYMENT R FILE#
setwd('~/Desktop/ECON_DMP/R/data_rds')
library(data.table)
library(dtplyr)
      library(dplyr)
#############################################################
#############################################################
#############################################################

states = readRDS('states.rds')
      states = states %>%
            select(name, abbreviation) %>%
            rename(statefip=name) %>%
            rename(abb=abbreviation) %>%
            mutate(statefip = as.character(statefip)) %>%
            mutate(abb = as.character(abb)) %>%
            mutate(statefip = replace(statefip, abb=='DC', 'District of Columbia')) %>%
            mutate(statefip=factor(statefip))

state_unemployment = readRDS('state_unemployment.rds')
      state_unemployment = state_unemployment %>%
                        mutate(DATE = as.character(DATE)) %>%
                        mutate(year = substr(DATE,1,4)) %>%
                        select(-DATE, -X) %>% 
                        melt(id.vars=c('year'),
                             #measure.vars=(''), -> includes all but ID
                             variable.name=('abb'),
                             variable.factor=FALSE,
                             value.name=('unemployment')
                             ) %>%
                        group_by(abb, year) %>%
                        summarize(unemployment=mean(unemployment)) %>%
                        ungroup() %>%
                        mutate(unemployment = round(unemployment, digits=2)) %>%
                        mutate(abb = substr(abb,1,2)) %>%
                        mutate(year = as.numeric(year)) %>%
                        inner_join(states) %>%
                        select(statefip, year, unemployment)

saveRDS(state_unemployment, '../data_final/final_unemployment.rds')

################################
rm(list=ls())
################################