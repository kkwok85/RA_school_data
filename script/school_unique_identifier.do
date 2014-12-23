clear all


* cd "C:\Users\Julian.Julian-PC\Dropbox\J file\RA_school_data"

cd "D:\dropbox_2\Dropbox\J file\RA_school_data"

/*
This script is to generate unique identifier for every year. I basically define grade10 to grade 12 as HS
and drop all the schools with enrollment = 0 for all these 3 grades
*/




* generate high school identifier in year 2007

*******************************************************************************************************

insheet using ".\raw_data\enrollment_data\FTE Enrollment by Grade Fiscal Year2007-1 Data Report_v2.csv", clear

keep if gender == "School Total"

/* this part just use to check what are the dropped schools
gen temp = 1  if grade10 == 0 & grade11 == 0 & grade12 == 0 

* these are dropped for sure
drop if temp == 1 & regexm(schoolname, "Elementary")
drop if temp == 1 & regexm(schoolname, "Middle")
drop if temp == 1 & regexm(schoolname, "Primary")
drop if temp == 1 & regexm(schoolname, "Intermediate")

* just to skim what are the schools that are dropped
list schoolname gradepk - grade12 if temp == 1 
*/


drop  if grade11 == 0 & grade12 == 0 & grade10 == 0  



split schoolname, p(" - ")

list if schoolname3 != ""    // check the school name that split into 3 names

replace schoolname2 = "Greenville Middle - High School" if schoolname2 == "Greenville Middle"
replace schoolname2 = "Inner Harbour - The Springs" if schoolname2 == "Inner Harbour"
replace schoolname2 = "Bradfield Center - Ault Academy" if schoolname2 == "Bradfield Center"




gen Lookup1 = systemid + schoolname1

keep Lookup1 schoolname2

rename schoolname2 SCHOOLNAME2007

duplicates report



save ".\temp_data\hs_identifier_2007", replace


/*

save "D:\RA_school_data\temp_data\hs_identifier_2007_enroll_part"




import excel "C:\Users\Julian.Julian-PC\Desktop\RA_school_data\raw_data\ALL_HS_2.xls", sheet("years") clear




keep D E F
rename (D E F) (SCHOOLNAME Lookup1 YEAR)
drop in 1/2

keep if YEAR == "2006"


duplicates report SCHOOLNAME Lookup1
drop YEAR
rename SCHOOLNAME SCHOOLNAME2007


* This part is to put 0 in front of the school id 
gen L1 = substr(Lookup1,1,3)
gen L2 = substr(Lookup1,4,.)

destring L2, replace
gen str4 L3 = string(L2,"%04.0f")
gen LookupN = L1 + L3
replace Lookup1 = LookupN


merge 1:1 SCHOOLNAME2007 Lookup1  using "C:\Users\Julian.Julian-PC\Desktop\RA_school_data\temp_data\hs_identifier_2007_enroll_part"

rename SCHOOLNAME2007 SCHOOLNAME
adopath + "C:\Users\Julian.Julian-PC\Desktop\RA_school_data\script\ado_file"
show_mismatch
	

	
	
sort school2_id1     // very important to sort it first

count if school2_id1 != .
scalar number_school2_id1 = r(N)

local i = 1

while `i' <= number_school2_id1 {
	local school  only_letter_all_school[`i']
	list if regexm(only_letter_all_school,`school') 
	
	local i = `i' + 1  

}


* please use set trace on to track the process

set trace on
foreach num of numlist 1 3 4 5 8 {


	replace _merge = 4 if SCHOOLNAME == "`=SCHOOLNAME[`num']'" & _merge == 1	
	replace _merge = 3 if SCHOOLNAME == "`=SCHOOLNAME[`num']'" & _merge == 2

}

replace _merge = 4 if SCHOOLNAME == "Monroe Area  High School" & _merge == 1	

set trace off


	
	

	
sort school1_id2    // very important to sort it first

count if school1_id2 != .
scalar number_school1_id2 = r(N)

local i = 1

while `i' <= number_school1_id2 {
	local school   Lookup1[`i']
	list if regexm(Lookup1,`school') 
	
	local i = `i' + 1  

}
		

		
set trace on
forvalues num = 1/19 {

	replace _merge = 4 if Lookup1 == "`=Lookup1[`num']'" & _merge == 1	
	replace _merge = 3 if Lookup1 == "`=Lookup1[`num']'" & _merge == 2

}


set trace off
		

		
		
		
		
		
		
		
		
		
sort school_special

count if school_special != .
scalar number_school_special = r(N)

local i = 1

while `i' <= number_school_special {
	local school   Lookup1[`i']
	list SCHOOLNAME Lookup1 if regexm(Lookup1,`school') 
	
	local i = `i' + 1  

}
				

				
		
set trace on
forvalues num = 1/14 {

	replace _merge = 4 if Lookup1 == "`=Lookup1[`num']'" & _merge == 1	
	replace _merge = 3 if Lookup1 == "`=Lookup1[`num']'" & _merge == 2

}


set trace off
		
				
replace _merge = 3 if school1_id1 !=.




replace _merge = 4 if Lookup1 == "7354050" & _merge == 1	



* There are some weird school left. I simply leave it here.
list if _merge == 1
list if _merge == 2


replace _merge = 4 if Lookup1 == "7354050" & _merge == 1	

replace _merge = 3 if  _merge == 1	
replace _merge = 3 if  _merge == 2	




keep if _merge == 3
	
	
*/







