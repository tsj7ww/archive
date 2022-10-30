*Data collected from pre & post survey, compiled into ///
/// (1) full excel file, participants matched, and file downloaded*
	***this could have been done by downloading raw excel files, ///
		/// dropping participants, and merging files
		
		
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

*PART 1 - XLSX --> DTA

cd "/Users/trev/Desktop/ASB study"
import excel using "full-email.xlsx", firstrow clear
save "asb_research_study.dta", replace

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

*PART 2 - CLEAN DATA

*rename long var names
rename Howoftendoyoutypicallyvolun volunteer_freq
rename Whatisyourreasonmotivationf motivation
rename Whichexperimentalgroupwereyo exp_group
*repeated questions - from experimental group 1 (control)
rename Howwasyourtrip trip_rating1
rename Pleaselistthetop3reasonsfo reasons1
rename Howlikelyisitthatyouwillv asb_repeat1
rename Howlikelyisitthatyouwould volunteer_weekly1
rename Wouldyouliketovolunteerfor tbe_registration1
*repeated questions - from experimental group 2 (primer)
rename U trip_rating2
rename V reasons2
rename W asb_repeat2
rename X volunteer_weekly2
rename Y tbe_registration2
rename Howimpactfulwasthereadingac primer_impact
rename Wasthatimpactpositivenegati impact_type
*drop unnecessary vars
drop AE
drop AF
drop AG
drop AH
drop AI
drop AJ
drop AK
drop AL
*relabel confusing var labels
label var Continue "did participant continue from pre to post survey?"
label var Finished "did participant finish the post survey at time of compilation?"
label var trip_name "Name of the ASB trip"
label var trip_id "coded ASB trips"
*drop people who did not continue onto post-survey
drop if Finished==0
*encode vars so combining is possible
gen tbe_registration = 0
label var tbe_registration "Would you like to volunteer for the Big Event at UVA?"
replace tbe_registration = 1 if tbe_registration1 == "Yes"
replace tbe_registration = 1 if tbe_registration2 == "Yes"
*combine repeated vars
gen trip_rating = max(trip_rating1, trip_rating2)
label var trip_rating "How was your trip?"
gen asb_repeat = max(asb_repeat1, asb_repeat2)
label var asb_repeat "How likely is it that you will volunteer again with ASB next year?"
gen volunteer_weekly = max(volunteer_weekly1, volunteer_weekly2)
label var volunteer_weekly "How likely is it that you would make volunteering a part of your weekly routine?"
*drop repeated vars
drop trip_rating1
drop trip_rating2
drop asb_repeat1
drop asb_repeat2
drop volunteer_weekly1
drop volunteer_weekly2
drop tbe_registration1
drop tbe_registration2
drop tbe_code
*code string vars - year, motivation, primer impact type, volunteer frequency
*year
gen year = 0
label var year "students year at UVA"
replace year = 1 if Year == "1st"
replace year = 2 if Year == "2nd"
replace year = 3 if Year == "3rd"
replace year = 4 if Year == "4th"
drop Year
*motivation - 1=MOST SELFISH; 5=MOST SELFLESS
label var motivation_code "1=MOST SELFISH; 5=MOST SELFLESS"
replace motivation_code = 4 in 1
replace motivation_code = 4 in 2
replace motivation_code = 4 in 3
replace motivation_code = 2 in 4
replace motivation_code = 2 in 5
replace motivation_code = 4 in 6
replace motivation_code = 1 in 7
replace motivation_code = 1 in 8
replace motivation_code = 1 in 9
replace motivation_code = 1 in 10
replace motivation_code = 2 in 11
replace motivation_code = 2 in 12
replace motivation_code = 2 in 13
replace motivation_code = 2 in 14
replace motivation_code = 1 in 15
replace motivation_code = 4 in 16
replace motivation_code = 1 in 17
	***replace motivation_code = 0 in 18
	***replace motivation_code = 0 in 19
