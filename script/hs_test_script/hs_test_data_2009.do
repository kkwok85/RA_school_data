clear all


cd "D:\dropbox_2\Dropbox\J file\RA_school_data"


 
* This script is to clean hs_test data 




import excel using ".\raw_data\hs_test_data\fy2009_ghsgt_ayp-school.xls"  , firstrow 


gen Lookup1 = SYSTEM_ID + SCHOOL_ID


drop if ASSESSMENT_SUBJECT_AREA_CODE == "M" 


keep if  REPORTING_CATEGORY_CODE == "ALL" | REPORTING_CATEGORY_CODE == "B" | REPORTING_CATEGORY_CODE == "HIS" | REPORTING_CATEGORY_CODE == "W" | REPORTING_CATEGORY_CODE == "SWD" | REPORTING_CATEGORY_CODE == "LEP" | REPORTING_CATEGORY_CODE == "ED" 

drop REPORTING_CATEGORY_LABEL STUDENT_IN_TESTED_GRADE_COUNT TEST_PARTICIPANT_COUNT 



reshape wide TEST_ENROLLMENT_COUNT FAY_PARTICIPANT_COUNT DNM_COUNT MEETS_COUNT EXCEEDS_COUNT, i(SYSTEM_ID SCHOOL_ID) j(REPORTING_CATEGORY_CODE) string





rename (TEST_ENROLLMENT_COUNTALL FAY_PARTICIPANT_COUNTALL DNM_COUNTALL MEETS_COUNTALL EXCEEDS_COUNTALL ///
TEST_ENROLLMENT_COUNTB FAY_PARTICIPANT_COUNTB DNM_COUNTB MEETS_COUNTB EXCEEDS_COUNTB ///
TEST_ENROLLMENT_COUNTED FAY_PARTICIPANT_COUNTED DNM_COUNTED MEETS_COUNTED EXCEEDS_COUNTED /// 
TEST_ENROLLMENT_COUNTHIS FAY_PARTICIPANT_COUNTHIS DNM_COUNTHIS MEETS_COUNTHIS EXCEEDS_COUNTHIS ///
TEST_ENROLLMENT_COUNTLEP FAY_PARTICIPANT_COUNTLEP DNM_COUNTLEP MEETS_COUNTLEP EXCEEDS_COUNTLEP ///
TEST_ENROLLMENT_COUNTSWD FAY_PARTICIPANT_COUNTSWD DNM_COUNTSWD MEETS_COUNTSWD EXCEEDS_COUNTSWD ///
TEST_ENROLLMENT_COUNTW FAY_PARTICIPANT_COUNTW DNM_COUNTW MEETS_COUNTW EXCEEDS_COUNTW) ///
(ELA_Enroll_all ELA_FAYP_all ELA_DNM_count_all ELA_MEETS_count_all ELA_EXCEEDS_count_all ///
ELA_Enroll_BLK ELA_FAYP_BLK ELA_DNM_count_BLK ELA_MEETS_count_BLK ELA_EXCEEDS_count_BLK ///
ELA_Enroll_ED ELA_FAYP_ED ELA_DNM_count_ED ELA_MEETS_count_ED ELA_EXCEEDS_count_ED ///
ELA_Enroll_HSP ELA_FAYP_HSP ELA_DNM_count_HSP ELA_MEETS_count_HSP ELA_EXCEEDS_count_HSP ///
ELA_Enroll_ELL ELA_FAYP_ELL ELA_DNM_count_ELL ELA_MEETS_count_ELL ELA_EXCEEDS_count_ELL ///
ELA_Enroll_dis ELA_FAYP_dis ELA_DNM_count_dis ELA_MEETS_count_dis ELA_EXCEEDS_count_dis ///
ELA_Enroll_w ELA_FAYP_w ELA_DNM_count_w ELA_MEETS_count_w ELA_EXCEEDS_count_w)




