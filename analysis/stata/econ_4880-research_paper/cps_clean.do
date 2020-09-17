cd "/Users/trev/Desktop/ECON 488/dta_full"
use cps_full.dta, clear
set more off





keep year hrhhid peage gestfips hufaminc pesex ptdtrace peeduca /// BEGIN SUPPLEMENT DATA
pesschol pegrade pelastyr pelastgd /// hs_dropout & col_enroll
pestype peged // 2yr4yr & GED
*PESCH614 PECHGRDE PES56 PES57 // 2nd round - enroll, grade, enroll_LR, grade_LR





//////////////////////////////////////////////////////////////////
///////////////////////NON LAGGED POLICY VARIABLES////////////////
//////////////////////////////////////////////////////////////////

*coding marijuana policy type*
gen type = 0
	label var type "type of marijuana legalization policy, by state & year; 0=none, 1=CDB, 2=medical, 3=recreational"
/*
replace type = 0 if gestfips == 5 | gestfips == 13 | gestfips == 16 ///
| gestfips == 18 | gestfips == 20 | gestfips == 22 | gestfips == 31 ///
| gestfips == 38 | gestfips == 39 | gestfips == 40 | gestfips == 41 ///
| gestfips == 42 | gestfips == 46 | gestfips == 47 | gestfips == 48 ///
| gestfips == 51 | gestfips == 54 | gestfips == 56 // 18 states have type=0 in 2014
	* - therefore these states have never legalized any type in any year
	* note: 34 policy changes up to 2014 - 34 lines of code
*/
replace type=1 if gestfips==1 & year>=2014 // 1
replace type=2 if gestfips==2 & year>=1998 // 2
replace type=2 if gestfips==4 & year>=2010 // 3
replace type=2 if gestfips==6 & year>=1996 // 4
replace type=2 if gestfips==8 & year>=2000 // 5
replace type=3 if gestfips==8 & year>=2012 // 6
replace type=2 if gestfips==9 & year>=2012 // 7
replace type=2 if gestfips==10 & year>=2011 // 8
replace type=1 if gestfips==12 & year>=2014 // 9
replace type=2 if gestfips==15 & year>=2000 // 10
replace type=1 if gestfips==17 & year>=2013 // 11
replace type=1 if gestfips==19 & year>=2014 // 12
replace type=1 if gestfips==21 & year>=2014 // 13
replace type=2 if gestfips==23 & year>=1999 // 14
replace type=2 if gestfips==24 & year>=2014 // 15
replace type=2 if gestfips==25 & year>=2012 // 16
replace type=2 if gestfips==26 & year>=2008 // 17
replace type=1 if gestfips==27 & year>=2014 // 18
replace type=1 if gestfips==28 & year>=2014 // 19
replace type=2 if gestfips==29 & year>=2014 // 20
replace type=2 if gestfips==30 & year>=2004 // 21
replace type=2 if gestfips==32 & year>=2000 // 22
replace type=2 if gestfips==33 & year>=2013 // 23
replace type=2 if gestfips==34 & year>=2010 // 24
replace type=2 if gestfips==35 & year>=2007 // 25
replace type=2 if gestfips==36 & year>=2014 // 26
replace type=1 if gestfips==37 & year>=2014 // 27
replace type=2 if gestfips==44 & year>=2006 // 28
replace type=1 if gestfips==45 & year>=2014 // 29
replace type=1 if gestfips==49 & year>=2014 // 30
replace type=2 if gestfips==50 & year>=2004 // 31
replace type=3 if gestfips==53 & year>=2012 // 32
replace type=1 if gestfips==55 & year>=2014 // 33
replace type=2 if gestfips==11 & year>=2010 // 34

*coding marijuana decriminalization policy*
gen decrim = 0
	label var decrim "type of marijuana decriminalization policy, by state & year; 0=criminal offense, 1=decriminalized"
replace decrim=1 if gestfips==6 & year>=1995 // california
replace decrim=1 if gestfips==8 & year>=2012 // colorado
replace decrim=1 if gestfips==2 & year>=2014 // alaska
replace decrim=1 if gestfips==9 & year>=2011 // connecticut
replace decrim=1 if gestfips==11 & year>=2014 // DC
replace decrim=1 if gestfips==23 & year>=1999 // maine
replace decrim=1 if gestfips==24 & year>=2014 // maryland
replace decrim=1 if gestfips==25 & year>=2009 // massachusetts
replace decrim=1 if gestfips==28 & year>=1995 // mississippi
replace decrim=1 if gestfips==36 & year>=2014 // NY
replace decrim=1 if gestfips==41 & year>=1995 // oregon
replace decrim=1 if gestfips==44 & year>=2013 // RI
replace decrim=1 if gestfips==50 & year>=2013 // vermont
replace decrim=1 if gestfips==53 & year>=2012 // washington