*primer impact type - 0=negative; 1=neutral; 2=positive; .=control group
label var impact_code "0=negative; 1=neutral; 2=positive; .=control group"
replace impact_code = 0 if impact_type == "Negative"
replace impact_code = 1 if impact_type == "Neutral"
replace impact_code = 2 if impact_type == "Positive"
replace impact_code = . if impact_type == ""
*volunteer frequency - 0=weekly; 1=biweekly; 2=monthly; 3=yearly
gen vol_freq_code = 0
label var vol_freq_code "previous volunteering - 0=weekly; 1=biweekly; 2=monthly; 3=yearly"
replace vol_freq_code = 0 if volunteer_freq == "Weekly"
replace vol_freq_code = 1 if volunteer_freq == "Biweekly"
replace vol_freq_code = 2 if volunteer_freq == "Monthly"
replace vol_freq_code = 3 if volunteer_freq == "Yearly"
*irrelevant vars: Participant_ID, Gender, Religion, Race_Ethnicity, School, Major, Impact Type, reasons (1 & 2 & code), volunteer frequency, motivation, continue & finished
order Participant_ID Gender Religion Race_Ethnicity School Major ///
impact_type reasons_code reasons1 reasons2 volunteer_freq motivation ///
Continue Finished, last
sort exp_group

*encode vars - for individual FEs*
	*Gender*
encode Gender, gen(female)
	*Vol Freq*
*free up desired numbers*
replace vol_freq_code=5 if vol_freq_code==0 // weekly
replace vol_freq_code=6 if vol_freq_code==1 // biweekly
replace vol_freq_code=7 if vol_freq_code==2 // monthly
replace vol_freq_code=8 if vol_freq_code==3 // yearly
*replace to actual #s*
replace vol_freq_code=0 if vol_freq_code==8 // yearly
replace vol_freq_code=1 if vol_freq_code==7 // monthly
replace vol_freq_code=2 if vol_freq_code==6 // biweekly
replace vol_freq_code=3 if vol_freq_code==5 // weekly

///////////////
save "asb_research_study.dta", replace
///////////////

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

*PART 3 - REGRESSIONS & OUTREG
/*
DVs - tbe_registration (LPM, logit, probit), asb_repeat (drop if year==4), volunteer_weekly, trip rating
EVs - 
FEs - experimental group, trip; volunteer frequency? impact? 
*/
set more off

*TBE registration*
use asb_research_study.dta, clear

reg tbe_registration i.trip_id ib1.exp_group, vce(robust)
	quietly outreg using asb_outreg.docx, replace title(ASB Research Study Outreg) se bdec(4) 
reg tbe_registration ib2.female i.trip_id ib1.exp_group, vce(robust)
	quietly outreg using asb_outreg.docx, merge se bdec(4)
reg tbe_registration ib0.vol_freq_code ib2.female i.trip_id ib1.exp_group, vce(robust)
	quietly outreg using asb_outreg.docx, merge se bdec(4)

/*
	***LOGIT & PROBIT MODELS DID NOT WORK***
logit tbe_registration i.trip_id ib1.exp_group
outreg2 using asb_outreg2.docx, replace title (ASB Research Study Outreg) se bdec(4)
probit tbe_registration i.trip_id ib1.exp_group
outreg2 using asb_outreg2.docx, append title (ASB Research Study Outreg) se bdec(4)
*/

*ASB Repeat*
use asb_research_study.dta, clear
	drop if year==4 // 4th years won't be back the following year to participate in ASB
	
reg asb_repeat i.trip_id ib1.exp_group, vce(robust)
	quietly outreg using asb_outreg.docx, merge se bdec(4)
reg asb_repeat ib2.female i.trip_id ib1.exp_group, vce(robust)
	quietly outreg using asb_outreg.docx, merge se bdec(4)
reg asb_repeat ib0.vol_freq_code ib2.female i.trip_id ib1.exp_group, vce(robust)
	quietly outreg using asb_outreg.docx, merge se bdec(4)

*Volunteer Weekly Schedule*
use asb_research_study.dta, clear

reg volunteer_weekly i.trip_id ib1.exp_group, vce(robust)
	quietly outreg using asb_outreg.docx, merge se bdec(4)
