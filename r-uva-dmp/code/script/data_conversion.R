#CONVERTING DATA: Raw -> RDS#
setwd('~/Desktop/ECON_DMP/R/data_raw')
library(data.table)
      
      cps_1981 = read.csv('cps_1981.csv') #medicaid enrollment
            cps_1981 = data.table(cps_1981)
            saveRDS(cps_1981, '../data_rds/cps_1981.rds')
      
      state_data = read.csv('state_data.csv') #medicaid expenditures
            state_data = data.table(state_data)
            saveRDS(state_data, '../data_rds/state_data.rds')
      
      state_unemployment = read.csv('state_unemployment.csv') #unemployment
            state_unemployment = data.table(state_unemployment)
            saveRDS(state_unemployment, '../data_rds/state_unemployment.rds')
            
      states = read.csv('states.csv') #state naming
            states = data.table(states)
            saveRDS(states, '../data_rds/states.rds')
      
      acs_2010 = read.csv('acs_2010.csv') #education
            acs_2010 = data.table(acs_2010)
            saveRDS(acs_2010, '../data_rds/acs_2010.rds')
            
################################
rm(list=ls())
################################