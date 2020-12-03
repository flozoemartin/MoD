*****************************************************************************************************************************************************************
*                                                                                                                                      				*
*                                                                                                                                      				*
*     Mode of delivery on sexual outcomes using the ALSPAC cohort - Data Anlysis                                                       				*
*                                                                                                                                      				*
*     Author:       Flo Martin                                                                                                         				*
*     Date started: 11/11/2020                                                                                                         				*
*                                                                                                                                      				*
*                                                                                                                                      				*
*****************************************************************************************************************************************************************

* This is a revised do-file for the data analysis performed for my MSc dissertation - I have knitted together the useful parts of the do-files I had for analysis, in the order in which the information is required for the manuscript. I will also be adding the revised regressions (ordinal logistic) and the imputation model for missing data.

cd "/Users/ti19522/OneDrive - University of Bristol/Documents/PhD/Year 1/ALSPAC MoD Study/Data"
use flo_dataset.dta, clear

* First in the manuscript is the flow diagram of participants through the study - important to know who is being lost at each stage. qlet = A ensures each mother is only counted once and mod < 6 excludes women with a mode of delivery coded as other. This can be added to as exclusion criteria is determined

count if qlet == "A"
count if qlet == "A" & mod < 6

* Next, for each outcome variable (enjoyment, frequency & pain) I am going to count the number of women at each timepoint

tab mod if qlet == "A"
tab caesarean if qlet == "A"
generate new_cs = 1 if caesarean ==1 | caesarean ==2
replace new_cs = 0 if caesarean !=1 & caesarean !=2
tab mod new_cs if qlet == "A"

* There are two women who have been coded as breech extraction and CS so I want to remove
* them as well as two women coded as forceps & caesarean
drop if new_cs ==1 & mod ==2
drop if new_cs ==1 & mod ==4
tab mod new_cs if qlet == "A"
tab mod if qlet == "A" & mod <6

* Now I have added the women who are coded in mod as other but caesarean as emergency CS to the CS group in mod - now the groups I have aren't "contaminated" with multiple methods of birth
tab mod caesarean if qlet == "A" 
recode mod (6 = 3) if mod ==6 & caesarean ==2 
tab mod caesarean if qlet == "A"

* Now I need to look at the distribution of complete case women at each timepoint for each outcome stratified by each exposure comparison (VD vs CS, non-ins vs ins, elective vs emergency)
drop if mod ==6 
drop vaginal_delivery

generate vaginal_delivery = 0 if mod !=3  
replace vaginal_delivery = 1 if mod ==3
replace vaginal_delivery =. if mod ==.
list mod vaginal_delivery in 1/100
tab vaginal_delivery if qlet == "A"
label values vaginal_delivery vaginal_delivery_lb
tab vaginal_delivery
label variable vaginal_delivery"Vaginal delivery (VD) vs Caesarean section (CS)"

tab instrumental_del if qlet == "A"
label variable instrumental_del"Non-instrumental VD vs Instrumental VD"

generate caesarean_bin = 1 if caesarean == 2
replace caesarean_bin = 0 if caesarean == 1
tab caesarean_bin if qlet == "A"
label define caesarean_bin_lb 1"Emergency CS" 0"Elective CS"
label values caesarean_bin caesarean_bin_lb
tab caesarean_bin
label variable caesarean_bin"Elective CS vs Emergency CS"

tab vaginal_delivery
tab vaginal_delivery if qlet == "A"
drop if qlet == "B"
tab vaginal_delivery

save flo_dataset2ndDec.dta, replace

* Distribution of answers for each primary outcome in vaginal delivery vs caesarean section
* Sexual enjoyment
foreach varname of varlist sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr {
	tab vaginal_delivery `varname' if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
}

* 33 months
histogram sexsat_33mo if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(vaginal_delivery) xlabel(0(1)4, valuelabel labsize(1.5)) title(33 months postpartum, size(3)) 

* 5 years
histogram sexsat_5yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(vaginal_delivery) xlabel(0(1)4, valuelabel labsize(1.5)) title(5 years postpartum, size(3))  
* 12 years
histogram sexsat_12yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(vaginal_delivery) xlabel(0(1)4, valuelabel labsize(1.5)) title(12 years postpartum, size(3)) 

* 18 years
histogram sexsat_18yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(vaginal_delivery) xlabel(0(1)4, valuelabel labsize(1.5)) title(18 years postpartum, size(3))  

* Sexual frequency
foreach varname of varlist sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr {
	tab `varname' vaginal_delivery  if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
}

* 33 months 
histogram sexfreq_33mo if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(vaginal_delivery) xlabel(0(1)5, valuelabel labsize(1.2)) title(33 months postpartum, size(3))

* 5 years
histogram sexfreq_5yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(vaginal_delivery) xlabel(0(1)5, valuelabel labsize(1.2)) title(5 years postpartum, size(3))

