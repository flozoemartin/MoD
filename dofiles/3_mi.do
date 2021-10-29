
***************************************************************************************************************************

*	Mode of delivery on sexual health outcomes using ALSPAC - Multiple Imputation

*	Author:	Flo Martin

*	Date started:	29/09/2021

* 	Date finished:	29/10/2021

***************************************************************************************************************************

* Start logging

	log using "$Logdir/log_mi.txt", text replace

***************************************************************************************************************************
	
* Load in the dataset containing participants with complete exposure data for mi_cohort_1
	
	use "$Datadir/mi_cohort_1.dta", clear

* Create imputed dataset

	mi set wide
	mi register imputed parity_18wkgest mat_bmi cc_anxiety_18wkgest epds_18wkgest mat_edu /// 
					abs_wtgain_meas anxiety_33mo depression_33mo ///  
					sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr ///
					dyspareunia_11yr pain_elsewhere_11yr
	mi register regular mod matage_delivery 

	mi impute chained (regress) mat_bmi abs_wtgain_meas ///
				  (ologit) sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr ///
					sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr ///
					dyspareunia_11yr pain_elsewhere_11yr ///
				  (pmm, knn(10)) parity_18wkgest cc_anxiety_18wkgest epds_18wkgest anxiety_33mo depression_33mo /// 
				  (mlogit, augment) mat_edu ///
				  = i.mod matage_delivery ///
				  , add(100) rseed(484286) dots 

	save "$Datadir/imputed_data_1.dta", replace
	
***************************************************************************************************************************
	
* Load in the dataset containing participants with complete exposure data and potential MNAR/"No sex at the moment" cases coded as "worst case scenario" (mi_cohort_2)
	
	use "$Datadir/mi_cohort_2.dta", clear

* Create imputed dataset

	mi set wide
	mi register imputed parity_18wkgest mat_bmi cc_anxiety_18wkgest epds_18wkgest mat_edu /// 
					abs_wtgain_meas anxiety_33mo depression_33mo ///  
					sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr ///
					dyspareunia_11yr pain_elsewhere_11yr
	mi register regular mod matage_delivery 

	mi impute chained (regress) mat_bmi abs_wtgain_meas ///
				  (ologit) sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr ///
					sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr ///
					dyspareunia_11yr pain_elsewhere_11yr ///
				  (pmm, knn(10)) parity_18wkgest cc_anxiety_18wkgest epds_18wkgest anxiety_33mo depression_33mo /// 
				  (mlogit, augment) mat_edu ///
				  = i.mod matage_delivery ///
				  , add(100) rseed(484286) dots

	save "$Datadir/imputed_data_2.dta", replace
	
***************************************************************************************************************************

* Stop logging
	
	log close

***************************************************************************************************************************
