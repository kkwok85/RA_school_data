clear all


cd "D:\dropbox_2\Dropbox\J file\RA_school_data"


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

SYSTEMID SYSTEMNAME SCHOOLID SCHOOLNAME Lookup1 YEAR 
ELA_Enroll_all ELA_FAYP_all ELA_MEXCR_all ELA_DNM_all  
ELA_Enroll_BLK ELA_FAYP_BLK ELA_MEXCR_BLK ELA_DNM_BLK
ELA_Enroll_ED ELA_FAYP_ED ELA_MEXCR_ED ELA_DNM_ED
ELA_Enroll_HSP ELA_FAYP_HSP ELA_MEXCR_HSP ELA_DNM_HSP
ELA_Enroll_ELL ELA_FAYP_ELL ELA_MEXCR_ELL ELA_DNM_ELL
ELA_Enroll_dis ELA_FAYP_dis ELA_MEXCR_dis ELA_DNM_dis
ELA_Enroll_w ELA_FAYP_w ELA_MEXCR_w ELA_DNM_w
MTH_Enroll_all MTH_FAYP_all MTH_MEXCR_all MTH_DNM_all  
MTH_Enroll_BLK MTH_FAYP_BLK MTH_MEXCR_BLK MTH_DNM_BLK
MTH_Enroll_ED MTH_FAYP_ED MTH_MEXCR_ED MTH_DNM_ED
MTH_Enroll_HSP MTH_FAYP_HSP MTH_MEXCR_HSP MTH_DNM_HSP
MTH_Enroll_ELL MTH_FAYP_ELL MTH_MEXCR_ELL MTH_DNM_ELL
MTH_Enroll_dis MTH_FAYP_dis MTH_MEXCR_dis MTH_DNM_dis
MTH_Enroll_w MTH_FAYP_w MTH_MEXCR_w MTH_DNM_w
SCHOOLVIOLENCE NONFELONYDRUGS FELONYDRUGS ///      
Admin_Total_Positions Admin_Full_Time Admin_White Admin_Exp_less_than_1_yr Admin_Avg_Yrs_Exp ///
Supp_Total_Positions Supp_Full_Time Supp_White Supp_Exp_less_than_1_yr Supp_Avg_Yrs_Exp ///
Tch_Total_Positions Tch_Full_Time Tch_White Tch_Exp_less_than_1_yr Tch_Exp_1_to_10_yrs ///
Tch_Exp_11_to_20_yrs Tch_Exp_21_to_30_yrs Tch_Exp_more_than_30_yrs Tch_Avg_Yrs_Exp ///	  
DROPOUT_RATEAllStudents DROPOUT_RATEMale DROPOUT_RATEFemale DROPOUT_RATEWhite DROPOUT_RATEBlack   DROPOUT_RATEHispanic
Tot_enr9_12 enr_female enr_male enr_white enr_black enr_hisp  enr_other 
pct_male pct_white pct_black pct_hisp




             
                   




                 


** 102 variables!!

import excel using ".\raw_data\ALL_HS_2.xls", clear
 


rename (A-CX) ///
(SYSTEMID SYSTEMNAME SCHOOLID SCHOOLNAME Lookup1 YEAR ///
ELA_Enroll_all	ELA_FAYP_all	ELA_Mexcr_all	ELA_DNM_all ///
MTH_Enroll_all	MTH_FAYP_all    MTH_Mexcr_all	MTH_DNM_all	///
ELA_Enroll_blk	ELA_FAYP_blk	ELA_Mexcr_blk	ELA_DNM_blk ///
MTH_Enroll_blk	MTH_FAYP_blk	MTH_Mexcr_blk   MTH_DNM_blk ///
ELA_Enroll_ed	ELA_FAYP_ed     ELA_Mexcr_ed    ELA_DNM_ed	///
MTH_Enroll_ed	MTH_FAYP_ed	    MTH_Mexcr_ed    MTH_DNM_ed ///
ELA_Enroll_hsp	ELA_FAYP_hsp    ELA_Mexcr_hsp   ELA_DNM_hsp ///
MTH_Enroll_hsp  MTH_FAYP_hsp    MTH_Mexcr_hsp	MTH_DNM_hsp	///
ELA_Enroll_ell  ELA_FAYP_ell    ELA_Mexcr_ell	ELA_DNM_ell ///
MTH_Enroll_ell  MTH_FAYP_ell	MTH_Mexcr_ell   MTH_DNM_ell ///
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


