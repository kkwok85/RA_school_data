capture program drop show_mismatch
program show_mismatch


/*
This ado file is to see the reason of mismatch when merging files. The focus is only on _merge == 2 since _merge == 1 has data
and I can still keep them and not focus on them. However, _merge == 2 (which is the unique identifier) does not have data and so I want to see the 
reason why they cannot match. Bascially there are 3 reasons:
1) school name matches but school id does not match   (indicated by school2_id1)
2) school id matches but school name does not match   (indicated by school1_id2)
3) other reason such as different spacing format in different data files, duplicated schools and etc  (indicated by school_special)



The whole methodology of this ado file is to 
1) get rid of special characters first (such as (,),&, - ) and get pure letter school name
2) then rank _merge (very important!! Because I am using the "array" method to record school name) and record school name and school id
   into local variable. After that, I count the number of the same school name and same school id
3) show the counted number in the data 
 
   


*/



	version 12

    set more off
	gen count_num_same_school =.     
	gen count_num_same_id =.     
	gen only_letter_all_school = subinstr(SCHOOLNAME," ","",.)
	gen only_letter_unique_identifier = subinstr(SCHOOLNAME," ","",.) if _merge == 2 
	
	gen merge2_indicator = 1 if _merge == 2  
	
	
* 1) get rid of special characters first (such as (,),&, - ) and get pure letter school name
	
	foreach punctuation in "(" ")" "," "." "&" "-" "/" {
		replace only_letter_all_school = subinstr(only_letter_all_school,"`punctuation'","",.)
		replace only_letter_unique_identifier = subinstr(only_letter_unique_identifier,"`punctuation'","",.) 
	}
	
/*
2) then rank _merge (very important!! Because I am using the "array" method to record school name) and record school name and school id
   into local variable. After that, I count the number of the same school name and same school id	
*/
	
	sort merge2_indicator Lookup1  // very important!! Because I am using the "array" method to record school name)
	
	count if _merge == 2
	scalar number_extra_unique_identifier = r(N)

	local i = 1          
	
	while `i' <= number_extra_unique_identifier {
	    local a only_letter_unique_identifier[`i'] 
		local b Lookup1[`i']
		
		count if regexm(only_letter_all_school, `a')==1  
		scalar num_match_school`i' = r(N)    // this variable name will be reused below
		replace count_num_same_school = r(N) in `i'
		
		count if regexm(Lookup1, `b')==1 
		scalar num_match_id`i' = r(N)   // this variable name will be reused below
		replace count_num_same_id = r(N) in `i'	
		
		local i = `i' + 1  
	}
	
	

	
* 3) show the counted number in the data 


	gen school2_id1 =.
	gen school1_id2 =.
	gen school1_id1 =.
	gen school_special =.
	



	local j = 1
	while `j' <= number_extra_unique_identifier {
	  if num_match_school`j' == 2 & num_match_id`j' == 1 {
		replace school2_id1 = `j' in `j'
		}
	  else if num_match_school`j' == 1 & num_match_id`j' == 2 {		
		replace school1_id2 = `j' in `j'
		}
      else if num_match_school`j' == 1 & num_match_id`j' == 1 {
	    replace school1_id1 = `j' in `j'
	    }
	  else {
		replace school_special = `j' in `j'
		}
	 local j = `j' + 1
	}

	
	
end	


	
	
	