reg volunteer_weekly ib2.female i.trip_id ib1.exp_group, vce(robust)
	quietly outreg using asb_outreg.docx, merge se bdec(4)
reg volunteer_weekly ib0.vol_freq_code ib2.female i.trip_id ib1.exp_group, vce(robust)
	quietly outreg using asb_outreg.docx, merge se bdec(4)
	
*Trip Rating*
use asb_research_study.dta, clear

reg trip_rating i.trip_id ib1.exp_group, vce(robust)
	quietly outreg using asb_outreg.docx, merge se bdec(4)
reg trip_rating ib2.female i.trip_id ib1.exp_group, vce(robust)
	quietly outreg using asb_outreg.docx, merge se bdec(4)
reg trip_rating ib0.vol_freq_code ib2.female i.trip_id ib1.exp_group, vce(robust)
	quietly outreg using asb_outreg.docx, merge se bdec(4)

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

*PART 4 - SUM STATS & FIGURES


///*GRAPHS*///

*TBE (bar freq count) Graph*
quietly graph bar (count), over(tbe_registration) over(exp_group) blabel(bar) ///
ytitle(Frequency of Option Chosen (0=no, 1=yes)) ///
title(TBE Registration)
graph export "tbe_reg.pdf", replace

*ASB Repeat (bar freq count) Graph*
quietly graph bar (count), over(asb_repeat) over(exp_group) blabel(bar) ///
	ytitle(Frequency of Option Chosen (Scale: 1(least likely)-5(most likely))) ///
	title(ASB Repeat Following Year)
graph export "asb_repeat.pdf", replace

*Volunteer Weekly (bar freq count) Graph*
quietly graph bar (count), over(volunteer_weekly) over(exp_group) blabel(bar) ///
	ytitle(Frequency of Option Chosen (Scale: 1(least likely)-5(most likely))) ///
	title(Likelihood of Starting Weekly Volunteer Schedule)
graph export "vol_weekly.pdf", replace

*Trip Rating (bar freq count) Graph*
quietly graph bar (count), over(trip_rating) over(exp_group) blabel(bar) ///
	ytitle(Frequency of Option Chosen (Scale: 1(worst)-5(best))) ///
	title(Rating of ASB Trip)
graph export "trip_rate.pdf", replace



///*SUM STATS*///

estpost summarize tbe_registration, listwise
	esttab using sum_stats.csv, replace cells("mean sd min max") nomtitle nonumber
estpost summarize tbe_registration if exp_group==1, listwise
	esttab using sum_stats.csv, append cells("mean sd min max") nomtitle nonumber
estpost summarize tbe_registration if exp_group==2, listwise
	esttab using sum_stats.csv, append cells("mean sd min max") nomtitle nonumber
estpost summarize asb_repeat, listwise
	esttab using sum_stats.csv, append cells("mean sd min max") nomtitle nonumber
estpost summarize asb_repeat if exp_group==1, listwise
	esttab using sum_stats.csv, append cells("mean sd min max") nomtitle nonumber
estpost summarize asb_repeat if exp_group==2, listwise
	esttab using sum_stats.csv, append cells("mean sd min max") nomtitle nonumber
estpost summarize volunteer_weekly, listwise
	esttab using sum_stats.csv, append cells("mean sd min max") nomtitle nonumber
estpost summarize volunteer_weekly if exp_group==1, listwise
	esttab using sum_stats.csv, append cells("mean sd min max") nomtitle nonumber
estpost summarize volunteer_weekly if exp_group==2, listwise
	esttab using sum_stats.csv, append cells("mean sd min max") nomtitle nonumber
estpost summarize trip_rating, listwise
	esttab using sum_stats.csv, append cells("mean sd min max") nomtitle nonumber
estpost summarize trip_rating if exp_group==1, listwise
	esttab using sum_stats.csv, append cells("mean sd min max") nomtitle nonumber
estpost summarize trip_rating if exp_group==2, listwise
	esttab using sum_stats.csv, append cells("mean sd min max") nomtitle nonumber



