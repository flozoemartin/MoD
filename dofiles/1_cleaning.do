
***************************************************************************************************************************

* Mode of delivery on sexual health outcomes using ALSPAC - Data Cleaning

* Author: Flo Martin 

* Date started: 01/03/2021

* Date finished: 26/10/2021

***************************************************************************************************************************

* Contents *
* line 23 Database management *
* line 103 Cleaning variables *

***************************************************************************************************************************

* Start logging

	log using "$Logdir/log_cleaning.txt", text replace

* Load in the data
	
	use "$Rawdatadir/flo_10may22.dta", clear

* Drop twins (mum duplicated in the data)

	drop if qlet =="B"

* Labels used throughout 

	label define mod_lb 1"Spontaneous" 2"Breech" 3"Caesarean section" 4"Forceps" 5"Vacuum extraction" 6"Other"
	label define sexfreq_lb 0"Not at all" 1"< once a month" 2"1-3 times a month" 3"About once a week" 4"2-4 times a week" 5">5 times a week"
	label define sexsat_lb 0"No sex at the moment" 1"No, not at all" 2"No, not a lot" 3"Yes, somewhat" 4"Yes, very much"
	label define sexfreqvsprepreg_lb 1"Less often" 2"About as often" 3"More often"
	label define dyspareunia_11yr_lb 0"Not at all" 1"A little" 2"Moderate" 3"A lot"
	label define pain_elsewhere_11yr_lb 0"Don't have sex" 1"Never" 2"Occasionally" 3"Often" 4"Always" 
	label define bin_lb 0"No" 1"Yes"
	label define vaginal_delivery_lb 0"Vaginal delivery" 1"Caesarean section"
	label define instrumental_del_lb 0"Non-instrumental" 1"Instrumental"
	label define strat_cs_lb 0"Vaginal delivery" 1"Emergency CS" 2"Elective CS"
	label define cc_anxiety_bin_lb 0"Not anxious" 1"Anxious"
	label define epds_bin_lb 0"Not depressed" 1"Depressed"
	label define mat_ethn_bin_lb 0"White" 1"Non White"
	label define mat_degree_lb 0"A levels or lower" 1"Degree"
	label define parity_lb 0"Nulliparous" 1"Multiparous"
	label define age_cat_lb 0"Under 25" 1"25 and over"
	label define bmi_cat_lb 0"Underweight" 1"Normal" 2"Overweight" 3"Obese"
	label define any_none_lb 0"No sex at the moment" 1"Having sex"
	label define worst_case_lb 1"No, not at all" 2"No, not a lot" 3"Yes, somewhat" 4"Yes, very much"
	
* Change variable names

	rename mz028b matage_delivery
	rename a525 marital_status
	rename b032 parity_18wkgest
	rename b351 cc_anxiety_18wkgest
	rename b370 epds_18wkgest
	rename c050 general_health
	rename c645a mat_edu
	rename c802 mat_ethn
	rename dw002 mat_wt
	rename dw021 mat_ht
	rename dw042 mat_bmi
	rename h090 h_prev_miss		// Previous question to sex qu's for missing data justification (H)
	rename h095 sexfreq_33mo
	rename h096 sexsat_33mo
	rename h187a anxiety_33mo
	rename h200a depression_33mo
	rename h280 h_rand_miss		// Random question later in questionnaire (H)
	rename k1180 k_prev_miss
	rename k1190 sexfreq_5yr	// Previous question to sex qu's for missing data justification (K)
	rename k1191 sexsat_5yr
	rename k5070 k_rand_miss	// Random question later in questionnaire (K)
	rename v1dac6_method_delivery mod
	rename v1dab6k_diabetes diabetes
	rename DEL_P1212 caesarean
	rename r2170 r_prev_miss 	// Previous question to sex qu's for missing data justification (R)
	rename r2191 dyspareunia_11yr
	rename r2192 pain_elsewhere_11yr
	rename r6010 r_rand_miss	// Random question later in questionnaire (R)
	rename s1210 s_prev_miss	// Previous question to sex qu's for missing data justification (S)
	rename s1230 sexfreq_12yr
	rename s1231 sexsat_12yr 
	rename s6009 s_rand_miss	// Random question later in questionnaire (S)
	rename t4003 t_prev_miss	// Previous question to sex qu's for missing data justification (T)
	rename t4500 sexfreq_18yr
	rename t4501 sexsat_18yr
	rename t5390 t_rand_miss	// Random question later in questionnaire (T)

