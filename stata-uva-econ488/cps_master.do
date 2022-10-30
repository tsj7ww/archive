///////////////////////////////////////////////*NOTES*////////////////////////////////////////////////
*File Locations*
*.dat: http://thedataweb.rm.census.gov/ftp/cps_ftp.html#cpsbasic
*.do: http://www.nber.org/data/cps_basic_progs.html
*.dct: http://www.nber.org/data/cps_basic_progs.html
*extract: http://www.nber.org/data/current-population-survey-data.html

///////////////////////////////////////////////*Prep .do files*////////////////////////////////////////////////
/*Changes made to do files:
	a. change do file to match directories and files names
	b. end each do file by saving .dta file
*/

///////////////////////////////////////////////*Set globals*////////////////////////////////////////////////


//////////////////////////////////////////////*Change directory*//////////////////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/do"

/////////////////////////////////////////////////////*.dat --> .dta*/////////////////////////////////////////////////////

***NOTES FROM DOWNLOADED DO FILES***

*All items, except those with one character, also can have values
*of -1, -2, or -3 even if the values are not in the documentation
*The meaning is
*       -1 .Blank or not in universe
*       -2 .Don't know
*       -3 .Refused
* The following changes in variable names have been made, if necessary:
*      '$' to 'd';            '-' to '_';              '%' to 'p';
*      ($ = unedited data;     - = edited data;         % = allocated data)

***NOTES FROM DOWNLOADED DO FILES***

