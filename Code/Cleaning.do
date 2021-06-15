*	Mode of delivery on sexual health outcomes using ALSPAC - Data Cleaning

*	Author:			Florence Martin (Epidemiology, MSc)

*	Date started:	01/03/2021

* Contents *
* line 14 Database management *
* line 89 Covariates *
* line 148 Outcomes *
* line 247 Exposure *
* line 361 Sensitivity analysis variables *

cd "/Users/ti19522/OneDrive - University of Bristol/Documents/PhD/Year 1/ALSPAC MoD Study/Data"
use flo_22mar21.dta, clear

drop if qlet =="B"

* Labels
label define sexfreq_lb 0"Not at all" 1"< once a month" 2"1-3 times a month" 3"About once a week" 4"2-4 times a week" 5">5 times a week"
label define sexsat_lb 0"No sex at the moment" 1"No, not at all" 2"No, not a lot" 3"Yes, somewhat" 4"Yes, very much"
label define sexfreqvsprepreg_lb 1"Less often" 2"About as often" 3"More often"
label define dyspareunia_11yr_lb 0"Not at all" 1"A little" 2"Moderate" 3"A lot"
label define pain_elsewhere_11yr_lb 0"Don't have sex" 1"Never" 2"Occasionally" 3"Often" 4"Always" 
label define bin_lb 0"No" 1"Yes"
label define vaginal_delivery_lb 0"Vaginal delivery" 1"Caesarean section"
label define instrumental_del_lb 0"Non-instrumental" 1"Instrumental"
label define emergency_cs_lb 1"Emergency CS" 0"Elective CS"
label define elective_vs_vaginal_lb 0"Vaginal delivery" 1"Elective caesarean"
label define emergency_vs_vaginal_lb 0"Vaginal delivery" 1"Emergency caesarean"
label define cc_anxiety_bin_lb 0"Not anxious" 1"Anxious"
label define epds_bin_lb 0"Not depressed" 1"Depressed"
label define mat_ethn_bin_lb 0"White" 1"Non White"
label define mat_degree_lb 0"A levels or lower" 1"Degree"
label define parity_lb 0"Nulliparous" 1"Multiparous"
label define age_cat_lb 0"Under 25" 1"25 and over"
label define bmi_cat_lb 0"Underweight" 1"Normal" 2"Overweight" 3"Obese"

* Firstly, I need to change all the variable names to something that is more
* recognisable for the analysis

rename mz028b matage_delivery
rename a525 marital_status
rename b032 parity_18wkgest
rename b351 cc_anxiety_18wkgest
rename b370 epds_18wkgest
rename c645a mat_edu
rename c800 ethnic_group
rename c802 mat_ethn
rename dw042 mat_bmi
rename g131 sexfreqvsprepreg_21mo
rename h095 sexfreq_33mo
rename h096 sexsat_33mo
rename h187a anxiety_33mo
rename h200a depression_33mo
rename h992 age_33mo
rename h386 marital_status_33mo
rename h010 health_33mo
rename k1190 sexfreq_5yr
rename k1191 sexsat_5yr
rename k1010 anxiety_5yr
rename k1011 depression_5yr
rename k9996a age_5yr
rename k1000 health_5yr
rename v1dac6_method_delivery mod
rename DEL_P1410 epis
rename DEL_P1412 tear
rename DEL_P1473 tearepis_infection
rename DEL_P1212 caesarean
rename r2191 dyspareunia_11yr
rename r2192 pain_elsewhere_11yr
rename r2160 depression_11yr
rename r4013 anxiety_11yr
rename r9996a age_11yr
rename s1230 sexfreq_12yr
rename s1231 sexsat_12yr
rename s1000 health_12yr
rename s1010 anxiety_12yr
rename s1011 depression_12yr
rename s9996a age_12yr 
rename t4500 sexfreq_18yr
rename t4501 sexsat_18yr
rename t3243 anxiety_18yr
rename t3255 depression_18yr
rename t1050 marital_status_18yr
rename t3500 health_18yr
rename t9994 age_18yr