*******************************************************************************************************



* generate high school identifier in year 2008

*******************************************************************************************************

insheet using ".\raw_data\enrollment_data\FTE Enrollment by Grade Fiscal Year2008-1 Data Report_v2.csv", clear

keep if gender == "School Total"

/* this part just use to check what are the dropped schools
gen temp = 1  if grade10 == 0 & grade11 == 0 & grade12 == 0 

* these are dropped for sure
drop if temp == 1 & regexm(schoolname, "Elementary")
drop if temp == 1 & regexm(schoolname, "Middle")
drop if temp == 1 & regexm(schoolname, "Primary")
drop if temp == 1 & regexm(schoolname, "Intermediate")

* just to skim what are the schools that are dropped
list schoolname gradepk - grade12 if temp == 1 
*/


drop  if grade11 == 0 & grade12 == 0 & grade10 == 0



split schoolname, p(" - ")
list if schoolname3 != ""    // check the school name that split into 3 names


replace schoolname2 = "Greenville Middle - High School" if schoolname2 == "Greenville Middle"
replace schoolname2 = "Inner Harbour - The Springs" if schoolname2 == "Inner Harbour" 
replace schoolname2 = "Bradfield Center - Ault Academy" if schoolname2 == "Bradfield Center" 


gen Lookup1 = systemid + schoolname1

keep Lookup1 schoolname2

rename schoolname2 SCHOOLNAME2008

duplicates report

save ".\temp_data\hs_identifier_2008", replace

*******************************************************************************************************





* generate high school identifier in year 2009

*******************************************************************************************************
insheet using ".\raw_data\enrollment_data\FTE Enrollment by Grade Fiscal Year2009-1 Data Report_v2.csv", clear

keep if gender == "School Total"

/* this part just use to check what are the dropped schools
gen temp = 1  if grade10 == 0 & grade11 == 0 & grade12 == 0 

* these are dropped for sure
drop if temp == 1 & regexm(schoolname, "Elementary")
drop if temp == 1 & regexm(schoolname, "Middle")
drop if temp == 1 & regexm(schoolname, "Primary")
drop if temp == 1 & regexm(schoolname, "Intermediate")

* just to skim what are the schools that are dropped
list schoolname gradepk - grade09 if temp == 1 
*/


drop  if grade11 == 0 & grade12 == 0 & grade10 == 0



split schoolname, p(" - ")
list if schoolname3 != ""    // check the school name that split into 3 names


replace schoolname2 = "Greenville Middle - High School" if schoolname2 == "Greenville Middle"
replace schoolname2 = "Bradfield Center - Ault Academy" if schoolname2 == "Bradfield Center" 



gen Lookup1 = systemid + schoolname1

keep Lookup1 schoolname2

rename schoolname2 SCHOOLNAME2009

duplicates report

save ".\temp_data\hs_identifier_2009", replace

*******************************************************************************************************






* generate high school identifier in year 2010

*******************************************************************************************************
insheet using ".\raw_data\enrollment_data\FTE Enrollment by Grade Fiscal Year2010-1 Data Report_v2.csv", clear

keep if gender == "School Total"

/* this part just use to check what are the dropped schools
gen temp = 1  if grade10 == 0 & grade11 == 0 & grade12 == 0 

* these are dropped for sure
drop if temp == 1 & regexm(schoolname, "Elementary")
drop if temp == 1 & regexm(schoolname, "Middle")
drop if temp == 1 & regexm(schoolname, "Primary")
drop if temp == 1 & regexm(schoolname, "Intermediate")

* just to skim what are the schools that are dropped
list schoolname gradekk - grade09 if temp == 1 
*/
drop  if grade11 == 0 & grade12 == 0 & grade10 == 0



