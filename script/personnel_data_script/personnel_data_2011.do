clear all


cd "D:\dropbox_2\Dropbox\J file\RA_school_data"
 
* This script is to clean personnel data 




import excel using ".\raw_data\personnel_data\cpi_2011-1_rpc_school.xls"




keep A-G L Z AB AG AH AM BA BC BH BI BN CB CD CE CF CG CH CI





rename (A-G L Z AB AG AH AM BA BC BH BI BN CB CD CE CF CG CH CI) ///
(FISCAL_YEAR	PERIOD	SYSTEM_ID	SYSTEM_NAME	SCHOOL_ID	SCHOOLNAME2011	///
Admin_Total_Positions	Admin_Full_Time	Admin_White	Admin_Exp_less_than_1_yr Admin_Avg_Yrs_Exp ///
Supp_Total_Positions Supp_Full_Time	Supp_White Supp_Exp_less_than_1_yr	Supp_Avg_Yrs_Exp	///
Tch_Total_Positions	Tch_Full_Time	Tch_White	Tch_Exp_less_than_1_yr Tch_Exp_1_to_10_yrs	Tch_Exp_11_to_20_yrs Tch_Exp_21_to_30_yrs Tch_Exp_more_than_30_yrs	Tch_Avg_Yrs_Exp)

drop in 1/7

gen Lookup1 =  SYSTEM_ID + SCHOOL_ID
gen YEAR = 2011



duplicates report SCHOOLNAME2011 Lookup1  



merge 1:1 SCHOOLNAME2011 Lookup1 using ".\temp_data\hs_identifier_2011"



rename SCHOOLNAME2011 SCHOOLNAME
adopath + ".\script\ado_file\"
show_mismatch











******************************************************************************************************************************************************************************
	
	
	


* school1_id2 
list if regexm(Lookup1,"6110407")
replace SCHOOLNAME = "LakeBridge Behavioral Health System" if SCHOOLNAME == "Macon Behavioral Health System" & Lookup1 == "6110407"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "LakeBridge Behavioral Health System" & Lookup1 == "6110407"


list if regexm(Lookup1,"6270111")
replace SCHOOLNAME = "Chattooga Academy" if SCHOOLNAME == "Crossroads Alternative School" & Lookup1 == "6270111"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Chattooga Academy" & Lookup1 == "6270111"




list if regexm(Lookup1,"6990300")
replace SCHOOLNAME = "Greenville Middle - High School" if SCHOOLNAME == "Greenville High School" & Lookup1 == "6990300"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Greenville Middle - High School" & Lookup1 == "6990300"





list if regexm(Lookup1,"7550105")
replace SCHOOLNAME = "Northwest Georgia College & Career Academy" if SCHOOLNAME == "Whitfield County Career Academy" & Lookup1 == "7550105"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Northwest Georgia College & Career Academy" & Lookup1 == "7550105"


list if regexm(Lookup1,"7610403")
list SCHOOLNAME if regexm(Lookup1,"7610403")
replace SCHOOLNAME = "APS-Forrest Hills Academy" if SCHOOLNAME == "APS-Forrest Hills Academey" & Lookup1 == "7610403"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "APS-Forrest Hills Academy" & Lookup1 == "7610403"




list if regexm(Lookup1,"7760210")
list SCHOOLNAME if regexm(Lookup1,"7760210")
replace SCHOOLNAME = "The Academy at Wood's Mill" if SCHOOLNAME == "Wood's Mill Non-Traditional High School" & Lookup1 == "7760210"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "The Academy at Wood's Mill" & Lookup1 == "7760210"








* school_special schools


list if regexm(only_letter_all_school,"WestsideHighSchool")
list if regexm(Lookup1,"6110198")


replace SCHOOLNAME = "Westside High School" if SCHOOLNAME == "Westside High" & Lookup1 == "6110198"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Westside High School" & Lookup1 == "6110198"




list SCHOOLNAME if regexm(only_letter_all_school,"MiddleGeorgiaWildernessInstituteDJJFacility")
list if regexm(Lookup1,"6120109")


replace SCHOOLNAME = "Middle Georgia Wilderness Institute DJJ Facility" if SCHOOLNAME == "Middle Georgia Wilderness Institute DJJ Facility " & Lookup1 == "6120109"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Middle Georgia Wilderness Institute DJJ Facility" & Lookup1 == "6120109"







list SCHOOLNAME if regexm(only_letter_all_school,"MetterHighSchool")
list if regexm(Lookup1,"6210101")

