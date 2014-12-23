clear all


cd "D:\dropbox_2\Dropbox\J file\RA_school_data"


* cd "C:\Users\Julian.Julian-PC\Dropbox\J file\RA_school_data"


use ".\temp_data\cleaned_crime_data_2007"


forvalues i = 2008(1)2013 {
	append using ".\temp_data\cleaned_crime_data_`i'"

}




save ".\temp_data\cleaned_crime_data_2007_2013", replace










use ".\temp_data\cleaned_dropout_data_2007"


forvalues i = 2008(1)2014 {
	append using ".\temp_data\cleaned_dropout_data_`i'"

}




save ".\temp_data\cleaned_dropout_2007_2014", replace






use ".\temp_data\cleaned_enrollment_data_2007"


forvalues i = 2008(1)2015 {
	append using ".\temp_data\cleaned_enrollment_data_`i'"

}




save ".\temp_data\cleaned_enrollment_data_2007_2015", replace







use ".\temp_data\cleaned_hs_test_data_2007"


forvalues i = 2008(1)2011 {
	append using ".\temp_data\cleaned_hs_test_data_`i'"

}




save ".\temp_data\cleaned_hs_test_data_2007_2011", replace






use ".\temp_data\cleaned_personnel_data_2007"


forvalues i = 2008(1)2013 {
	append using ".\temp_data\cleaned_personnel_data_`i'"

}




save ".\temp_data\cleaned_personnel_data_2007_2013", replace







use ".\temp_data\cleaned_crime_data_2007_2013", clear
merge 1:1 YEAR SCHOOLNAME Lookup1 using ".\temp_data\cleaned_dropout_2007_2014", gen(_merge_dropout)
merge 1:1 YEAR SCHOOLNAME Lookup1 using ".\temp_data\cleaned_enrollment_data_2007_2015", gen(_merge_enrollment)
merge 1:1 YEAR SCHOOLNAME Lookup1 using ".\temp_data\cleaned_hs_test_data_2007_2011", gen(_merge_hs_test)
merge 1:1 YEAR SCHOOLNAME Lookup1 using ".\temp_data\cleaned_personnel_data_2007_2013", gen(_merge_personnel_test)




drop systemid systemname PERIOD SYSTEM_ID SYSTEM_NAME SCHOOL_ID FISCAL_YEAR    _merge_dropout gender ethnicityrace  _merge_enrollment ASSESSMENT_TYPE_CODE    _merge_personnel_test _merge_hs_test




** 101 variables!!


