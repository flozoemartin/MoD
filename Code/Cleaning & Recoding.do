***********************************************************************************************************************************************************
*                                                                                                                                                         *
*                                                                                                                                                         *
*                                                                                                                                                         *
*	            Mode of delivery on sexual health outcomes using ALSPAC - Data Cleaning                                                                 *
*	                                                                                                                                                    *
*	            Author: Florence Martin (Epidemiology, MSc)                                                                                             *
*                                                                                                                                                         *
*	            Date started: 22/06/2020                                                                                                                *
*                 Date finished: 07/07/2020                                                                                                               *
*                                                                                                                                                         *
*                                                                                                                                                         *
***********************************************************************************************************************************************************

cd "/Users/ti19522/Documents/Documents - IT047379"
use Forbes_22June20.dta, clear

* Firstly, I need to change all the variable names to something that is more
* recognisable for the analysis

rename kz011b alive_1yr
rename kz021 child_sex
rename mz010a preg_size
rename mz005a mt1preg_alspac
rename mz010 preg_size_2
rename mz011 preg_outcome_pre20wks
rename mz011a miscarr_pre20wks
rename mz011b termination
rename mz012 livebirth
rename mz013 twenty8day_survival
rename mz014 oneyr_survival
rename mz021a month_lmp
rename mz021b year_lmp
rename mz022a gest_enrol
rename mz022b age_enrol
rename mz022c gest_checked
rename mz023 gest_delivery
rename mz023a gest_delivery_cat
rename mz024a month_delivery
rename mz024b year_delivery
rename mz028a matage_lmp
rename mz028b matage_delivery
rename mz028c matage_oneyr
rename mz028d matage_twoyr
rename mz028e matage_threeyr 
rename mz050 apip
rename mz052 clasp
rename mz053 thermo
rename kb280 duration_bf_6mo
rename kc404 duration_bf_1yr
rename b032 parity_18wkgest
rename b351 cc_anxiety_18wkgest
rename b353 cc_depress_18wkgest
rename b370 epds_18wkgest
rename c645 mat_edu
rename c645a mat_edu_2
rename c802 mat_ethn
rename dw042 mat_bmi
rename e326 aduse_cat_8wk
rename e327 aduse_bin_8wk
rename e371 cc_anxiety_8wk
rename e375 cc_depress_8wk
rename e390 epds_8wk
rename ew001 mat_wtlbs
rename ew002 mat_wtkg
rename f063 aduse_cat_8mo
rename f063a aduse_bin_8mo
rename f200 epds_8mo
rename g130 sexfreq_21mo
rename g131 sexfreqvsprepreg_21mo
rename g268 cc_anxiety_21mo
rename g274 cc_depress_21mo
rename g290 epds_21mo
rename g697 sexsat_partner_21mo
rename h095 sexfreq_33mo
rename h096 sexsat_33mo
rename h567 sexsat_partner_33mo
rename j110 sexfreq_47mo
rename j111 sexsat_47mo
rename k1190 sexfreq_5yr
rename k1191 sexsat_5yr
rename l3270 sexfreq_6yr
rename l3271 sexsat_6yr
rename l6132 sexsat_partner_6yr
rename m3102a dobmo_child_1
rename m3102b dobyr_child_1
rename m3104a dobmo_child_2
rename m3104b dobyr_child_2
rename m3106a dobmo_child_3
rename m3106b dobyr_child_3
rename m3108a dobmo_child_4
rename m3108b dobyr_child_4
rename m4220 mat_wtkg_7yr
rename m4221 mat_htcm_7yr
rename n1140 mat_wtkg_8yr
rename n1141 matwt_certain_8yr
rename n1145 mat_htcm_8yr
rename n1146 matht_certain_8yr
rename v1dab5_hypertension highbppreeclam_preg
rename v1dab6k_diabetes diabetes_preg
rename v1dac6_method_delivery mod
rename HDP hdp
rename DEL_P1410 epis
rename DEL_P1412 tear
rename DEL_P1473 tearepis_infection
rename p1230 sexfreq_9yr
rename p1231 sexsat_9yr
rename p1290 mat_wtkg_9yr
rename p1291 mat_htcm_9yr
rename p3132 sexsat_partner_9yr
rename q4270 bpmed_12mo_10yr
rename q4273 freq_bpmed_1_10yr
rename q4275 freq_bpmed_2_10yr
rename r2191 dyspareunia_11yr
rename r2192 pain_elsewhere_11yr
rename s1230 sexfreq_12yr
rename s1231 sexsat_12yr 
rename s1290 mat_wtkg_12yr
rename s1291 mat_htcm_12yr
rename s3132 sexsat_partner_12yr
rename s4270 bpmed_12mo_12yr
rename s4273 freq_bpmed_1_12yr
rename s4275 freq_bpmed_2_12yr
rename t4500 sexfreq_18yr
rename t4501 sexsat_18yr
rename t6099 mat_bmi_18yr
rename V0101 no_of_children_22yr
rename V4400 mat_htcm_22yr
rename V4401 matht_notknown_22yr
rename V4410 mat_wtkg_22yr
rename V4411 matwt_notknown_22yr
rename V5005 sexfreq_22yr
rename V5006 nonsexfreq_22yr
rename V5015 sexsat_22yr
rename XB070 mat_htcm_2010
rename XB080 mat_wtkg_2010

* Now, I need to explore the data and recode string variables as numerical 
* variables for analysis

* Index child gender

tab child_sex
tab child_sex, nolabel
recode child_sex (-1=.) (1=0) (2=1)
tab child_sex, nolabel
label define child_sex_lb 0"Male" 1"Female"
label values child_sex child_sex_lb
tab child_sex

* Index child alive at 1 year (binary)

tab alive_1yr
tab alive_1yr, nolabel
recode alive_1yr (1=1) (2=0)
label define alive_1yr_lb 1"Yes" 0"No"
label values alive_1yr alive_1yr_lb
tab alive_1yr

* Index pregnancy eith singleton or multiple

tab preg_size
tab preg_size, nolabel
recode preg_size (-2=.) (1=1) (2=2)
tab preg_size, nolabel
label define preg_size_lb 1"Singleton" 2"Multiple"
label values preg_size preg_size_lb
tab preg_size

* Pregnancies enrolled as part of the core sample

tab in_core
tab in_core, nolabel
recode in_core (-1=.) (1=1) (2=0)
label define in_core_lb 1"Yes" 0"No"
label values in_core in_core_lb
tab in_core

* Pregnancies enrolled as part of Phase II (Focus@7)

tab in_phase2
tab in_phase2, nolabel
recode in_phase2 (1=1) (2=0) 
label define in_phase2_lb 1"Yes" 0"No"
label values in_phase2 in_phase2_lb
tab in_phase2

* Pregnancies enrolled as part of Phase IV

tab in_phase4
tab in_phase4, nolabel
recode in_phase4 (1=1) (2=0) 
label define in_phase4_lb 1"Yes" 0"No"
label values in_phase4 in_phase4_lb
tab in_phase4

* More than one pregnancy in the core sample enrollment

tab mt1preg_alspac
tab mt1preg_alspac, nolabel
recode mt1preg_alspac (-10=.) (1=1) (2=0)
label define mt1preg_alspac_lb 1"Yes" 0"No"
label values mt1preg_alspac mt1preg_alspac_lb
tab mt1preg_alspac

* Comparing these two variables of pregnancy size...

tab preg_size
tab preg_size_2

* ...shows that they provide the exact same information so I am going to drop
* the second variable (preg_size_2)

drop preg_size_2

* Pregnancy outcomes before 20 weeks gestation

tab preg_outcome_pre20wks
tab preg_outcome_pre20wks, nolabel
recode preg_outcome_pre20wks (-2=.) (1=1) (2=2) (3=3) (4=4) (5=5) (6=6) (7=7) ///
(8=8) (10=9) 
label define preg_outcome_pre20wks_lb 1"Miscarriage <12 weeks" ///
2"Miscarriage 12-15 weeks" 3"Miscarriage 16-19 weeks" 4"Miscarriage 20 weeks" ///
5"Miscarriage gestation not known" 6"Termination due to foetal abnormality" /// 
7"Termination due to other" 8"Other" 9"Delivery at >20 weeks"
label values preg_outcome_pre20wks preg_outcome_pre20wks_lb
tab preg_outcome_pre20wks

* Miscarriage before 20 weeks gestation (binary)

tab miscarr_pre20wks
tab miscarr_pre20wks, nolabel
recode miscarr_pre20wks (-2=.) (1=1) (2=0)
label define miscarr_pre20wks_lb 1"Yes" 0"No"
label values miscarr_pre20wks miscarr_pre20wks_lb
tab miscarr_pre20wks

* Termination of the foetus due to foetal problem (CM = congenital malformation 
* PRM = premature rupture of membrane?) 

tab termination
tab termination, nolabel
recode termination (-2=.) (1=1) (3=2) (7=0)
label define termination_lb 1"Yes, CM" 2"Yes, PRM" 0"No"
label values termination termination_lb
tab termination

* Live births resulting from pregnancy