split schoolname, p(" - ")
list if schoolname3 != ""    // check the school name that split into 3 names


replace schoolname2 = "Arabia Mountain High School - Academy of Engineering, Medicine and Environm" if schoolname2 == "Arabia Mountain High School"
replace schoolname2 = "Greenville Middle - High School" if schoolname2 == "Greenville Middle"
replace schoolname2 = "Bradfield Center - Ault Academy" if schoolname2 == "Bradfield Center" 


gen Lookup1 = systemid + schoolname1

replace Lookup1 = "7820108" if Lookup1 == "78201080108"
replace Lookup1 = "7830103" if Lookup1 == "78301030103"



keep Lookup1 schoolname2

rename schoolname2 SCHOOLNAME2010

duplicates report

save ".\temp_data\hs_identifier_2010", replace

*******************************************************************************************************







* generate high school identifier in year 2011

*******************************************************************************************************
insheet using ".\raw_data\enrollment_data\FTE Enrollment by Grade Fiscal Year2011-1 Data Report_v2.csv", clear

keep if gender == "School Total"

/* this part just use to check what are the dropped schools
gen temp = 1  if grade10 == 0 & grade11 == 0 & grade12 == 0 

* these are dropped for sure
drop if temp == 1 & regexm(schoolname, "Elementary")
drop if temp == 1 & regexm(schoolname, "Middle")
drop if temp == 1 & regexm(schoolname, "Primary")
drop if temp == 1 & regexm(schoolname, "Intermediate")

* just to skim what are the schools that are dropped
list schoolname gradekk - grade09 if temp == 1 
*/
drop  if grade11 == 0 & grade12 == 0 & grade10 == 0



split schoolname, p(" - ")
list if schoolname3 != ""    // check the school name that split into 3 names


replace schoolname2 = "Arabia Mountain High School - Academy of Engineering, Medicine and Environm" if schoolname2 == "Arabia Mountain High School"
replace schoolname2 = "Greenville Middle - High School" if schoolname2 == "Greenville Middle"
replace schoolname2 = "Bradfield Center - Ault Academy" if schoolname2 == "Bradfield Center" 
replace schoolname2 = "Booker T. Washington High School - Banking, Finance and Investment Small Sc" if schoolname2 == "Booker T. Washington High School" & schoolname3 == "Banking, Finance and Investment Small Sc"
replace schoolname2 = "Booker T. Washington - Early College Small School" if schoolname2 == "Booker T. Washington" 
replace schoolname2 = "Booker T. Washington High School	- Health, Sciences and Nutrition Small Sch" if schoolname2 == "Booker T. Washington High School" & schoolname3 == "Health, Sciences and Nutrition Small Sch"





gen Lookup1 = systemid + schoolname1



replace Lookup1 = "7820108" if Lookup1 == "78201080108"
replace Lookup1 = "7830103" if Lookup1 == "78301030103"

keep Lookup1 schoolname2

rename schoolname2 SCHOOLNAME2011

duplicates report

save ".\temp_data\hs_identifier_2011", replace

*******************************************************************************************************




* generate high school identifier in year 2012

*******************************************************************************************************
insheet using ".\raw_data\enrollment_data\FTE Enrollment by Grade Fiscal Year2012-1 Data Report_v2.csv", clear

keep if gender == "School Total"

/* this part just use to check what are the dropped schools
gen temp = 1  if grade10 == 0 & grade11 == 0 & grade12 == 0 

* these are dropped for sure
drop if temp == 1 & regexm(schoolname, "Elementary")
drop if temp == 1 & regexm(schoolname, "Middle")
drop if temp == 1 & regexm(schoolname, "Primary")
drop if temp == 1 & regexm(schoolname, "Intermediate")

* just to skim what are the schools that are dropped
list schoolname gradekk - grade09 if temp == 1 
*/
drop  if grade11 == 0 & grade12 == 0 & grade10 == 0



split schoolname, p(" - ")
list if schoolname3 != ""    // check the school name that split into 3 names


