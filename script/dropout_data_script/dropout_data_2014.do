clear all


cd "D:\dropbox_2\Dropbox\J file\RA_school_data"

 

 
* This script is to clean dropout data 




import excel using ".\raw_data\dropout_data\fy2014_droprate-gr09-12_sch_disag-FERPA.xls"


* This few lines are used to clean and delete the first few line and used the 6th line as the variable name

foreach var of varlist A-K {
  rename `var' `=`var'[6]'
}

drop in 1/6



rename (SCHOOL_YEAR-DROPOUT_RATE) (YEAR SYSTEMID SYSTEMNAME SCHOOLID SCHOOLNAME2014 GRADE_RANGE SUBGROUP STUDENT_GROUP DROPOUT_DENOMINATOR DROPOUT_COUNT DROPOUT_RATE)

gen Lookup1 = SYSTEMID + SCHOOLID 

destring YEAR, replace

drop GRADE_RANGE SUBGROUP DROPOUT_DENOMINATOR DROPOUT_COUNT




keep if STUDENT_GROUP == "All Students" | STUDENT_GROUP == "Male" | STUDENT_GROUP == "Female" | STUDENT_GROUP == "White" | STUDENT_GROUP == "Black" | STUDENT_GROUP == "Hispanic"


replace STUDENT_GROUP = subinstr(STUDENT_GROUP, " ", "",.)





reshape wide DROPOUT_RATE, i(SCHOOLNAME2014 Lookup1) j(STUDENT_GROUP) string

merge 1:1 SCHOOLNAME2014 Lookup1 using ".\temp_data\hs_identifier_2014"



rename SCHOOLNAME2014 SCHOOLNAME
adopath + ".\script\ado_file\"

show_mismatch










******************************************************************************************************************************************************************************





* school1_id2 


list if regexm(Lookup1,"6600307")
replace SCHOOLNAME = "Georgia Baptist Children's Home and Family Ministries" if SCHOOLNAME == "Georgia Baptist Chidlren's Home and Family Ministries" & Lookup1 == "6600307"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Georgia Baptist Children's Home and Family Ministries" & Lookup1 == "6600307"







list if regexm(Lookup1,"6600383")
replace SCHOOLNAME = "McClarin High School" if SCHOOLNAME == "McClarin Alternative School" & Lookup1 == "6600383"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "McClarin High School" & Lookup1 == "6600383"


list if regexm(Lookup1,"6600386")
replace SCHOOLNAME = "Independence High School" if SCHOOLNAME == "Independence Alternative School" & Lookup1 == "6600386"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Independence High School" & Lookup1 == "6600386"






list if regexm(Lookup1,"6990300")
replace SCHOOLNAME = "Greenville Middle - High School" if SCHOOLNAME == "Greenville High School" & Lookup1 == "6990300"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Greenville Middle - High School" & Lookup1 == "6990300"






list if regexm(Lookup1,"7610403")
replace SCHOOLNAME = "APS-Forrest Hills Academy" if SCHOOLNAME == "APS-Forrest Hills Academey" & Lookup1 == "7610403"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "APS-Forrest Hills Academy" & Lookup1 == "7610403"




list if regexm(Lookup1,"7820108")
replace Lookup1 = "7820108"  if SCHOOLNAME == "Mountain Education Center School" & Lookup1 == "78201080108"
replace SCHOOLNAME = "Mountain Education Charter High School" if SCHOOLNAME == "Mountain Education Center School" & Lookup1 == "7820108"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Mountain Education Charter High School" & Lookup1 == "7820108"








* school_special schools



list SCHOOLNAME if regexm(only_letter_all_school,"MetterHighSchool")
list if regexm(only_letter_all_school,"MetterHighSchool")
list if regexm(Lookup1,"6210101")

replace SCHOOLNAME = "Metter High School"  if SCHOOLNAME == "Metter High School " & Lookup1 == "6210101"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Metter High School" & Lookup1 == "6210101"






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








list SCHOOLNAME if regexm(only_letter_all_school,"HeardCountyHighSchool")
list if regexm(only_letter_all_school,"HeardCountyHighSchool")
list if regexm(Lookup1,"6740110")


replace SCHOOLNAME = "Heard County High School"  if SCHOOLNAME == "New Heard County High School" & Lookup1 == "6740110"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Heard County High School" & Lookup1 == "6740110"







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







list SCHOOLNAME if regexm(only_letter_all_school,"OdysseySchool")
list if regexm(only_letter_all_school,"OdysseySchool")
list if regexm(Lookup1,"7820110")


replace Lookup1 = "7820110"  if SCHOOLNAME == "Odyssey School" & Lookup1 == "78201100110"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Odyssey School" & Lookup1 == "7820110"







list SCHOOLNAME if regexm(only_letter_all_school,"ProvostAcademyGeorgia")
list if regexm(only_letter_all_school,"ProvostAcademyGeorgia")
list if regexm(Lookup1,"7820119")


replace Lookup1 = "7820119"  if SCHOOLNAME == "Provost Academy Georgia" & Lookup1 == "78201190119"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Provost Academy Georgia" & Lookup1 == "7820119"









list SCHOOLNAME if regexm(only_letter_all_school,"GeorgiaConnectionsAcademy")
list if regexm(only_letter_all_school,"GeorgiaConnectionsAcademy")
list if regexm(Lookup1,"7820412")


replace Lookup1 = "7820412"  if SCHOOLNAME == "Georgia Connections Academy" & Lookup1 == "78204120412"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Georgia Connections Academy" & Lookup1 == "7820412"









list SCHOOLNAME if regexm(only_letter_all_school,"CCATSchool")
list if regexm(only_letter_all_school,"CCATSchool")
list if regexm(Lookup1,"7830103")


replace Lookup1 = "7830103"  if SCHOOLNAME == "CCAT School" & Lookup1 == "78301030103"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "CCAT School" & Lookup1 == "7830103"











list SCHOOLNAME if regexm(only_letter_all_school,"IvyPreparatoryAcademySchool")
list if regexm(only_letter_all_school,"IvyPreparatoryAcademySchool")
list if regexm(Lookup1,"7830110")


replace Lookup1 = "7830110"  if SCHOOLNAME == "Ivy Preparatory Academy School" & Lookup1 == "78301100110"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Ivy Preparatory Academy School" & Lookup1 == "7830110"





list SCHOOLNAME if regexm(only_letter_all_school,"AtlantaAreaSchoolfortheDeaf")
list if regexm(only_letter_all_school,"AtlantaAreaSchoolfortheDeaf")
list if regexm(Lookup1,"7991893")



replace Lookup1 = "7991893"  if SCHOOLNAME == "Atlanta Area School for the Deaf" & Lookup1 == "79918931893"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Atlanta Area School for the Deaf" & Lookup1 == "7991893"








list SCHOOLNAME if regexm(only_letter_all_school,"GeorgiaAcademyfortheBlind")
list if regexm(only_letter_all_school,"GeorgiaAcademyfortheBlind")
list if regexm(Lookup1,"7991894")



replace Lookup1 = "7991894"  if SCHOOLNAME == "Georgia Academy for the Blind" & Lookup1 == "79918941894"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Georgia Academy for the Blind" & Lookup1 == "7991894"







list SCHOOLNAME if regexm(only_letter_all_school,"GeorgiaSchoolfortheDeaf")
list if regexm(only_letter_all_school,"GeorgiaSchoolfortheDeaf")
list if regexm(Lookup1,"7991895")



replace Lookup1 = "7991895"  if SCHOOLNAME == "Georgia School for the Deaf" & Lookup1 == "79918951895"
replace _merge = 3 if _merge == 1 & SCHOOLNAME == "Georgia School for the Deaf" & Lookup1 == "7991895"





keep if _merge == 3




keep SCHOOLNAME Lookup1 DROPOUT_RATEAllStudents DROPOUT_RATEBlack DROPOUT_RATEFemale DROPOUT_RATEHispanic DROPOUT_RATEMale DROPOUT_RATEWhite YEAR SYSTEMID SYSTEMNAME SCHOOLID




save ".\temp_data\cleaned_dropout_data_2014", replace






