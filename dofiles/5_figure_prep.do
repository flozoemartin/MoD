
***************************************************************************************************************************

* Figure prep - making the dataframes used by the figures in the manuscript (main text). Figure 3 - primary analysis in imputed dataset of caesarean section vs vaginal delivery

* Author: Flo Martin

* Date started: 25/10/2021

* Date finished: 29/10/2021

***************************************************************************************************************************

* Start logging

	log using "7_figure_prep.txt", replace
	
* Change directory for saving dataframes

	cd "$Datadir/outputs/figure_data"
	
***************************************************************************************************************************

* Figure 3 dataframes - primary analysis of caesarean section vs vaginal delivery in imputed dataset

* Sexual enjoyment chunk 

	use "$Datadir/imputed_data_1.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' id or lci uci ///
	using "$Datadir/outputs/figure_data/figure_3/MI_sexsat_chunk_1.dta", replace

	local i = 0
	local exposure vaginal_delivery  
	
	foreach outcome in sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr  {
	local i = `i' + 1
	
	mi estimate: ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (exp(r(table)[1,1])) (exp(r(table)[5,1])) (exp(r(table)[6,1]))

}

	postclose `memhold'

	use "$Datadir/Outputs/figure_data/figure_3/MI_sexsat_chunk_1.dta", clear	
	
* Sexual frequency chunk
	
	use "$Datadir/imputed_data_1.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' id or lci uci ///
	using "$Datadir/Outputs/figure_data/figure_3/MI_sexfreq_chunk_1.dta", replace

	local i = 0
	local exposure vaginal_delivery  
	
	foreach outcome in sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr  {
	local i = `i' + 1
	
	mi estimate: ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (exp(r(table)[1,1])) (exp(r(table)[5,1])) (exp(r(table)[6,1]))

}

	postclose `memhold'

	use "$Datadir/Outputs/figure_data/figure_3/MI_sexfreq_chunk_1.dta", clear	
	
* Pain in the vagina chunk
	
	use "$Datadir/imputed_data_1.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' id or lci uci ///
	using "$Datadir/Outputs/figure_data/figure_3/MI_dyspar_chunk_1.dta", replace

	local i = 0
	local exposure vaginal_delivery  
	
	foreach outcome in dyspareunia_11yr  {
	local i = `i' + 1
	
	mi estimate: ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (exp(r(table)[1,1])) (exp(r(table)[5,1])) (exp(r(table)[6,1]))

}

	postclose `memhold'

	use "$Datadir/Outputs/figure_data/figure_3/MI_dyspar_chunk_1.dta", clear
	
* Pain elsewhere chunk
	
	use "$Datadir/imputed_data_1.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' id or lci uci ///
	using "$Datadir/Outputs/figure_data/figure_3/MI_pain_chunk_1.dta", replace

	local i = 0
	local exposure vaginal_delivery  
	
	foreach outcome in pain_elsewhere_11yr  {
	local i = `i' + 1
	
	mi estimate: ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (exp(r(table)[1,1])) (exp(r(table)[5,1])) (exp(r(table)[6,1]))

}

	postclose `memhold'

	use "$Datadir/Outputs/figure_data/figure_3/MI_pain_chunk_1.dta", clear
	
***************************************************************************************************************************

* Stop logging

	log close
	
***************************************************************************************************************************