replace schoolname2 = "Arabia Mountain High School - Academy of Engineering, Medicine and Environm" if schoolname2 == "Arabia Mountain High School"
replace schoolname2 = "Greenville Middle - High School" if schoolname2 == "Greenville Middle"
replace schoolname2 = "Bradfield Center - Ault Academy" if schoolname2 == "Bradfield Center" 
replace schoolname2 = "Booker T. Washington High School - Banking, Finance and Investment Small Sc" if schoolname2 == "Booker T. Washington High School" & schoolname3 == "Banking, Finance and Investment Small Sc"
replace schoolname2 = "Booker T. Washington - Early College Small School" if schoolname2 == "Booker T. Washington" 
replace schoolname2 = "Booker T. Washington High School	- Health, Sciences and Nutrition Small Sch" if schoolname2 == "Booker T. Washington High School" & schoolname3 == "Health, Sciences and Nutrition Small Sch"





gen Lookup1 = systemid + schoolname1





replace Lookup1 = "7820108" if Lookup1 == "78201080108"
replace Lookup1 = "7820110" if Lookup1 == "78201100110"
replace Lookup1 = "7830103" if Lookup1 == "78301030103"
replace Lookup1 = "7991893" if Lookup1 == "79918931893"
replace Lookup1 = "7991894" if Lookup1 == "79918941894"
replace Lookup1 = "7991895" if Lookup1 == "79918951895"



keep Lookup1 schoolname2

rename schoolname2 SCHOOLNAME2012

duplicates report

save ".\temp_data\hs_identifier_2012", replace

*******************************************************************************************************









* generate high school identifier in year 2013


*******************************************************************************************************
insheet using ".\raw_data\enrollment_data\FTE Enrollment by Grade Fiscal Year2013-1 Data Report_v2.csv", clear

keep if gender == "School Total"

/* this part just use to check what are the dropped schools
gen temp = 1  if grade10 == 0 & grade11 == 0 & grade12 == 0 

* these are dropped for sure
drop if temp == 1 & regexm(schoolname, "Elementary")
drop if temp == 1 & regexm(schoolname, "Middle")
drop if temp == 1 & regexm(schoolname, "Primary")
drop if temp == 1 & regexm(schoolname, "Intermediate")

* just to skim what are the schools that are dropped
list schoolname gradekk - grade09 if temp == 1 
*/
drop  if grade11 == 0 & grade12 == 0 & grade10 == 0



split schoolname, p(" - ")
list if schoolname3 != ""    // check the school name that split into 3 names


replace schoolname2 = "Arabia Mountain High School - Academy of Engineering, Medicine and Environm" if schoolname2 == "Arabia Mountain High School"
replace schoolname2 = "Greenville Middle - High School" if schoolname2 == "Greenville Middle"
replace schoolname2 = "Bradfield Center - Ault Academy" if schoolname2 == "Bradfield Center" 
replace schoolname2 = "Booker T. Washington High School - Banking, Finance and Investment Small Sc" if schoolname2 == "Booker T. Washington High School" & schoolname3 == "Banking, Finance and Investment Small Sc"
replace schoolname2 = "Booker T. Washington - Early College Small School" if schoolname2 == "Booker T. Washington" 
replace schoolname2 = "Booker T. Washington High School	- Health, Sciences and Nutrition Small Sch" if schoolname2 == "Booker T. Washington High School" & schoolname3 == "Health, Sciences and Nutrition Small Sch"





gen Lookup1 = systemid + schoolname1


replace Lookup1 = "7820108" if Lookup1 == "78201080108"
replace Lookup1 = "7820110" if Lookup1 == "78201100110"
replace Lookup1 = "7820119" if Lookup1 == "78201190119"
replace Lookup1 = "7820412" if Lookup1 == "78204120412"
replace Lookup1 = "7830103" if Lookup1 == "78301030103"
replace Lookup1 = "7830110" if Lookup1 == "78301100110"
replace Lookup1 = "7991893" if Lookup1 == "79918931893"
replace Lookup1 = "7991894" if Lookup1 == "79918941894"
replace Lookup1 = "7991895" if Lookup1 == "79918951895"


keep Lookup1 schoolname2

rename schoolname2 SCHOOLNAME2013

duplicates report

save ".\temp_data\hs_identifier_2013", replace

*******************************************************************************************************






* generate high school identifier in year 2014


*******************************************************************************************************
insheet using ".\raw_data\enrollment_data\FTE Enrollment by Grade Fiscal Year2014-1 Data Report_v2.csv", clear

keep if gender == "School Total"

/* this part just use to check what are the dropped schools
gen temp = 1  if grade10 == 0 & grade11 == 0 & grade12 == 0 

* these are dropped for sure
drop if temp == 1 & regexm(schoolname, "Elementary")
drop if temp == 1 & regexm(schoolname, "Middle")
drop if temp == 1 & regexm(schoolname, "Primary")
drop if temp == 1 & regexm(schoolname, "Intermediate")

* just to skim what are the schools that are dropped
list schoolname gradekk - grade09 if temp == 1 
*/
drop  if grade11 == 0 & grade12 == 0 & grade10 == 0



