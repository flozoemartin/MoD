****************************************************************************************************************************************
*                                                                                                                                      *
*                                                                                                                                      *
*     Mode of delivery on sexual outcomes using the ALSPAC cohort - Data Anlysis                                                       *
*                                                                                                                                      *
*     Author:       Flo Martin                                                                                                         *
*     Date started: 11/11/2020                                                                                                         *
*                                                                                                                                      *
*                                                                                                                                      *
****************************************************************************************************************************************

* This is a revised do-file for the data analysis performed for my MSc dissertation - I have knitted
* together the useful parts of the do-files I had for analysis, in the order in which the information
* is required for the manuscript. I will also be adding the revised regressions (ordinal logistic) and
* the imputation model for missing data.

cd "/Users/ti19522/OneDrive - University of Bristol/Documents/PhD/Year 1/ALSPAC MoD Study"
use flo_dataset.dta, clear

* First in the manuscript is the flow diagram of participants through the study - important to know
* who is being lost at each stage. qlet = A ensures each mother is only counted once and mod < 6 excludes
* women with a mode of delivery coded as other. This can be added to as exclusion criteria is determined

count if qlet == "A"
count if qlet == "A" & mod < 6

* Next, for each outcome variable (enjoyment, frequency & pain) I am going to count the number of women at 
* each timepoint

tab mod if qlet == "A" & mod < 6

foreach varname of varlist sexsat_33mo sexsat_47mo sexsat_5yr sexsat_6yr sexsat_9yr sexsat_12yr sexsat_18yr {
	tab `varname' if qlet == "A" & mod < 6
}

foreach varname of varlist sexfreq_21mo sexfreq_33mo sexfreq_47mo sexfreq_5yr sexfreq_6yr sexfreq_9yr sexfreq_12yr sexfreq_18yr {
	tab `varname' if qlet == "A" & mod < 6
}

tab dyspareunia_11yr if qlet == "A" & mod < 6
tab pain_elsewhere_11yr if qlet == "A" & mod < 6

* Next, the participants characteristics for all women with obstetric info (for now - not sure which timepoint or
* complete cases I will use yet) 

tab vaginal_delivery if qlet == "A" & mod < 6

tab matage_del_cat vaginal_delivery if qlet == "A" & mod < 6, col chi
summ matage_delivery if vaginal_delivery ==0 & qlet == "A" & mod < 6, detail
summ matage_delivery if vaginal_delivery ==1 & qlet == "A" & mod < 6, detail

tab mat_ethn_cat vaginal_delivery if qlet == "A" & mod < 6, col chi 

tab hbp_mat vaginal_delivery if qlet == "A" & mod < 6, col chi

tab pregnancy_diabetes vaginal_delivery if qlet == "A" & mod < 6, col chi

tab mat_bmi_cat vaginal_delivery if qlet == "A" & mod < 6, col chi
summ mat_bmi if vaginal_delivery ==0 & qlet == "A" & mod < 6, detail 
summ mat_bmi if vaginal_delivery ==1 & qlet == "A" & mod < 6, detail

tab epds_bin vaginal_delivery if qlet == "A" & mod < 6, col chi 

tab cc_anxiety_bin vaginal_delivery if qlet == "A" & mod < 6, col chi  

tab parity_cat vaginal_delivery if qlet == "A" & mod < 6, col chi 

tab mat_edu_2 vaginal_delivery if qlet == "A" & mod < 6, col chi 

* For the ordinal logistic regressions at each timepoint I want to use ologit, restrict to individual pregnancies &
* defined mode of delivery & for now, exclude 'no sex at the moment' from the regressions

foreach varname of varlist sexsat_33mo sexsat_47mo sexsat_5yr sexsat_6yr sexsat_9yr sexsat_12yr sexsat_18yr {
	tab `varname' if qlet == "A" & mod < 6 
	ologit `varname' vaginal_delivery if qlet == "A" & mod < 6 & `varname' != 0 
	ologit `varname' vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest ///
	if qlet == "A" & mod < 6 & `varname' != 0 
}

foreach varname of varlist sexfreq_21mo sexfreq_33mo sexfreq_47mo sexfreq_5yr sexfreq_6yr sexfreq_9yr sexfreq_12yr sexfreq_18yr {
	tab `varname' if qlet == "A" & mod < 6 
	ologit `varname' vaginal_delivery if qlet == "A" & mod < 6 & `varname' != 0 
	ologit `varname' vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest ///
	if qlet == "A" & mod < 6 & `varname' != 0 
}

tab dyspareunia_11yr if qlet == "A" & mod < 6 
ologit dyspareunia_11yr vaginal_delivery if qlet == "A" & mod < 6 
ologit dyspareunia_11yr vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest ///
	if qlet == "A" & mod < 6
	
tab pain_elsewhere_11yr if qlet == "A" & mod < 6 
ologit pain_elsewhere_11yr vaginal_delivery if qlet == "A" & mod < 6 
ologit pain_elsewhere_11yr vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest ///
	if qlet == "A" & mod < 6

* Starting to have a look at the intersection between sexual pain at 11 years & sexual enjoyment at 12 years 
* but I don't think I have the power to deduce anything from this because of my small numbers	

table sexsat_12yr dyspareunia_11yr vaginal_delivery if qlet == "A" & mod < 6 & sexsat_12yr != 0 & dyspareunia_11yr !=.
ologit sexsat_12yr dyspareunia_11yr if qlet == "A" & mod < 6 & sexsat_12yr != 0 
