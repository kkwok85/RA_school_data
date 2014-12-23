clear all


cd "D:\dropbox_2\Dropbox\J file\RA_school_data"

* This script is to clean crime data so that schoolnames match the school identifiers


import excel using ".\raw_data\school_violence_data\USCO violations by school_2008.xls", firstrow clear


gen SCHOOLVIOLENCE =  AGGRAVATED_BATTERY + AGGR_CHILD_MOLESTATION +  AGGR_SEXUAL_BATTERY +  ///
AGGR_SODOMY + ARMED_ROBBERY + ARSON + KIDNAPPING + MURDER + RAPE + VOL_MANSLAUGHTER + FELONY_WEAPONS + TERRORISTIC_THREATS  


keep  SYSTEM_ID SYSTEM_NAME SCHOOL_ID SCHOOL_NAME SCHOOLVIOLENCE FELONY_DRUGS  NONFELONY_DRUGS FISCAL_YEAR
order SCHOOLVIOLENCE, before(NONFELONY_DRUGS) 


rename (FISCAL_YEAR -  FELONY_DRUGS) (YEAR SYSTEMID SYSTEMNAME SCHOOLID SCHOOLNAME  SCHOOLVIOLENCE NONFELONYDRUGS FELONYDRUGS)


gen Lookup1 = SYSTEMID + SCHOOLID 

destring YEAR, replace

rename SCHOOLNAME SCHOOLNAME2008

drop if YEAR ==.

merge 1:1 SCHOOLNAME2008 Lookup1 using ".\temp_data\hs_identifier_2008"



rename SCHOOLNAME2008 SCHOOLNAME
adopath + ".\script\ado_file\"
show_mismatch


******************************************************************************************************************************************************************************


	
* school1_id2 

list if regexm(Lookup1,"6110407")
replace SCHOOLNAME = "LakeBridge Behavioral Health System" if SCHOOLNAME == "Macon Behavioral Health System" & Lookup1 == "6110407"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "LakeBridge Behavioral Health System" & Lookup1 == "6110407"


list if regexm(Lookup1,"6290104")
replace SCHOOLNAME = "Classic City High School" if SCHOOLNAME == "Classic City Performance Learning Center" & Lookup1 == "6290104"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Classic City High School" & Lookup1 == "6290104"


list if regexm(Lookup1,"6330186")
replace SCHOOLNAME = "Oakwood Digital Academy" if SCHOOLNAME == "Oakwood High School" & Lookup1 == "6330186"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Oakwood Digital Academy" & Lookup1 == "6330186"


list if regexm(Lookup1,"6440400")
replace SCHOOLNAME = "DeKalb High School of the Arts" if SCHOOLNAME == "DeKalb School of the Arts" & Lookup1 == "6440400"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "DeKalb High School of the Arts" & Lookup1 == "6440400"


list if regexm(Lookup1,"6480507")
replace SCHOOLNAME = "Youth Villages at Inner Harbour" if SCHOOLNAME == "Inner Harbour School" & Lookup1 == "6480507"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Youth Villages at Inner Harbour" & Lookup1 == "6480507"


list if regexm(Lookup1,"6501050")
replace SCHOOLNAME = "Echols County High School" if SCHOOLNAME == "Echols County High/Elementary School" & Lookup1 == "6501050"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Echols County High School" & Lookup1 == "6501050"


list if regexm(Lookup1,"6570201")
replace SCHOOLNAME = "Model High School" if SCHOOLNAME == "Model 9-12 High School" & Lookup1 == "6570201"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Model High School" & Lookup1 == "6570201"


list if regexm(Lookup1,"6600506")
replace SCHOOLNAME = "Fulton Science Academy High School" if SCHOOLNAME == "TEACH Charter High School" & Lookup1 == "6600506"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Fulton Science Academy High School" & Lookup1 == "6600506"


list if regexm(Lookup1,"6603066")
replace SCHOOLNAME = "Riverwood International Charter School" if SCHOOLNAME == "Riverwood High School" & Lookup1 == "6603066"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Riverwood International Charter School" & Lookup1 == "6603066"


list if regexm(Lookup1,"6670388")
replace SCHOOLNAME = "Gwinnett InterVention Education (GIVE) Center East" if SCHOOLNAME == "Gwinnett InterVention Education (GIVE) Center" & Lookup1 == "6670388"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Gwinnett InterVention Education (GIVE) Center East" & Lookup1 == "6670388"