rename ///
(SYSTEMID SYSTEMNAME SCHOOLID SCHOOLNAME Lookup1 YEAR ///
ELA_Enroll_all ELA_FAYP_all ELA_MEXCR_all ELA_DNM_all ///
MTH_Enroll_all MTH_FAYP_all MTH_MEXCR_all MTH_DNM_all ///
ELA_Enroll_BLK ELA_FAYP_BLK ELA_MEXCR_BLK ELA_DNM_BLK ///
MTH_Enroll_BLK MTH_FAYP_BLK MTH_MEXCR_BLK MTH_DNM_BLK ///
ELA_Enroll_ED ELA_FAYP_ED ELA_MEXCR_ED ELA_DNM_ED ///
MTH_Enroll_ED MTH_FAYP_ED MTH_MEXCR_ED MTH_DNM_ED ///
ELA_Enroll_HSP ELA_FAYP_HSP ELA_MEXCR_HSP ELA_DNM_HSP ///
MTH_Enroll_HSP MTH_FAYP_HSP MTH_MEXCR_HSP MTH_DNM_HSP ///
ELA_Enroll_ELL ELA_FAYP_ELL ELA_MEXCR_ELL ELA_DNM_ELL ///
MTH_Enroll_ELL MTH_FAYP_ELL MTH_MEXCR_ELL MTH_DNM_ELL ///
ELA_Enroll_dis ELA_FAYP_dis ELA_MEXCR_dis ELA_DNM_dis ///
MTH_Enroll_dis MTH_FAYP_dis MTH_MEXCR_dis MTH_DNM_dis ///
ELA_Enroll_w ELA_FAYP_w ELA_MEXCR_w ELA_DNM_w ///
MTH_Enroll_w MTH_FAYP_w MTH_MEXCR_w MTH_DNM_w ///
SCHOOLVIOLENCE NONFELONYDRUGS FELONYDRUGS ///      
Admin_Total_Positions Admin_Full_Time Admin_White Admin_Exp_less_than_1_yr Admin_Avg_Yrs_Exp ///
Supp_Total_Positions Supp_Full_Time Supp_White Supp_Exp_less_than_1_yr Supp_Avg_Yrs_Exp ///
Tch_Total_Positions Tch_Full_Time Tch_White Tch_Exp_less_than_1_yr Tch_Exp_1_to_10_yrs ///
Tch_Exp_11_to_20_yrs Tch_Exp_21_to_30_yrs Tch_Exp_more_than_30_yrs Tch_Avg_Yrs_Exp ///	  
DROPOUT_RATEAllStudents DROPOUT_RATEMale DROPOUT_RATEFemale DROPOUT_RATEWhite DROPOUT_RATEBlack   DROPOUT_RATEHispanic ///
Tot_enr9_12 enr_male enr_female  enr_white enr_black enr_hisp  enr_other ///
pct_male pct_white pct_black pct_hisp) ///
(SYSTEMID SYSTEMNAME SCHOOLID SCHOOLNAME Lookup1 YEAR ///
ELA_Enroll_all	ELA_FAYP_all	ELA_Mexcr_all	ELA_DNM_all ///
MTH_Enroll_all	MTH_FAYP_all    MTH_Mexcr_all	MTH_DNM_all	///
ELA_Enroll_BLK	ELA_FAYP_BLK	ELA_Mexcr_BLK	ELA_DNM_BLK ///
MTH_Enroll_BLK	MTH_FAYP_BLK	MTH_Mexcr_BLK   MTH_DNM_BLK ///
ELA_Enroll_ED	ELA_FAYP_ED     ELA_Mexcr_ED    ELA_DNM_ED	///
MTH_Enroll_ED	MTH_FAYP_ED	    MTH_Mexcr_ED    MTH_DNM_ED ///
ELA_Enroll_HSP	ELA_FAYP_HSP    ELA_Mexcr_HSP   ELA_DNM_HSP ///			
MTH_Enroll_HSP  MTH_FAYP_HSP    MTH_Mexcr_HSP	MTH_DNM_HSP	///		
ELA_Enroll_ELL  ELA_FAYP_ELL    ELA_Mexcr_ELL	ELA_DNM_ELL ///			
MTH_Enroll_ELL  MTH_FAYP_ELL	MTH_Mexcr_ELL   MTH_DNM_ELL ///			
ELA_Enroll_dis	ELA_FAYP_dis    ELA_Mexcr_dis	ELA_DNM_dis	///	
MTH_Enroll_dis	MTH_FAYP_dis	MTH_Mexcr_dis	MTH_DNM_dis	///
ELA_Enroll_w	ELA_FAYP_w	ELA_Mexcr_w	ELA_DNM_w	MTH_Enroll_w ///
MTH_FAYP_w MTH_Mexcr_w	MTH_DNM_w ///
SCHOOLVIOLENCE	NONFELONYDRUGS	FELONYDRUGS ///
Admin_Total_Positions Admin_Full_Time Admin_White Admin_Exp_less_than_1_yr Admin_Avg_Yrs_Exp ///
Supp_Total_Positions  Supp_Full_Time Supp_White Supp_Exp_less_than_1_yr  Supp_Avg_Yrs_Exp ///
Tch_Total_Positions	Tch_Full_Time Tch_White	Tch_Exp_less_than_1_yr  Tch_Exp_1_to_10_yrs ///
Tch_Exp_11_to_20_yrs Tch_Exp_21_to_30_yrs Tch_Exp_more_than_30_yrs Tch_Avg_Yrs_Exp ///
Drp9_12_total Drp9_12_male Drp9_12_female Drp9_12_white Drp9_12_black Drp9_12_hisp ///
Tot_enr9_12 enr_male enr_female enr_white enr_black enr_hisp enr_other ///
pct_male pct_white pct_black pct_hisp )


destring, replace

tostring SYSTEMID Lookup1, replace



gen SCHOOLID2 = substr(Lookup1, 4,4) 
tostring SCHOOLID, replace
replace SCHOOLID = SCHOOLID2
drop SCHOOLID2




