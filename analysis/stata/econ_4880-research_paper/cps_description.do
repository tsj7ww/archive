cd "/Users/trev/Desktop/ECON 488/dta_describe"
use cps_describe.dta, clear
set more off
*************************************
***SUMMARY STATISTICS & DATA CHECK***
*************************************
sum
tab state year
tab age year
***POLICY VARIABLE: TYPE***
tab year type
tab state type
***POLICY VARIABLE: DECRIMINALIZATION***
tab year decrim
tab state decrim
***POLICY VARIABLE: DISPENSARY***
tab year dispensary
tab state dispensary
***EDUCATION VARIABLE: CURRENT GRADE***
tab year education
tab state education
***EFFECTS VARIABLE: UNEMPLOYMENT RATES***
sum unemployment 

***********************************
**************GRAPHS***************
***********************************

*1) Policy

*2) Unemployment
