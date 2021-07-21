* Mode of delivery on sexual health outcomes using ALSPAC - Data Analysis

* Author: Flo Martin

* Date started:	02/03/2021
* Date finished: 15/06/2021	

* Contents *
* line 20 Dataset management *
* line 23 Figure 1 - Flow diagram *
* line 30 Table 1 - Participants characteristics *
* line 50 Overview of the exposures *
* line 157 Primary analysis - caesarean section vs vaginal delivery *
* line 203 Sensitivity analysis - instrumental vs non-instrumental vaginal delivery *
* line 247 Sensitivity analysis - emergency CS vs vaginal delivery *
* line 289 Sensitivity analysis - elective CS vs vaginal delivery *
* line 331 Sensitivity analysis - "No sex at the moment" *
* line 354 Sensitivity analysis - Including predictors (not currently included in the manuscript 14/06) *

cd "/location/of/the/data"
use flo_dataset_cc.dta, clear

* Figure 1 - flow diagram
count if sexsat_33mo !=. | sexfreq_33mo !=.
count if sexsat_5yr !=. | sexfreq_5yr !=.
count if dyspareunia_11yr !=. | pain_elsewhere_11yr !=.
count if sexsat_12yr !=. | sexfreq_12yr !=.
count if sexsat_18yr !=. | sexfreq_18yr !=.

* Table 1 - characteristic summary between caesarean section and vaginal delivery in complete cases

tab vaginal_delivery

ttest mat_bmi, by(vaginal_delivery) 

ttest matage_delivery, by(vaginal_delivery)

tab mat_degree vaginal_delivery, col chi

tab cc_anxiety_bin vaginal_delivery, col chi

tab epds_bin vaginal_delivery, col chi

tab parity_bin vaginal_delivery, col chi

* Participation rate
tab sexsat_33mo sexfreq_33mo, m
tab sexsat_18yr sexfreq_18yr, m

* Overall prevalence
* Primary exposure groups - vaginal delivery vs caesarean section

tab sexsat_33mo vaginal_delivery, col
tab sexsat_5yr vaginal_delivery, col
tab sexsat_12yr vaginal_delivery, col
tab sexsat_18yr vaginal_delivery, col

tab sexfreq_33mo vaginal_delivery, col
tab sexfreq_5yr vaginal_delivery, col
tab sexfreq_12yr vaginal_delivery, col
tab sexfreq_18yr vaginal_delivery, col

tab dyspareunia_11yr vaginal_delivery, col
tab pain_elsewhere_11yr vaginal_delivery, col

* Sensitivity analysis exposure groups
* Instrumental vs non-instrumental vaginal delivery 
tab sexsat_33mo instrumental_del, col
tab sexsat_5yr instrumental_del, col
tab sexsat_12yr instrumental_del, col
tab sexsat_18yr instrumental_del, col

tab sexfreq_33mo instrumental_del, col
tab sexfreq_5yr instrumental_del, col
tab sexfreq_12yr instrumental_del, col
tab sexfreq_18yr instrumental_del, col

tab dyspareunia_11yr instrumental_del, col
tab pain_elsewhere_11yr instrumental_del, col

* Emergency caesarean section vs vaginal delivery
tab sexsat_33mo emergency_vs_vaginal, col
tab sexsat_5yr emergency_vs_vaginal, col
tab sexsat_12yr emergency_vs_vaginal, col
tab sexsat_18yr emergency_vs_vaginal, col

tab sexfreq_33mo emergency_vs_vaginal, col
tab sexfreq_5yr emergency_vs_vaginal, col
tab sexfreq_12yr emergency_vs_vaginal, col
tab sexfreq_18yr emergency_vs_vaginal, col

tab dyspareunia_11yr emergency_vs_vaginal, col
tab pain_elsewhere_11yr emergency_vs_vaginal, col