* Where some variables have missing = .a | .b replace with .
	
	foreach varname of varlist mod matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest mat_edu mat_bmi mat_ht mat_wt sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr dyspareunia_11yr pain_elsewhere_11yr b924 h001 h_prev_miss h_rand_miss k0007a k_prev_miss k_rand_miss r0007a r_prev_miss r_rand_miss s0007a s_prev_miss s_rand_miss t0007a t_prev_miss t_rand_miss diabetes general_health {
	
	replace `varname' =. if `varname' == .a | `varname' == .b
	
	}
	
***************************************************************************************************************************

* Cleaning variables

* Returned the questionnaire prenatal

	tab b924, nolabel
	gen b001 = 1 if b924 !=.
	replace b001 = 0 if b924 ==.
	label values b001 bin_lb
	label variable b001"Questionnaire returned prenatal"
	tab b001

* 33 months

* Returned the questionnaire

	tab h001, nolabel
	replace h001 = 1 if h001 >0 & h001 !=.
	replace h001 = 0 if h001 ==.
	label values h001 bin_lb
	label variable h001"Questionnaire returned 33 months"
	tab h001

* Recode -1 to . for missing data questions
	
	tab h_prev_miss, nolabel
	replace h_prev_miss =. if h_prev_miss ==-1
	tab h_prev_miss
	
	tab h_rand_miss, nolabel
	replace h_rand_miss =. if h_rand_miss ==-1
	tab h_rand_miss

* 5 years
	
* Returned the questionnaire

	tab k0007a, nolabel
	replace k0007a = 0 if k0007a ==2 | k0007a ==.
	label values k0007a bin_lb
	label variable k0007a"Questionnaire returned 5 years"
	tab k0007a
	
* Recode -1 to . for missing data questions	

	tab k_prev_miss, nolabel
	replace k_prev_miss =. if k_prev_miss ==-10 | k_prev_miss ==-1
	tab k_prev_miss
	
	tab k_rand_miss, nolabel
	replace k_rand_miss =. if k_rand_miss ==-10 | k_rand_miss ==-9 | k_rand_miss ==-1
	tab k_rand_miss
	
* 11 years
	
* Returned the questionnaire 

	tab r0007a, nolabel
	replace r0007a = 0 if r0007a ==2 | r0007a ==.
	label values r0007a bin_lb
	label variable r0007a"Questionnaire returned 11 years"
	tab r0007a
	
* Recode -1 to . for missing data questions	

	tab r_prev_miss, nolabel
	replace r_prev_miss =. if r_prev_miss ==-10 | r_prev_miss ==-1
	tab r_prev_miss
	
	tab r_rand_miss, nolabel
	replace r_rand_miss =. if r_rand_miss ==-10 | r_rand_miss ==-1
	tab r_rand_miss	
	
* 12 years
	
* Returned the questionnaire 

	tab s0007a, nolabel
	replace s0007a = 0 if s0007a ==2 | s0007a ==.
	label values s0007a bin_lb
	label variable s0007a"Questionnaire returned 12 years"
	tab s0007a
	
* Recode -1 to . for missing data questions	

	tab s_prev_miss, nolabel
	replace s_prev_miss =. if s_prev_miss ==-10 | s_prev_miss ==-1
	tab s_prev_miss
	
	tab s_rand_miss, nolabel
	replace s_rand_miss =. if s_rand_miss ==-10| s_rand_miss ==-1
	tab s_rand_miss	

* 18 years	
	
* Returned the questionnaire

	tab t0007a, nolabel
	replace t0007a = 0 if t0007a ==2 | t0007a ==.
	label values t0007a bin_lb
	label variable t0007a"Questionnaire returned 18 years"
	tab t0007a

