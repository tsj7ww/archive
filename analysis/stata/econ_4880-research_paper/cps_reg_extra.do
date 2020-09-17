cd "/Users/trev/Desktop/ECON 488/dta_final"
	use cps_final.dta, clear

gen rand_num = rnormal(.4358265, .68677269)

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
*state & year FE*
reg hs_dropout i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.type decrim dispensary, vce(robust)
quietly outreg using "hs-do.docx", merge se bdec(4)
testparm i.state i.year
testparm i.type decrim dispensary
*logit*
logit hs_dropout i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.type decrim dispensary, vce(robust)
outreg2 using "hs-do_lp.docx", replace title(HS Dropout) se bdec(4) ctitle(Logit)
testparm i.type decrim dispensary
*probit*
probit hs_dropout i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.type decrim dispensary, vce(robust)
outreg2 using "hs-do_lp.docx", append se bdec(4) ctitle(Probit)
testparm i.type decrim dispensary

//////////////////////////////////
////////LAG HS DROPOUT////////////
//////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/outreg/L.hs-dropout"

*no FE*
reg hs_dropout i.fam_income i.sex i.race unemployment ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
quietly outreg using "lag_hs-do.docx", replace title(Lagged Policy - HS Dropout) se bdec(4) 
*state FE*
reg hs_dropout i.fam_income i.sex i.race unemployment ///
	i.state ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
quietly outreg using "lag_hs-do.docx", merge se bdec(4)
*year FE*
reg hs_dropout i.fam_income i.sex i.race unemployment ///
	i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
quietly outreg using "lag_hs-do.docx", merge se bdec(4)
*state & year FE*
reg hs_dropout i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
testparm i.state i.year
quietly outreg using "lag_hs-do.docx", merge se bdec(4)
*logit*
logit hs_dropout i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
outreg2 using "lag_hs-do_lp.docx", replace title(Lagged Policy - HS Dropout) se bdec(4) ctitle(Logit)
*probit*
probit hs_dropout i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
outreg2 using "lag_hs-do_lp.docx", append se bdec(4) ctitle(Probit)

/////////////////////////////////////////////////////////////////
///////////////////////COLLEGE DROPOUT///////////////////////////
/////////////////////////////////////////////////////////////////

//////////////////////////////////
////////COLLEGE DROPOUT///////////
//////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/outreg/col-dropout"

*no FE*
reg col_dropout i.fam_income i.sex i.race unemployment ///
		i.type decrim dispensary, vce(robust)
quietly outreg using "col-do.docx", replace title(College Dropout) se bdec(4) 
*state FE*
reg col_dropout i.fam_income i.sex i.race unemployment ///
	i.state ///
		i.type decrim dispensary, vce(robust)
quietly outreg using "col-do.docx", merge se bdec(4)
*year FE*
reg col_dropout i.fam_income i.sex i.race unemployment ///
	i.year ///
		i.type decrim dispensary, vce(robust)
quietly outreg using "col-do.docx", merge se bdec(4)
*state & year FE*
reg col_dropout i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.type decrim dispensary, vce(robust)
testparm i.state i.year
quietly outreg using "col-do.docx", merge se bdec(4)
outreg2 using "col-do_lp.docx", replace title(College Dropout) se bdec(4) ctitle(Logit)
*probit*
probit col_dropout i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.type decrim dispensary, vce(robust)
outreg2 using "col-do_lp.docx", append se bdec(4) ctitle(Probit)

//////////////////////////////////
///////LAG COL DROPOUT////////////
//////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/outreg/L.col-dropout"

*no FE*
reg col_dropout i.fam_income i.sex i.race unemployment ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
quietly outreg using "lag_col-do.docx", replace title(Lagged Policy - College Dropout) se bdec(4) 
*state FE*
reg col_dropout i.fam_income i.sex i.race unemployment ///
	i.state ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
quietly outreg using "lag_col-do.docx", merge se bdec(4)
*year FE*
reg col_dropout i.fam_income i.sex i.race unemployment ///
	i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