*1995*
cd "/Users/trev/Desktop/ECON 488/do/dat_dta"
quietly do cpsoct1995.do
rename perace ptdtrace // rename race variable to match majority of versions
rename prhspnon pehspnon // rename hispanic variable to match majority of versions
cd "/Users/trev/Desktop/ECON 488/dta"
save oct95.dta, replace
*1996*
cd "/Users/trev/Desktop/ECON 488/do/dat_dta"
quietly do cpsoct1996.do
rename perace ptdtrace // rename race variable to match majority of versions
rename prhspnon pehspnon // rename hispanic variable to match majority of versions
cd "/Users/trev/Desktop/ECON 488/dta"
save oct96.dta, replace
*1997*
cd "/Users/trev/Desktop/ECON 488/do/dat_dta"
quietly do cpsoct1997.do
rename perace ptdtrace // rename race variable to match majority of versions
rename prhspnon pehspnon // rename hispanic variable to match majority of versions
cd "/Users/trev/Desktop/ECON 488/dta"
save oct97.dta, replace
*1998*
cd "/Users/trev/Desktop/ECON 488/do/dat_dta"
quietly do cpsoct1998.do
rename perace ptdtrace // rename race variable to match majority of versions
rename prhspnon pehspnon // rename hispanic variable to match majority of versions
cd "/Users/trev/Desktop/ECON 488/dta"
save oct98.dta, replace
*1999*
cd "/Users/trev/Desktop/ECON 488/do/dat_dta"
quietly do cpsoct1999.do
rename perace ptdtrace // rename race variable to match majority of versions
rename prhspnon pehspnon // rename hispanic variable to match majority of versions
cd "/Users/trev/Desktop/ECON 488/dta"
save oct99.dta, replace
*2000*
cd "/Users/trev/Desktop/ECON 488/do/dat_dta"
quietly do cpsoct2000.do
rename perace ptdtrace // rename race variable to match majority of versions
rename prhspnon pehspnon // rename hispanic variable to match majority of versions
cd "/Users/trev/Desktop/ECON 488/dta"
save oct00.dta, replace
*2001*
cd "/Users/trev/Desktop/ECON 488/do/dat_dta"
quietly do cpsoct2001.do
rename perace ptdtrace // rename race variable to match majority of versions
rename prhspnon pehspnon // rename hispanic variable to match majority of versions
cd "/Users/trev/Desktop/ECON 488/dta"
save oct01.dta, replace
*2002*
cd "/Users/trev/Desktop/ECON 488/do/dat_dta"
quietly do cpsoct2002.do
rename perace ptdtrace // rename race variable to match majority of versions
rename prhspnon pehspnon // rename hispanic variable to match majority of versions
cd "/Users/trev/Desktop/ECON 488/dta"
save oct02.dta, replace
*2003*
cd "/Users/trev/Desktop/ECON 488/do/dat_dta"
quietly do cpsoct2003.do
rename prtage peage // rename age variable to match majority of versions
cd "/Users/trev/Desktop/ECON 488/dta"
save oct03.dta, replace
*2004*
cd "/Users/trev/Desktop/ECON 488/do/dat_dta"
quietly do cpsoct2004.do
rename prtage peage // rename age variable to match majority of versions
cd "/Users/trev/Desktop/ECON 488/dta"
save oct04.dta, replace
*2005*
cd "/Users/trev/Desktop/ECON 488/do/dat_dta"
quietly do cpsoct2005.do
cd "/Users/trev/Desktop/ECON 488/dta"
save oct05.dta, replace
*2006*
cd "/Users/trev/Desktop/ECON 488/do/dat_dta"
quietly do cpsoct2006.do
cd "/Users/trev/Desktop/ECON 488/dta"
save oct06.dta, replace
*2007*
cd "/Users/trev/Desktop/ECON 488/do/dat_dta"
quietly do cpsoct2007.do
cd "/Users/trev/Desktop/ECON 488/dta"
save oct07.dta, replace
*2008*
cd "/Users/trev/Desktop/ECON 488/do/dat_dta"
quietly do cpsoct2008.do
cd "/Users/trev/Desktop/ECON 488/dta"
save oct08.dta, replace
*2009*
cd "/Users/trev/Desktop/ECON 488/do/dat_dta"
quietly do cpsoct2009.do
cd "/Users/trev/Desktop/ECON 488/dta"
save oct09.dta, replace
*2010*
cd "/Users/trev/Desktop/ECON 488/do/dat_dta"
quietly do cpsoct2010.do
rename hefaminc hufaminc // rename family income variable to match majority of versions
cd "/Users/trev/Desktop/ECON 488/dta"
save oct10.dta, replace
*2011*
cd "/Users/trev/Desktop/ECON 488/do/dat_dta"
quietly do cpsoct2011.do
rename hefaminc hufaminc // rename family income variable to match majority of versions
cd "/Users/trev/Desktop/ECON 488/dta"
save oct11.dta, replace
*2012*
cd "/Users/trev/Desktop/ECON 488/do/dat_dta"
quietly do cpsoct2012.do
rename prtage peage // rename age variable to match majority of versions
rename hefaminc hufaminc // rename family income variable to match majority of versions
cd "/Users/trev/Desktop/ECON 488/dta"
save oct12.dta, replace
*2013*
cd "/Users/trev/Desktop/ECON 488/do/dat_dta"
quietly do cpsoct2013.do
rename prtage peage // rename age variable to match majority of versions
rename hefaminc hufaminc // rename family income variable to match majority of versions
cd "/Users/trev/Desktop/ECON 488/dta"
save oct13.dta, replace
*2014*
cd "/Users/trev/Desktop/ECON 488/do/dat_dta"
quietly do cpsoct2014.do
rename prtage peage // rename age variable to match majority of versions
rename hefaminc hufaminc // rename family income variable to match majority of versions
cd "/Users/trev/Desktop/ECON 488/dta"
save oct14.dta, replace

/////////////////////////////////////////////////////*append*/////////////////////////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/do"
quietly do cps_append.do // note: "force" option was needed for year 2004 


/////////////////////////////////////////////////////*data cleaning*/////////////////////////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/do"
quietly do cps_clean.do

/////////////////////////////////////////////////////*data description*/////////////////////////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/do"
do cps_description.do

/////////////////////////////////////////////////////*MORE data cleaning*/////////////////////////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/do"
quietly do cps_clean2.do

/////////////////////////////////////////////////////*regression*/////////////////////////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/do"
do cps_reg.do

/*

/////////////////////////////////////////////////////*graphs*/////////////////////////////////////////////////////
cd "/Users/trev/Desktop/ECON 488/do"
do cps_graph.do