replace SCHOOLNAME = "Metter High School"  if SCHOOLNAME == "Metter High School " & Lookup1 == "6210101"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Metter High School" & Lookup1 == "6210101"



list SCHOOLNAME if regexm(only_letter_all_school,"MtZionHighSchool")
list if regexm(Lookup1,"6220308")

replace SCHOOLNAME = "Mt. Zion High School"  if SCHOOLNAME == "Mt. Zion High School " & Lookup1 == "6220308"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Mt. Zion High School" & Lookup1 == "6220308"




list SCHOOLNAME if regexm(only_letter_all_school,"DawsonCountyHighSchool")
list if regexm(only_letter_all_school,"DawsonCountyHighSchool")

replace SCHOOLNAME = "Dawson County High School"  if SCHOOLNAME == "Dawson County High School " & Lookup1 == "6420198"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Dawson County High School" & Lookup1 == "6420198"





list SCHOOLNAME if regexm(only_letter_all_school,"MartinLutherKingJrHighSchool")
list if regexm(only_letter_all_school,"MartinLutherKingJrHighSchool")

replace SCHOOLNAME = "Martin Luther King, Jr. High School"  if SCHOOLNAME == "Martin Luther King, Jr. High School " & Lookup1 == "6440103"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Martin Luther King, Jr. High School" & Lookup1 == "6440103"




list SCHOOLNAME if regexm(only_letter_all_school,"DeKalbRockdalePsychoEducationCenter")
list if regexm(only_letter_all_school,"DeKalbRockdalePsychoEducationCenter")

replace SCHOOLNAME = "DeKalb/Rockdale PsychoEducation Center"  if SCHOOLNAME == "DeKalb/Rockdale PsychoEducation Center " & Lookup1 == "6445066"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "DeKalb/Rockdale PsychoEducation Center" & Lookup1 == "6445066"




list SCHOOLNAME if regexm(only_letter_all_school,"JohnsonCountyHighSchool")
list if regexm(only_letter_all_school,"JohnsonCountyHighSchool")

replace SCHOOLNAME = "Johnson County High School"  if SCHOOLNAME == "Johnson County High School " & Lookup1 == "6830201"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Johnson County High School" & Lookup1 == "6830201"




list SCHOOLNAME if regexm(only_letter_all_school,"RabunCountyHighSchool")
list if regexm(only_letter_all_school,"RabunCountyHighSchool")

replace SCHOOLNAME = "Rabun County High School"  if SCHOOLNAME == "Rabun County High School " & Lookup1 == "7190177"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Rabun County High School" & Lookup1 == "7190177"



list SCHOOLNAME if regexm(only_letter_all_school,"WashingtonWilkesComprehensiveHighSchool")
list if regexm(only_letter_all_school,"WashingtonWilkesComprehensiveHighSchool")

replace SCHOOLNAME = "Washington-Wilkes Comprehensive High School"  if SCHOOLNAME == "New Washington-Wilkes Comprehensive High School" & Lookup1 == "7570110"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Washington-Wilkes Comprehensive High School" & Lookup1 == "7570110"




list SCHOOLNAME if regexm(only_letter_all_school,"MariettaHighSchool")
list if regexm(only_letter_all_school,"MariettaHighSchool")

replace SCHOOLNAME = "Marietta High School"  if SCHOOLNAME == "Marietta High School " & Lookup1 == "7810101"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Marietta High School" & Lookup1 == "7810101"




list SCHOOLNAME if regexm(only_letter_all_school,"MountainEducationCenterSchool")
list if regexm(only_letter_all_school,"MountainEducationCenterSchool")
list if regexm(Lookup1,"7820108")


replace Lookup1 = "7820108"  if SCHOOLNAME == "Mountain Education Center School" & Lookup1 == "78201080108"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Mountain Education Center School" & Lookup1 == "7820108"






list SCHOOLNAME if regexm(only_letter_all_school,"CCATSchool")
list if regexm(only_letter_all_school,"CCATSchool")
list if regexm(Lookup1,"7830103")


replace Lookup1 = "7830103"  if SCHOOLNAME == "CCAT School" & Lookup1 == "78301030103"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "CCAT School" & Lookup1 == "7830103"



















keep if _merge == 3



drop _merge count_num_same_school count_num_same_id only_letter_all_school only_letter_unique_identifier merge2_indicator school2_id1 school1_id2 school1_id1 school_special


* I didnt keep the data where _merge == 2	


save ".\temp_data\cleaned_personnel_data_2011", replace