* Elective caesarean section vs vaginal delivery
tab sexsat_33mo elective_vs_vaginal, col
tab sexsat_5yr elective_vs_vaginal, col
tab sexsat_12yr elective_vs_vaginal, col
tab sexsat_18yr elective_vs_vaginal, col

tab sexfreq_33mo elective_vs_vaginal, col
tab sexfreq_5yr elective_vs_vaginal, col
tab sexfreq_12yr elective_vs_vaginal, col
tab sexfreq_18yr elective_vs_vaginal, col

tab dyspareunia_11yr elective_vs_vaginal, col
tab pain_elsewhere_11yr elective_vs_vaginal, col

* Association between exposure/outcome and predictors
* 33 months
tab health_33mo sexsat_33mo, row chi
tab marital_status_33mo sexsat_33mo, row chi
tab anxiety_bin_33mo sexsat_33mo, row chi
tab depression_bin_33mo sexsat_33mo, row chi

tab health_33mo vaginal_delivery, col chi
tab marital_status_33mo vaginal_delivery, col chi
tab anxiety_bin_33mo vaginal_delivery, col chi
tab depression_bin_33mo vaginal_delivery, col chi

* 5 years
tab health_5yr sexsat_5yr, row chi
tab anxiety_5yr sexsat_5yr, row chi
tab depression_5yr sexsat_5yr, row chi

tab health_5yr vaginal_delivery, col chi
tab anxiety_5yr vaginal_delivery, col chi
tab depression_5yr vaginal_delivery, col chi

* 11 years
tab anxiety_11yr dyspareunia_11yr, row chi
tab depression_11yr dyspareunia_11yr, row chi

tab anxiety_11yr vaginal_delivery, col chi
tab depression_11yr vaginal_delivery, col chi

* 12 years
tab health_12yr sexsat_12yr, row chi
tab anxiety_12yr sexsat_12yr, row chi
tab depression_12yr sexsat_12yr, row chi

tab health_12yr vaginal_delivery, col chi
tab anxiety_12yr vaginal_delivery, col chi
tab depression_12yr vaginal_delivery, col chi

* 18 years
tab health_18yr sexsat_18yr, row chi
tab marital_status_18yr sexsat_18yr, row chi
tab anxiety_18yr sexsat_18yr, row chi
tab depression_bin_18yr sexsat_18yr, row chi

tab health_18yr vaginal_delivery, col chi
tab marital_status_18yr vaginal_delivery, col chi
tab anxiety_18yr vaginal_delivery, col chi
tab depression_bin_18yr vaginal_delivery, col chi

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

* The assumption also isn't violated for both pain variables

* The primary analysis comparing caesarean section with vaginal delivery

foreach varname of varlist sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr {
	tab `varname' vaginal_delivery if `varname' !=0
	ologit `varname' i.vaginal_delivery if `varname' !=0, or 
	ologit `varname' i.vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi if `varname' !=0, or
}

foreach varname of varlist sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr {
	tab `varname' vaginal_delivery
	ologit `varname' i.vaginal_delivery, or 
	ologit `varname' i.vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi, or
}

tab dyspareunia_11yr vaginal_delivery	
ologit dyspareunia_11yr i.vaginal_delivery, or 
ologit dyspareunia_11yr i.vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi, or
	
tab pain_elsewhere_11yr vaginal_delivery if pain_elsewhere_11yr !=0	
ologit pain_elsewhere_11yr i.vaginal_delivery if pain_elsewhere_11yr !=0, or 
ologit pain_elsewhere_11yr i.vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi if pain_elsewhere_11yr !=0, or

* Next is the stratified analysis: instrumental vs non-instrumental and emergency vs elective caesarean
* Instrumental vs non-instrumental

* Check the assumption for ologit
foreach varname of varlist sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr {
	omodel logit `varname' instrumental_del if `varname' !=0
	brant, detail
}