list if regexm(Lookup1,"6760300")
replace SCHOOLNAME = "Houston County Career Academy" if SCHOOLNAME == "Houston County Career and Technology Center" & Lookup1 == "6760300"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Houston County Career Academy" & Lookup1 == "6760300"


list if regexm(Lookup1,"6960275")
replace SCHOOLNAME = "Marion County Middle/High School" if SCHOOLNAME == "Marion County High School" & Lookup1 == "6960275"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Marion County Middle/High School" & Lookup1 == "6960275"


list if regexm(Lookup1,"6990300")
replace SCHOOLNAME = "Greenville Middle - High School" if SCHOOLNAME == "Greenville High School" & Lookup1 == "6990300"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Greenville Middle - High School" & Lookup1 == "6990300"



list if regexm(Lookup1,"7050108")
replace SCHOOLNAME = "Mountain Creek Academy School" if SCHOOLNAME == "Mountain Creek Academy" & Lookup1 == "7050108"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Mountain Creek Academy School" & Lookup1 == "7050108"



list if regexm(Lookup1,"7280201")
replace SCHOOLNAME = "Stewart County High School" if SCHOOLNAME == "Stewart-Quitman High School" & Lookup1 == "7280201"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Stewart County High School" & Lookup1 == "7280201"


list if regexm(Lookup1,"7310102")
replace SCHOOLNAME = "Taliaferro County School" if SCHOOLNAME == "Taliaferro County Charter School" & Lookup1 == "7310102"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Taliaferro County School" & Lookup1 == "7310102"


list if regexm(Lookup1,"7350105")
replace SCHOOLNAME = "Terrell High School" if SCHOOLNAME == "Terrell Middle High School" & Lookup1 == "7350105"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Terrell High School" & Lookup1 == "7350105"



list if regexm(Lookup1,"7550105")
replace SCHOOLNAME = "Northwest Georgia College & Career Academy" if SCHOOLNAME == "Whitfield County Career Academy" & Lookup1 == "7550105"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Northwest Georgia College & Career Academy" & Lookup1 == "7550105"



list if regexm(Lookup1,"7610403")
list SCHOOLNAME if regexm(Lookup1,"7610403")
replace SCHOOLNAME = "APS-Forrest Hills Academy" if SCHOOLNAME == "APS-Forrest Hills Academey" & Lookup1 == "7610403"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "APS-Forrest Hills Academy" & Lookup1 == "7610403"


list if regexm(Lookup1,"7614568")
replace SCHOOLNAME = "Washington High School Senior Academy" if SCHOOLNAME == "Washington High School" & Lookup1 == "7614568"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Washington High School Senior Academy" & Lookup1 == "7614568"

list if regexm(Lookup1,"7980108")
replace SCHOOLNAME = "Mountain Education Center" if SCHOOLNAME == "Moutain Education Center" & Lookup1 == "7980108"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Mountain Education Center" & Lookup1 == "7980108"














* school_special schools

	
list if regexm(only_letter_all_school,"WestsideHighSchool")
list if regexm(Lookup1,"6110198")


replace SCHOOLNAME = "Westside High School" if SCHOOLNAME == "Westside High" & Lookup1 == "6110198"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Westside High School" & Lookup1 == "6110198"


list SCHOOLNAME if regexm(only_letter_all_school,"MiddleGeorgiaWildernessInstituteDJJFacility")
list if regexm(only_letter_all_school,"MiddleGeorgiaWildernessInstituteDJJFacility")
list if regexm(Lookup1,"6120109")

replace SCHOOLNAME = "Middle Georgia Wilderness Institute DJJ Facility"  if SCHOOLNAME == "Middle Georgia Wilderness Institute DJJ Facility " & Lookup1 == "6120109"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Middle Georgia Wilderness Institute DJJ Facility" & Lookup1 == "6120109"




list SCHOOLNAME if regexm(only_letter_all_school,"MetterHighSchool")
list if regexm(only_letter_all_school,"MetterHighSchool")
list if regexm(Lookup1,"6210101")

replace SCHOOLNAME = "Metter High School"  if SCHOOLNAME == "Metter High School " & Lookup1 == "6210101"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Metter High School" & Lookup1 == "6210101"



list SCHOOLNAME if regexm(only_letter_all_school,"MtZionHighSchool")
list if regexm(only_letter_all_school,"MtZionHighSchool")
list if regexm(Lookup1,"6220308")

