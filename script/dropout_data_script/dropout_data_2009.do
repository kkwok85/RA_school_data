clear all


cd "D:\dropbox_2\Dropbox\J file\RA_school_data"

 

 
* This script is to clean dropout data 




import excel using ".\raw_data\dropout_data\fy2009_droprate-gr09-12_sch_disag-FERPA.xls"


* This few lines are used to clean and delete the first few line and used the 6th line as the variable name

foreach var of varlist A-K {
  rename `var' `=`var'[6]'
}

drop in 1/6



rename (SCHOOL_YEAR-DROPOUT_RATE) (YEAR SYSTEMID SYSTEMNAME SCHOOLID SCHOOLNAME2009 GRADE_RANGE SUBGROUP STUDENT_GROUP DROPOUT_DENOMINATOR DROPOUT_COUNT DROPOUT_RATE)

gen Lookup1 = SYSTEMID + SCHOOLID 

destring YEAR, replace

drop GRADE_RANGE SUBGROUP DROPOUT_DENOMINATOR DROPOUT_COUNT




keep if STUDENT_GROUP == "All Students" | STUDENT_GROUP == "Male" | STUDENT_GROUP == "Female" | STUDENT_GROUP == "White" | STUDENT_GROUP == "Black" | STUDENT_GROUP == "Hispanic"


replace STUDENT_GROUP = subinstr(STUDENT_GROUP, " ", "",.)





reshape wide DROPOUT_RATE, i(SCHOOLNAME2009 Lookup1) j(STUDENT_GROUP) string

merge 1:1 SCHOOLNAME2009 Lookup1 using ".\temp_data\hs_identifier_2009"



rename SCHOOLNAME2009 SCHOOLNAME
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



list if regexm(Lookup1,"6600506")
replace SCHOOLNAME = "Fulton Science Academy High School" if SCHOOLNAME == "TEACH Charter High School" & Lookup1 == "6600506"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Fulton Science Academy High School" & Lookup1 == "6600506"



list if regexm(Lookup1,"6990300")
replace SCHOOLNAME = "Greenville Middle - High School" if SCHOOLNAME == "Greenville High School" & Lookup1 == "6990300"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Greenville Middle - High School" & Lookup1 == "6990300"





list if regexm(Lookup1,"7550105")
replace SCHOOLNAME = "Northwest Georgia College & Career Academy" if SCHOOLNAME == "Whitfield County Career Academy" & Lookup1 == "7550105"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Northwest Georgia College & Career Academy" & Lookup1 == "7550105"



list if regexm(Lookup1,"7610403")
replace SCHOOLNAME = "APS-Forrest Hills Academy" if SCHOOLNAME == "APS-Forrest Hills Academey" & Lookup1 == "7610403"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "APS-Forrest Hills Academy" & Lookup1 == "7610403"






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



list SCHOOLNAME if regexm(only_letter_all_school,"JohnsonCountyHighSchool")
list if regexm(only_letter_all_school,"JohnsonCountyHighSchool")
list if regexm(Lookup1,"6830201")

replace SCHOOLNAME = "Johnson County High School"  if SCHOOLNAME == "Johnson County High School " & Lookup1 == "6830201"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Johnson County High School" & Lookup1 == "6830201"




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


keep SCHOOLNAME Lookup1 DROPOUT_RATEAllStudents DROPOUT_RATEBlack DROPOUT_RATEFemale DROPOUT_RATEHispanic DROPOUT_RATEMale DROPOUT_RATEWhite YEAR SYSTEMID SYSTEMNAME SCHOOLID




save ".\temp_data\cleaned_dropout_data_2009", replace

	