* Recode -1 to . for missing data questions	

	tab t_prev_miss, nolabel
	replace t_prev_miss =. if t_prev_miss ==-10 | t_prev_miss ==-1
	tab t_prev_miss
	
	tab t_rand_miss, nolabel
	replace t_rand_miss =. if t_rand_miss ==-10 | t_rand_miss ==-1
	tab t_rand_miss	
	
* Clean & generate variables for the analysis

* Maternal age at delivery
	
	tab matage_delivery
	tab matage_delivery, nolabel
	recode matage_delivery (-10=.) (-4=.) (-2=.)
	gen age_cat =.
	replace age_cat = 0 if matage_delivery <25
	replace age_cat = 1 if matage_delivery >=25
	label values age_cat age_cat_lb
	tab age_cat

* Marital status

	tab marital_status, nolabel
	recode marital_status (-1=.)

* Parity at 18 weeks gestation 
	
	tab parity_18wkgest
	tab parity_18wkgest, nolabel
	recode parity_18wkgest (-7=.) (-2=.) (-1=.)

* Dichotomising parity at 18 weeks gestation

	tab parity_18wkgest
	gen parity_bin =.
	replace parity_bin = 0 if parity_18wkgest ==0
	replace parity_bin = 1 if parity_18wkgest >0 & parity_18wkgest !=.
	label values parity_bin parity_lb
	tab parity_bin
	
* Missing in parity

	gen parity_cc = 1 if parity_bin !=.
	replace parity_cc = 0 if parity_bin ==.
	label values parity_cc bin_lb 
	tab parity_cc
	
* Crown Crisp score for anxiety at 18 weeks gestation

	tab cc_anxiety_18wkgest
	tab cc_anxiety_18wkgest, nolabel
	recode cc_anxiety_18wkgest (-7=.) (-1=.)

* Categorising Crown Crisp anxiety score at 18 weeks gestation
	
	tab cc_anxiety_18wkgest
	generate cc_anxiety_bin = 0 if cc_anxiety_18wkgest >=0 & cc_anxiety_18wkgest <9
	replace cc_anxiety_bin = 1 if cc_anxiety_18wkgest >=9 & cc_anxiety_18wkgest !=.
	list cc_anxiety_18wkgest cc_anxiety_bin in 1/10, nolabel
	tab cc_anxiety_bin
	label values cc_anxiety_bin cc_anxiety_bin_lb
	tab cc_anxiety_bin
	label variable cc_anxiety_bin"Crown Crisp anxiety score at 18 weeks gestation"
	
* Missing in anxiety

	gen anxiety_cc = 1 if cc_anxiety_bin !=.
	replace anxiety_cc = 0 if cc_anxiety_bin ==.
	label values anxiety_cc bin_lb 
	tab anxiety_cc

* Edinburgh Post-Natal Depression Score at 18 weeks gestation

	tab epds_18wkgest
	tab epds_18wkgest, nolabel
	recode epds_18wkgest (-7=.) (-1=.)

* Dichotomising Edinburgh post-natal depression score at 18 weeks gestation

	tab epds_18wkgest
	generate epds_bin = 0 if epds_18wkgest >=0 & epds_18wkgest <13
	replace epds_bin = 1 if epds_18wkgest >=13 & epds_18wkgest !=.
	list epds_18wkgest epds_bin in 1/10, nolabel
	tab epds_bin
	label values epds_bin epds_bin_lb
	tab epds_bin
	label variable epds_bin"Edinburgh post-natal depression score at 18 weeks gestation"
	
* Missing in depression

	gen epds_cc = 1 if epds_bin !=.
	replace epds_cc = 0 if epds_bin ==.
	label values epds_cc bin_lb 
	tab epds_cc

* Highest achieved education qualification for mum as reported at the 32 week gestation questionnaire (leaving the coding as is)

	tab mat_edu
	tab mat_edu, nolabel
	recode mat_edu (-1=.)