foreach varname of varlist sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr {
	omodel logit `varname' instrumental_del
	brant, detail
}

tab dyspareunia_11yr instrumental_del
omodel logit dyspareunia_11yr instrumental_del  	
brant, detail	
	
tab pain_elsewhere_11yr instrumental_del
omodel logit pain_elsewhere_11yr instrumental_del if pain_elsewhere_11yr !=0
brant, detail

* Assumptions not violated

foreach varname of varlist sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr {
	tab `varname' instrumental_del if `varname' !=0
	ologit `varname' i.instrumental_del if `varname' !=0, or 
	ologit `varname' i.instrumental_del matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi if `varname' !=0, or
}

foreach varname of varlist sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr {
	tab `varname' instrumental_del
	ologit `varname' i.instrumental_del, or 
	ologit `varname' i.instrumental_del matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi, or
}

tab dyspareunia_11yr instrumental_del	
ologit dyspareunia_11yr i.instrumental_del, or 
ologit dyspareunia_11yr i.instrumental_del matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi, or
	
tab pain_elsewhere_11yr instrumental_del if pain_elsewhere_11yr !=0	
ologit pain_elsewhere_11yr i.instrumental_del if pain_elsewhere_11yr !=0, or 
ologit pain_elsewhere_11yr i.instrumental_del matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi if pain_elsewhere_11yr !=0, or

* Next comparing emergency caesarean with vaginal delivery at each timepoint

foreach varname of varlist sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr {
	omodel logit `varname' emergency_vs_vaginal if `varname' !=0
	brant, detail
}

foreach varname of varlist sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr {
	omodel logit `varname' emergency_vs_vaginal
	brant, detail
}

tab dyspareunia_11yr emergency_vs_vaginal
omodel logit dyspareunia_11yr emergency_vs_vaginal  	
brant, detail	
	
tab pain_elsewhere_11yr emergency_vs_vaginal
omodel logit pain_elsewhere_11yr emergency_vs_vaginal if pain_elsewhere_11yr !=0
brant, detail

* Assumptions not violated

foreach varname of varlist sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr {
	tab `varname' emergency_vs_vaginal if `varname' !=0
	ologit `varname' i.emergency_vs_vaginal if `varname' !=0, or 
	ologit `varname' i.emergency_vs_vaginal matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi if `varname' !=0, or
}

foreach varname of varlist sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr {
	tab `varname' emergency_vs_vaginal
	ologit `varname' i.emergency_vs_vaginal, or 
	ologit `varname' i.emergency_vs_vaginal matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi, or
}

tab dyspareunia_11yr emergency_vs_vaginal	
ologit dyspareunia_11yr i.emergency_vs_vaginal, or 
ologit dyspareunia_11yr i.emergency_vs_vaginal matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi, or
	
tab pain_elsewhere_11yr emergency_vs_vaginal if pain_elsewhere_11yr !=0	
ologit pain_elsewhere_11yr i.emergency_vs_vaginal if pain_elsewhere_11yr !=0, or 
ologit pain_elsewhere_11yr i.emergency_vs_vaginal matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi if pain_elsewhere_11yr !=0, or

* Next comparing elective caesarean with vaginal delivery at each timepoint

foreach varname of varlist sexsat_33mo_4cat sexsat_5yr_4cat sexsat_12yr_4cat sexsat_18yr_4cat {
	omodel logit `varname' elective_vs_vaginal if `varname' !=0
	brant, detail
}

foreach varname of varlist sexfreq_33mo_5cat sexfreq_5yr_5cat sexfreq_12yr_5cat sexfreq_18yr_5cat {
	omodel logit `varname' elective_vs_vaginal
	brant, detail
}

tab dyspareunia_11yr elective_vs_vaginal
omodel logit dyspareunia_11yr elective_vs_vaginal  	
brant, detail	
	
tab pain_elsewhere_11yr_4cat elective_vs_vaginal
omodel logit pain_elsewhere_11yr_4cat elective_vs_vaginal if pain_elsewhere_11yr !=0
brant, detail

* Assumptions not violated

foreach varname of varlist sexsat_33mo_4cat sexsat_5yr_4cat sexsat_12yr_4cat sexsat_18yr_4cat {
	tab `varname' elective_vs_vaginal if `varname' !=0
	ologit `varname' i.elective_vs_vaginal if `varname' !=0, or 
	ologit `varname' i.elective_vs_vaginal matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi if `varname' !=0, or
}