quietly outreg using "lag_col-do.docx", merge se bdec(4)
*state & year FE*
reg col_dropout i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
testparm i.state i.year
quietly outreg using "lag_col-do.docx", merge se bdec(4)
*logit*
logit col_dropout i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
outreg2 using "lag_col-do_lp.docx", replace title(Lagged Policy - College Dropout) se bdec(4) ctitle(Logit)
*probit*
probit col_dropout i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
outreg2 using "lag_col-do_lp.docx", append se bdec(4) ctitle(Probit)

/////////////////////////////////////////////////////////////////
////////////////////COLLEGE ENROLLMENT///////////////////////////
/////////////////////////////////////////////////////////////////

//////////////////////////////////
////////COLLEGE ENROLLMENT////////
//////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/outreg/col-enroll"

reg col_enroll i.fam_income i.sex i.race unemployment ///
		i.type decrim dispensary, vce(robust)
quietly outreg using "col-enroll.docx", replace title(College Enrollment) se bdec(4) 
*state FE*
reg col_enroll i.fam_income i.sex i.race unemployment ///
	i.state ///
		i.type decrim dispensary, vce(robust)
quietly outreg using "col-enroll.docx", merge se bdec(4)
*year FE*
reg col_enroll i.fam_income i.sex i.race unemployment ///
	i.year ///
		i.type decrim dispensary, vce(robust)
quietly outreg using "col-enroll.docx", merge se bdec(4)
*state & year FE*
reg col_enroll i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.type decrim dispensary, vce(robust)
testparm i.state i.year
quietly outreg using "col-enroll.docx", merge se bdec(4)
*logit*
logit col_enroll i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.type decrim dispensary, vce(robust)
outreg2 using "col-enroll_lp.docx", replace title(College Enrollment) se bdec(4) ctitle(Logit)
*probit*
probit col_enroll i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.type decrim dispensary, vce(robust)
outreg2 using "col-enroll_lp.docx", append se bdec(4) ctitle(Probit)

//////////////////////////////////
////////LAG COL ENROLL////////////
//////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/outreg/L.col-enroll"

*no FE*
reg col_enroll i.fam_income i.sex i.race unemployment ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
quietly outreg using "lag_col-enroll.docx", replace title(Lagged Policy - College Enrollment) se bdec(4) 
*state FE*
reg col_enroll i.fam_income i.sex i.race unemployment ///
	i.state ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
quietly outreg using "lag_col-enroll.docx", merge se bdec(4)
*year FE*
reg col_enroll i.fam_income i.sex i.race unemployment ///
	i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
quietly outreg using "lag_col-enroll.docx", merge se bdec(4)
*state & year FE*
reg col_enroll i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
testparm i.state i.year
quietly outreg using "lag_col-enroll.docx", merge se bdec(4)
*logit*
logit col_enroll i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
outreg2 using "lag_col-enroll_lp.docx", replace title(Lagged Policy - College Enrollment) se bdec(4) ctitle(Logit)
*probit*
probit col_enroll i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
outreg2 using "lag_col-enroll_lp.docx", append se bdec(4) ctitle(Probit)

/////////////////////////////////////////////////////////////////
////////////////////////2/4 YR COLLEGE///////////////////////////
/////////////////////////////////////////////////////////////////

//////////////////////////////////
/////////2/4 YR COLLEGE///////////
//////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/outreg/2yr4yr"

*no FE*
reg two_four_yr i.fam_income i.sex i.race unemployment ///
		i.type decrim dispensary, vce(robust)
quietly outreg using "2yr4yr.docx", replace title(2 Year vs. 4 Year College) se bdec(4) 
*state FE*
reg two_four_yr i.fam_income i.sex i.race unemployment ///
	i.state ///
		i.type decrim dispensary, vce(robust)
quietly outreg using "2yr4yr.docx", merge se bdec(4)
*year FE*
reg two_four_yr i.fam_income i.sex i.race unemployment ///
	i.year ///
		i.type decrim dispensary, vce(robust)
quietly outreg using "2yr4yr.docx", merge se bdec(4)
*state & year FE*
reg two_four_yr i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.type decrim dispensary, vce(robust)
testparm i.state i.year
quietly outreg using "2yr4yr.docx", merge se bdec(4)
*logit*
logit two_four_yr i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.type decrim dispensary, vce(robust)
outreg2 using "2yr4yr_lp.docx", replace title(2 Year vs. 4 Year College) se bdec(4) ctitle(Logit)
*probit*
probit two_four_yr i.fam_income i.sex i.race unemployment ///
	i.state i.year ///		
		i.type decrim dispensary, vce(robust)