* Now, I need to explore the data and recode string variables as numerical variables for analysis

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

* Maternal ethnicity (leaving coding as is)

tab mat_ethn
tab mat_ethn, nolabel
recode mat_ethn (-1=.)

* Dichotomising maternal ethnicity 

tab mat_ethn
tab mat_ethn, nolabel
generate mat_ethn_bin = 0 if mat_ethn ==1
replace mat_ethn_bin = 1 if mat_ethn ==2 | mat_ethn ==3 | mat_ethn ==4 | ///
mat_ethn ==5 | mat_ethn ==6 | mat_ethn ==7 | mat_ethn ==8 | mat_ethn ==9
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

* Frequency of sex as compared with before pregnancy - recoded so that increasing
* number confers more often

tab sexfreqvsprepreg
tab sexfreqvsprepreg, nolabel
recode sexfreqvsprepreg (-1=.) (1=3) (2=2) (3=1)
label values sexfreqvsprepreg sexfreqvsprepreg_lb
tab sexfreqvsprepreg

* Frequency of sex at 33 months postpartum coded similarly to 21 months

tab sexfreq_33mo
tab sexfreq_33mo, nolabel
recode sexfreq_33mo (-1=.) (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
label values sexfreq_33mo sexfreq_lb
tab sexfreq_33mo

* Sexual satisfaction "do you enjoy sex?" at 33 months postpartum coded as 
* increasing enjoyment conferred by increasing numbers and that "no sex now"
* conferred by zero

tab sexsat_33mo
tab sexsat_33mo, nolabel
recode sexsat_33mo (-1=.) (1=4) (2=3) (3=2) (4=1) (5=0)
label values sexsat_33mo sexsat_lb
tab sexsat_33mo

* Sexual frequency at 5 years 1 month postpartum - coding consistent with other
* time points

tab sexfreq_5yr
tab sexfreq_5yr, nolabel
recode sexfreq_5yr (-10=.) (-1=.) (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
label values sexfreq_5yr sexfreq_lb
tab sexfreq_5yr

* Sexual satisfaction at 5 years 1 month postpartum - coding consistent with
* other time points

tab sexsat_5yr
tab sexsat_5yr, nolabel
recode sexsat_5yr (-10=.) (-1=.) (1=4) (2=3) (3=2) (4=1) (5=0)
label values sexsat_5yr sexsat_lb
tab sexsat_5yr

* Mum has ever had pain or soreness in the vagina during intercourse at 11 years
* 1 month- recoded so that "not at all" is represented by a 0

tab dyspareunia_11yr
tab dyspareunia_11yr, nolabel
recode dyspareunia_11yr (-10=.) (-1=.) (1=0) (2=1) (3=2) (4=3)
label values dyspareunia_11yr dyspareunia_11yr_lb
tab dyspareunia_11yr

* Frequency mum experiences pain elsewhere after intercourse - leave recoding 
* this for now as a couple of options could be fairly represented by a zero

tab pain_elsewhere_11yr
tab pain_elsewhere_11yr, nolabel
recode pain_elsewhere_11yr (-10=.) (-1=.) (0=.) (1=1) (2=2) (3=3) (4=4) (5=0)
label values pain_elsewhere_11yr pain_elsewhere_11yr_lb
tab pain_elsewhere_11yr

* Frequency of sex at 12 years 1 months postpartum - coding consistent with other
* time points

tab sexfreq_12yr
tab sexfreq_12yr, nolabel
recode sexfreq_12yr (-10=.) (-1=.) (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
label values sexfreq_12yr sexfreq_lb
tab sexfreq_12yr

* Sexual satisfaction at 12 years 1 month - coding consistent with other time 
* points

tab sexsat_12yr
tab sexsat_12yr, nolabel
recode sexsat_12yr (-10=.) (-1=.) (1=4) (2=3) (3=2) (4=1) (5=0)
label values sexsat_12yr sexsat_lb
tab sexsat_12yr

* Frequency of sex at 18 years postpartum - coding consistent with other
* time points

tab sexfreq_18yr
tab sexfreq_18yr, nolabel
recode sexfreq_18yr (-10=.) (-1=.) (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
label values sexfreq_18yr sexfreq_lb
tab sexfreq_18yr

* Sexual satisfaction at 18 years - coding consistent with other time 
* points

tab sexsat_18yr
tab sexsat_18yr, nolabel
recode sexsat_18yr (-10=.) (-1=.) (1=4) (2=3) (3=2) (4=1) (5=0)
label values sexsat_18yr sexsat_lb
tab sexsat_18yr 

* Mode of delivery - exposure
* For the mode of delivery variable I am going to make sure that I have as many women correctly categorised as possible

tab mod 
tab caesarean, nolabel
recode caesarean (-10=.) (-1=.)
generate caesarean_bin = 1 if caesarean ==1 | caesarean ==2
replace caesarean_bin = 0 if caesarean ==3
label values caesarean_bin bin_lb
tab mod caesarean_bin 

* There are two women who have been coded as breech extraction and CS so I want to remove them as well as two women coded as forceps & caesarean
drop if caesarean_bin ==1 & mod ==2
drop if caesarean_bin ==1 & mod ==4
tab mod caesarean_bin

* Now I have added the women who are coded in mod as other but caesarean as emergency CS to the CS group in mod - now the groups I have aren't "contaminated" with multiple methods of birth
tab mod caesarean 
recode mod (6 = 3) if mod ==6 & caesarean ==2 
tab mod caesarean 

* Now I need to look at the distribution of complete case women at each timepoint for each outcome stratified by each exposure comparison (VD vs CS, non-ins vs ins, elective vs emergency)
tab mod, nolabel

* Binary variable vaginal delivery vs caesarean section
generate vaginal_delivery = 0 if mod !=3  
replace vaginal_delivery = 1 if mod ==3
replace vaginal_delivery =. if mod ==.
list mod vaginal_delivery in 1/100
tab vaginal_delivery 
label values vaginal_delivery vaginal_delivery_lb
tab vaginal_delivery
label variable vaginal_delivery"Vaginal delivery (VD) vs Caesarean section (CS)"

* Instrumental vs non-instrumental delivery
gen instrumental_del =.
replace instrumental_del = 0 if mod ==0 | mod ==1 | mod ==2
replace instrumental_del = 1 if mod ==4 | mod ==5
label values instrumental_del instrumental_del_lb
label variable instrumental_del"Instrumental delivery via forceps or vacuum"
tab instrumental_del

* Elective vs emergency caesarean
tab caesarean
generate emergency_cs = 1 if caesarean == 2
replace emergency_cs = 0 if caesarean == 1
label values emergency_cs emergency_cs_lb
tab emergency_cs
label variable emergency_cs"Elective CS vs Emergency CS"

* Elective caesarean vs vaginal delivery
gen elective_vs_vaginal =.
replace elective_vs_vaginal = 0 if vaginal_delivery ==0
replace elective_vs_vaginal = 1 if emergency_cs ==0 
label value elective_vs_vaginal elective_vs_vaginal_lb
tab elective_vs_vaginal

* Emergency caesarean vs vaginal delivery
gen emergency_vs_vaginal =.
replace emergency_vs_vaginal = 0 if vaginal_delivery ==0
replace emergency_vs_vaginal = 1 if emergency_cs ==1 
label value emergency_vs_vaginal emergency_vs_vaginal_lb
tab emergency_vs_vaginal

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
label define any_none_lb 0"No sex at the moment" 1"Having sex"
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
label define worst_case_lb 1"No, not at all" 2"No, not a lot" 3"Yes, somewhat" 4"Yes, very much"
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

* Predictors of the outcome at each timepoint
* 33 months 
* Age
tab age_33mo
replace age_33mo =. if age_33mo ==-1

* Health
tab health_33mo, nolabel
replace health_33mo =. if health_33mo ==-1

* Anxiety
tab anxiety_33mo, nolabel
replace anxiety_33mo =. if anxiety_33mo <0
gen anxiety_bin_33mo =.
replace anxiety_bin_33mo = 0 if anxiety_33mo <9 & anxiety_33mo !=.
replace anxiety_bin_33mo = 1 if anxiety_33mo >=9 & anxiety_33mo !=.
label values anxiety_bin_33mo bin_lb
tab anxiety_bin_33mo

* Depression
tab depression_33mo, nolabel
replace depression_33mo =. if depression_33mo <0
gen depression_bin_33mo =.
replace depression_bin_33mo = 0 if depression_33mo <13
replace depression_bin_33mo = 1 if depression_33mo >=13 & depression_33mo !=.
label values depression_bin_33mo bin_lb
tab depression_bin_33mo

* Marital status
tab marital_status_33mo, nolabel
replace marital_status_33mo =. if marital_status_33mo ==-1

* 5 years 
* Age
tab age_5yr, nolabel
replace age_5yr =. if age_5yr <0

* Health
tab health_5yr, nolabel
replace health_5yr =. if health_5yr <0

* Anxiety
tab anxiety_5yr, nolabel
replace anxiety_5yr =. if anxiety_5yr <0

* Depression
tab depression_5yr, nolabel
replace depression_5yr =. if depression_5yr <0

* 11 years 
* Age
tab age_11yr, nolabel
replace age_11yr =. if age_11yr <0

* Anxiety
tab anxiety_11yr, nolabel
replace anxiety_11yr =. if anxiety_11yr <0

* Depression
tab depression_11yr
replace depression_11yr =. if depression_11yr <0

* 12 years 
* Age
tab age_12yr, nolabel
replace age_12yr =. if age_12yr <0

* Health
tab health_12yr, nolabel
replace health_12yr =. if health_12yr <0

* Anxiety
tab anxiety_12yr, nolabel
replace anxiety_12yr =. if anxiety_12yr <0

* Depression
tab depression_12yr, nolabel
replace depression_12yr =. if depression_12yr <0

* 18 years 
* Age
tab age_18yr, nolabel
replace age_18yr =. if age_18yr <0

* Health
tab health_18yr, nolabel
replace health_18yr =. if health_18yr <0

* Anxiety
tab anxiety_18yr, nolabel
replace anxiety_18yr =. if anxiety_18yr <0

* Depression
tab depression_18yr, nolabel
replace depression_18yr =. if depression_18yr <0
gen depression_bin_18yr =.
replace depression_bin_18yr = 0 if depression_18yr <13
replace depression_bin_18yr = 1 if depression_18yr >=13 & depression_18yr !=.
label values depression_bin_18yr bin_lb
tab depression_bin_18yr

* Marital status
tab marital_status_18yr, nolabel
replace marital_status_18yr =. if marital_status_18yr <0

* Complete case variable
gen cc =.
replace cc = 0 if matage_delivery ==. | mat_bmi ==. | cc_anxiety_18wkgest ==. | epds_18wkgest ==. | parity_18wkgest ==. | mat_edu ==.
replace cc = 1 if matage_delivery !=. & mat_bmi !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & parity_18wkgest !=. & mat_edu !=.
tab cc

save flo_dataset.dta, replace

drop if mod ==6 | mod ==.
drop if matage_delivery ==.
drop if mat_bmi ==.
drop if cc_anxiety_18wkgest ==.
drop if epds_18wkgest ==.
drop if parity_18wkgest ==.
drop if mat_edu ==.

save flo_dataset_cc.dta, replace
