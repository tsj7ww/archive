cd "/Users/trev/Desktop/ECON 488/dta_final"
	use cps_final.dta, clear

cd "/Users/trev/Desktop/ECON 488/outreg"

set more off

/////////////////////////////////////////////////////////////////
//////////////////////////HS DROPOUT/////////////////////////////
/////////////////////////////////////////////////////////////////

//////////////////////////////////
///////////HS DROPOUT/////////////
//////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/outreg/hs-dropout"

*no FE*
reg hs_dropout i.fam_income i.sex i.race unemployment ///
		i.type decrim dispensary, vce(robust)
quietly outreg using "hs-do.docx", replace title(HS Dropout) se bdec(4) 
*state FE*
reg hs_dropout i.fam_income i.sex i.race unemployment ///
	i.state ///
		i.type decrim dispensary, vce(robust)
quietly outreg using "hs-do.docx", merge se bdec(4)
*year FE*
reg hs_dropout i.fam_income i.sex i.race unemployment ///
	i.year ///
		i.type decrim dispensary, vce(robust)
quietly outreg using "hs-do.docx", merge se bdec(4)


///////////////////////
///////////////////////


*state & year FE*
reg hs_dropout i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.type decrim dispensary, vce(robust)
quietly outreg using "hs-do.docx", merge se bdec(4)
*logit*
logit hs_dropout i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.type decrim dispensary, vce(robust)
outreg2 using "hs-do_lp.docx", replace title(HS Dropout) se bdec(4) ctitle(Logit)
testparm i.state i.year
testparm i.type decrim dispensary

//////////////////////////////////
////////LAG HS DROPOUT////////////
//////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/outreg/L.hs-dropout"

*state & year FE*
reg hs_dropout i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
quietly outreg using "lag_hs-do.docx", replace se bdec(4)
*logit*
logit hs_dropout i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
outreg2 using "lag_hs-do_lp.docx", replace title(Lagged Policy - HS Dropout) se bdec(4) ctitle(Logit)

/////////////////////////////////////////////////////////////////
////////////////////COLLEGE ENROLLMENT///////////////////////////
/////////////////////////////////////////////////////////////////

//////////////////////////////////
////////COLLEGE ENROLLMENT////////
//////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/outreg/col-enroll"

*state & year FE*
reg col_enroll i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.type decrim dispensary, vce(robust)
quietly outreg using "col-enroll.docx", replace se bdec(4)
*logit*
logit col_enroll i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.type decrim dispensary, vce(robust)
outreg2 using "col-enroll_lp.docx", replace title(College Enrollment) se bdec(4) ctitle(Logit)

//////////////////////////////////
////////LAG COL ENROLL////////////
//////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/outreg/L.col-enroll"

*state & year FE*
reg col_enroll i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
quietly outreg using "lag_col-enroll.docx", replace se bdec(4)
*logit*
logit col_enroll i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
outreg2 using "lag_col-enroll_lp.docx", replace title(Lagged Policy - College Enrollment) se bdec(4) ctitle(Logit)