foreach category in all BLK ED HSP ELL dis w {
	gen ELA_MEXCR_count_`category' = ELA_MEETS_count_`category' + ELA_EXCEEDS_count_`category'
	gen ELA_MEXCR_`category' = (ELA_MEXCR_count_`category'/ELA_FAYP_`category')*100
	gen ELA_DNM_`category' = (ELA_DNM_count_`category'/ELA_FAYP_`category')*100
}





drop *_count_* ASSESSMENT_SUBJECT_AREA_CODE


rename (SCHOOL_YEAR SYSTEM_ID SYSTEM_NAME SCHOOL_ID SCHOOL_NAME) (YEAR SYSTEMID SYSTEMNAME SCHOOLID SCHOOLNAME2009)


merge 1:1 SCHOOLNAME2009 Lookup1 using ".\temp_data\hs_identifier_2009"



rename SCHOOLNAME2009 SCHOOLNAME
adopath + ".\script\ado_file\"
show_mismatch




******************************************************************************************************************************************************************************




* school1_id2 



list if regexm(Lookup1,"6600383")
replace SCHOOLNAME = "McClarinAlternativeSchool" if SCHOOLNAME == "McClarin High School" & Lookup1 == "6600383"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "McClarinAlternativeSchool" & Lookup1 == "6600383"








list if regexm(Lookup1,"6600386")
replace SCHOOLNAME = "Independence Alternative School" if SCHOOLNAME == "Independence High School" & Lookup1 == "6600386"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Independence Alternative School" & Lookup1 == "6600386"
















 * school_special schools



 

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



drop _merge count_num_same_school count_num_same_id only_letter_all_school only_letter_unique_identifier merge2_indicator school2_id1 school1_id2 school1_id1 school_special


destring YEAR, replace


save ".\temp_data\cleaned_hs_test_data_2009_ELA", replace




















* MATH Part
******************************************************************************************************************************************************************************

clear

import excel using ".\raw_data\hs_test_data\fy2009_ghsgt_ayp-school.xls"  , firstrow 


gen Lookup1 = SYSTEM_ID + SCHOOL_ID


drop if ASSESSMENT_SUBJECT_AREA_CODE == "ELA" 


keep if  REPORTING_CATEGORY_CODE == "ALL" | REPORTING_CATEGORY_CODE == "B" | REPORTING_CATEGORY_CODE == "HIS" | REPORTING_CATEGORY_CODE == "W" | REPORTING_CATEGORY_CODE == "SWD" | REPORTING_CATEGORY_CODE == "LEP" | REPORTING_CATEGORY_CODE == "ED" 

drop REPORTING_CATEGORY_LABEL STUDENT_IN_TESTED_GRADE_COUNT TEST_PARTICIPANT_COUNT



reshape wide TEST_ENROLLMENT_COUNT FAY_PARTICIPANT_COUNT DNM_COUNT MEETS_COUNT EXCEEDS_COUNT, i(SYSTEM_ID SCHOOL_ID) j(REPORTING_CATEGORY_CODE) string