* Dichotomising maternal education

	tab mat_edu, nolabel
	gen mat_degree =.
	replace mat_degree = 1 if mat_edu ==5
	replace mat_degree = 0 if mat_edu <5 & mat_edu !=.
	label values mat_degree mat_degree_lb
	tab mat_degree
	
* Missing in maternal education

	gen mat_edu_cc = 1 if mat_degree !=.
	replace mat_edu_cc = 0 if mat_degree ==.
	label values mat_edu_cc bin_lb 
	tab mat_edu_cc

* Maternal ethnicity (leaving coding as is)

	tab mat_ethn
	tab mat_ethn, nolabel
	recode mat_ethn (-1=.)

* Dichotomising maternal ethnicity 

	tab mat_ethn
	tab mat_ethn, nolabel
	generate mat_ethn_bin = 0 if mat_ethn ==1
	replace mat_ethn_bin = 1 if mat_ethn ==2 | mat_ethn ==3 | mat_ethn ==4 | mat_ethn ==5 | mat_ethn ==6 | mat_ethn ==7 | mat_ethn ==8 | mat_ethn ==9
	tab mat_ethn_bin
	label values mat_ethn_bin mat_ethn_bin_lb
	tab mat_ethn_bin
	label variable mat_ethn_bin"Maternal ethnicity"

* Maternal BMI (need to generate a BMI category variable)

	tab mat_bmi
	tab mat_bmi, nolabel
	recode mat_bmi (-3=.)
	gen bmi_cat =.
	replace bmi_cat = 0 if mat_bmi <18.5
	replace bmi_cat = 1 if mat_bmi >=18.5 & mat_bmi <25
	replace bmi_cat = 2 if mat_bmi >=25 & mat_bmi <30
	replace bmi_cat = 3 if mat_bmi >=30 & mat_bmi !=.
	label values bmi_cat bmi_cat_lb
	tab bmi_cat 
	
* Missing in bmi

	gen bmi_cc = 1 if mat_bmi !=.
	replace bmi_cc = 0 if mat_bmi ==.
	label values bmi_cc bin_lb 
	tab bmi_cc
	
* Maternal diabetes

	tab diabetes, nolabel
	recode diabetes 2=0 
	label values diabetes bin_lb
	tab diabetes
	
* Missing diabetes

	gen diabetes_cc = 1 if diabetes !=.
	replace diabetes_cc = 0 if diabetes ==.
	label values diabetes_cc bin_lb
	tab diabetes_cc

