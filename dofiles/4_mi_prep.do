
*	Mode of delivery on sexual health outcomes using ALSPAC - Multiple Imputation

*	Author:			Florence Martin (Epidemiology, MSc)

*	Date started:	29/09/2021
* 	Date finished:	

* Start logging
log using "$Logdir/log_mi_prep.txt", text replace

* Load in the dataset containing participants with complete exposure data
cd "$Projectdir/datafiles"
use mi_dataset.dta, clear

* Check numbers 
count // n=13,299 complete cases for exposure

* Generate a variable for those with at least one outcome response
generate mi_cohort = 1 if sexsat_33mo !=. | sexsat_5yr !=. | sexsat_12yr !=. | sexsat_18yr !=. | sexfreq_33mo !=. | sexfreq_5yr !=. | sexfreq_12yr !=. | sexfreq_18yr !=. | dyspareunia_11yr !=. | pain_elsewhere_11yr !=.

tab mi_cohort // n=10,327 participants with at least one outcome response

* Worst case scenario for those who responded to each questionnaire but did not respond to each individual outcome

* Sexual enjoyment
* 33 months
tab sexsat_33mo if h001 ==1 & mi_cohort ==1, m nolabel
replace sexsat_33mo = 1 if sexsat_33mo ==. & h001 ==1
tab sexsat_33mo if h001 ==1 & mi_cohort ==1, m nolabel

* 5 years
tab sexsat_5yr if k0007a ==1 & mi_cohort ==1, m nolabel
replace sexsat_5yr = 1 if sexsat_5yr ==. & k0007a ==1
tab sexsat_5yr if k0007a ==1 & mi_cohort ==1, m nolabel

* 12 years
tab sexsat_12yr if s0007a ==1 & mi_cohort ==1, m nolabel
replace sexsat_12yr = 1 if sexsat_12yr ==. & s0007a ==1
tab sexsat_12yr if s0007a ==1 & mi_cohort ==1, m nolabel

* 18 years
tab sexsat_18yr if t0007a ==1 & mi_cohort ==1, m nolabel
replace sexsat_18yr = 1 if sexsat_18yr ==. & t0007a ==1
tab sexsat_18yr if t0007a ==1 & mi_cohort ==1, m nolabel

* Sexual frequency
* 33 months
tab sexfreq_33mo if h001 ==1 & mi_cohort ==1, m nolabel
replace sexfreq_33mo = 0 if sexfreq_33mo ==. & h001 ==1
tab sexfreq_33mo if h001 ==1 & mi_cohort ==1, m nolabel

* 5 years
tab sexfreq_5yr if k0007a ==1 & mi_cohort ==1, m nolabel
replace sexfreq_5yr = 0 if sexfreq_5yr ==. & k0007a ==1
tab sexfreq_5yr if k0007a ==1 & mi_cohort ==1, m nolabel

* 12 years
tab sexfreq_12yr if s0007a ==1 & mi_cohort ==1, m nolabel
replace sexfreq_12yr = 0 if sexfreq_12yr ==. & s0007a ==1
tab sexfreq_12yr if s0007a ==1 & mi_cohort ==1, m nolabel

* 18 years
tab sexfreq_18yr if t0007a ==1 & mi_cohort ==1, m nolabel
replace sexfreq_18yr = 0 if sexfreq_18yr ==. & t0007a ==1
tab sexfreq_18yr if t0007a ==1 & mi_cohort ==1, m nolabel

* Pain in the vagina during sex
* 11 years
tab dyspareunia_11yr if r0007a ==1 & mi_cohort ==1, m nolabel
replace dyspareunia_11yr = 3 if dyspareunia_11yr ==. & r0007a ==1
tab dyspareunia_11yr if r0007a ==1 & mi_cohort ==1, m nolabel

* Pain elsewhere after sex
* 11 years
tab pain_elsewhere_11yr if r0007a ==1 & mi_cohort ==1, m nolabel
replace pain_elsewhere_11yr = 4 if pain_elsewhere_11yr ==. & r0007a ==1
tab pain_elsewhere_11yr if r0007a ==1 & mi_cohort ==1, m nolabel

* Covariates included in the substantive model: maternal age, maternal pre-pregnancy BMI, maternal education, parity, anxiety & depression

* Age complete so no need to impute 
* BMI auxiliary gestational weight gain
* Maternal education auxiliary marital status & occupational status
* Parity only 7% missing so no need to impute
* Anxiety auxiliary anxiety at 33 months
* Depression auxiliary depression at 33 months

* BMI auxiliaries
tab marital_status // clean

rename c755 mat_occu
tab mat_occu, nolabel
replace mat_occu =. if mat_occu ==-1

* Anxiety
tab anxiety_33mo // clean

* Depression 
tab depression_33mo // clean

* Stop logging
log close