tab livebirth
tab livebirth, nolabel
recode livebirth (-2=.) (1=0) (2=1) (3=2)
label define livebirth_lb 0"No survivors" 1"1 survivor" 2"All survived"
label values livebirth livebirth_lb
tab livebirth

* Survival rate of infants at 28 days post-partum

tab twenty8day_survival
tab twenty8day_survival, nolabel
recode twenty8day_survival (-2=.) (1=0) (2=1) (3=2)
label define twenty8day_survival_lb 0"No survivors" 1"1 survivor" 2"All survived"
label values twenty8day_survival twenty8day_survival_lb
tab twenty8day_survival

* Survival rate of infants at 1 year post-partum

tab oneyr_survival
tab oneyr_survival, nolabel
recode oneyr_survival (-2=.) (1=0) (2=1) (3=2)
label define oneyr_survival_lb 0"No survivors" 1"1 survivor" 2"All survived"
label values oneyr_survival oneyr_survival_lb
tab oneyr_survival

* Month of last menstrual period (left as is)
 
tab month_lmp
tab month_lmp, nolabel
recode month_lmp (-10=.) (-1=.)

* Year of last menstrual period (left as is)

tab year_lmp
tab year_lmp, nolabel
recode year_lmp (-10=.) (-1=.)

* Gestation at enrollment, I am leaving this one as is

tab gest_enrol
tab gest_enrol, nolabel
recode gest_enrol (-10=.) (-5=.) (-4=.) (-3=.) (-2=.) (-1=.)

* Age in weeks of the baby at enrollment if not enrolled in pregnancy, also 
* leaving this one as is

tab age_enrol
tab age_enrol, nolabel
recode age_enrol (-10=.) (-2=.)

* Whether gestation was checked against the records (labels redefined to have 
* caps)

tab gest_checked
tab gest_checked, nolabel
recode gest_checked (-10=.) (0=0) (1=1)
label define gest_checked_lb 0"Unchecked" 1"Checked"
label values gest_checked gest_checked_lb
tab gest_checked

* Gestation at either miscarriage or delivery in weeks 
* (leaving for now - not important)

tab gest_delivery
tab gest_delivery, nolabel

* Gestation at either miscarriage or delivery in week categories

tab gest_delivery_cat
tab gest_delivery_cat, nolabel
recode gest_delivery_cat (-10=.) (-3=.) (-2=.)

* Month in which the delivery occurred

tab month_delivery
tab month_delivery, nolabel
recode month_delivery (-2=.) (-1=.)

* Year in which the delivery occurred

tab year_delivery
tab year_delivery, nolabel
recode year_delivery (-2=.) (-1=.)

tab matage_lmp
tab matage_lmp, nolabel
recode matage_lmp (-10=.) (-3=.)

tab matage_delivery
tab matage_delivery, nolabel
recode matage_delivery (-10=.) (-4=.) (-2=.)

tab matage_oneyr
tab matage_oneyr, nolabel
recode matage_oneyr (-10=.) (-4=.) (-2=.)

tab matage_twoyr
tab matage_twoyr, nolabel
recode matage_twoyr (-10=.) (-4=.) (-2=.)

tab matage_threeyr
tab matage_threeyr, nolabel
recode matage_threeyr (-10=.) (-4=.) (-2=.)


* Whether particpants were involved in the APIP study (recoded for consistency
* of 0 = no 1 = yes similarly to all other variables thus far)

tab apip
tab apip, nolabel
recode apip (-10=.) (1=1) (2=0)
label define apip_lb 1"Yes" 0"No"
label values apip apip_lb
tab apip

* Whether partcipants were involved in the Clasp study

tab clasp
tab clasp, nolabel
recode clasp (-10=.) (1=1) (2=0)
label define clasp_lb 1"Yes" 0"No"
label values clasp clasp_lb
tab clasp

* Whether partcipants were involved in the Thermometer study

tab thermo
tab thermo, nolabel
recode thermo (-10=.) (1=1) (2=0)
label define thermo_lb 1"Yes" 0"No"
label values thermo thermo_lb
tab thermo

* Source of the data? Seems intuitively coded so no need to change

tab source
tab source, nolabel

* Duration of breastfeeding at 6 months questionnaire

tab duration_bf_6mo
tab duration_bf_6mo, nolabel
recode duration_bf_6mo (-1=.) (1=0) (2=1) (3=2) (4=3) (5=4)
label define duration_bf_6mo_lb 0"Never" 1"<1 month" ///
2"1-<3 months" 3"3-<6 months" 4"6 months or more"
label values duration_bf_6mo duration_bf_6mo_lb
tab duration_bf_6mo

* Duration of breastfeeding at the 1 year 3 months questionnaire (changed labels
* to mirror the labels at 6 months)

tab duration_bf_1yr
tab duration_bf_1yr, nolabel
recode duration_bf_1yr (-1=.) (0=0) (1=1) (2=2) (3=3)
label define duration_bf_1yr_lb 0"Never" 1"<3 months" 2"3-5 months" ///
3"6 months or more"
label values duration_bf_1yr duration_bf_1yr_lb
tab duration_bf_1yr

* Parity at 18 weeks gestation 

tab parity_18wkgest // Want to use this parity variable for confounder
tab parity_18wkgest, nolabel
recode parity_18wkgest (-7=.) (-2=.) (-1=.)

* Crown Crisp score for anxiety at 18 weeks gestation

tab cc_anxiety_18wkgest
tab cc_anxiety_18wkgest, nolabel
recode cc_anxiety_18wkgest (-7=.) (-1=.)

* Crown Crisp score for depression at 18 weeks gestation

tab cc_depress_18wkgest
tab cc_depress_18wkgest, nolabel
recode cc_depress_18wkgest (-7=.) (-1=.)

* Edinburgh Post-Natal Depression Score at 18 weeks gestation

tab epds_18wkgest
tab epds_18wkgest, nolabel
recode epds_18wkgest (-7=.) (-1=.)


* Highest achieved education qualification for mum as reported at the 32 week
* gestation questionnaire (leaving the coding as is)

tab mat_edu
tab mat_edu, nolabel
recode mat_edu (-1=.)