* Frequency of sex at 33 months postpartum coded similarly to 21 months

	tab sexfreq_33mo
	tab sexfreq_33mo, nolabel
	recode sexfreq_33mo (-1=.) (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
	label values sexfreq_33mo sexfreq_lb
	tab sexfreq_33mo

* Sexual satisfaction "do you enjoy sex?" at 33 months postpartum coded as increasing enjoyment conferred by increasing numbers and that "no sex now" conferred by zero

	tab sexsat_33mo
	tab sexsat_33mo, nolabel
	recode sexsat_33mo (-1=.) (1=4) (2=3) (3=2) (4=1) (5=0)
	label values sexsat_33mo sexsat_lb
	tab sexsat_33mo
	
	gen nsatm_33mo = 0 if sexsat_33mo !=0 & sexsat_33mo !=.
	replace nsatm_33mo = 1 if sexsat_33mo ==0
	tab nsatm_33mo

* Sexual frequency at 5 years 1 month postpartum - coding consistent with other time points

	tab sexfreq_5yr
	tab sexfreq_5yr, nolabel
	recode sexfreq_5yr (-10=.) (-1=.) (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
	label values sexfreq_5yr sexfreq_lb
	tab sexfreq_5yr

* Sexual satisfaction at 5 years 1 month postpartum - coding consistent with other time points

	tab sexsat_5yr
	tab sexsat_5yr, nolabel
	recode sexsat_5yr (-10=.) (-1=.) (1=4) (2=3) (3=2) (4=1) (5=0)
	label values sexsat_5yr sexsat_lb
	tab sexsat_5yr
	
	gen nsatm_5yr = 0 if sexsat_5yr !=0 & sexsat_5yr !=.
	replace nsatm_5yr = 1 if sexsat_5yr ==0
	tab nsatm_5yr

* Mum has ever had pain or soreness in the vagina during intercourse at 11 years 1 month- recoded so that "not at all" is represented by a 0

	tab dyspareunia_11yr
	tab dyspareunia_11yr, nolabel
	recode dyspareunia_11yr (-10=.) (-1=.) (1=0) (2=1) (3=2) (4=3)
	label values dyspareunia_11yr dyspareunia_11yr_lb
	tab dyspareunia_11yr

* Frequency mum experiences pain elsewhere after intercourse - leave recoding this for now as a couple of options could be fairly represented by a zero

	tab pain_elsewhere_11yr
	tab pain_elsewhere_11yr, nolabel
	recode pain_elsewhere_11yr (-10=.) (-1=.) (0=.) (1=1) (2=2) (3=3) (4=4) (5=0)
	label values pain_elsewhere_11yr pain_elsewhere_11yr_lb
	tab pain_elsewhere_11yr
	
	gen nsatm_11yr = 0 if pain_elsewhere_11yr !=0 & pain_elsewhere_11yr !=.
	replace nsatm_11yr = 1 if pain_elsewhere_11yr ==0
	tab nsatm_11yr

* Frequency of sex at 12 years 1 months postpartum - coding consistent with other time points

	tab sexfreq_12yr
	tab sexfreq_12yr, nolabel
	recode sexfreq_12yr (-10=.) (-1=.) (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
	label values sexfreq_12yr sexfreq_lb
	tab sexfreq_12yr

* Sexual satisfaction at 12 years 1 month - coding consistent with other time points

	tab sexsat_12yr
	tab sexsat_12yr, nolabel
	recode sexsat_12yr (-10=.) (-1=.) (1=4) (2=3) (3=2) (4=1) (5=0)
	label values sexsat_12yr sexsat_lb
	tab sexsat_12yr
	
	gen nsatm_12yr = 0 if sexsat_12yr !=0 & sexsat_12yr !=.
	replace nsatm_12yr = 1 if sexsat_12yr ==0
	tab nsatm_12yr

* Frequency of sex at 18 years postpartum - coding consistent with other time points

	tab sexfreq_18yr
	tab sexfreq_18yr, nolabel
	recode sexfreq_18yr (-10=.) (-1=.) (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
	label values sexfreq_18yr sexfreq_lb
	tab sexfreq_18yr

* Sexual satisfaction at 18 years - coding consistent with other time points

	tab sexsat_18yr
	tab sexsat_18yr, nolabel
	recode sexsat_18yr (-10=.) (-1=.) (1=4) (2=3) (3=2) (4=1) (5=0)
	label values sexsat_18yr sexsat_lb
	tab sexsat_18yr 

	gen nsatm_18yr = 0 if sexsat_18yr !=0 & sexsat_18yr !=.
	replace nsatm_18yr = 1 if sexsat_18yr ==0
	tab nsatm_18yr

* Mode of delivery - exposure
* For the mode of delivery variable I am going to make sure that I have as many women correctly categorised as possible

	tab mod 
	tab caesarean, nolabel
	recode caesarean (-10=.) (-1=.)
	generate caesarean_bin = 1 if caesarean ==1 | caesarean ==2
	replace caesarean_bin = 0 if caesarean ==3
	label values caesarean_bin bin_lb
	tab mod caesarean_bin 

* Now I have added the women who are coded in mod as other but caesarean as emergency CS to the CS group in mod - now the groups I have aren't "contaminated" with multiple methods of birth

	tab mod caesarean 
	recode mod (6 = 3) if mod ==6 & caesarean ==2 
	tab mod caesarean 

* Now I need to look at the distribution of complete case women at each timepoint for each outcome stratified by each exposure comparison (VD vs CS, non-ins vs ins, elective vs emergency)

	tab mod, nolabel
	replace mod = 2 if mod ==1
	replace mod = 1 if mod ==0
	label values mod mod_lb
	tab mod

* Binary variable vaginal delivery vs caesarean section

	generate vaginal_delivery = 0 if mod !=3  
	replace vaginal_delivery = 1 if mod ==3
	replace vaginal_delivery =. if mod ==.
	list mod vaginal_delivery in 1/100
	tab vaginal_delivery 
	label values vaginal_delivery vaginal_delivery_lb
	tab vaginal_delivery
	label variable vaginal_delivery"Vaginal delivery (0) vs caesarean section (1)"

* Instrumental vs non-instrumental delivery

	gen instrumental_del =.
	replace instrumental_del = 0 if mod ==1 | mod ==2
	replace instrumental_del = 1 if mod ==4 | mod ==5
	label values instrumental_del instrumental_del_lb
	label variable instrumental_del"Non-instrumental (0) vs instrumental delivery (1)"
	tab instrumental_del

* Three level categorical variable: vaginal delivery (0) vs emergency caesarean (1) vs elective caesarean (2)

	tab caesarean, nolabel
	generate strat_cs = 1 if caesarean == 2
	replace strat_cs = 2 if caesarean == 1
	replace strat_cs = 0 if vaginal_delivery ==0
	label values strat_cs strat_cs_lb
	tab strat_cs
	label variable strat_cs"Vaginal delivery (0) vs emergency (1) vs elective (2)"

* Given that caesarean_bin gets very small, leaving some categories empty I can pool some of the categories allowing us to do some analysis

* Recode the frequency variable to pool top two categories at each timepoint so the elective CS isn't empty at the top of the scale => separate categories "2-4 times a week" and ">5 times a week" become one category ">= 2 times a week"

	generate sexfreq_33mo_5cat = 0 if sexfreq_33mo == 0
	replace sexfreq_33mo_5cat = 1 if sexfreq_33mo == 1
	replace sexfreq_33mo_5cat = 2 if sexfreq_33mo == 2
	replace sexfreq_33mo_5cat = 3 if sexfreq_33mo == 3
	replace sexfreq_33mo_5cat = 4 if sexfreq_33mo == 4 | sexfreq_33mo == 5

	generate sexfreq_5yr_5cat = 0 if sexfreq_5yr == 0
	replace sexfreq_5yr_5cat = 1 if sexfreq_5yr == 1
	replace sexfreq_5yr_5cat = 2 if sexfreq_5yr == 2
	replace sexfreq_5yr_5cat = 3 if sexfreq_5yr == 3
	replace sexfreq_5yr_5cat = 4 if sexfreq_5yr == 4 | sexfreq_5yr == 5
	
	generate sexfreq_12yr_5cat = 0 if sexfreq_12yr == 0
	replace sexfreq_12yr_5cat = 1 if sexfreq_12yr == 1
	replace sexfreq_12yr_5cat = 2 if sexfreq_12yr == 2
	replace sexfreq_12yr_5cat = 3 if sexfreq_12yr == 3
	replace sexfreq_12yr_5cat = 4 if sexfreq_12yr == 4 | sexfreq_12yr == 5
	
	generate sexfreq_18yr_5cat = 0 if sexfreq_18yr == 0
	replace sexfreq_18yr_5cat = 1 if sexfreq_18yr == 1
	replace sexfreq_18yr_5cat = 2 if sexfreq_18yr == 2
	replace sexfreq_18yr_5cat = 3 if sexfreq_18yr == 3
	replace sexfreq_18yr_5cat = 4 if sexfreq_18yr == 4 | sexfreq_18yr == 5
	
* Similarly for enjoyment I am creating a 4-level variable in which I am pooling "Not at all" and "Not a lot"

	generate sexsat_33mo_4cat = 0 if sexsat_33mo ==0
	replace sexsat_33mo_4cat = 1 if sexsat_33mo ==1 | sexsat_33mo ==2
	replace sexsat_33mo_4cat = 2 if sexsat_33mo ==3
	replace sexsat_33mo_4cat = 3 if sexsat_33mo ==4
	tab sexsat_33mo sexsat_33mo_4cat
	
	generate sexsat_5yr_4cat = 0 if sexsat_5yr ==0
	replace sexsat_5yr_4cat = 1 if sexsat_5yr ==1 | sexsat_33mo ==2
	replace sexsat_5yr_4cat = 2 if sexsat_5yr ==3
	replace sexsat_5yr_4cat = 3 if sexsat_5yr ==4
		
	generate sexsat_12yr_4cat = 0 if sexsat_12yr ==0
	replace sexsat_12yr_4cat = 1 if sexsat_12yr ==1 | sexsat_33mo ==2
	replace sexsat_12yr_4cat = 2 if sexsat_12yr ==3
	replace sexsat_12yr_4cat = 3 if sexsat_12yr ==4

	generate sexsat_18yr_4cat = 0 if sexsat_18yr ==0
	replace sexsat_18yr_4cat = 1 if sexsat_18yr ==1 | sexsat_33mo ==2
	replace sexsat_18yr_4cat = 2 if sexsat_18yr ==3
	replace sexsat_18yr_4cat = 3 if sexsat_18yr ==4

* Pain elsewhere after sex at 11 years is also problematic - highest two pain categories pooled
	
	tab pain_elsewhere_11yr caesarean_bin

	generate pain_elsewhere_11yr_4cat = 0 if pain_elsewhere_11yr ==0
	replace pain_elsewhere_11yr_4cat = 1 if pain_elsewhere_11yr ==1
	replace pain_elsewhere_11yr_4cat = 2 if pain_elsewhere_11yr ==2
	replace pain_elsewhere_11yr_4cat = 3 if pain_elsewhere_11yr ==3 | pain_elsewhere_11yr ==4
	tab pain_elsewhere_11yr pain_elsewhere_11yr_4cat

* Sensitivity analysis variables - for dealing with 'no sex at the moment' women, we can approach this is two ways:
* Binary - any sex vs no sex at each timepoint
 
* Sexual enjoyment
	
	tab sexsat_33mo, nolabel
	gen any_none_33mo =.
	replace any_none_33mo = 0 if sexsat_33mo ==0
	replace any_none_33mo = 1 if sexsat_33mo >0 & sexsat_33mo <=4
	label values any_none_33mo any_none_lb
	tab any_none_33mo

	tab sexsat_5yr, nolabel
	gen any_none_5yr =.
	replace any_none_5yr = 0 if sexsat_5yr ==0
	replace any_none_5yr = 1 if sexsat_5yr >0 & sexsat_5yr <=4
	label values any_none_5yr any_none_lb
	tab any_none_5yr

	tab sexsat_12yr, nolabel
	gen any_none_12yr =.
	replace any_none_12yr = 0 if sexsat_12yr ==0
	replace any_none_12yr = 1 if sexsat_12yr >0 & sexsat_12yr <=4
	label values any_none_12yr any_none_lb
	tab any_none_12yr

	tab sexsat_18yr, nolabel
	gen any_none_18yr =.
	replace any_none_18yr = 0 if sexsat_18yr ==0
	replace any_none_18yr = 1 if sexsat_18yr >0 & sexsat_18yr <=4
	label values any_none_18yr any_none_lb
	tab any_none_18yr

* Sexual pain elsewhere
	
	tab pain_elsewhere_11yr
	gen any_none_11yr =.
	replace any_none_11yr = 0 if pain_elsewhere_11yr ==0
	replace any_none_11yr = 1 if pain_elsewhere_11yr >0 & pain_elsewhere_11yr <=4
	label values any_none_11yr any_none_lb
	tab any_none_11yr

* Worst-case scenario - 'no sex at the moment' recoded as 'no satisfaction' or 'always pain'

* Sexual enjoyment

	tab sexsat_33mo
	gen worst_case_33mo =.
	replace worst_case_33mo = 1 if sexsat_33mo ==1 | sexsat_33mo ==0
	replace worst_case_33mo = 2 if sexsat_33mo ==2
	replace worst_case_33mo = 3 if sexsat_33mo ==3
	replace worst_case_33mo = 4 if sexsat_33mo ==4
	label values worst_case_33mo worst_case_lb
	tab worst_case_33mo

	tab sexsat_5yr, nolabel
	gen worst_case_5yr =.
	replace worst_case_5yr = 1 if sexsat_5yr ==1 | sexsat_5yr ==0
	replace worst_case_5yr = 2 if sexsat_5yr ==2
	replace worst_case_5yr = 3 if sexsat_5yr ==3
	replace worst_case_5yr = 4 if sexsat_5yr ==4
	label values worst_case_5yr worst_case_lb
	tab worst_case_5yr

	tab sexsat_12yr, nolabel
	gen worst_case_12yr =.
	replace worst_case_12yr = 1 if sexsat_12yr ==1 | sexsat_12yr ==0
	replace worst_case_12yr = 2 if sexsat_12yr ==2
	replace worst_case_12yr = 3 if sexsat_12yr ==3
	replace worst_case_12yr = 4 if sexsat_12yr ==4
	label values worst_case_12yr worst_case_lb
	tab worst_case_12yr

	tab sexsat_18yr, nolabel
	gen worst_case_18yr =.
	replace worst_case_18yr = 1 if sexsat_18yr ==1 | sexsat_18yr ==0
	replace worst_case_18yr = 2 if sexsat_18yr ==2
	replace worst_case_18yr = 3 if sexsat_18yr ==3
	replace worst_case_18yr = 4 if sexsat_18yr ==4
	label values worst_case_18yr worst_case_lb
	tab worst_case_18yr

* Sexual pain elsewhere

	tab pain_elsewhere_11yr
	gen worst_case_11yr =.
	replace worst_case_11yr = 1 if pain_elsewhere_11yr ==1 
	replace worst_case_11yr = 2 if pain_elsewhere_11yr ==2
	replace worst_case_11yr = 3 if pain_elsewhere_11yr ==3
	replace worst_case_11yr = 4 if pain_elsewhere_11yr ==4 | pain_elsewhere_11yr ==0
	label values worst_case_11yr worst_case_lb
	tab worst_case_11yr
	
* General health sensitivity

	tab general_health, m nolabel
	recode general_health -7=. -1=. .a=.
	tab general_health, m
	recode general_health 1=5 2=4 4=2 5=1
	label define general_health_lb 1"Always unwell" 2"Often unwell" 3"Sometimes unwell" 4"Usually well" 5"Always well"
	label values general_health general_health_lb
	tab general_health, m

* Complete case variable

	gen cc =.	
	replace cc = 0 if matage_delivery ==. | mat_bmi ==. | cc_anxiety_18wkgest ==. | epds_18wkgest ==. | parity_18wkgest ==. | mat_edu ==. | diabetes ==.
	replace cc = 1 if matage_delivery !=. & mat_bmi !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & parity_18wkgest !=. & mat_edu !=. & diabetes !=.
	tab cc

* Save complete clean dataset n=15,442

	save "$Datadir/flo_dataset.dta", replace
	
***************************************************************************************************************************

* There are two women who have been coded as breech extraction and CS so I want to remove them as well as two women coded as forceps & caesarean

	drop if caesarean_bin ==1 & mod ==2
	drop if caesarean_bin ==1 & mod ==4
	tab mod caesarean_bin

	drop if mod ==6 | mod ==.
	
	replace sexsat_33mo =. if nsatm_33mo ==1 
	replace sexsat_5yr =. if nsatm_5yr ==1 
	replace pain_elsewhere_11yr =. if nsatm_11yr ==1
	replace sexsat_12yr =. if nsatm_12yr ==1
	replace sexsat_18yr =. if nsatm_18yr ==1

* Save clean dataset including those with complete exposure data n=13,299

	save "$Datadir/mi_dataset.dta", replace
	
***************************************************************************************************************************

* Drop incomplete covariates for complete case analysis

	drop if matage_delivery ==. | mat_bmi ==. | cc_anxiety_18wkgest ==. | epds_18wkgest ==. | parity_18wkgest ==. | mat_edu ==. | diabetes ==.

* Save clean dataset including those with complete exposure & covariate data n=9,231

	save "$Datadir/flo_dataset_cc.dta", replace

***************************************************************************************************************************
	
* Stop logging

	log close
	
***************************************************************************************************************************