replace SCHOOLNAME = "Mt. Zion High School"  if SCHOOLNAME == "Mt. Zion High School " & Lookup1 == "6220308"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Mt. Zion High School" & Lookup1 == "6220308"



list SCHOOLNAME if regexm(only_letter_all_school,"DawsonCountyHighSchool")
list if regexm(only_letter_all_school,"DawsonCountyHighSchool")
list if regexm(Lookup1,"6420198")

replace SCHOOLNAME = "Dawson County High School"  if SCHOOLNAME == "Dawson County High School " & Lookup1 == "6420198"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Dawson County High School" & Lookup1 == "6420198"



list SCHOOLNAME if regexm(only_letter_all_school,"MartinLutherKingJrHighSchool")
list if regexm(only_letter_all_school,"MartinLutherKingJrHighSchool")
list if regexm(Lookup1,"6440103")


replace SCHOOLNAME = "Martin Luther King, Jr. High School"  if SCHOOLNAME == "Martin Luther King, Jr. High School " & Lookup1 == "6440103"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Martin Luther King, Jr. High School" & Lookup1 == "6440103"



list SCHOOLNAME if regexm(only_letter_all_school,"DeKalbRockdalePsychoEducationCenter")
list if regexm(only_letter_all_school,"DeKalbRockdalePsychoEducationCenter")
list if regexm(Lookup1,"6445066")


replace SCHOOLNAME = "DeKalb/Rockdale PsychoEducation Center"  if SCHOOLNAME == "DeKalb/Rockdale PsychoEducation Center " & Lookup1 == "6445066"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "DeKalb/Rockdale PsychoEducation Center" & Lookup1 == "6445066"



list SCHOOLNAME if regexm(only_letter_all_school,"PepperellHighSchool")
list if regexm(only_letter_all_school,"PepperellHighSchool")
list if regexm(Lookup1,"6570107")

replace SCHOOLNAME = "Pepperell High School"  if SCHOOLNAME == "New Pepperell High School" & Lookup1 == "6570107"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Pepperell High School" & Lookup1 == "6570107"



list SCHOOLNAME if regexm(only_letter_all_school,"FloweryBranchHigh")
list if regexm(only_letter_all_school,"FloweryBranchHigh")
list if regexm(Lookup1,"6690202")

replace SCHOOLNAME = "Flowery Branch High"  if SCHOOLNAME == "Flowery Branch High School" & Lookup1 == "6690202"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Flowery Branch High" & Lookup1 == "6690202"


list SCHOOLNAME if regexm(only_letter_all_school,"JohnsonCountyHighSchool")
list if regexm(only_letter_all_school,"JohnsonCountyHighSchool")
list if regexm(Lookup1,"6830201")

replace SCHOOLNAME = "Johnson County High School"  if SCHOOLNAME == "Johnson County High School " & Lookup1 == "6830201"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Johnson County High School" & Lookup1 == "6830201"


list SCHOOLNAME if regexm(only_letter_all_school,"LumpkinCountyHighSchool")
list if regexm(only_letter_all_school,"LumpkinCountyHighSchool")
list if regexm(Lookup1,"6930101")

replace SCHOOLNAME = "Lumpkin County High School"  if SCHOOLNAME == "New Lumpkin County High School" & Lookup1 == "6930101"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Lumpkin County High School" & Lookup1 == "6930101"




list SCHOOLNAME if regexm(only_letter_all_school,"RabunCountyHighSchool")
list if regexm(only_letter_all_school,"RabunCountyHighSchool")
list if regexm(Lookup1,"7190177")


replace SCHOOLNAME = "Rabun County High School"  if SCHOOLNAME == "Rabun County High School " & Lookup1 == "7190177"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Rabun County High School" & Lookup1 == "7190177"




list SCHOOLNAME if regexm(only_letter_all_school,"MariettaHighSchool")
list if regexm(only_letter_all_school,"MariettaHighSchool")
list if regexm(Lookup1,"7810101")


replace SCHOOLNAME = "Marietta High School"  if SCHOOLNAME == "Marietta High School " & Lookup1 == "7810101"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Marietta High School" & Lookup1 == "7810101"



keep if _merge == 3
	
	
keep YEAR SYSTEMID SYSTEMNAME SCHOOLID SCHOOLNAME SCHOOLVIOLENCE NONFELONYDRUGS FELONYDRUGS Lookup1

	
* I didnt keep the data where _merge == 2

save ".\temp_data\cleaned_crime_data_2008", replace



