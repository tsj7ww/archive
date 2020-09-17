#EDUCATION R FILE#
setwd('~/Desktop/ECON_DMP/R/data_rds')
library(data.table)
library(dtplyr)
      library(dplyr)
#############################################################
#############################################################
#############################################################

#note: used Stata to separate factor variables b/f loading data
acs_2010 = readRDS('acs_2010.rds') # note: survey=2010; information=2009
      acs_2010 = acs_2010 %>%
            select(statefip, sex, birthyr, race, bpl, educ, age,
                      statefip_label, sex_label, age_label, race_label,
                      bpl_label, educ_label) %>%
            mutate(statefip_label = as.character(statefip_label)) %>%
            mutate(sex_label = as.character(sex_label)) %>%
            mutate(age_label = as.character(age_label)) %>%
            mutate(race_label = as.character(race_label)) %>%
            mutate(bpl_label = as.character(bpl_label)) %>%
            mutate(educ_label = as.character(educ_label)) %>%
            filter(statefip<=56, bpl<=56,
                   age>=1, educ>=4, birthyr>=1974) %>% 
            #drop people living outside US, born outside US,
            #under 16 y-o, before 10th grade,
            #born before 1974 (after roe v. wade)
            mutate(statefip_label = factor(statefip_label)) %>% 
            mutate(sex_label = factor(sex_label)) %>% 
            mutate(bpl_label = factor(bpl_label)) %>% 
            mutate(educ_label = factor(educ_label, ordered=TRUE,
                             levels = c('Grade 10', 'Grade 11', 'Grade 12',
                                        '1 year of college', '2 years of college', '3 years of college',
                                        '4 years of college', '5+ years of college'))) %>% 
            mutate(race_label = factor(race_label, 
                             levels = c('White', 'Black/Negro', 'American Indian or Alaska Native',
                                        'Chinese', 'Japanese', 'Other Asian or Pacific Islander',
                                        'Other race, nec', 'Two major races',
                                        'Three or more major races'))) %>%
            select(-statefip, -sex, -race, -bpl, -educ, -age_label) %>%
            rename(statefip=statefip_label) %>%
            rename(sex=sex_label) %>%
            rename(race=race_label) %>%
            rename(bpl=bpl_label) %>%
            rename(educ=educ_label) %>%
            mutate(hyde = ifelse(birthyr<=1977, 0, 1)) %>% #hyde, 1=unaffected
            mutate(c.educ=ifelse(as.numeric(educ)==1, 10, #creating cont. edu variable
                  ifelse(as.numeric(educ)==2, 11,
                  ifelse(as.numeric(educ)==3, 12,
                  ifelse(as.numeric(educ)==4, 13,
                  ifelse(as.numeric(educ)==5, 14,
                  ifelse(as.numeric(educ)==6, 15,
                  ifelse(as.numeric(educ)==7, 16,
                  ifelse(as.numeric(educ)==8, 18, 0) #average post-grad schooling is 2 years
                  ))))))
                  ))

saveRDS(acs_2010, '../data_final/final_education.rds')

################################
rm(list=ls())
################################
#HS_Dropout & Col_Enroll Variables
      #variables needed: educ & age
      # gen grade_change = grade - grade_ly
      # gen enrollment_change = enroll - enroll_ly
# *hs_dropout*
      # 	gen hs_dropout=17 // to make sure that there is no incorrect coding
      # 		replace hs_dropout=0 if grade_change==1 & enrollment_change==0
      # 		replace hs_dropout=1 if enrollment_change==-1
      # 		replace hs_dropout=. if grade_ly<9 | grade_ly>11
      # 		replace hs_dropout=. if enrollment_change==0 & grade_change!=1
# *col_enroll*
      # 	gen col_enroll=17 // to make sure that there is no incorrect coding
      # 		replace col_enroll=0 if enrollment_change==-1
      # 		replace col_enroll=1 if grade_change==1 & enrollment_change==0
      # 		replace col_enroll=. if grade_ly!=12
      # 		replace col_enroll=. if enrollment_change==0 & grade_change!=1