*coding marijuana dispensary policy*
gen dispensary = 0
	label var dispensary "whether or not policy allows for dispensaries within state; 0=no, 1=yes"
replace dispensary=1 if gestfips==2 & year>=1998 // 1
replace dispensary=1 if gestfips==4 & year>=2010 // 2
replace dispensary=1 if gestfips==6 & year>=1996 // 3
replace dispensary=1 if gestfips==8 & year>=2000 // 4
replace dispensary=1 if gestfips==9 & year>=2012 // 5
replace dispensary=1 if gestfips==11 & year>=2010 // 6
replace dispensary=1 if gestfips==10 & year>=2011 // 7
replace dispensary=1 if gestfips==17 & year>=2013 // 8
replace dispensary=1 if gestfips==25 & year>=2012 // 9
replace dispensary=1 if gestfips==23 & year>=1999 // 10
replace dispensary=1 if gestfips==26 & year>=2008 // 11
replace dispensary=1 if gestfips==27 & year>=2014 // 12
replace dispensary=1 if gestfips==30 & year>=2004 // 13
replace dispensary=1 if gestfips==34 & year>=2010 // 14
replace dispensary=1 if gestfips==32 & year>=2000 // 15
replace dispensary=1 if gestfips==36 & year>=2014 // 16
replace dispensary=1 if gestfips==44 & year>=2006 // 17
replace dispensary=1 if gestfips==50 & year>=2004 // 18
replace dispensary=1 if gestfips==53 & year>=2012 // 19






//////////////////////////////////////////////////////////////////
///////////////////////LAGGED POLICY VARIABLES////////////////////
//////////////////////////////////////////////////////////////////

*ex: 2013 policy will take effect/be realized in 2014

*coding marijuana policy type*
gen lag_type = 0
	label var lag_type "lagged - type of marijuana legalization policy, by state & year; 0=none, 1=CDB, 2=medical, 3=recreational"
/*
replace lag_type = 0 if gestfips == 5 | gestfips == 13 | gestfips == 16 ///
| gestfips == 18 | gestfips == 20 | gestfips == 22 | gestfips == 31 ///
| gestfips == 38 | gestfips == 39 | gestfips == 40 | gestfips == 41 ///
| gestfips == 42 | gestfips == 46 | gestfips == 47 | gestfips == 48 ///
| gestfips == 51 | gestfips == 54 | gestfips == 56 | gestfips == 12 ///
| gestfips == 19 | gestfips == 21 | gestfips == 24 | gestfips == 27 ///
| gestfips == 28 | gestfips == 29 | gestfips == 36 | gestfips == 37 ///
| gestfips == 45 | gestfips == 49 | gestfips == 55 // 31 states have type=0 in 2013
	* - therefore these states have never legalized any type in any year
	* note: 21 policy changes up to 2014 - 21 lines of code
*/
replace lag_type=2 if gestfips==2 & year>=1999 // 1
replace lag_type=2 if gestfips==4 & year>=2011 // 2
replace lag_type=2 if gestfips==6 & year>=1997 // 3
replace lag_type=2 if gestfips==8 & year>=2001 // 4
replace lag_type=3 if gestfips==8 & year>=2013 // 5
replace lag_type=2 if gestfips==9 & year>=2013 // 6
replace lag_type=2 if gestfips==10 & year>=2012 // 7
replace lag_type=2 if gestfips==15 & year>=2001 // 8
replace lag_type=1 if gestfips==17 & year>=2014 // 9
replace lag_type=2 if gestfips==23 & year>=2000 // 10
replace lag_type=2 if gestfips==25 & year>=2013 // 11
replace lag_type=2 if gestfips==26 & year>=2009 // 12
replace lag_type=2 if gestfips==30 & year>=2005 // 13
replace lag_type=2 if gestfips==32 & year>=2001 // 14
replace lag_type=2 if gestfips==33 & year>=2014 // 15
replace lag_type=2 if gestfips==34 & year>=2011 // 16
replace lag_type=2 if gestfips==35 & year>=2008 // 17
replace lag_type=2 if gestfips==44 & year>=2007 // 18
replace lag_type=2 if gestfips==50 & year>=2005 // 19
replace lag_type=3 if gestfips==53 & year>=2013 // 20
replace lag_type=2 if gestfips==11 & year>=2011 // 21
	
