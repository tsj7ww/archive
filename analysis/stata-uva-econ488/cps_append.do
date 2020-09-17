cd "/Users/trev/Desktop/ECON 488/dta"

*no need to press the "more" button to continue*
set more off

use oct95, clear
gen year = 0
replace year = 1995 if year == 0
label variable year "year of cps data"
order year

append using oct96
replace year = 1996 if year == .

append using oct97
replace year = 1997 if year == .

append using oct98
replace year = 1998 if year == .

append using oct99
replace year = 1999 if year == .

append using oct00
replace year = 2000 if year == .

append using oct01
replace year = 2001 if year == .

append using oct02
replace year = 2002 if year == .

append using oct03
replace year = 2003 if year == .

append using oct04, force
replace year = 2004 if year == .
* note: "force" option was needed for year 2004 

append using oct05
replace year = 2005 if year == .

append using oct06
replace year = 2006 if year == .

append using oct07
replace year = 2007 if year == .

append using oct08
replace year = 2008 if year == .

append using oct09
replace year = 2009 if year == .

append using oct10
replace year = 2010 if year == .

append using oct11
replace year = 2011 if year == .

append using oct12
replace year = 2012 if year == .

append using oct13
replace year = 2013 if year == .

append using oct14
replace year = 2014 if year == .



*save full dataset*
cd "/Users/trev/Desktop/ECON 488/dta_full"

save cps_full.dta, replace