* tranform all N/A into missing variables and make them all numeric 
foreach stringlist in Drp9_12_total	Drp9_12_black	Drp9_12_female	Drp9_12_hisp	Drp9_12_male	Drp9_12_white {
	replace `stringlist' = "." if regexm(`stringlist',"n/a")
	destring `stringlist', replace
}




destring Drp9_12_total	Drp9_12_black	Drp9_12_female	Drp9_12_hisp	Drp9_12_male	Drp9_12_white , replace





save ".\temp_data\cleaned_ALL_HS_2007_2013", replace















           


                 


** 102 variables!! (school type is the extra one)

import excel using ".\raw_data\ALL_HS_2.xls", clear
 


rename (A-CX) ///
(SYSTEMID SYSTEMNAME SCHOOLID SCHOOLNAME Lookup1 YEAR ///
ELA_Enroll_all	ELA_FAYP_all	ELA_Mexcr_all	ELA_DNM_all ///
MTH_Enroll_all	MTH_FAYP_all    MTH_Mexcr_all	MTH_DNM_all	///
ELA_Enroll_BLK	ELA_FAYP_BLK	ELA_Mexcr_BLK	ELA_DNM_BLK ///
MTH_Enroll_BLK	MTH_FAYP_BLK	MTH_Mexcr_BLK   MTH_DNM_BLK ///
ELA_Enroll_ED	ELA_FAYP_ED     ELA_Mexcr_ED    ELA_DNM_ED	///
MTH_Enroll_ED	MTH_FAYP_ED	    MTH_Mexcr_ED    MTH_DNM_ED ///
ELA_Enroll_HSP	ELA_FAYP_HSP    ELA_Mexcr_HSP   ELA_DNM_HSP ///			
MTH_Enroll_HSP  MTH_FAYP_HSP    MTH_Mexcr_HSP	MTH_DNM_HSP	///		
ELA_Enroll_ELL  ELA_FAYP_ELL    ELA_Mexcr_ELL	ELA_DNM_ELL ///			
MTH_Enroll_ELL  MTH_FAYP_ELL	MTH_Mexcr_ELL   MTH_DNM_ELL ///			
ELA_Enroll_dis	ELA_FAYP_dis    ELA_Mexcr_dis	ELA_DNM_dis	///	
MTH_Enroll_dis	MTH_FAYP_dis	MTH_Mexcr_dis	MTH_DNM_dis	///
ELA_Enroll_w	ELA_FAYP_w	ELA_Mexcr_w	ELA_DNM_w	MTH_Enroll_w ///
MTH_FAYP_w MTH_Mexcr_w	MTH_DNM_w ///
SCHOOLVIOLENCE	NONFELONYDRUGS	FELONYDRUGS ///
SchoolType ///
Admin_Total_Positions Admin_Full_Time Admin_White Admin_Exp_less_than_1_yr Admin_Avg_Yrs_Exp ///
Supp_Total_Positions  Supp_Full_Time Supp_White Supp_Exp_less_than_1_yr  Supp_Avg_Yrs_Exp ///
Tch_Total_Positions	Tch_Full_Time Tch_White	Tch_Exp_less_than_1_yr  Tch_Exp_1_to_10_yrs ///
Tch_Exp_11_to_20_yrs Tch_Exp_21_to_30_yrs Tch_Exp_more_than_30_yrs Tch_Avg_Yrs_Exp ///
Drp9_12_total Drp9_12_male Drp9_12_female Drp9_12_white Drp9_12_black Drp9_12_hisp ///
Tot_enr9_12 enr_male enr_female enr_white enr_black enr_hisp enr_other ///
pct_male pct_white pct_black pct_hisp )





drop in 1/2


destring , replace

drop if SYSTEMID == .



gen str4 L3 = string(SCHOOLID,"%04.0f")
drop SCHOOLID
rename L3 SCHOOLID
drop Lookup1
tostring SYSTEMID, replace
gen Lookup1 = SYSTEMID + SCHOOLID



* tranform all N/A into missing variables and make them all numeric 
foreach stringlist in  ELA_Mexcr_all ELA_DNM_all MTH_Mexcr_all MTH_DNM_all {

	replace `stringlist' = "." if regexm(`stringlist',"N/A")
	destring `stringlist', replace
}





append using ".\temp_data\cleaned_ALL_HS_2007_2013"



sort SCHOOLNAME Lookup1 YEAR

order SYSTEMID	SYSTEMNAME	SCHOOLNAME Lookup1 YEAR











*** debug check ***


duplicates report SCHOOLNAME Lookup1 YEAR

duplicates report SCHOOLNAME  YEAR










