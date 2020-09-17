#MASTER R FILE#
#install.packages(c('data.table','dtplyr','dplyr',
                   # 'ggplot2','lattice','xtable',
                   # 'reporttools','stargazer'))
#packages used: data.table, dtplyr, dplyr,
      #ggplot2, lattice,
      # xtable, reporttools, stargazer
#packages unused: tidyr, stringr, devtools, MASS, effects

# library(data.table)
# library(dtplyr)
#       library(dplyr)
# library(ggplot2)
# library(lattice)
#       library(xtable)
# library(reporttools)
# library(stargazer)
# library(tidyr)
# library(stringr)
# library(devtools)
# library(MASS)
# library(effects)

#############################
#######DATA CONVERSION#######
#############################
setwd('~/Desktop/ECON_DMP/R/script')
source('data_conversion.R')
      #packages: data.table
      #converts the following files to .RDS
      #(1) cps_1981
      #(2) state_data
      #(3) state_unemployment
      #(4) states
      #(5) acs_2010


#############################
###########MEDICAID##########
#############################
setwd('~/Desktop/ECON_DMP/R/script')
source('medicaid.R')
      #data: cps_1981.csv, state_data.csv -> final_state.rds
      #packages: data.table, dtplyr, dplyr
      #(1) CPS -> find medicaid enrollment proportion
      #(2) State -> use medicaid expenditure data
      #(3) Merge state_data + cps
      #(4) find state medicaid expenditures per pop & per enrollee


#############################
#########UNEMPLOYMENT########
#############################
setwd('~/Desktop/ECON_DMP/R/script')
source('unemployment.R')
      #data: state_unemployment.xls, states.csv -> final_unemployment.rds
      #packages: data.table, dtplyr
      #(1) Clean unemployment data
      #(2) Make compatible for merging by mapping abbreviations to statefips


#############################
##########EDUCATION##########
#############################
setwd('~/Desktop/ECON_DMP/R/script')
source('education.R')
      #data: acs_2010.csv -> final_acs.rds
      #packages: data.table, dtplyr, dplyr
      #(1) Clean ACS data
      #(2) Filter data
      #(3) Make compatible for merging
      #(4) create hyde, hs_dropout, col_enroll variables


#############################
############MERGE############
#############################
setwd('~/Desktop/ECON_DMP/R/script')
source('merge.R')
      #data: final_acs.rds, final_unemployment.rds, final_state.rds -> final_dmp.rds
      #packages: data.table, dtplyr, dplyr
      #(1) Merge Education, Unemployment, and Medicaid data
      #(2) Remove irrelevant variables


#############################
######DATA DESCRIPTION#######
#############################
setwd('~/Desktop/ECON_DMP/R/script')
source('data_description.R')
      #data: final_dmp.rds
      #packages: data.table, dtplyr, dplyr, ggplot2, lattice,
            #xtable, reporttools, stargazer
      #(1) Create a numeric variable data.frame & categorical variable data.frame
      #(2) Stargazer -> create table for numberic vars
      #(3) Reporttools::tableNominal -> create table for categorical vars
      #(4) Create graphs and figures


#############################
###########ANALYSIS##########
#############################
setwd('~/Desktop/ECON_DMP/R/script')
source('analysis.R')
      #data: final_dmp.rds
      #packages: data.table, dtplyr, dplyr,
            #ggplot2, lattice, stargazer, xtable
      #(1) Run OLS Regressions
      #(2) Stargazer -> create tables for regression output
      #(3) 


#############################
########ORDINAL LOGIT########
#############################
#setwd('~/Desktop/ECON_DMP/R/script/unused')
#source('ordinal_logit_model.R')
      #data: final_dmp.rds
      #packages: MASS, effects
      #(1) Run Ordinal Logistic Regressions
      #(2) Effect -> interpretation of results