*coding marijuana decriminalization policy*
gen lag_decrim = 0
	label var lag_decrim "lagged - type of marijuana decriminalization policy, by state & year; 0=criminal offense, 1=decriminalized"
replace lag_decrim=1 if gestfips==6 & year>=1995 // california
replace lag_decrim=1 if gestfips==8 & year>=2013 // colorado
replace lag_decrim=1 if gestfips==9 & year>=2012 // connecticut
replace lag_decrim=1 if gestfips==23 & year>=2000 // maine
replace lag_decrim=1 if gestfips==25 & year>=2010 // massachusetts
replace lag_decrim=1 if gestfips==28 & year>=1995 // mississippi
replace lag_decrim=1 if gestfips==41 & year>=1995 // oregon
replace lag_decrim=1 if gestfips==44 & year>=2014 // RI
replace lag_decrim=1 if gestfips==50 & year>=2014 // vermont
replace lag_decrim=1 if gestfips==53 & year>=2013 // washington

*coding marijuana dispensary policy*
gen lag_dispensary = 0
	label var lag_dispensary "lagged - whether or not policy allows for dispensaries within state; 0=no, 1=yes"
replace lag_dispensary=1 if gestfips==2 & year>=1999 // 1
replace lag_dispensary=1 if gestfips==4 & year>=2011 // 2
replace lag_dispensary=1 if gestfips==6 & year>=1997 // 3
replace lag_dispensary=1 if gestfips==8 & year>=2001 // 4
replace lag_dispensary=1 if gestfips==9 & year>=2013 // 5
replace lag_dispensary=1 if gestfips==11 & year>=2011 // 6
replace lag_dispensary=1 if gestfips==10 & year>=2012 // 7
replace lag_dispensary=1 if gestfips==17 & year>=2014 // 8
replace lag_dispensary=1 if gestfips==25 & year>=2013 // 9
replace lag_dispensary=1 if gestfips==23 & year>=2000 // 10
replace lag_dispensary=1 if gestfips==26 & year>=2009 // 11
replace lag_dispensary=1 if gestfips==30 & year>=2005 // 12
replace lag_dispensary=1 if gestfips==34 & year>=2011 // 13
replace lag_dispensary=1 if gestfips==32 & year>=2001 // 14
replace lag_dispensary=1 if gestfips==44 & year>=2007 // 15
replace lag_dispensary=1 if gestfips==50 & year>=2005 // 16
replace lag_dispensary=1 if gestfips==53 & year>=2013 // 17

cd "/Users/trev/Desktop/ECON 488/dta_describe"
save cps_describe.dta, replace






//////////////////////////////////////////////////////////////////
///////////////////////UNEMPLOYMENT VARIABLE//////////////////////
//////////////////////////////////////////////////////////////////
cd "/Users/trev/Desktop/ECON 488"
import excel using unemployment_merge.xlsx, firstrow clear
*PREP TO MERGE*
reshape long year_, i(gestfips) j(year)
	rename year_ unemployment
	keep gestfips year unemployment
		save unemployment.dta, replace
cd "/Users/trev/Desktop/ECON 488/dta_describe"
use cps_describe.dta, clear
	merge m:1 gestfips year using "/Users/trev/Desktop/ECON 488/unemployment.dta"
	drop _merge
		cd "/Users/trev/Desktop/ECON 488/dta_describe"
		save cps_describe.dta, replace

		
		
		
//////////////////////////////////////////////////////////////////
///////////////////////////CLEANING DATA//////////////////////////
//////////////////////////////////////////////////////////////////

		*rename variables*
*year = fine
rename hrhhid id
rename peage age
rename gestfips state
	label var state "state - FIPS coding"
rename hufaminc fam_income
rename pesex sex
rename ptdtrace race
rename peeduca education
		***SUPPLEMENT VARS***	
*hs_dropout & col_enroll*
rename pesschol enroll
	label var enroll "enrolled in school"
rename pegrade grade
	label var grade "grade student is attending"
rename pelastyr enroll_ly
	label var enroll_ly "enrolled in school last year"
rename pelastgd grade_ly
	label var grade_ly "grade in previous year"
*2yr4yr*
rename pestype two_four_yr
	label var two_four_yr "2yr or 4yr college"
*GED*
rename peged hsgrad_type
	label var hsgrad_type "HS grad: GED vs. diploma"

	
	
	
	
*save cleaned data*
cd "/Users/trev/Desktop/ECON 488/dta_describe"
save cps_describe.dta, replace