foreach varname of varlist sexfreq_33mo_5cat sexfreq_5yr_5cat sexfreq_12yr_5cat sexfreq_18yr_5cat {
	tab `varname' elective_vs_vaginal
	ologit `varname' i.elective_vs_vaginal, or 
	ologit `varname' i.elective_vs_vaginal matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi, or
}

tab dyspareunia_11yr elective_vs_vaginal	
ologit dyspareunia_11yr i.elective_vs_vaginal, or 
ologit dyspareunia_11yr i.elective_vs_vaginal matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi, or
	
tab pain_elsewhere_11yr_4cat elective_vs_vaginal if pain_elsewhere_11yr !=0	
ologit pain_elsewhere_11yr_4cat i.elective_vs_vaginal if pain_elsewhere_11yr !=0, or 
ologit pain_elsewhere_11yr_4cat i.elective_vs_vaginal matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi if pain_elsewhere_11yr !=0, or

* Sensitvity analysis to deal with 'no sex at the moment' people
* First off compare binary variable any sex vs no sex between caesarean and vaginal delivery
foreach varname of varlist any_none_33mo any_none_5yr any_none_12yr any_none_18yr {
	tab `varname' vaginal_delivery
	logistic `varname' vaginal_delivery, or 
	logistic `varname' vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi, or
}

tab any_none_11yr vaginal_delivery 
logistic any_none_11yr i.vaginal_delivery, or 
logistic any_none_11yr i.vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi, or

