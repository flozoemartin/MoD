
***************************************************************************************************************************

* Mode of delivery on sexual health outcomes using ALSPAC - Data Analysis

* Author: Flo Martin

* Date started:	02/03/2021

* Date finished: 29/10/2021	

***************************************************************************************************************************

* Contents *
* line 23 - Dataset management *
* line 33 - Participation rate *
* line 38 - Table 1 participant characteristics *
* line 64 - Check proportional odds assumption *
* line 90 - Primary analysis caesarean section vs vaginal delivery in imputed dataset *

***************************************************************************************************************************

* Start logging

	log using "$Logdir/log_analysis.txt", text replace

* Load in the data

	use "$Datadir/mi_cohort_1.dta", clear
	
***************************************************************************************************************************

* Participation rate

	tab sexsat_33mo sexfreq_33mo, m
	tab sexsat_18yr sexfreq_18yr, m

* Table 1 - characteristic summary between caesarean section and vaginal delivery in complete cases

	tab vaginal_delivery

	ttest mat_bmi, by(vaginal_delivery) 
	tab bmi_cc vaginal_delivery, col chi

	ttest matage_delivery, by(vaginal_delivery)
	
	tab diabetes vaginal_delivery, col chi
	tab diabetes_cc vaginal_delivery, col chi

	tab cc_anxiety_bin vaginal_delivery, col chi
	tab anxiety_cc vaginal_delivery, col chi
	
	tab epds_bin vaginal_delivery, col chi
	tab epds_cc vaginal_delivery, col chi

	tab parity_bin vaginal_delivery, col chi
	tab parity_cc vaginal_delivery, col chi
	
	tab mat_degree vaginal_delivery, col chi
	tab mat_edu_cc vaginal_delivery, col chi

***************************************************************************************************************************
	
* Load in the data

	use "$Datadir/flo_dataset_cc.dta", clear
	
* Now, to check we can use ologit, we need to check that the assumption of proportionality holds

	foreach varname of varlist sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr {
		omodel logit `varname' vaginal_delivery if `varname' !=0
		brant, detail
	}

	foreach varname of varlist sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr {
		omodel logit `varname' vaginal_delivery
		brant, detail
	}

* The assumption isn't violated for any of the timepoints for sexual enjoyment and frequency

	tab dyspareunia_11yr vaginal_delivery
	omodel logit dyspareunia_11yr vaginal_delivery  	
	brant, detail	
	
	tab pain_elsewhere_11yr vaginal_delivery
	omodel logit pain_elsewhere_11yr vaginal_delivery if pain_elsewhere_11yr !=0
	brant, detail

* The assumption also isn't violated for both pain variables so we can go ahead with ologit

***************************************************************************************************************************

* Perform primary analysis ologit regression for caesarean section vs vaginal delivery - create table for manuscript

	use "$Datadir/imputed_data_1.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' str10 outcome str50 model str10 OR str20 OR_CI str10 p  ///
	using "$Datadir/Outputs/stata/MI_manuscript_1.dta", replace

	local i = 0
	local exposure vaginal_delivery  
	
	foreach outcome in sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr dyspareunia_11yr pain_elsewhere_11yr  {
	local i = `i' + 1
	
	mi estimate: ologit `outcome' `exposure' 
	post `memhold' ("`outcome'") ("Unadjusted") ///
		(strofreal(exp(r(table)[1,1]), "%5.2f")) ///
		("(" + strofreal(exp(r(table)[5,1]),"%5.2f") + " to " + strofreal(exp(r(table)[6,1]),"%5.2f") + ")") ///
		(strofreal(r(table)[4,1]), "%4.3f") 

	mi estimate: ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi diabetes
	post `memhold' ("`outcome'") ("Adjusted") ///
		(strofreal(exp(r(table)[1,1]), "%5.2f")) ///
		("(" + strofreal(exp(r(table)[5,1]),"%5.2f") + " to " + strofreal(exp(r(table)[6,1]),"%5.2f") + ")") ///
		(strofreal(r(table)[4,1]), "%4.3f")

}

	postclose `memhold'

	use "$Datadir/Outputs/stata/MI_manuscript_1.dta", clear

* Prepare models for output

	use "$Datadir/Outputs/stata/MI_manuscript_1.dta", clear
	export delim using "$Datadir/Outputs/MI_manuscript_1.csv", delim(",") replace

***************************************************************************************************************************

* Stop logging

	log close
	
***************************************************************************************************************************
	