rename (TEST_ENROLLMENT_COUNTALL FAY_PARTICIPANT_COUNTALL DNM_COUNTALL MEETS_COUNTALL EXCEEDS_COUNTALL ///
TEST_ENROLLMENT_COUNTB FAY_PARTICIPANT_COUNTB DNM_COUNTB MEETS_COUNTB EXCEEDS_COUNTB ///
TEST_ENROLLMENT_COUNTED FAY_PARTICIPANT_COUNTED DNM_COUNTED MEETS_COUNTED EXCEEDS_COUNTED /// 
TEST_ENROLLMENT_COUNTHIS FAY_PARTICIPANT_COUNTHIS DNM_COUNTHIS MEETS_COUNTHIS EXCEEDS_COUNTHIS ///
TEST_ENROLLMENT_COUNTLEP FAY_PARTICIPANT_COUNTLEP DNM_COUNTLEP MEETS_COUNTLEP EXCEEDS_COUNTLEP ///
TEST_ENROLLMENT_COUNTSWD FAY_PARTICIPANT_COUNTSWD DNM_COUNTSWD MEETS_COUNTSWD EXCEEDS_COUNTSWD ///
TEST_ENROLLMENT_COUNTW FAY_PARTICIPANT_COUNTW DNM_COUNTW MEETS_COUNTW EXCEEDS_COUNTW) ///
(MTH_Enroll_all MTH_FAYP_all MTH_DNM_count_all MTH_MEETS_count_all MTH_EXCEEDS_count_all ///
MTH_Enroll_BLK MTH_FAYP_BLK MTH_DNM_count_BLK MTH_MEETS_count_BLK MTH_EXCEEDS_count_BLK ///
MTH_Enroll_ED MTH_FAYP_ED MTH_DNM_count_ED MTH_MEETS_count_ED MTH_EXCEEDS_count_ED ///
MTH_Enroll_HSP MTH_FAYP_HSP MTH_DNM_count_HSP MTH_MEETS_count_HSP MTH_EXCEEDS_count_HSP ///
MTH_Enroll_ELL MTH_FAYP_ELL MTH_DNM_count_ELL MTH_MEETS_count_ELL MTH_EXCEEDS_count_ELL ///
MTH_Enroll_dis MTH_FAYP_dis MTH_DNM_count_dis MTH_MEETS_count_dis MTH_EXCEEDS_count_dis ///
MTH_Enroll_w MTH_FAYP_w MTH_DNM_count_w MTH_MEETS_count_w MTH_EXCEEDS_count_w)






foreach category in all BLK ED HSP ELL dis w {
	gen MTH_MEXCR_count_`category' = MTH_MEETS_count_`category' + MTH_EXCEEDS_count_`category'
	gen MTH_MEXCR_`category' = (MTH_MEXCR_count_`category'/MTH_FAYP_`category')*100
	gen MTH_DNM_`category' = (MTH_DNM_count_`category'/MTH_FAYP_`category')*100
}





drop *_count_*


rename (SCHOOL_YEAR SYSTEM_ID SYSTEM_NAME SCHOOL_ID SCHOOL_NAME) (YEAR SYSTEMID SYSTEMNAME SCHOOLID SCHOOLNAME2009)


merge 1:1 SCHOOLNAME2009 Lookup1 using ".\temp_data\hs_identifier_2009"



rename SCHOOLNAME2009 SCHOOLNAME
adopath + ".\script\ado_file\"
show_mismatch




******************************************************************************************************************************************************************************




* school1_id2 



list if regexm(Lookup1,"6600383")
replace SCHOOLNAME = "McClarinAlternativeSchool" if SCHOOLNAME == "McClarin High School" & Lookup1 == "6600383"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "McClarinAlternativeSchool" & Lookup1 == "6600383"








list if regexm(Lookup1,"6600386")
replace SCHOOLNAME = "Independence Alternative School" if SCHOOLNAME == "Independence High School" & Lookup1 == "6600386"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Independence Alternative School" & Lookup1 == "6600386"
















 * school_special schools



 

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



drop _merge count_num_same_school count_num_same_id only_letter_all_school only_letter_unique_identifier merge2_indicator school2_id1 school1_id2 school1_id1 school_special ASSESSMENT_SUBJECT_AREA_CODE


destring YEAR, replace


save ".\temp_data\cleaned_hs_test_data_2009_MTH", replace









******************************************************************************************************************************************************************************

merge 1:1 SYSTEMID SCHOOLID YEAR SYSTEMNAME SCHOOLNAME ASSESSMENT_TYPE_CODE Lookup1 using ".\temp_data\cleaned_hs_test_data_2009_ELA", nogen





save ".\temp_data\cleaned_hs_test_data_2009", replace