* Secondly do a worst-case scenario analysis, reclassifying all 'no sex at the moment' women as not enjoying sex/experiencing a lot of pain
foreach varname of varlist worst_case_33mo worst_case_5yr worst_case_12yr worst_case_18yr {
	tab `varname' vaginal_delivery 
	ologit `varname' i.vaginal_delivery, or 
	ologit `varname' i.vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi, or
}

tab worst_case_11yr vaginal_delivery 
ologit worst_case_11yr i.vaginal_delivery, or 
ologit worst_case_11yr i.vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi, or

* With predictors in at each timepoint
* The primary analysis comparing caesarean section with vaginal delivery
* Sexual satisfaction with confounders and predictors
tab sexsat_33mo vaginal_delivery if sexsat_33mo !=0 & age_33mo !=. & health_33mo !=. & anxiety_33mo !=. & depression_33mo !=. & marital_status_33mo !=.
ologit sexsat_33mo i.vaginal_delivery if sexsat_33mo !=0 & age_33mo !=. & health_33mo !=. & anxiety_33mo !=. & depression_33mo !=. & marital_status_33mo !=., or 
	ologit sexsat_33mo i.vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi age_33mo i.health_33mo anxiety_33mo depression_33mo i.marital_status_33mo if sexsat_33mo !=0, or
	
tab sexsat_5yr vaginal_delivery if sexsat_5yr !=0 & age_5yr !=. & health_5yr !=. & anxiety_5yr !=. & depression_5yr !=.
ologit sexsat_5yr i.vaginal_delivery if sexsat_5yr !=0 & age_5yr !=. & health_5yr !=. & anxiety_5yr !=. & depression_5yr !=., or 
	ologit sexsat_5yr i.vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi age_5yr i.health_5yr anxiety_5yr depression_5yr if sexsat_5yr !=0, or
	
tab sexsat_12yr vaginal_delivery if sexsat_12yr !=0 & age_12yr !=. & health_12yr !=. & anxiety_12yr !=. & depression_12yr !=.
ologit sexsat_12yr i.vaginal_delivery if sexsat_12yr !=0 & age_12yr !=. & health_12yr !=. & anxiety_12yr !=. & depression_12yr !=., or 
	ologit sexsat_12yr i.vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi age_12yr i.health_12yr anxiety_12yr depression_12yr if sexsat_12yr !=0, or
	
tab sexsat_18yr vaginal_delivery if sexsat_18yr !=0 & age_18yr !=. & health_18yr !=. & anxiety_18yr !=. & depression_18yr !=. & marital_status_18yr !=.
ologit sexsat_18yr i.vaginal_delivery if sexsat_18yr !=0 & age_18yr !=. & health_18yr !=. & anxiety_18yr !=. & depression_18yr !=. & marital_status_18yr !=., or 
	ologit sexsat_18yr i.vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi age_18yr i.health_18yr anxiety_18yr depression_18yr i.marital_status_18yr if sexsat_18yr !=0, or

* Sexual frequency with confounders and predictors
tab sexfreq_33mo vaginal_delivery if age_33mo !=. & health_33mo !=. & anxiety_33mo !=. & depression_33mo !=. & marital_status_33mo !=.
ologit sexfreq_33mo i.vaginal_delivery if age_33mo !=. & health_33mo !=. & anxiety_33mo !=. & depression_33mo !=. & marital_status_33mo !=., or 
	ologit sexfreq_33mo i.vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi age_33mo i.health_33mo anxiety_33mo depression_33mo i.marital_status_33mo, or
	
tab sexfreq_5yr vaginal_delivery if age_5yr !=. & health_5yr !=. & anxiety_5yr !=. & depression_5yr !=.
ologit sexfreq_5yr i.vaginal_delivery if age_5yr !=. & health_5yr !=. & anxiety_5yr !=. & depression_5yr !=., or 
	ologit sexfreq_5yr i.vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi age_5yr i.health_5yr anxiety_5yr depression_5yr, or
	
tab sexfreq_12yr vaginal_delivery if age_12yr !=. & health_12yr !=. & anxiety_12yr !=. & depression_12yr !=.
ologit sexfreq_12yr i.vaginal_delivery if age_12yr !=. & health_12yr !=. & anxiety_12yr !=. & depression_12yr !=., or 
	ologit sexfreq_12yr i.vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi age_12yr i.health_12yr anxiety_12yr depression_12yr, or
	
tab sexfreq_18yr vaginal_delivery if age_18yr !=. & health_18yr !=. & anxiety_18yr !=. & depression_18yr !=. & marital_status_18yr !=.
ologit sexfreq_18yr i.vaginal_delivery if age_18yr !=. & health_18yr !=. & anxiety_18yr !=. & depression_18yr !=. & marital_status_18yr !=., or 
	ologit sexfreq_18yr i.vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi age_18yr i.health_18yr anxiety_18yr depression_18yr i.marital_status_18yr, or
	
* Sexual pain

tab dyspareunia_11yr vaginal_delivery if age_11yr !=. & anxiety_11yr !=. & depression_11yr !=.
ologit dyspareunia_11yr i.vaginal_delivery if age_11yr !=. & anxiety_11yr !=. & depression_11yr !=., or 
ologit dyspareunia_11yr i.vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi age_11yr anxiety_11yr depression_11yr, or
	
tab pain_elsewhere_11yr vaginal_delivery if pain_elsewhere_11yr !=0	& age_11yr !=. & anxiety_11yr !=. & depression_11yr !=.
ologit pain_elsewhere_11yr i.vaginal_delivery if pain_elsewhere_11yr !=0 & age_11yr !=. & anxiety_11yr !=. & depression_11yr !=., or 
ologit pain_elsewhere_11yr i.vaginal_delivery matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi age_11yr anxiety_11yr depression_11yr if pain_elsewhere_11yr !=0, or
