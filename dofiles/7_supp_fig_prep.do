
***************************************************************************************************************************

* Supplementary figure prep - making the dataframes used by the figures in the manuscript (supplementary material). Figure 2 - instrumental vs non-instrumental vaginal delivery, figure 3 elective and emergency vs vaginal delivery, figure 4 worst case scenario sensitivity analysis & figure 5 complete case vs MI sensitivity analysis

* Author: Flo Martin

* Date started: 29/10/2021

* Date finished: 29/10/2021

***************************************************************************************************************************

* Contents *
* line 23 - Database management *
* line 33 - Supplementary figure 2 *
* line 137 - Supplementary figure 3 *
* line 253 - Supplementary figure 4 *
* line 357 - Supplementary figure 5 *

***************************************************************************************************************************

* Start logging

	log using "$Logdir/log_supp_fig_prep.txt", replace
	
* Change directory for saving dataframes

	cd "$Datadir/outputs/figure_data"
	
***************************************************************************************************************************

* Supplementary figure 2 dataframes - sensitivity analysis instrumental vs non-instrumental vaginal delivery in imputed dataset

* Sexual enjoyment chunk 

	use "$Datadir/imputed_data_1.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' id or lci uci ///
	using "$Datadir/outputs/figure_data/supp_figure_2/MI_sexsat_chunk_2.dta", replace

	local i = 0
	local exposure instrumental_del  
	
	foreach outcome in sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr  {
	local i = `i' + 1
	
	mi estimate: ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (exp(r(table)[1,1])) (exp(r(table)[5,1])) (exp(r(table)[6,1]))

}

	postclose `memhold'

	use "$Datadir/Outputs/figure_data/supp_figure_2/MI_sexsat_chunk_2.dta", clear	
	
* Sexual frequency chunk
	
	use "$Datadir/imputed_data_1.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' id or lci uci ///
	using "$Datadir/Outputs/figure_data/supp_figure_2/MI_sexfreq_chunk_2.dta", replace

	local i = 0
	local exposure instrumental_del  
	
	foreach outcome in sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr  {
	local i = `i' + 1
	
	mi estimate: ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (exp(r(table)[1,1])) (exp(r(table)[5,1])) (exp(r(table)[6,1]))

}

	postclose `memhold'

	use "$Datadir/Outputs/figure_data/supp_figure_2/MI_sexfreq_chunk_2.dta", clear	
	
* Pain in the vagina chunk
	
	use "$Datadir/imputed_data_1.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' id or lci uci ///
	using "$Datadir/Outputs/figure_data/supp_figure_2/MI_dyspar_chunk_2.dta", replace

	local i = 0
	local exposure instrumental_del  
	
	foreach outcome in dyspareunia_11yr  {
	local i = `i' + 1
	
	mi estimate: ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (exp(r(table)[1,1])) (exp(r(table)[5,1])) (exp(r(table)[6,1]))

}

	postclose `memhold'

	use "$Datadir/Outputs/figure_data/supp_figure_2/MI_dyspar_chunk_2.dta", clear
	
* Pain elsewhere chunk
	
	use "$Datadir/imputed_data_1.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' id or lci uci ///
	using "$Datadir/Outputs/figure_data/supp_figure_2/MI_pain_chunk_2.dta", replace

	local i = 0
	local exposure instrumental_del  
	
	foreach outcome in pain_elsewhere_11yr  {
	local i = `i' + 1
	
	mi estimate: ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (exp(r(table)[1,1])) (exp(r(table)[5,1])) (exp(r(table)[6,1]))

}

	postclose `memhold'

	use "$Datadir/Outputs/figure_data/supp_figure_2/MI_pain_chunk_2.dta", clear
	
***************************************************************************************************************************

* Supplementary figure 3 dataframes - sensitivity analysis elective and emergency C-section vs vaginal delivery in imputed dataset

* Sexual enjoyment chunk 

	use "$Datadir/imputed_data_1.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' id gr or lci uci ///
	using "$Datadir/outputs/figure_data/supp_figure_3/MI_sexsat_chunk_3.dta", replace

	local i = 0
	local exposure strat_cs  
	
	foreach outcome in sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr  {
	local i = `i' + 1
	
	mi estimate: ologit `outcome' i.`exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (1) (exp(r(table)[1,2])) (exp(r(table)[5,2])) (exp(r(table)[6,2]))
	
		mi estimate: ologit `outcome' i.`exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (2) (exp(r(table)[1,3])) (exp(r(table)[5,3])) (exp(r(table)[6,3]))

}

	postclose `memhold'

	use "$Datadir/Outputs/figure_data/supp_figure_3/MI_sexsat_chunk_3.dta", clear	
	
* Sexual frequency chunk
	
	use "$Datadir/imputed_data_1.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' id gr or lci uci ///
	using "$Datadir/Outputs/figure_data/supp_figure_3/MI_sexfreq_chunk_3.dta", replace

	local i = 0
	local exposure strat_cs  
	
	foreach outcome in sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr  {
	local i = `i' + 1
	
	mi estimate: ologit `outcome' i.`exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (1) (exp(r(table)[1,2])) (exp(r(table)[5,2])) (exp(r(table)[6,2]))
	
	mi estimate: ologit `outcome' i.`exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (2) (exp(r(table)[1,3])) (exp(r(table)[5,3])) (exp(r(table)[6,3]))

}

	postclose `memhold'

	use "$Datadir/Outputs/figure_data/supp_figure_3/MI_sexfreq_chunk_3.dta", clear	
	
* Pain in the vagina chunk
	
	use "$Datadir/imputed_data_1.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' id gr or lci uci ///
	using "$Datadir/Outputs/figure_data/supp_figure_3/MI_dyspar_chunk_3.dta", replace

	local i = 0
	local exposure strat_cs  
	
	foreach outcome in dyspareunia_11yr  {
	local i = `i' + 1
	
	mi estimate: ologit `outcome' i.`exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (1) (exp(r(table)[1,2])) (exp(r(table)[5,2])) (exp(r(table)[6,2]))
	
	mi estimate: ologit `outcome' i.`exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (2) (exp(r(table)[1,3])) (exp(r(table)[5,3])) (exp(r(table)[6,3]))

}

	postclose `memhold'

	use "$Datadir/Outputs/figure_data/supp_figure_3/MI_dyspar_chunk_3.dta", clear
	
* Pain elsewhere chunk
	
	use "$Datadir/imputed_data_1.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' id gr or lci uci ///
	using "$Datadir/Outputs/figure_data/supp_figure_3/MI_pain_chunk_3.dta", replace

	local i = 0
	local exposure strat_cs  
	
	foreach outcome in pain_elsewhere_11yr  {
	local i = `i' + 1
	
	mi estimate: ologit `outcome' i.`exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (1) (exp(r(table)[1,2])) (exp(r(table)[5,2])) (exp(r(table)[6,2]))
	
	mi estimate: ologit `outcome' i.`exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (2) (exp(r(table)[1,3])) (exp(r(table)[5,3])) (exp(r(table)[6,3]))

}

	postclose `memhold'

	use "$Datadir/Outputs/figure_data/supp_figure_3/MI_pain_chunk_3.dta", clear
	
***************************************************************************************************************************

* Supplementary figure 4 dataframes - sensitivity analysis worst case scenario in imputed dataset with MNAR/"No sex at the moment" recoded

* Sexual enjoyment chunk 

	use "$Datadir/imputed_data_2.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' id or lci uci ///
	using "$Datadir/outputs/figure_data/supp_figure_4/MI_sexsat_chunk_4.dta", replace

	local i = 0
	local exposure vaginal_delivery  
	
	foreach outcome in sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr  {
	local i = `i' + 1
	
	mi estimate: ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (exp(r(table)[1,1])) (exp(r(table)[5,1])) (exp(r(table)[6,1]))

}

	postclose `memhold'

	use "$Datadir/Outputs/figure_data/supp_figure_4/MI_sexsat_chunk_4.dta", clear	
	
* Sexual frequency chunk
	
	use "$Datadir/imputed_data_2.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' id or lci uci ///
	using "$Datadir/Outputs/figure_data/supp_figure_4/MI_sexfreq_chunk_4.dta", replace

	local i = 0
	local exposure vaginal_delivery  
	
	foreach outcome in sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr  {
	local i = `i' + 1
	
	mi estimate: ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (exp(r(table)[1,1])) (exp(r(table)[5,1])) (exp(r(table)[6,1]))

}

	postclose `memhold'

	use "$Datadir/Outputs/figure_data/supp_figure_4/MI_sexfreq_chunk_4.dta", clear	
	
* Pain in the vagina chunk
	
	use "$Datadir/imputed_data_2.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' id or lci uci ///
	using "$Datadir/Outputs/figure_data/supp_figure_4/MI_dyspar_chunk_4.dta", replace

	local i = 0
	local exposure vaginal_delivery  
	
	foreach outcome in dyspareunia_11yr  {
	local i = `i' + 1
	
	mi estimate: ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (exp(r(table)[1,1])) (exp(r(table)[5,1])) (exp(r(table)[6,1]))

}

	postclose `memhold'

	use "$Datadir/Outputs/figure_data/supp_figure_4/MI_dyspar_chunk_4.dta", clear
	
* Pain elsewhere chunk
	
	use "$Datadir/imputed_data_2.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' id or lci uci ///
	using "$Datadir/Outputs/figure_data/supp_figure_4/MI_pain_chunk_4.dta", replace

	local i = 0
	local exposure vaginal_delivery  
	
	foreach outcome in pain_elsewhere_11yr  {
	local i = `i' + 1
	
	mi estimate: ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (exp(r(table)[1,1])) (exp(r(table)[5,1])) (exp(r(table)[6,1]))

}

	postclose `memhold'

	use "$Datadir/Outputs/figure_data/supp_figure_4/MI_pain_chunk_4.dta", clear
	
***************************************************************************************************************************

* Supplementary figure 5 dataframes - sensitivity analysis complete case analysis and primary analysis MI

* Sexual enjoyment chunk 

	capture postutil close 
	tempname memhold 

	postfile `memhold' id gr or lci uci ///
	using "$Datadir/outputs/figure_data/supp_figure_5/MI_sexsat_chunk_5.dta", replace

	local i = 0
	local exposure vaginal_delivery  
	
	foreach outcome in sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr  {
	local i = `i' + 1
	
	use "$Datadir/imputed_data_1.dta", clear
	
	mi estimate: ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (1) (exp(r(table)[1,1])) (exp(r(table)[5,1])) (exp(r(table)[6,1]))
	
	use "$Datadir/flo_dataset_cc.dta", clear
	
	ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (2) (exp(r(table)[1,1])) (exp(r(table)[5,1])) (exp(r(table)[6,1]))

}

	postclose `memhold'

	use "$Datadir/Outputs/figure_data/supp_figure_5/MI_sexsat_chunk_5.dta", clear	
	
* Sexual frequency chunk

	capture postutil close 
	tempname memhold 

	postfile `memhold' id gr or lci uci ///
	using "$Datadir/Outputs/figure_data/supp_figure_5/MI_sexfreq_chunk_5.dta", replace

	local i = 0
	local exposure vaginal_delivery  
	
	foreach outcome in sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr  {
	local i = `i' + 1
	
	use "$Datadir/imputed_data_1.dta", clear
	
	mi estimate: ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (1) (exp(r(table)[1,1])) (exp(r(table)[5,1])) (exp(r(table)[6,1]))
	
	use "$Datadir/flo_dataset_cc.dta", clear
	
	ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (2) (exp(r(table)[1,1])) (exp(r(table)[5,1])) (exp(r(table)[6,1]))

}

	postclose `memhold'

	use "$Datadir/Outputs/figure_data/supp_figure_5/MI_sexfreq_chunk_5.dta", clear	
	
* Pain in the vagina chunk

	capture postutil close 
	tempname memhold 

	postfile `memhold' id gr or lci uci ///
	using "$Datadir/Outputs/figure_data/supp_figure_5/MI_dyspar_chunk_5.dta", replace

	local i = 0
	local exposure vaginal_delivery  
	
	foreach outcome in dyspareunia_11yr  {
	local i = `i' + 1
	
	use "$Datadir/imputed_data_1.dta", clear
	
	mi estimate: ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (1) (exp(r(table)[1,1])) (exp(r(table)[5,1])) (exp(r(table)[6,1]))
	
	use "$Datadir/flo_dataset_cc.dta", clear
	
	ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (2) (exp(r(table)[1,1])) (exp(r(table)[5,1])) (exp(r(table)[6,1]))

}

	postclose `memhold'

	use "$Datadir/Outputs/figure_data/supp_figure_5/MI_dyspar_chunk_5.dta", clear
	
* Pain elsewhere chunk

	capture postutil close 
	tempname memhold 

	postfile `memhold' id gr or lci uci ///
	using "$Datadir/Outputs/figure_data/supp_figure_5/MI_pain_chunk_5.dta", replace

	local i = 0
	local exposure vaginal_delivery  
	
	foreach outcome in pain_elsewhere_11yr  {
	local i = `i' + 1
	
	use "$Datadir/imputed_data_1.dta", clear
	
	mi estimate: ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (1) (exp(r(table)[1,1])) (exp(r(table)[5,1])) (exp(r(table)[6,1]))
	
	use "$Datadir/flo_dataset_cc.dta", clear
	
	ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (`i') (2) (exp(r(table)[1,1])) (exp(r(table)[5,1])) (exp(r(table)[6,1]))

}

	postclose `memhold'

	use "$Datadir/Outputs/figure_data/supp_figure_5/MI_pain_chunk_5.dta", clear
	
***************************************************************************************************************************

* Stop logging

	log close
	
***************************************************************************************************************************