split schoolname, p(" - ")
list if schoolname3 != ""    // check the school name that split into 3 names


replace schoolname2 = "Arabia Mountain High School - Academy of Engineering, Medicine and Environm" if schoolname2 == "Arabia Mountain High School"
replace schoolname2 = "Greenville Middle - High School" if schoolname2 == "Greenville Middle"
replace schoolname2 = "Bradfield Center - Ault Academy" if schoolname2 == "Bradfield Center" 
replace schoolname2 = "Booker T. Washington High School - Banking, Finance and Investment Small Sc" if schoolname2 == "Booker T. Washington High School" & schoolname3 == "Banking, Finance and Investment Small Sc"
replace schoolname2 = "Booker T. Washington - Early College Small School" if schoolname2 == "Booker T. Washington" 
replace schoolname2 = "Booker T. Washington High School	- Health, Sciences and Nutrition Small Sch" if schoolname2 == "Booker T. Washington High School" & schoolname3 == "Health, Sciences and Nutrition Small Sch"





gen Lookup1 = systemid + schoolname1


replace Lookup1 = "7820108" if Lookup1 == "78201080108"
replace Lookup1 = "7820110" if Lookup1 == "78201100110"
replace Lookup1 = "7820119" if Lookup1 == "78201190119"
replace Lookup1 = "7820412" if Lookup1 == "78204120412"
replace Lookup1 = "7830103" if Lookup1 == "78301030103"
replace Lookup1 = "7830110" if Lookup1 == "78301100110"
replace Lookup1 = "7991893" if Lookup1 == "79918931893"
replace Lookup1 = "7991894" if Lookup1 == "79918941894"
replace Lookup1 = "7991895" if Lookup1 == "79918951895"


keep Lookup1 schoolname2

rename schoolname2 SCHOOLNAME2014

duplicates report

save ".\temp_data\hs_identifier_2014", replace

*******************************************************************************************************













* generate high school identifier in year 2015


*******************************************************************************************************
insheet using ".\raw_data\enrollment_data\FTE Enrollment by Grade Fiscal Year2015-1 Data Report_v2.csv", clear

keep if gender == "School Total"

/* this part just use to check what are the dropped schools
gen temp = 1  if grade10 == 0 & grade11 == 0 & grade12 == 0 

* these are dropped for sure
drop if temp == 1 & regexm(schoolname, "Elementary")
drop if temp == 1 & regexm(schoolname, "Middle")
drop if temp == 1 & regexm(schoolname, "Primary")
drop if temp == 1 & regexm(schoolname, "Intermediate")

* just to skim what are the schools that are dropped
list schoolname gradekk - grade09 if temp == 1 
*/
drop  if grade11 == 0 & grade12 == 0 & grade10 == 0



split schoolname, p(" - ")
list if schoolname3 != ""    // check the school name that split into 3 names


replace schoolname2 = "Arabia Mountain High School - Academy of Engineering, Medicine and Environm" if schoolname2 == "Arabia Mountain High School"
replace schoolname2 = "Greenville Middle - High School" if schoolname2 == "Greenville Middle"
replace schoolname2 = "Bradfield Center - Ault Academy" if schoolname2 == "Bradfield Center" 





gen Lookup1 = systemid + schoolname1


replace Lookup1 = "7820108" if Lookup1 == "78201080108"
replace Lookup1 = "7820119" if Lookup1 == "78201190119"
replace Lookup1 = "7820120" if Lookup1 == "78201200120"

replace Lookup1 = "7820412" if Lookup1 == "78204120412"
replace Lookup1 = "7830103" if Lookup1 == "78301030103"
replace Lookup1 = "7830110" if Lookup1 == "78301100110"

replace Lookup1 = "7830210" if Lookup1 == "78302100210"
replace Lookup1 = "7830310" if Lookup1 == "78303100310"


replace Lookup1 = "7991893" if Lookup1 == "79918931893"
replace Lookup1 = "7991894" if Lookup1 == "79918941894"
replace Lookup1 = "7991895" if Lookup1 == "79918951895"


keep Lookup1 schoolname2

rename schoolname2 SCHOOLNAME2015

duplicates report

save ".\temp_data\hs_identifier_2015", replace

*******************************************************************************************************





