cd "/Users/trev/Desktop/ECON 488/dta_describe"
use cps_describe.dta, clear

//////////////////////////////////////////////////////////////////
//////////////////////////MORE CLEANING///////////////////////////
//////////////////////////////////////////////////////////////////

***DROP VARIABLES NOT USED IN REGRESSION***
drop education
	
	
	
	
	
///////////////////////////
/////VARIABLE CLEANING/////
///////////////////////////


			***********************************************
			***individual and households characteristics***
			***********************************************
*fam_income*
	replace fam_income=. if fam_income<=0
	replace fam_income=14 if fam_income>=14 // revert to 2002 format = encompassed by "75000 or more" category
*sex*
	replace sex=. if sex<=-1
	replace sex=0 if sex==2
*race*
	replace race=. if race<=0
	replace race=5 if race>=5 // revert to 2002 format - encompassed by "other" category
	
	
	
	
			*************************
			***dependent variables***
			*************************
replace grade=. if grade==-1
replace grade_ly=. if grade_ly==-1
replace enroll=. if enroll==-1
	replace enroll=0 if enroll==2
replace enroll_ly=. if enroll_ly==-1
	replace enroll_ly=0 if enroll_ly==2
gen grade_change = grade - grade_ly
gen enrollment_change = enroll - enroll_ly
*hs_dropout*
	gen hs_dropout=17 // to make sure that there is no incorrect coding
		replace hs_dropout=0 if grade_change==1 & enrollment_change==0
		replace hs_dropout=1 if enrollment_change==-1
		replace hs_dropout=. if grade_ly<9 | grade_ly>11
		replace hs_dropout=. if enrollment_change==0 & grade_change!=1
*col_dropout*
	gen col_dropout=17 // to make sure that there is no incorrect coding
		replace col_dropout=0 if grade_change==1 & enrollment_change==0
		replace col_dropout=1 if enrollment_change==-1
		replace col_dropout=. if grade_ly<13 | grade_ly>15
		replace col_dropout=. if enrollment_change==0 & grade_change!=1
*col_enroll*
	gen col_enroll=17 // to make sure that there is no incorrect coding
		replace col_enroll=0 if enrollment_change==-1
		replace col_enroll=1 if grade_change==1 & enrollment_change==0
		replace col_enroll=. if grade_ly!=12
		replace col_enroll=. if enrollment_change==0 & grade_change!=1
*two_four_yr*
	replace two_four_yr=. if two_four_yr==-1
	replace two_four_yr=0 if two_four_yr==2
*hsgrad_type*
	replace hsgrad_type=. if hsgrad_type<=-1 // -1, -2, & -3 are options for this ?
	replace hsgrad_type=0 if hsgrad_type==2

///////////////////	
*make dta smaller*
	drop if hs_dropout==. & col_dropout==. & ///
		col_enroll==. & two_four_yr==. & hsgrad_type==.
///////////////////

	
///////////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/dta_final"
	save cps_final.dta, replace
