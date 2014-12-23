clear all


cd "D:\dropbox_2\Dropbox\J file\RA_school_data"
 
* This script is to clean enrollment data 


insheet using ".\raw_data\enrollment_data\FTE Enrollment by Grade Fiscal Year2009-1 Data Report_v2.csv", clear



drop  if grade11 == 0 & grade12 == 0 & grade10 == 0



split schoolname, p(" - ")


replace schoolname2 = "Greenville Middle - High School" if schoolname2 == "Greenville Middle"
replace schoolname2 = "Bradfield Center - Ault Academy" if schoolname2 == "Bradfield Center" 



gen Lookup1 = systemid + schoolname1




keep if gender == "School Total" | (gender == "Female" & ethnicityrace == "Subtotal") | (gender == "Male" & ethnicityrace == "Subtotal")



gen Tot_enr9_12 = grade09 + grade10 + grade11 + grade12


drop  ethnicityrace schoolname total gradepk gradekk grade01 grade02 grade03 grade04 grade05 grade06 grade07 grade08 grade09 grade10 grade11 grade12 schoolname1 schoolname3




replace gender = "total" if gender == "School Total"



reshape wide Tot_enr9_12, i(schoolname2 Lookup1) j(gender) string









rename (Tot_enr9_12Female Tot_enr9_12Male Tot_enr9_12total) (enr_female enr_male Tot_enr9_12)






save ".\temp_data\cleaned_enrollment_data_2009_gender", replace



























insheet using ".\raw_data\enrollment_data\FTE Enrollment by Grade Fiscal Year2009-1 Data Report_v2.csv", clear



drop  if grade11 == 0 & grade12 == 0 & grade10 == 0



split schoolname, p(" - ")


replace schoolname2 = "Greenville Middle - High School" if schoolname2 == "Greenville Middle"
replace schoolname2 = "Bradfield Center - Ault Academy" if schoolname2 == "Bradfield Center" 



gen Lookup1 = systemid + schoolname1





keep if ethnicityrace == "White" | ethnicityrace == "Black" | ethnicityrace == "Hispanic" | ethnicityrace == "Multi-Racial"  | ethnicityrace == "Asian" 



gen Tot_enr9_12 = grade09 + grade10 + grade11 + grade12


drop  schoolname total gradepk gradekk grade01 grade02 grade03 grade04 grade05 grade06 grade07 grade08 grade09 grade10 grade11 grade12 schoolname1 schoolname3



gen White_gender = Tot_enr9_12 if ethnicityrace == "White"
gen Black_gender = Tot_enr9_12 if ethnicityrace == "Black"
gen Hispanic_gender = Tot_enr9_12 if ethnicityrace == "Hispanic"
gen MR_gender = Tot_enr9_12 if ethnicityrace == "Multi-Racial"
gen Asian_gender = Tot_enr9_12 if ethnicityrace == "Asian"



bysort Lookup1: egen White = total(White_gender)
bysort Lookup1: egen Black = total(Black_gender)
bysort Lookup1: egen Hispanic = total(Hispanic_gender)
bysort Lookup1: egen Multi_Racial = total(MR_gender)
bysort Lookup1: egen Asian = total(Asian_gender)


duplicates drop Lookup1 schoolname2, force








merge 1:1 schoolname2 Lookup1 using ".\temp_data\cleaned_enrollment_data_2009_gender"




rename (White Black Hispanic schoolname2) (enr_white enr_black enr_hisp SCHOOLNAME)
gen enr_other = Multi_Racial + Asian
gen pct_male = (enr_male/Tot_enr9_12)*100
gen pct_white = (enr_white/Tot_enr9_12)*100
gen pct_black = (enr_black/Tot_enr9_12)*100
gen pct_hisp = (enr_hisp/Tot_enr9_12)*100
gen YEAR = 2009







drop White_gender Black_gender Hispanic_gender MR_gender Asian_gender Multi_Racial Asian _merge 





save ".\temp_data\cleaned_enrollment_data_2009", replace