* Second maternal education variable - the same for all barring missing and 
* CSE (seems to have caught more CSE's?)

tab mat_edu_2
tab mat_edu_2, nolabel
recode mat_edu_2 (-1=.)

* Maternal ethnicity (leaving coding as is)

tab mat_ethn
tab mat_ethn, nolabel
recode mat_ethn (-1=.)

* Maternal BMI (need to generate a BMI category variable)

tab mat_bmi
tab mat_bmi, nolabel
recode mat_bmi (-3=.)

* Frequency of antidepressant use at 8 weeks in categories - recoded this so 
* increasing numbers conferred increasing use of antidepressants 

tab aduse_cat_8wk
tab aduse_cat_8wk, nolabel
recode aduse_cat_8wk (-1=.) (1=2) (2=1) (3=0)
label define aduse_cat_8wk_lb 1"Sometimes" 2"Almost daily" 0"Not at all"
label values aduse_cat_8wk aduse_cat_8wk_lb
tab aduse_cat_8wk

* Frequency of antidepressant use at 8 weeks as a binary yes/no variable - 
* recoded to match consistency of 0 = no 1= yes

tab aduse_bin_8wk
tab aduse_bin_8wk, nolabel
recode aduse_bin_8wk (-1=.) (1=1) (2=0)
label define aduse_bin_8wk_lb 1"Yes" 0"No"
label values aduse_bin_8wk aduse_bin_8wk_lb
tab aduse_bin_8wk

* Same as the 18 weeks gestation except 0 has been labelled as not anxious and 
* 16 has been labelled as very anxious

tab cc_anxiety_8wk
tab cc_anxiety_8wk, nolabel
recode cc_anxiety_8wk (-1=.)

* Same as Crown Crips anxiety with the changed labelling

tab cc_depress_8wk
tab cc_depress_8wk, nolabel
recode cc_depress_8wk (-1=.)

* Only difference in labelling for the EPDS score is not depressed for a score 
* of 0

tab epds_8wk
tab epds_8wk, nolabel
recode epds_8wk (-1=.)

* Postnatal maternal weight in lbs - will need to categorise
 
tab mat_wtlbs
tab mat_wtlbs, nolabel
recode mat_wtlbs (-3=.) (-2=.) (-1=.)

* Postnatal maternal weight in kg - provides the same information as maternal
* weight in lbs in terms of missing, not known etc so do I need both?

tab mat_wtkg
tab mat_wtkg, nolabel
recode mat_wtkg (-3=.) (-2=.) (-1=.)


* Frequency of antidepressant use at 8 months postpartum in categories - recoded 
* this so increasing numbers conferred increasing use of antidepressants 

tab aduse_cat_8mo
tab aduse_cat_8mo, nolabel
recode aduse_cat_8mo (-1=.) (4=0) (3=1) (2=2) (1=3)
label define aduse_cat_8mo_lb 0"Not at all" 1"Sometimes" 2"Often" ///
3"Daily"
label values aduse_cat_8mo aduse_cat_8mo_lb
tab aduse_cat_8mo

* Frequency of antidepressant use at 8 months postpartum as a binary yes/no 
* variable - recoded to match consistency of 0 = no 1= yes

tab aduse_bin_8mo
tab aduse_bin_8mo, nolabel
recode aduse_bin_8mo (-1=.) (1=1) (2=0)
label define aduse_bin_8mo_lb 1"Yes" 0"No"
label values aduse_bin_8mo aduse_bin_8mo_lb
tab aduse_bin_8mo

* EPDS score at 8 months postpartum - highest score here is 29 (labelled very 
* depressed different to 8 weeks where the highest score was 28)

tab epds_8mo
tab epds_8mo, nolabel
recode epds_8mo (-1=.)

* Frequency of sex at 21 months - recoding so that "Not at all" is conferred by 
* a 0 and >5 times a week by a 5 

tab sexfreq_21mo
tab sexfreq_21mo, nolabel
recode sexfreq_21mo (-1=.) (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
label define sexfreq_21mo_lb 0"Not at all" 1"< once a month" ///
2"1-3 times a month" 3"About once a week" 4"2-4 times a week" 5">5 times a week"
label values sexfreq_21mo sexfreq_21mo_lb
tab sexfreq_21mo

* Frequency of sex as compared with before pregnancy - recoded so that increasing
* number confers more often

tab sexfreqvsprepreg
tab sexfreqvsprepreg, nolabel
recode sexfreqvsprepreg (-1=.) (1=3) (2=2) (3=1)
label define sexfreqvsprepreg_lb 1"Less often" 2"About as often" ///
3"More often"
label values sexfreqvsprepreg sexfreqvsprepreg_lb
tab sexfreqvsprepreg

* Crown Crisp anxiety score at 21 months postpartum (left as is)

tab cc_anxiety_21mo
tab cc_anxiety_21mo, nolabel
recode cc_anxiety_21mo (-1=.)

* Crown Crisp depression score at 21 months postpartum (left as is)

tab cc_depress_21mo
tab cc_depress_21mo, nolabel
recode cc_depress_21mo (-1=.)

* EPDS score at 21 months postpartum - highest score at this timepoint is one 
* higher again at 30 as opposed to 29 at 8 months postpartum

tab epds_21mo
tab epds_21mo, nolabel
recode epds_21mo (-1=.)

* Sexual satisfaction with partner 21 months postpartum - left scale as is for 
* this one as it differs from frequency where increasing numbers confer the 
* amount. It is souble-ended superlative scale so in the analysis a unit 
* increase in exposure will confer a likelihood of being dissatisfied

tab sexsat_partner_21mo
tab sexsat_partner_21mo, nolabel
recode sexsat_partner_21mo (-2=0) (-1=.) (1=1) (2=2) (3=3) (4=4)
label define sexsat_partner_21mo_lb 0"No partner" 1"Very satisfied" ///
2"Satisfied" 3"Dissatisfied" 4"Very dissatisfied"
label values sexsat_partner_21mo sexsat_partner_21mo_lb
tab sexsat_partner_21mo

* Frequency of sex at 33 months postpartum coded similarly to 21 months

tab sexfreq_33mo
tab sexfreq_33mo, nolabel
recode sexfreq_33mo (-1=.) (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
label define sexfreq_33mo_lb 0"Not at all" 1"< once a month" ///
2"1-3 times a month" 3"About once a week" 4"2-4 times a week" ///
5">5 times a week"
label values sexfreq_33mo sexfreq_33mo_lb
tab sexfreq_33mo

* Sexual satisfaction "do you enjoy sex?" at 33 months postpartum coded as 
* increasing enjoyment conferred by increasing numbers and that "no sex now"
* conferred by zero

tab sexsat_33mo
tab sexsat_33mo, nolabel
recode sexsat_33mo (-1=.) (1=4) (2=3) (3=2) (4=1) (5=0)
label define sexsat_33mo_lb 0"No sex at the moment" 1"No, not at all" ///
2"No,not a lot" 3"Yes, somewhat" 4"Yes, very much"
label values sexsat_33mo sexsat_33mo_lb
tab sexsat_33mo

* Sexual satisfaction with partner at 33 months postpartum - coded similarly to
* the variable at 21 months

tab sexsat_partner_33mo
tab sexsat_partner_33mo, nolabel
recode sexsat_partner_33mo (-2=0) (-1=.) (1=1) (2=2) (3=3) (4=4)
label define sexsat_partner_33mo_lb 0"No partner" 1"Very satisfied" ///
2"Satisfied" 3"Dissatisfied" 4"Very dissatisfied"
label values sexsat_partner_33mo sexsat_partner_33mo_lb
tab sexsat_partner_33mo

* Frequency of sex at 47 months postpartum - coding consistent with other time
* points 

tab sexfreq_47mo
tab sexfreq_47mo, nolabel
recode sexfreq_47mo (-1=.) (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
label define sexfreq_47mo_lb 0"Not at all" 1"< once a month" ///
2"1-3 times a month" 3"About once a week" 4"2-4 times a week" 5">5 times a week"
label values sexfreq_47mo sexfreq_47mo_lb
tab sexfreq_47mo

* Sexual satisfaction at 47 months postpartum - coding consistent with other 
* time points

tab sexsat_47mo
tab sexsat_47mo, nolabel
recode sexsat_47mo (-1=.) (1=4) (2=3) (3=2) (4=1) (5=0)
label define sexsat_47mo_lb 0"No sex at the moment" 1"No, not at all" ///
2"No, not a lot" 3"Yes, somewhat" 4"Yes, very much"
label values sexsat_47mo sexsat_47mo_lb
tab sexsat_47mo

* Sexual frequency at 5 years 1 month postpartum - coding consistent with other
* time points

tab sexfreq_5yr
tab sexfreq_5yr, nolabel
recode sexfreq_5yr (-10=.) (-1=.) (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
label define sexfreq_5yr_lb 0"Not at all" 1"< once a month" /// 
2"1-3 times a month" 3"About once a week" 4"2-4 times a week" 5">5 times a week"
label values sexfreq_5yr sexfreq_5yr_lb
tab sexfreq_5yr

* Sexual satisfaction at 5 years 1 month postpartum - coding consistent with
* other time points

tab sexsat_5yr
tab sexsat_5yr, nolabel
recode sexsat_5yr (-10=.) (-1=.) (1=4) (2=3) (3=2) (4=1) (5=0)
label define sexsat_5yr_lb 0"No sex at the moment" /// 
1"No, not at all" 2"No, not a lot" 3"Yes, somewhat" 4"Yes, very much"
label values sexsat_5yr sexsat_5yr_lb
tab sexsat_5yr

* Sexual frequency at 6 years 1 month postpartum - coding consistent with other 
* time points

tab sexfreq_6yr
tab sexfreq_6yr, nolabel
recode sexfreq_6yr (-10=.) (-1=.) (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
label define sexfreq_6yr_lb 0"Not at all" 1"< once a month" 2"1-3 times a month" /// 
3"About once a week" 4"2-4 times a week" 5">5 times a week"
label values sexfreq_6yr sexfreq_6yr_lb
tab sexfreq_6yr

* Sexual satisfaction at 6 years 1 month postpartum - coding consistent with 
* other time points

tab sexsat_6yr
tab sexsat_6yr, nolabel
recode sexsat_6yr (-10=.) (-1=.) (1=4) (2=3) (3=2) (4=1) (5=0)
label define sexsat_6yr_lb 0"No sex at the moment" /// 
1"No, not at all" 2"No, not a lot" 3"Yes, somewhat" 4"Yes, very much"
label values sexsat_6yr sexsat_6yr_lb
tab sexsat_6yr

* Sexual satisfaction with partner - coding inconsistent with previous time 
* points because there is no option for "no partner" like before

tab sexsat_partner_6yr
tab sexsat_partner_6yr, nolabel
recode sexsat_partner_6yr (-10=.) (-1=.)

* Dates of birth in months and years of each child that mum has

tab dobmo_child_1
tab dobmo_child_1, nolabel
recode dobmo_child_1 (-10=.) (-1=.)

tab dobyr_child_1
tab dobyr_child_1, nolabel
recode dobyr_child_1 (-10=.) (-1=.)

tab dobmo_child_2
tab dobmo_child_2, nolabel
recode dobmo_child_2 (-10=.) (-1=.)

tab dobyr_child_2
tab dobyr_child_2, nolabel
recode dobyr_child_2 (-10=.) (-1=.)

tab dobmo_child_3
tab dobmo_child_3, nolabel
recode dobmo_child_3 (-10=.) (-1=.)

tab dobyr_child_3
tab dobyr_child_3, nolabel
recode dobyr_child_3 (-10=.) (-1=.)

tab dobmo_child_4
tab dobmo_child_4, nolabel
recode dobmo_child_4 (-10=.) (-1=.)

tab dobyr_child_4
tab dobyr_child_4, nolabel
recode dobyr_child_4 (-10=.) (-1=.)

* Maternal weight at 7 years 1 month in kg (will need categorising)

tab mat_wtkg_7yr
tab mat_wtkg_7yr, nolabel
recode mat_wtkg_7yr (-10=.) (-1=.)

* Maternal height at 7 years 1 month in cm (will need categorising)

tab mat_htcm_7yr
tab mat_htcm_7yr, nolabel
recode mat_htcm_7yr (-10=.) (-1=.)

* Maternal weight at 8 years 1 month in kg (will need categorising)

tab mat_wtkg_8yr
tab mat_wtkg_8yr, nolabel
recode mat_wtkg_8yr (-10=.) (-1=.)

* Whether mum is certain of her weight at 8 years 1 month - recoded for 
* consistency with 0 = no

tab matwt_certain
tab matwt_certain, nolabel
recode matwt_certain (-10=.) (-1=.) (1=1) (2=0)
label define matwt_certain_lb 1"Yes" 0"No"
label values matwt_certain matwt_certain_lb
tab matwt_certain

* Maternal height at 8 years 1 month in cm (will need categorising)

tab mat_htcm_8yr
tab mat_htcm_8yr, nolabel
recode mat_htcm_8yr (-10=.) (-1=.)

* Whether mum is certain of her height at 8 years 1 month - recoded for 
* consistency with 0 = no

tab matht_certain
tab matht_certain, nolabel
recode matht_certain (-10=.) (-1=.) (1=1) (2=0)
label define matht_certain_lb 1"Yes" 0"No"
label values matht_certain matht_certain_lb
tab matht_certain

* Whether hypertension or preeclampsia was diagnosed at any time during the 
* pregnancy - recoded for consistent yes/no

tab highbppreeclam_preg
tab highbppreeclam_preg, nolabel
recode highbppreeclam_preg (1=1) (2=0)
label define highbppreeclam_preg_lb 1"Yes" 0"No"
label values highbppreeclam_preg highbppreeclam_preg_lb
tab highbppreeclam_preg

* Whether diabetes was noted during the pregnancy - recoded for consistent 
* yes/no

tab diabetes_preg
tab diabetes_preg, nolabel
recode diabetes_preg (1=1) (2=0)
label define diabetes_preg_lb 1"Yes" 0"No"
label values diabetes_preg diabetes_preg_lb
tab diabetes_preg

* Mode of delivery - either spontaneous, assisted breech, breech extraction,
* caesarean section, forceps, vacuum extraction or other 

tab mod
tab mod, nolabel

* Whether hypertension had ever been previously diagnosed - recoding not needed
* as already consistent with previous binary variables

tab prev_hyp
tab prev_hyp, nolabel

* Hypertensive disorder of pregnancy - high blood pressure post 20 weeks 
* gestation without prior history of high BP (coding already consistent)

tab hdp
tab hdp, nolabel

* Preeclampsia without known high blood pressure prior to pregnancy (coding 
* already consistent)

tab preeclampsia
tab preeclampsia, nolabel

* Gestational hypertension (coding already consistent)

tab gesthyp
tab gesthyp, nolabel

* Preeclampsia superimposed onto existing hypertension (coding already 
* consistent)

tab sup_preeclam
tab sup_preeclam, nolabel

* Maternal (deduced from the actual weights) weight at 0 weeks (at the birth?) - 
* need to categorise as too many values to tabulate

* tab wt_0wks

* Diabetes during pregnancy categorised by type of diabetes (gives more detail
* than the diabetes_preg variable

tab pregnancy_diabetes
tab pregnancy_diabetes, nolabel

* Whether mum had an episiotomy or not - recoded for consistency of binary var

tab epis
tab epis, nolabel
recode epis (-10=.) (-1=.) (1=1) (2=0)
label define epis_lb 1"Yes" 0"No"
label values epis epis_lb
tab epis

* Whether mum had a perineal tear or not - recoded for consistency of binary
* variables

tab tear
tab tear, nolabel
recode tear (-1=.) (1=1) (2=0)
label define tear_lb 1"Yes" 0"No"
label values tear tear_lb
tab tear

* Wthere mum developed an infection having had a perineal tear or episiotomy - 
* recoded for consistency of binary variables

tab tearepis_infection
tab tearepis_infection, nolabel
recode tearepis_infection (-10=.) (1=1) (2=0)
label define tearepis_infection_lb 1"Yes" 0"No"
label values tearepis_infection tearepis_infection_lb
tab tearepis_infection

* Frequency of sex at 9 years 1 months postpartum - coding consistent with other
* time points

tab sexfreq_9yr
tab sexfreq_9yr, nolabel
recode sexfreq_9yr (-10=.) (-8=.) (-1=.) (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
label define sexfreq_9yr_lb 0"Not at all" 1"< once a month" 2"1-3 times a month" ///
3"About once a week" 4"2-4 times a week" 5">5 times a week"
label values sexfreq_9yr sexfreq_9yr_lb
tab sexfreq_9yr

* Sexual satisfaction at 9 years 1 month - coding consistent with other time 
* points

tab sexsat_9yr
tab sexsat_9yr, nolabel
recode sexsat_9yr (-10=.) (-1=.) (1=4) (2=3) (3=2) (4=1) (5=0)
label define sexsat_9yr_lb 0"No sex at the moment" /// 
1"No, not at all" 2"No, not a lot" 3"Yes, somewhat" 4"Yes, very much"
label values sexsat_9yr sexsat_9yr_lb
tab sexsat_9yr

* Maternal weight in kg and height in cm at 9 years 1 month - needs categorising
* or used to calculate BMI

tab mat_wtkg_9yr
tab mat_wtkg_9yr, nolabel
recode mat_wtkg_9yr (-10=.) (-1=.)

tab mat_htcm_9yr
tab mat_htcm_9yr, nolabel
recode mat_htcm_9yr (-10=.) (-1=.)

* Sexual satisfaction with partner 9 years 1 month postpartum - coding 
* inconsistent with previous time points because there is no option for "no 
* partner" similarly to 6 years 1 month postpartum

tab sexsat_partner_9yr
tab sexsat_partner_9yr, nolabel
recode sexsat_partner_9yr (-10=.) (-1=.)

* If mum has used a blood pressure medication in the last 12 months at 10 years 
* 1 month - no answers for no in this question

tab bpmed_12mo_10yr
tab bpmed_12mo_10yr, nolabel
recode bpmed_12mo_10yr (-10=.) (-1=.)

* Frequency that mum used the first blood pressure medicine she listed (at 10 
* years 1 month  - recoded so as numbers increase frequency of use increases

tab freq_bpmed_1_10yr
tab freq_bpmed_1_10yr, nolabel
recode freq_bpmed_1_10yr (-10=.) (-1=.) (0=0) (1=4) (2=3) (3=2) (4=1)
label define freq_bpmed_1_10yr_lb 0"Medicine reported but no frequency" /// 
1"Once or twice" 2"Sometimes" 3"Most days" 4"Every day"
label values freq_bpmed_1_10yr freq_bpmed_1_10yr_lb
tab freq_bpmed_1_10yr

* Frequency that mum used the second blood pressure medicine she listed (at 10 
* years 1 month - recoded so as numbers increase frequency of use increases 
* (consistent with coding above)

tab freq_bpmed_2_10yr
tab freq_bpmed_2_10yr, nolabel
recode freq_bpmed_2_10yr (-10=.) (-1=.) (0=0) (1=4) (4=1)
label define freq_bpmed_2_10yr_lb 0"Medicine reported but no frequency" /// 
1"Once or twice" 4"Every day"
label values freq_bpmed_2_10yr freq_bpmed_2_10yr_lb
tab freq_bpmed_2_10yr

* Mum has ever had pain or soreness in the vagina during intercourse at 11 years
* 1 month- recoded so that "not at all" is represented by a 0

tab dyspareunia_11yr
tab dyspareunia_11yr, nolabel
recode dyspareunia_11yr (-10=.) (-1=.) (1=0) (2=1) (3=2) (4=3)
label define dyspareunia_11yr_lb 0"Not at all" 1"A little" 2"Moderate" 3"A lot"
label values dyspareunia_11yr dyspareunia_11yr_lb
tab dyspareunia_11yr

* Frequency mum experiences pain elsewhere after intercourse - leave recoding 
* this for now as a couple of options could be fairly represented by a zero

tab pain_elsewhere_11yr
tab pain_elsewhere_11yr, nolabel
recode pain_elsewhere_11yr (-10=.) (-1=.) (0=.) (1=0) (2=1) (3=2) (4=3) (5=4)
label define pain_elsewhere_11yr_lb 0"Never" 1"Occasionally" 2"Often" 3"Always" ///
4"Don't have sex"
label values pain_elsewhere_11yr pain_elsewhere_11yr_lb
tab pain_elsewhere_11yr

* Frequency of sex at 12 years 1 months postpartum - coding consistent with other
* time points

tab sexfreq_12yr
tab sexfreq_12yr, nolabel
recode sexfreq_12yr (-10=.) (-1=.) (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
label define sexfreq_12yr_lb 0"Not at all" 1"< once a month" 2"1-3 times a month" /// 
3"About once a week" 4"2-4 times a week" 5">5 times a week"
label values sexfreq_12yr sexfreq_12yr_lb
tab sexfreq_12yr

* Sexual satisfaction at 12 years 1 month - coding consistent with other time 
* points

tab sexsat_12yr
tab sexsat_12yr, nolabel
recode sexsat_12yr (-10=.) (-1=.) (1=4) (2=3) (3=2) (4=1) (5=0)
label define sexsat_12yr_lb 0"No sex at the moment" 1"No, not at all" /// 
2"No, not a lot" 3"Yes, somewhat" 4"Yes, very much"
label values sexsat_12yr sexsat_12yr_lb
tab sexsat_12yr

* Maternal weight in kg and height in cm at 12 years 1 month - needs categorising
* or used to calculate BMI

tab mat_wtkg_12yr
tab mat_wtkg_12yr, nolabel
recode mat_wtkg_12yr (-10=.) (-1=.)

tab mat_htcm_12yr
tab mat_htcm_12yr, nolabel
recode mat_htcm_12yr (-10=.) (-1=.)

* Sexual satisfaction with partner 9 years 1 month postpartum - coding 
* inconsistent with previous time points because there is no option for "no 
* partner" similarly to 6 years 1 month postpartum

tab sexsat_partner_12yr
tab sexsat_partner_12yr, nolabel
recode sexsat_partner_12yr (-10=.) (-1=.)

* If mum has used a blood pressure medication in the last 12 months at 12 years 
* 1 month - no answers for no in this question

tab bpmed_12mo_12yr
tab bpmed_12mo_12yr, nolabel
recode bpmed_12mo_12yr (-10=.) (-1=.)

* Frequency that mum used the first blood pressure medicine she listed (at 12 
* years 1 month  - recoded so as numbers increase frequency of use increases

tab freq_bpmed_1_12yr
tab freq_bpmed_1_12yr, nolabel
recode freq_bpmed_1_12yr (-10=.) (-1=.) (0=0) (1=4) (2=3) (3=2) (4=1)
label define freq_bpmed_1_12yr_lb 0"Medicine reported but no frequency" /// 
1"Once or twice" 2"Sometimes" 3"Most days" 4"Every day"
label values freq_bpmed_1_12yr freq_bpmed_1_12yr_lb
tab freq_bpmed_1_12yr

* Frequency that mum used the second blood pressure medicine she listed (at 12 
* years 1 month - recoded so as numbers increase frequency of use increases 
* (consistent with coding above)

tab freq_bpmed_2_12yr
tab freq_bpmed_2_12yr, nolabel
recode freq_bpmed_2_12yr (-10=.) (-1=.) (0=0) (1=4) (2=3) (3=2)
label define freq_bpmed_2_12yr_lb 0"Medicine reported but no frequency" /// 
2"Sometimes" 3"Most days" 4"Every day"
label values freq_bpmed_2_12yr freq_bpmed_2_12yr_lb
tab freq_bpmed_2_12yr

* Frequency of sex at 18 years postpartum - coding consistent with other
* time points

tab sexfreq_18yr
tab sexfreq_18yr, nolabel
recode sexfreq_18yr (-10=.) (-1=.) (1=0) (2=1) (3=2) (4=3) (5=4) (6=5)
label define sexfreq_18yr_lb 0"Not at all" 1"< once a month" /// 
2"1-3 times a month" 3"About once a week" 4"2-4 times a week" 5">5 times a week"
label values sexfreq_18yr sexfreq_18yr_lb
tab sexfreq_18yr

* Sexual satisfaction at 18 years - coding consistent with other time 
* points

tab sexsat_18yr
tab sexsat_18yr, nolabel
recode sexsat_18yr (-10=.) (-1=.) (1=4) (2=3) (3=2) (4=1) (5=0)
label define sexsat_18yr_lb 0"No sex at the moment" 1"No, not at all" ///
2"No, not a lot" 3"Yes, somewhat" 4"Yes, very much"
label values sexsat_18yr sexsat_18yr_lb
tab sexsat_18yr

* Maternal BMI at 18 years (needs categorising)

tab mat_bmi_18yr
tab mat_bmi_18yr, nolabel
recode mat_bmi_18yr (-10=.) (-1=.)

* Number of children at reported by mum when index child is 22 years old - coding
* as is as intuitive

tab no_of_children_22yr
tab no_of_children_22yr, nolabel
recode no_of_children_22yr (-10=.) (-8=.) (-1=.)

* Maternal height in cm at 22 years postpartum and whether she knows it (no no's)

tab mat_htcm_22yr
tab mat_htcm_22yr, nolabel
recode mat_htcm_22yr (-10=.) (-1=.)

tab matht_notknown_22yr
tab matht_notknown_22yr, nolabel
recode matht_notknown_22yr (-10=.) (-1=.)

* Maternal weight in kg at 22 years postpartum and whether she knows it (no no's)

tab mat_wtkg_22yr
tab mat_wtkg_22yr, nolabel
recode mat_wtkg_22yr (-10=.) (-1=.)

tab matwt_notknown_22yr
tab matwt_notknown_22yr, nolabel
recode matwt_notknown_22yr (-10=.) (-1=.)

* Frequency of sex at 22 years postpartum (different scale to previous frequency
* questions)

tab sexfreq_22yr
tab sexfreq_22yr, nolabel
recode sexfreq_22yr (-10=.) (-1=.) (1=0) (2=1) (3=2) (4=3) (5=4) (6=5) (7=6) ///
(8=7)
label define sexfreq_22yr_lb 0"Not at all" 1"Once in the last month" /// 
2"2-3 times in the last month" 3"Once a week" 4"2-3 times a week" ///
5"4-6 times a week" 6"Once a day" 7"> once a day"
label values sexfreq_22yr sexfreq_22yr_lb
tab sexfreq_22yr

* Frequency that mum engages in non-sexual intercourse at 22 years postpartum 
* (same scale as sexual frequency)

tab nonsexfreq_22yr
tab nonsexfreq_22yr, nolabel
recode nonsexfreq_22yr (-10=.) (-1=.) (1=0) (2=1) (3=2) (4=3) (5=4) (6=5) (7=6) ///
(8=7)
label define nonsexfreq_22yr_lb 0"Not at all" 1"Once in the last month" /// 
2"2-3 times in the last month" 3"Once a week" 4"2-3 times a week" ///
5"4-6 times a week" 6"Once a day" 7"> once a day"
label values nonsexfreq_22yr nonsexfreq_22yr_lb
tab nonsexfreq_22yr

* Sexual satisfaction at 22 years postpartum with overall sex life - additional 
* option to previous satisfaction and question framed differently

tab sexsat_22yr
tab sexsat_22yr, nolabel
recode sexsat_22yr (-10=.) (-1=.) 

* Maternal height and weight in 2010 - categorise or calculate BMI

tab mat_wtkg_2010
tab mat_wtkg_2010, nolabel
recode mat_wtkg_2010 (-10=.) (-2=.) (-1=.)

tab mat_htcm_2010
tab mat_htcm_2010, nolabel
recode mat_htcm_2010 (-10=.) (-1=.)

* Maternal height and weight from FOM1 (?)

tab fm1ms100
tab fm1ms110, nolabel
recode fm1ms110 (-10=.) (-1=.)

* The best gestation we can get - length of pregnancy in weeks

tab bestgest

* Whether or not mum was in the ALSPAC core sample or not - recoded for consistent
* binary variables

tab mz001
tab mz001, nolabel
recode mz001 (1=1) (2=0)
label define mz001_lb 1"Yes" 0"No"
label values mz001 mz001_lb
tab mz001

* Whether or not mum wasenrolled as part of phase III, after Focus@7 up to the 
* age of 18 years, or not - recoded for consistent binary variables

tab in_phase3
tab in_phase3, nolabel
recode in_phase3 (1=1) (2=0)
label define in_phase3_lb 1"Yes" 0"No"
label values in_phase3 in_phase3_lb
tab in_phase3

* Having explored and recoded all the variables individually, I need to generate
* some new variables like categorised BMI, maternal age, Crown Crisp scores, 
* EPDS scores etc.

* Categorising maternal age at delivery

tab matage_delivery, nolabel
generate matage_del_cat = 1 if matage_delivery >0 & matage_delivery <20
replace matage_del_cat = 2 if matage_delivery >=20 & matage_delivery <25
replace matage_del_cat = 3 if matage_delivery >=25 & matage_delivery <30
replace matage_del_cat = 4 if matage_delivery >=30 & matage_delivery <35
replace matage_del_cat = 5 if matage_delivery >=35 & matage_delivery <40
replace matage_del_cat = 6 if matage_delivery >=40 
replace matage_del_cat =. if matage_delivery ==. // i.e. those who miscarried, 
* outcome not known or not in core sample
list matage_delivery matage_del_cat in 1/10, nolabel
tab matage_del_cat
label define matage_del_cat_lb 1"< 20" 2"20-24" 3"25-29" 4"30-34" 5"35-39" 6"40 +"
label values matage_del_cat matage_del_cat_lb
tab matage_del_cat
label variable matage_del_cat"Maternal age at delivery categorised" 

* Categorising Crown Crisp anxiety score at 18 weeks gestation

tab cc_anxiety_18wkgest
generate cc_anxiety_bin = 0 if cc_anxiety_18wkgest >=0 & cc_anxiety_18wkgest <9
replace cc_anxiety_bin = 1 if cc_anxiety_18wkgest >=9 & cc_anxiety_18wkgest !=.
list cc_anxiety_18wkgest cc_anxiety_bin in 1/10, nolabel
tab cc_anxiety_bin
label define cc_anxiety_bin_lab 0"Not anxious" 1"Anxious"
label values cc_anxiety_bin cc_anxiety_bin_lab
tab cc_anxiety_bin
label variable cc_anxiety_bin"Crown Crisp anxiety score at 18 weeks gestation"

* Dichotomising Edinburgh post-natal depression score at 18 weeks gestation

tab epds_18wkgest
generate epds_bin = 0 if epds_18wkgest >=0 & epds_18wkgest <13
replace epds_bin = 1 if epds_18wkgest >=13 & epds_18wkgest !=.
list epds_18wkgest epds_bin in 1/10, nolabel
tab epds_bin
label define epds_bin_lb 0"Not depressed" 1"Depressed"
label values epds_bin epds_bin_lb
tab epds_bin
label variable epds_bin"Edinburgh post-natal depression score at 18 weeks gestation"

* Categorising EPDS at 18 weeks gestation

tab epds_18wkgest
generate epds_cat = 0 if epds_18wkgest >=0 & epds_18wkgest <10
replace epds_cat = 1 if epds_18wkgest >=10 & epds_18wkgest <13
replace epds_cat = 2 if epds_18wkgest >=13 
replace epds_cat = . if epds_18wkgest ==.
list epds_18wkgest epds_cat in 1/10, nolabel
tab epds_cat
label define epds_cat_lb 0"< 10" 1"10 - 12" 2">= 13"
label values epds_cat epds_cat_lb
tab epds_cat
label variable epds_cat"Edinburgh post-natal depression score categorised at 18 weeks gestation"

* Dichotomising maternal ethnicity 

tab mat_ethn
tab mat_ethn, nolabel
generate mat_ethn_cat = 0 if mat_ethn ==1 | mat_ethn ==0
replace mat_ethn_cat = 1 if mat_ethn ==2 | mat_ethn ==3 | mat_ethn ==4 | ///
mat_ethn ==5 | mat_ethn ==6 | mat_ethn ==7 | mat_ethn ==8 | mat_ethn ==9
list mat_ethn_cat mat_ethn in 1/85, nolabel
tab mat_ethn_cat
label define mat_ethn_cat_lb 0"White" 1"Non White"
label values mat_ethn_cat mat_ethn_cat_lb
tab mat_ethn_cat
label variable mat_ethn_cat"Maternal ethnicity"

* Categorising maternal BMI pre-birth

tab mat_bmi
generate mat_bmi_cat = 0 if mat_bmi <18.5
replace mat_bmi_cat = 1 if mat_bmi >=18.5 & mat_bmi <25
replace mat_bmi_cat = 2 if mat_bmi >=25 & mat_bmi <30
replace mat_bmi_cat = 3 if mat_bmi >=30
replace mat_bmi_cat =. if mat_bmi ==. 
list mat_bmi mat_bmi_cat in 1/1000, nolabel
tab mat_bmi_cat
label define mat_bmi_cat_lb 0"Underweight" 1"Normal weight" 2"Overweight" ///
3"Obese"
label values mat_bmi_cat mat_bmi_cat_lb
tab mat_bmi_cat
label variable mat_bmi_cat"Maternal BMI categorised"

* New variable for demographics table for presence of hypertensive disorders before or
* during pregnancy

tab highbppreeclam_preg
tab hdp preeclampsia
tab preeclampsia
tab gesthyp
tab sup_preeclampsia
generate hbp_mat = 1 if preeclampsia ==1 | sup_preeclampsia ==1
replace hbp_mat = 2 if gesthyp ==1
replace hbp_mat = 3 if highbppreeclam_preg ==1 & hdp ==0 & preeclampsia ==0 & gesthyp ==0
replace hbp_mat = 0 if highbppreeclam_preg ==0 & hdp ==0 & preeclampsia ==0 & gesthyp ==0
list hbp_mat highbppreeclam_preg hdp preeclampsia gesthyp sup_preeclampsia in 1/100
label define hbp_preg_lb 0"No hypertensive disorder noted before or during pregnancy" ///
1"Preeclampsia" 2"Gestational hypertension" 3"High blood pressure noted any time during pregnancy"
label values hbp_mat hbp_preg_lb
tab hbp_mat, nolabel
label variable hbp_mat"Pre-pregnancy or gestational blood pressure disorders"
list hbp_mat highbppreeclam_preg in 1/100, nolabel

* To categorise women by exposure vaginal (instrumental or not) vs caesarean, we need to think
* about the epis/tear group as well as mod - excluded other as I don't know what actual method
* this was

tab mod epis, nolabel
tab mod tear
generate vaginal_delivery = 0 if mod !=3 & mod !=6 
replace vaginal_delivery = 1 if mod ==3
replace vaginal_delivery =. if mod ==6 | mod ==.
list mod vaginal_delivery in 1/100
tab vaginal_delivery
label define vaginal_delivery_lb 1"Caesarean Section" 0"Vaginal Delivery"
label values vaginal_delivery vaginal_delivery_lb
tab vaginal_delivery
label variable vaginal_delivery"Binary exposure of vaginal delivery (0) vs caesarean section (1)"

* Stratifying vaginal delivery into instrumental and non-instrumental - this includes spontaneous 
* vaginal without episiotomy in the 0 group and assisted breech, breech (extraction), forceps, vacuum
* extraction and spontaneous delivery with episiotomy in the 1 group. Women with a perineal tear and 
* subsequent spontaneous vaginal birth have been left in the 0 group as this isn't instrumental? Women
* with epis info missing have been assigned based on information about spontaneous birth y/n

tab mod 
generate instrumental_del = 1 if mod ==4 | mod ==5 
replace instrumental_del = 0 if mod ==0 | mod ==1 | mod ==2
list mod instrumental_del in 1/100
label define instrumental_del_lb 0"Non-instrumental vaginal delivery" 1"Instrumental vaginal delivery"
label values instrumental_del instrumental_del_lb
tab instrumental_del
label variable instrumental_del"Instrumental delivery via forceps or vacuum"

* I have generated all the variables I want for now (26/06) so I am going to save this dataset separately 
* for data manipulation - I will revisit this dataset to add new variables or alter existing variables

* Having filled in my demographics table I need to generate my outcome variables for my actual analysis
* (29/06)

* Going to start with the sexual satisfaction variable (asked in the questionnaire as "Mum enjoys sex now"

tab sexsat_33mo
tab sexsat_33mo, nolabel
generate sexsat_bin_33mo = 1 if sexsat_33mo == 3 | sexsat_33mo ==4
replace sexsat_bin_33mo = 0 if sexsat_33mo == 1 | sexsat_33mo == 2
tab sexsat_bin_33mo
label define sexsat_bin_33mo_lb 0"Doesn't enjoy sex" 1"Enjoys sex"
label values sexsat_bin_33mo sexsat_bin_33mo_lb
tab sexsat_bin_33mo
label variable sexsat_bin_33mo"Sexual satisfaction at 33 months (binary)" 

tab sexsat_47mo
tab sexsat_47mo, nolabel
generate sexsat_bin_47mo = 1 if sexsat_47mo == 3 | sexsat_47mo ==4
replace sexsat_bin_47mo = 0 if sexsat_47mo == 1 | sexsat_47mo == 2
tab sexsat_bin_47mo
label define sexsat_bin_47mo_lb 0"Doesn't enjoy sex" 1"Enjoys sex"
label values sexsat_bin_47mo sexsat_bin_33mo_lb
tab sexsat_bin_47mo
label variable sexsat_bin_47mo"Sexual satisfaction at 47 months (binary)" 

tab sexsat_5yr
tab sexsat_5yr, nolabel
generate sexsat_bin_5yr = 1 if sexsat_5yr == 3 | sexsat_5yr ==4
replace sexsat_bin_5yr = 0 if sexsat_5yr == 1 | sexsat_5yr == 2
tab sexsat_bin_5yr
label values sexsat_bin_5yr sexsat_bin_33mo_lb
tab sexsat_bin_5yr
label variable sexsat_bin_5yr"Sexual satisfaction at 5 years (binary)" 

tab sexsat_6yr
tab sexsat_6yr, nolabel
generate sexsat_bin_6yr = 1 if sexsat_6yr == 3 | sexsat_6yr ==4
replace sexsat_bin_6yr = 0 if sexsat_6yr == 1 | sexsat_6yr == 2
tab sexsat_bin_6yr
label values sexsat_bin_6yr sexsat_bin_33mo_lb
tab sexsat_bin_6yr
label variable sexsat_bin_6yr"Sexual satisfaction at 6 years (binary)" 

tab sexsat_9yr
tab sexsat_9yr, nolabel
generate sexsat_bin_9yr = 1 if sexsat_9yr == 3 | sexsat_9yr ==4
replace sexsat_bin_9yr = 0 if sexsat_9yr == 1 | sexsat_9yr == 2
tab sexsat_bin_9yr
label values sexsat_bin_9yr sexsat_bin_33mo_lb
tab sexsat_bin_9yr
label variable sexsat_bin_9yr"Sexual satisfaction at 9 years (binary)" 

tab sexsat_12yr
tab sexsat_12yr, nolabel
generate sexsat_bin_12yr = 1 if sexsat_12yr == 3 | sexsat_12yr ==4
replace sexsat_bin_12yr = 0 if sexsat_12yr == 1 | sexsat_12yr == 2
tab sexsat_bin_12yr
label values sexsat_bin_12yr sexsat_bin_33mo_lb
tab sexsat_bin_12yr
label variable sexsat_bin_12yr"Sexual satisfaction at 12 years (binary)" 

tab sexsat_18yr
tab sexsat_18yr, nolabel
generate sexsat_bin_18yr = 1 if sexsat_18yr == 3 | sexsat_18yr ==4
replace sexsat_bin_18yr = 0 if sexsat_18yr == 1 | sexsat_18yr == 2
tab sexsat_bin_18yr
label values sexsat_bin_18yr sexsat_bin_33mo_lb
tab sexsat_bin_18yr
label variable sexsat_bin_18yr"Sexual satisfaction at 18 years (binary)"

* Now I will dichotomise sexual satisfaction with partner at timepoints where
* this question was asked

tab sexsat_partner_21mo
tab sexsat_partner_21mo, nolabel
generate sexsat_partbin_21mo = 1 if sexsat_partner_21mo ==1 | sexsat_partner_21mo ==2
replace sexsat_partbin_21mo = 0 if sexsat_partner_21mo ==3 | sexsat_partner_21mo ==4
tab sexsat_partbin_21mo
label define sexsat_partbin_21mo_lb 0"Unsatisfied" 1"Satisfied"
label values sexsat_partbin_21mo sexsat_partbin_21mo_lb
tab sexsat_partbin_21mo
label variable sexsat_partbin_21mo"Sexual satisfaction with partner at 21 months (binary)" 

tab sexsat_partner_33mo
tab sexsat_partner_33mo, nolabel
generate sexsat_partbin_33mo = 1 if sexsat_partner_33mo ==1 | sexsat_partner_33mo ==2
replace sexsat_partbin_33mo = 0 if sexsat_partner_33mo ==3 | sexsat_partner_33mo ==4
tab sexsat_partbin_33mo
label values sexsat_partbin_33mo sexsat_partbin_21mo_lb
tab sexsat_partbin_33mo
label variable sexsat_partbin_33mo"Sexual satisfaction with partner at 33 months (binary)" 

tab sexsat_partner_6yr
tab sexsat_partner_6yr, nolabel
generate sexsat_partbin_6yr = 1 if sexsat_partner_6yr ==1 | sexsat_partner_6yr ==2
replace sexsat_partbin_6yr = 0 if sexsat_partner_6yr ==3 | sexsat_partner_6yr ==4
tab sexsat_partbin_6yr
label values sexsat_partbin_6yr sexsat_partbin_21mo_lb
tab sexsat_partbin_6yr
label variable sexsat_partbin_6yr"Sexual satisfaction with partner at 6 years (binary)" 

tab sexsat_partner_9yr
tab sexsat_partner_9yr, nolabel
generate sexsat_partbin_9yr = 1 if sexsat_partner_9yr ==1 | sexsat_partner_9yr ==2
replace sexsat_partbin_9yr = 0 if sexsat_partner_9yr ==3 | sexsat_partner_9yr ==4
tab sexsat_partbin_9yr
label values sexsat_partbin_9yr sexsat_partbin_21mo_lb
tab sexsat_partbin_9yr
label variable sexsat_partbin_9yr"Sexual satisfaction with partner at 9 years (binary)" 

tab sexsat_partner_12yr
tab sexsat_partner_12yr, nolabel
generate sexsat_partbin_12yr = 1 if sexsat_partner_12yr ==1 | sexsat_partner_12yr ==2
replace sexsat_partbin_12yr = 0 if sexsat_partner_12yr ==3 | sexsat_partner_12yr ==4
tab sexsat_partbin_12yr
label values sexsat_partbin_12yr sexsat_partbin_21mo_lb
tab sexsat_partbin_12yr
label variable sexsat_partbin_12yr"Sexual satisfaction with partner at 12 years (binary)" 

* Now I will dichotomise sexual frequency into "Once a week or more" (1) and "Less than once a week"
* (0)

tab sexfreq_21mo
generate sexfreq_21mo_bin = 1 if sexfreq_21mo ==3 | sexfreq_21mo ==4 | sexfreq_21mo ==5
replace sexfreq_21mo_bin = 0 if sexfreq_21mo ==0 | sexfreq_21mo ==1 | sexfreq_21mo ==2
tab sexfreq_21mo_bin
label variable sexfreq_21mo_bin"More or less than once a week at 21 months"

generate sexfreq_33mo_bin = 1 if sexfreq_33mo ==3 | sexfreq_33mo ==4 | sexfreq_33mo ==5
replace sexfreq_33mo_bin = 0 if sexfreq_33mo ==0 | sexfreq_33mo ==1 | sexfreq_33mo ==2
tab sexfreq_33mo_bin
label variable sexfreq_33mo_bin"More or less than once a week at 33 months"

generate sexfreq_47mo_bin = 1 if sexfreq_47mo ==3 | sexfreq_47mo ==4 | sexfreq_47mo ==5
replace sexfreq_47mo_bin = 0 if sexfreq_47mo ==0 | sexfreq_47mo ==1 | sexfreq_47mo ==2
tab sexfreq_47mo_bin
label variable sexfreq_47mo_bin"More or less than once a week at 47 months"

generate sexfreq_5yr_bin = 1 if sexfreq_5yr ==3 | sexfreq_5yr ==4 | sexfreq_5yr ==5
replace sexfreq_5yr_bin = 0 if sexfreq_5yr ==0 | sexfreq_5yr ==1 | sexfreq_5yr ==2
tab sexfreq_5yr_bin
label variable sexfreq_5yr_bin"More or less than once a week at 5 years"

generate sexfreq_6yr_bin = 1 if sexfreq_6yr ==3 | sexfreq_6yr ==4 | sexfreq_6yr ==5
replace sexfreq_6yr_bin = 0 if sexfreq_6yr ==0 | sexfreq_6yr ==1 | sexfreq_6yr ==2
tab sexfreq_6yr_bin
label variable sexfreq_6yr_bin"More or less than once a week at 6 years"

generate sexfreq_9yr_bin = 1 if sexfreq_9yr ==3 | sexfreq_9yr ==4 | sexfreq_9yr ==5
replace sexfreq_9yr_bin = 0 if sexfreq_9yr ==0 | sexfreq_9yr ==1 | sexfreq_9yr ==2
tab sexfreq_9yr_bin
label variable sexfreq_9yr_bin"More or less than once a week at 9 years"

generate sexfreq_12yr_bin = 1 if sexfreq_12yr ==3 | sexfreq_12yr ==4 | sexfreq_12yr ==5
replace sexfreq_12yr_bin = 0 if sexfreq_12yr ==0 | sexfreq_12yr ==1 | sexfreq_12yr ==2
tab sexfreq_12yr_bin
label variable sexfreq_12yr_bin"More or less than once a week at 12 years"

generate sexfreq_18yr_bin = 1 if sexfreq_18yr ==3 | sexfreq_18yr ==4 | sexfreq_18yr ==5
replace sexfreq_18yr_bin = 0 if sexfreq_18yr ==0 | sexfreq_18yr ==1 | sexfreq_18yr ==2
tab sexfreq_18yr_bin
label variable sexfreq_18yr_bin"More or less than once a week at 18 years"

* In order to make the Chi-squared tests work for demographics I need to code each category of 
* the categorical variables as binary variables 

* Year of delivery 

tab year_delivery, nolabel
generate yrdel_1991 = 1 if year_delivery ==1991
replace yrdel_1991 = 0 if year_delivery ==1990 | year_delivery ==1992 | year_delivery ==1993
tab yrdel_1991
label define yrdel_1991_lb 0"Delivery not in 1991" 1"Delivery in 1991"
label values yrdel_1991 yrdel_1991_lb
tab yrdel_1991
label variable yrdel_1991"Delivery in 1991"

generate yrdel_1992 = 1 if year_delivery ==1992
replace yrdel_1992 = 0 if year_delivery ==1990 | year_delivery ==1991 | year_delivery ==1993
tab yrdel_1992
label define yrdel_1992_lb 0"Delivery not in 1992" 1"Delivery in 1992"
label values yrdel_1992 yrdel_1992_lb
tab yrdel_1992
label variable yrdel_1992"Delivery in 1992"

generate yrdel_1993 = 1 if year_delivery ==1993
replace yrdel_1993 = 0 if year_delivery ==1990 | year_delivery ==1992 | year_delivery ==1991
tab yrdel_1993
label define yrdel_1993_lb 0"Delivery not in 1993" 1"Delivery in 1993"
label values yrdel_1993 yrdel_1993_lb
tab yrdel_1993
label variable yrdel_1993"Delivery in 1993"

* Maternal age at delivery

tab matage_del_cat, nolabel
generate matage_cat1 = 1 if matage_del_cat ==1
replace matage_cat1 = 0 if matage_del_cat ==2 | matage_del_cat ==3 | matage_del_cat ==4 ///
| matage_del_cat ==5 | matage_del_cat ==6
tab matage_cat1
label variable matage_cat1"Binary maternal age category 1"

generate matage_cat2 = 1 if matage_del_cat ==2
replace matage_cat2 = 0 if matage_del_cat ==1 | matage_del_cat ==3 | matage_del_cat ==4 ///
| matage_del_cat ==5 | matage_del_cat ==6
tab matage_cat2
label variable matage_cat2"Binary maternal age category 2"

generate matage_cat3 = 1 if matage_del_cat ==3
replace matage_cat3 = 0 if matage_del_cat ==2 | matage_del_cat ==1 | matage_del_cat ==4 ///
| matage_del_cat ==5 | matage_del_cat ==6
tab matage_cat3
label variable matage_cat3"Binary maternal age category 3"

generate matage_cat4 = 1 if matage_del_cat ==4
replace matage_cat4 = 0 if matage_del_cat ==2 | matage_del_cat ==3 | matage_del_cat ==1 ///
| matage_del_cat ==5 | matage_del_cat ==6
tab matage_cat4
label variable matage_cat4"Binary maternal age category 4"

generate matage_cat5 = 1 if matage_del_cat ==5
replace matage_cat5 = 0 if matage_del_cat ==2 | matage_del_cat ==3 | matage_del_cat ==4 ///
| matage_del_cat ==1 | matage_del_cat ==6
tab matage_cat5
label variable matage_cat5"Binary maternal age category 5"

generate matage_cat6 = 1 if matage_del_cat ==6
replace matage_cat6 = 0 if matage_del_cat ==2 | matage_del_cat ==3 | matage_del_cat ==4 ///
| matage_del_cat ==5 | matage_del_cat ==1
tab matage_cat6
label variable matage_cat6"Binary maternal age category 6"

* Maternal ethnicity

tab mat_ethn_cat
generate matethn_white = 1 if mat_ethn_cat ==0
replace matethn_white = 0 if mat_ethn_cat ==1 | mat_ethn_cat ==2 | mat_ethn_cat ==3
tab matethn_white
label variable matethn_white"Maternal Ethnicity - White"

generate matethn_black = 1 if mat_ethn_cat ==1
replace matethn_black = 0 if mat_ethn_cat ==0 | mat_ethn_cat ==2 | mat_ethn_cat ==3
tab matethn_black
label variable matethn_black"Maternal Ethnicity - Black"

generate matethn_asian = 1 if mat_ethn_cat ==2
replace matethn_asian = 0 if mat_ethn_cat ==1 | mat_ethn_cat ==0 | mat_ethn_cat ==3
tab matethn_asian
label variable matethn_asian"Maternal Ethnicity - Asian"

generate matethn_other = 1 if mat_ethn_cat ==3
replace matethn_other = 0 if mat_ethn_cat ==1 | mat_ethn_cat ==2 | mat_ethn_cat ==0
tab matethn_other
label variable matethn_other"Maternal Ethnicity - Other"

* Maternal educational attainment

tab mat_edu_2, nolabel
generate matedu_cse = 1 if mat_edu_2 ==1
replace matedu_cse = 0 if mat_edu_2 ==2 | mat_edu_2 ==3 | mat_edu_2 ==4 | mat_edu_2 ==5
tab matedu_cse
label variable matedu_cse"Maternal education - CSE"

generate matedu_voc = 1 if mat_edu_2 ==2
replace matedu_voc = 0 if mat_edu_2 ==1 | mat_edu_2 ==3 | mat_edu_2 ==4 | mat_edu_2 ==5
tab matedu_voc
label variable matedu_voc"Maternal education - vocational"

generate matedu_olev = 1 if mat_edu_2 ==3
replace matedu_olev = 0 if mat_edu_2 ==2 | mat_edu_2 ==1 | mat_edu_2 ==4 | mat_edu_2 ==5
tab matedu_olev
label variable matedu_olev"Maternal education - O level"

generate matedu_alev = 1 if mat_edu_2 ==4
replace matedu_alev = 0 if mat_edu_2 ==2 | mat_edu_2 ==3 | mat_edu_2 ==1 | mat_edu_2 ==5
tab matedu_alev
label variable matedu_alev"Maternal education - A level"

generate matedu_degree = 1 if mat_edu_2 ==5
replace matedu_degree = 0 if mat_edu_2 ==2 | mat_edu_2 ==3 | mat_edu_2 ==4 | mat_edu_2 ==1
tab matedu_degree
label variable matedu_degree"Maternal education - Degree"

* Parity

tab parity_18wkgest, nolabel
generate parity_cat = 0 if parity_18wkgest ==0
replace parity_cat = 1 if parity_18wkgest ==1
replace parity_cat = 2 if parity_18wkgest ==2
replace parity_cat = 3 if parity_18wkgest ==3
replace parity_cat = 4 if parity_18wkgest >3
replace parity_cat = . if parity_18wkgest ==.
tab parity_cat vaginal_delivery
list parity_cat parity_18wkgest in 1000/1100

generate parity_0 = 1 if parity_cat ==0
replace parity_0 = 0 if parity_cat ==1 | parity_cat ==2 | parity_cat ==3 | parity_cat ==4
tab parity_0 
label variable parity_0"No children"

generate parity_1 = 1 if parity_cat ==1
replace parity_1 = 0 if parity_cat ==0 | parity_cat ==2 | parity_cat ==3 | parity_cat ==4
tab parity_1 
label variable parity_1"1 child"

generate parity_2 = 1 if parity_cat ==2
replace parity_2 = 0 if parity_cat ==1 | parity_cat ==0 | parity_cat ==3 | parity_cat ==4
tab parity_2
label variable parity_2"2 children"

generate parity_3 = 1 if parity_cat ==3
replace parity_3 = 0 if parity_cat ==1 | parity_cat ==2 | parity_cat ==0 | parity_cat ==4
tab parity_3
label variable parity_3"3 children"

generate parity_4 = 1 if parity_cat ==4
replace parity_4 = 0 if parity_cat ==1 | parity_cat ==2 | parity_cat ==3 | parity_cat ==0
tab parity_4 
label variable parity_4"More than 3 children"

* Maternal BMI at 12 weeks gestation

tab mat_bmi_cat, nolabel
generate mat_bmi_0 = 1 if mat_bmi_cat ==0
replace mat_bmi_0 = 0 if mat_bmi_cat ==1 | mat_bmi_cat ==2 | mat_bmi_cat ==3
tab mat_bmi_0
label variable mat_bmi_0"Underweight"

generate mat_bmi_1 = 1 if mat_bmi_cat ==1
replace mat_bmi_1 = 0 if mat_bmi_cat ==0 | mat_bmi_cat ==2 | mat_bmi_cat ==3
tab mat_bmi_1
label variable mat_bmi_1"Normal weight"

generate mat_bmi_2 = 1 if mat_bmi_cat ==2
replace mat_bmi_2 = 0 if mat_bmi_cat ==1 | mat_bmi_cat ==0 | mat_bmi_cat ==3
tab mat_bmi_2
label variable mat_bmi_2"Overweight"

generate mat_bmi_3 = 1 if mat_bmi_cat ==3
replace mat_bmi_3 = 0 if mat_bmi_cat ==1 | mat_bmi_cat ==2 | mat_bmi_cat ==0
tab mat_bmi_3
label variable mat_bmi_3"Obese"

* Time to deal with the 11 years dyspareunia variable for a secondary outcome

tab dyspareunia_11yr, nolabel
generate dyspareunia_bin = 1 if dyspareunia_11yr ==1 | dyspareunia ==2 | dyspareunia ==3
replace dyspareunia_bin = 0 if dyspareunia_11yr ==0
tab dyspareunia_bin
label define dyspareunia_bin_lb 0"No pain" 1"Pain"
label values dyspareunia_bin dyspareunia_bin_lb
tab dyspareunia_bin
list dyspareunia_11yr dyspareunia_bin in 1/100

tab pain_elsewhere_11yr, nolabel
generate pain_bin = 1 if pain_elsewhere_11yr ==1 | pain_elsewhere_11yr ==2 | pain_elsewhere_11yr ==3
replace pain_bin = 0 if pain_elsewhere_11yr ==0
label define pain_bin_lb 0"No pain elsewhere" 1"Pain elsewhere"
label values pain_bin pain_bin_lab
tab pain_bin

save flo_dataset.dta, replace