outreg2 using "2yr4yr_lp.docx", append se bdec(4) ctitle(Probit)
	
//////////////////////////////////
////////LAG 2/4 YR COLLEGE////////
//////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/outreg/L.2yr4yr"

*no FE*
reg two_four_yr i.fam_income i.sex i.race unemployment ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
quietly outreg using "lag_2yr4yr.docx", replace title(Lagged Policy - 2 Year vs. 4 Year College) se bdec(4) 
*state FE*
reg two_four_yr i.fam_income i.sex i.race unemployment ///
	i.state ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
quietly outreg using "lag_2yr4yr.docx", merge se bdec(4)
*year FE*
reg two_four_yr i.fam_income i.sex i.race unemployment ///
	i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
quietly outreg using "lag_2yr4yr.docx", merge se bdec(4)
*state & year FE*
reg two_four_yr i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
testparm i.state i.year
quietly outreg using "lag_2yr4yr.docx", merge se bdec(4)
*logit*
logit two_four_yr i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
outreg2 using "lag_2yr4yr_lp.docx", replace title(Lagged Policy - 2 Year vs. 4 Year College) se bdec(4) ctitle(Logit)
*probit*
probit two_four_yr i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
outreg2 using "lag_2yr4yr_lp.docx", append se bdec(4) ctitle(Probit)

/////////////////////////////////////////////////////////////////
//////////////////////GED vs. GRADUATION/////////////////////////
/////////////////////////////////////////////////////////////////

//////////////////////////////////
///////////GED vs. GRAD///////////
//////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/outreg/ged"

*no FE*
reg hsgrad_type i.fam_income i.sex i.race unemployment ///
		i.type decrim dispensary, vce(robust)
quietly outreg using "ged.docx", replace title(GED vs. Graduation) se bdec(4) 
*state FE*
reg hsgrad_type i.fam_income i.sex i.race unemployment ///
	i.state ///
		i.type decrim dispensary, vce(robust)
quietly outreg using "ged.docx", merge se bdec(4)
*year FE*
reg hsgrad_type i.fam_income i.sex i.race unemployment ///
	i.year ///
		i.type decrim dispensary, vce(robust)
quietly outreg using "ged.docx", merge se bdec(4)
*state & year FE*
reg hsgrad_type i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.type decrim dispensary, vce(robust)
testparm i.state i.year
quietly outreg using "ged.docx", merge se bdec(4)
*logit*
logit hsgrad_type i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.type decrim dispensary, vce(robust)
outreg2 using "ged_lp.docx", replace title(GED vs. Graduation) se bdec(4) ctitle(Logit)
*probit*
probit hsgrad_type i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.type decrim dispensary, vce(robust)
outreg2 using "ged_lp.docx", append se bdec(4) ctitle(Probit)

//////////////////////////////////
/////////////LAG GED//////////////
//////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/outreg/L.ged"

*no FE*
reg hsgrad_type i.fam_income i.sex i.race unemployment ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
quietly outreg using "lag_ged.docx", replace title(Lagged Policy - GED vs. Graduation) se bdec(4) 
*state FE*
reg hsgrad_type i.fam_income i.sex i.race unemployment ///
	i.state ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
quietly outreg using "lag_ged.docx", merge se bdec(4)
*year FE*
reg hsgrad_type i.fam_income i.sex i.race unemployment ///
	i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
quietly outreg using "lag_ged.docx", merge se bdec(4)
*state & year FE*
reg hsgrad_type i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
testparm i.state i.year
quietly outreg using "lag_ged.docx", merge se bdec(4)
*logit*
logit hsgrad_type i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
outreg2 using "lag_ged_lp.docx", replace title(Lagged Policy - GED vs. Graduation) se bdec(4) ctitle(Logit)
*probit*
probit hsgrad_type i.fam_income i.sex i.race unemployment ///
	i.state i.year ///
		i.lag_type lag_decrim lag_dispensary, vce(robust)
outreg2 using "lag_ged_lp.docx", append se bdec(4) ctitle(Probit)
