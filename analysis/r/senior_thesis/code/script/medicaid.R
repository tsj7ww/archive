#MEDICAID R FILE#
setwd('~/Desktop/ECON_DMP/R/data_rds')
library(data.table)
library(dtplyr)
      library(dplyr)
#############################################################
#############################################################
#############################################################

### Medicaid Enrollment ###
cps_1981 = readRDS('cps_1981.rds')
      cps_1981 = cps_1981 %>%
                  select(statefip, himcaid) %>%
                  count(statefip, himcaid) %>%
                  rename(count=n) %>%
                  group_by(statefip) %>%
                  mutate(total = sum(count)) %>%
                  ungroup() %>%
                  filter(himcaid=='Yes') %>%
                  mutate(proportion = count/total)

### State Data ###
state_data = readRDS('state_data.rds')
      state_data =  state_data %>%
            select(-STATE_FIPS, -STATE_ABBREV) %>%
            rename(statefip=STATE_NAME) %>%
            rename(pop_1980=X1980_pop) %>%
            rename(med_exp_1980=X1980_med_exp) %>%
            mutate(pop_1980 = as.numeric(gsub(',', '', as.character(pop_1980)))) %>%
            mutate(med_exp_1980 = as.numeric(gsub(',', '', as.character(med_exp_1980)))) %>%
            inner_join(cps_1981) %>%
            mutate(enroll_1980 = proportion*pop_1980) %>%
            mutate(enroll_1980 = round(enroll_1980, digits=0)) %>%
            mutate(exp_per_pop = med_exp_1980/pop_1980) %>%
            mutate(exp_per_enroll = med_exp_1980/enroll_1980) %>%
            mutate(exp_per_pop = round(exp_per_pop, digits=2)) %>%
            mutate(exp_per_enroll = round(exp_per_enroll, digits=2)) %>%
            select(statefip, exp_per_pop, exp_per_enroll)

saveRDS(state_data, '../data_final/final_medicaid.rds')

################################
rm(list=ls())
################################