* 12 years
histogram sexfreq_12yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(vaginal_delivery) xlabel(0(1)5, valuelabel labsize(1.2)) title(12 years postpartum, size(3))

* 18 years
histogram sexfreq_18yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(vaginal_delivery) xlabel(0(1)5, valuelabel labsize(1.2)) title(18 years postpartum, size(3))

* Dyspareunia
tab vaginal_delivery dyspareunia_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.

histogram dyspareunia_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(vaginal_delivery) xlabel(0(1)3, valuelabel labsize(1.5)) title(11 years postpartum, size(3))

tab vaginal_delivery pain_elsewhere_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.

histogram pain_elsewhere_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(vaginal_delivery) xlabel(0(1)4, valuelabel labsize(1.5)) title(11 years postpartum, size(3))

* Distribution of answers for each primary outcome in instrumental vaginal delivery vs non-instrumental
* Sexual enjoyment
foreach varname of varlist sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr {
	tab instrumental_del `varname' if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
}

* 33 months
histogram sexsat_33mo if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(instrumental_del) xlabel(0(1)4, valuelabel labsize(1.5)) title(33 months postpartum, size(3)) 

* 5 years
histogram sexsat_5yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(instrumental_del) xlabel(0(1)4, valuelabel labsize(1.5)) title(5 years postpartum, size(3))  
* 12 years
histogram sexsat_12yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(instrumental_del) xlabel(0(1)4, valuelabel labsize(1.5)) title(12 years postpartum, size(3)) 

* 18 years
histogram sexsat_18yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(instrumental_del) xlabel(0(1)4, valuelabel labsize(1.5)) title(18 years postpartum, size(3))  

* Sexual frequency
foreach varname of varlist sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr {
	tab `varname' instrumental_del  if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
}

* 33 months 
histogram sexfreq_33mo if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(instrumental_del) xlabel(0(1)5, valuelabel labsize(1.2)) title(33 months postpartum, size(3))

* 5 years
histogram sexfreq_5yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(instrumental_del) xlabel(0(1)5, valuelabel labsize(1.2)) title(5 years postpartum, size(3))

* 12 years
histogram sexfreq_12yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(instrumental_del) xlabel(0(1)5, valuelabel labsize(1.2)) title(12 years postpartum, size(3))

* 18 years
histogram sexfreq_18yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(instrumental_del) xlabel(0(1)5, valuelabel labsize(1.2)) title(18 years postpartum, size(3))

* Dyspareunia
tab instrumental_del dyspareunia_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.

histogram dyspareunia_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(instrumental_del) xlabel(0(1)3, valuelabel labsize(1.5)) title(11 years postpartum, size(3))

tab instrumental_del pain_elsewhere_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.

histogram pain_elsewhere_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(instrumental_del) xlabel(0(1)4, valuelabel labsize(1.5)) title(11 years postpartum, size(3))

* Distribution of answers for each primary outcome in elective CS vs emergency CS
* Sexual enjoyment
foreach varname of varlist sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr {
	tab caesarean_bin `varname' if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
}

* 33 months
histogram sexsat_33mo if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(caesarean_bin) xlabel(0(1)4, valuelabel labsize(1.5)) title(33 months postpartum, size(3)) 

* 5 years
histogram sexsat_5yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(caesarean_bin) xlabel(0(1)4, valuelabel labsize(1.5)) title(5 years postpartum, size(3))  
* 12 years
histogram sexsat_12yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(caesarean_bin) xlabel(0(1)4, valuelabel labsize(1.5)) title(12 years postpartum, size(3)) 

* 18 years
histogram sexsat_18yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(caesarean_bin) xlabel(0(1)4, valuelabel labsize(1.5)) title(18 years postpartum, size(3))  

* Sexual frequency
foreach varname of varlist sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr {
	tab `varname' caesarean_bin  if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
}

* 33 months 
histogram sexfreq_33mo if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(caesarean_bin) xlabel(0(1)5, valuelabel labsize(1.2)) title(33 months postpartum, size(3))

* 5 years
histogram sexfreq_5yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(caesarean_bin) xlabel(0(1)5, valuelabel labsize(1.2)) title(5 years postpartum, size(3))

* 12 years
histogram sexfreq_12yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(caesarean_bin) xlabel(0(1)5, valuelabel labsize(1.2)) title(12 years postpartum, size(3))

* 18 years
histogram sexfreq_18yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(caesarean_bin) xlabel(0(1)5, valuelabel labsize(1.2)) title(18 years postpartum, size(3))

* Dyspareunia
tab caesarean_bin dyspareunia_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.

histogram dyspareunia_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(caesarean_bin) xlabel(0(1)3, valuelabel labsize(1.5)) title(11 years postpartum, size(3))

tab caesarean_bin pain_elsewhere_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.

histogram pain_elsewhere_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(caesarean_bin) xlabel(0(1)4, valuelabel labsize(1.5)) title(11 years postpartum, size(3))
