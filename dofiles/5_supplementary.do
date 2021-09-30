
* Supplementary material - dropoint graphs showing the distribution of each answer at each timepoint by mode of delivery (VD and CS) & exploration of missing data

* Author: Flo Martin

* Date started: 12/04/2021

* Date finished: 15/06/2021

* Contents *
* line 14 Figure 1 - Likert scale figure *
* line 350 Missing data tables *

* Start logging
log using "$Logdir/log_supplementary.txt", text replace

* Change directory for saving graphs
cd "$Projectdir/graphfiles"

* Supplementary figure 1 - likert scale figure to show the distribution of answers (crude proportions)

* Sexual enjoyment
* 33 months
clear
input float barorder str10 mod float one two three four
1	"VD" 0.81 9.28 41.45 48.45
2	"CS" 0.29 8.24 41.32 50.15
end

set scheme s2color
graph bar one two three four, over(mod, sort(barorder) label(labsize(vsmall))) legend(label(1 "No, not at all") label(2 "No, not a lot") label(3 "Yes, somewhat") label(4 "Yes a lot") size(vsmall) row(4) region(margin(1 -1 2 2)) symxsize(*0.2)) bar(4, color("33 103 126%70")) bar(3, color("106 59 119%70")) bar(2, color("130 47 90%70")) bar(1, color("208 114 50%70")) stack ///
graphregion(color(white) margin(1 1 1 0.8)) ///
title("{bf:33 months}" "{bf:postpartum}", size(vsmall) color(black)) ///
l2title("{bf:Proportion of women (%)}", size(small)) ylabel(, nogrid labsize(vsmall)) ///
name(sexsat_likert_33mo, replace)

* 5 years
clear
input float barorder str10 mod float one two three four
1	"VD" 0.79 7.69 41.70 49.82
2	"CS" 0.95 8.21 39.81 51.03
end

set scheme s2color
graph bar one two three four, over(mod, sort(barorder) label(labsize(vsmall))) legend(label(1 "No, not at all") label(2 "No, not a lot") label(3 "Yes, somewhat") label(4 "Yes a lot") size(vsmall) row(4) region(margin(1 -1 2 2)) symxsize(*0.2)) bar(4, color("33 103 126%70")) bar(3, color("106 59 119%70")) bar(2, color("130 47 90%70")) bar(1, color("208 114 50%70"))  stack ///
title("{bf:5 years}" "{bf:postpartum}", size(vsmall) color(black)) ///
graphregion(color(white) margin(1 1 1 0.8)) ///
yscale(lstyle(none)) ///
l2title("{bf:Proportion of women (%)}", size(small) color(white)) ylabel(, labcolor(white) nogrid notick labsize(vsmall)) ///
name(sexsat_likert_5yr, replace)

* 12 years
clear
input float barorder str10 mod float one two three four
1	"VD" 0.72 7.14 43.65 48.49
2	"CS" 0.22 6.67 43.44 49.68
end

set scheme s2color
graph bar one two three four, over(mod, sort(barorder) label(labsize(vsmall))) legend(label(1 "No, not at all") label(2 "No, not a lot") label(3 "Yes, somewhat") label(4 "Yes a lot") size(vsmall) row(4) region(margin(1 -1 2 2)) symxsize(*0.2)) bar(4, color("33 103 126%70")) bar(3, color("106 59 119%70")) bar(2, color("130 47 90%70")) bar(1, color("208 114 50%70")) stack ///
title("{bf:12 years}" "{bf:postpartum}", size(vsmall) color(black)) ///
graphregion(color(white) margin(1 1 1 0.8)) ///
yscale(lstyle(none)) ///
l2title("{bf:Proportion of women (%)}", size(small) color(white)) ylabel(, labcolor(white) nogrid notick labsize(vsmall)) ///
name(sexsat_likert_12yr, replace)

* 18 years
clear
input float barorder str10 mod float one two three four
1	"VD" 1.38 9.36 43.68 45.57
2	"CS" 1.12 6.34 46.27 46.27
end

set scheme s2color
graph bar one two three four, over(mod, sort(barorder) label(labsize(vsmall))) legend(label(1 "No, not at all") label(2 "No, not a lot") label(3 "Yes, somewhat") label(4 "Yes a lot") size(vsmall) row(4) region(margin(1 -1 2 2)) symxsize(*0.2)) bar(4, color("33 103 126%70")) bar(3, color("106 59 119%70")) bar(2, color("130 47 90%70")) bar(1, color("208 114 50%70")) stack ///
title("{bf:18 years}" "{bf:postpartum}", size(vsmall) color(black)) ///
graphregion(color(white) margin(1 1 1 0.8)) ///
yscale(lstyle(none)) ///
l2title("{bf:Proportion of women (%)}", size(small) color(white)) ylabel(, labcolor(white) nogrid notick labsize(vsmall)) ///
name(sexsat_likert_18yr, replace)

grc1leg2 sexsat_likert_33mo sexsat_likert_5yr sexsat_likert_12yr sexsat_likert_18yr, rows(1) col(4) legendfrom(sexsat_likert_33mo) ring(1) pos(6) graphregion(lcolor(none) ilcolor(none) fcolor(white) ifcolor(white)) plotregion(lcolor(none) ilcolor(none) style(none) margin(zero)) name("likert_sat", replace) title("{bf: Sexual enjoyment}" "{bf:}", size(small) color(black) ring(1)) fxsize(100) fysize(100) 

* Dyspareunia

clear
input float barorder str10 mod float one two three four
1	"VD" 79.31 18.06 1.93 0.70
2	"CS" 69.15 26.06 3.55 1.24
end

set scheme s2color
graph bar one two three four, over(mod, sort(barorder) label(labsize(*0.45))) legend(label(1 "Not at all") label(2 "A little") label(3 "Moderate") label(4 "A lot") size(vsmall) row(4) region(margin(1 -1 2 2)) symxsize(*0.2)) bar(4, color("208 114 50%70")) bar(3, color("130 47 90%70")) bar(2, color("106 59 119%70")) bar(1, color("33 103 126%70")) stack ///
title("{bf:Pain in the vagina}" "{bf:during sex}", size(small) color(black) margin(b=2)) ///
subtitle("{bf:11 years}" "{bf:postpartum}", size(*0.42) color(black) margin(b=-0.5)) ///
graphregion(color(white) margin(1 1 1 0.8)) ///
yscale(lstyle(none)) ///
ylabel("", nogrid notick labsize(vsmall)) ///
b2title("t", color(white) size(*0.12)) ///
fxsize(20) fysize(100) ///
name(dyspareunia_likert_11yr, replace)

graph combine likert_sat dyspareunia_likert_11yr, graphregion(color(white)) name("supp_fig_1", replace) 

* Save supplementary figure 1 as .tif in graphfiles
graph export supp_fig_1.tif, name(supp_fig_1) replace

* Sexual frequency
* 33 months
clear
input float barorder str10 mod float one two three four five six
1	"VD" 9.71 11.41 27.34 25.30 24.19 2.04
2	"CS" 9.46 15.00 26.89 26.22 20.27 2.16
end

set scheme s2color
graph bar one two three four five six, over(mod, sort(barorder) label(labsize(vsmall))) legend(label(1 "Not at all") label(2 "Less than once" "a month") label(3 "1-3 times" "a month") label(4 "About once" "a week") label(5 "2-4 times" "a week") label(6 "5+ times" "a week") size(vsmall) row(3) region(margin(1 -1 2 2)) symxsize(*0.2)) bar(6, color("33 103 126%70")) bar(5, color("106 59 119%70")) bar(4, color("130 47 90%70")) bar(3, color("208 114 50%70")) bar(2, color("255 219 0%70")) bar(1, color("181 211 52%70")) stack ///
title("{bf:33 months}" "{bf:postpartum}", size(vsmall) color(black)) ///
graphregion(color(white)) ///
l2title("{bf:Proportion of women (%)}", size(small)) ylabel(, nogrid labsize(vsmall)) ///
name(sexfreq_likert_33mo, replace)

* 5 years
clear
input float barorder str10 mod float one two three four five six
1	"VD" 9.36 9.96 26.34 24.37 27.81 2.17
2	"CS" 8.63 13.01 27.63 27.92 21.05 1.75
end

set scheme s2color
graph bar one two three four five six, over(mod, sort(barorder) label(labsize(vsmall))) legend(label(1 "Not at all") label(2 "Less than once" "a month") label(3 "1-3 times" "a month") label(4 "About once" "a week") label(5 "2-4 times" "a week") label(6 "5+ times" "a week") size(vsmall) row(3) region(margin(1 -1 2 2)) symxsize(*0.2)) bar(6, color("33 103 126%70")) bar(5, color("106 59 119%70")) bar(4, color("130 47 90%70")) bar(3, color("208 114 50%70")) bar(2, color("255 219 0%70")) bar(1, color("181 211 52%70")) stack ///
title("{bf:5 years}" "{bf:postpartum}", size(vsmall) color(black)) ///
graphregion(color(white)) ///
yscale(lstyle(none)) ///
l2title("{bf:Proportion of women (%)}", size(small) color(white)) ylabel(, labcolor(white) nogrid notick labsize(vsmall)) ///
name(sexfreq_likert_5yr, replace)

* 12 years
clear
input float barorder str10 mod float one two three four five six
1	"VD" 12.40 13.81 25.68 23.02 22.95 2.15
2	"CS" 12.06 13.23 30.16 20.62 22.57 1.36
end

set scheme s2color
graph bar one two three four five six, over(mod, sort(barorder) label(labsize(vsmall))) legend(label(1 "Not at all") label(2 "Less than once" "a month") label(3 "1-3 times" "a month") label(4 "About once" "a week") label(5 "2-4 times" "a week") label(6 "5+ times" "a week") size(vsmall) row(3) region(margin(1 -1 2 2)) symxsize(*0.2)) bar(6, color("33 103 126%70")) bar(5, color("106 59 119%70")) bar(4, color("130 47 90%70")) bar(3, color("208 114 50%70")) bar(2, color("255 219 0%70")) bar(1, color("181 211 52%70")) stack ///
title("{bf:12 years}" "{bf:postpartum}", size(vsmall) color(black)) ///
graphregion(color(white)) ///
yscale(lstyle(none)) ///
l2title("{bf:Proportion of women (%)}", size(small) color(white)) ylabel(, labcolor(white) nogrid notick labsize(vsmall)) ///
name(sexfreq_likert_12yr, replace)

* 18 years
clear
input float barorder str10 mod float one two three four five six
1	"VD" 19.20 17.62 21.83 22 18.15 1.19
2	"CS" 18.99 20.89 20.89 18.35 19.30 1.58
end

set scheme s2color
graph bar one two three four five six, over(mod, sort(barorder) label(labsize(vsmall))) legend(label(1 "Not at all") label(2 "Less than once" "a month") label(3 "1-3 times" "a month") label(4 "About once" "a week") label(5 "2-4 times" "a week") label(6 "5+ times" "a week") size(vsmall) row(3) region(margin(1 -1 2 2)) symxsize(*0.2)) bar(6, color("33 103 126%70")) bar(5, color("106 59 119%70")) bar(4, color("130 47 90%70")) bar(3, color("208 114 50%70")) bar(2, color("255 219 0%70")) bar(1, color("181 211 52%70")) stack ///
title("{bf:18 years}" "{bf:postpartum}", size(vsmall) color(black)) ///
graphregion(color(white)) ///
yscale(lstyle(none)) ///
l2title("{bf:Proportion of women (%)}", size(small) color(white)) ylabel(, labcolor(white) nogrid notick labsize(vsmall)) ///
name(sexfreq_likert_18yr, replace)

grc1leg2 sexfreq_likert_33mo sexfreq_likert_5yr sexfreq_likert_12yr sexfreq_likert_18yr, rows(1) col(4) legendfrom(sexfreq_likert_33mo) ring(1) pos(6) graphregion(lcolor(none) ilcolor(none) fcolor(white) ifcolor(white)) plotregion(lcolor(none) ilcolor(none) style(none) margin(zero)) name("likert_freq", replace) title("{bf: Sexual frequency}", size(small) color(black) ring(1)) fxsize(100) fysize(100) 

* Pain elsewhere
clear
input float barorder str10 mod float one two three four
1	"VD" 92.16 6.58 1.07 0.19
2	"CS" 88.67 9.51 1.65 0.18
end

set scheme s2color
graph bar one two three four, over(mod, sort(barorder) label(labsize(*0.45))) legend(label(1 "Never") label(2 "Occasional") label(3 "Often") label(4 "Always") size(vsmall) row(4) region(margin(1 -1 2 2)) symxsize(*0.2)) bar(4, color("208 114 50%70")) bar(3, color("130 47 90%70")) bar(2, color("106 59 119%70")) bar(1, color("33 103 126%70")) stack ///
title("{bf:Pain elsewhere}" "{bf:after sex}", size(small) color(black) margin(b=2)) ///
subtitle("{bf:11 years}" "{bf:postpartum}", size(*0.42) color(black) margin(b=-0.5)) ///
graphregion(color(white) margin(1 1 1 0.8)) ///
yscale(lstyle(none)) ///
ylabel("", nogrid notick labsize(vsmall)) ///
fxsize(20) fysize(100) ///
name(pain_elsewhere, replace)

graph combine likert_freq pain_elsewhere, rows(1) graphregion(color(white)) name("supp_fig_2", replace)

* Save supplementary figure 2 as .tif in graphfiles
graph export supp_fig_2.tif, name(supp_fig_2) replace

* Supplementary tables exploring missing data
* Load in the full cleaned dataset without complete cases removed
cd "$Projectdir/datafiles"
use flo_dataset.dta, clear

* Count the total number of participants in the cleaned dataset
count 

* Count the complete cases for each individual variable
tab1 vaginal_delivery bmi_cat age_cat mat_degree cc_anxiety_bin epds_bin parity_bin sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr dyspareunia_11yr pain_elsewhere_11yr

* Now count all these in my complete cases for sexual enjoyment, frequency and pain
use flo_dataset_cc.dta, clear

tab1 vaginal_delivery bmi_cat age_cat mat_degree cc_anxiety_bin epds_bin parity_bin sexsat_33mo if sexsat_33mo !=.
tab1 vaginal_delivery bmi_cat age_cat mat_degree cc_anxiety_bin epds_bin parity_bin sexsat_5yr if sexsat_5yr !=.
tab1 vaginal_delivery bmi_cat age_cat mat_degree cc_anxiety_bin epds_bin parity_bin sexsat_12yr if sexsat_12yr !=.
tab1 vaginal_delivery bmi_cat age_cat mat_degree cc_anxiety_bin epds_bin parity_bin sexsat_18yr if sexsat_18yr !=.

tab1 vaginal_delivery bmi_cat age_cat mat_degree cc_anxiety_bin epds_bin parity_bin sexfreq_33mo if sexfreq_33mo !=.
tab1 vaginal_delivery bmi_cat age_cat mat_degree cc_anxiety_bin epds_bin parity_bin sexfreq_5yr if sexfreq_5yr !=.
tab1 vaginal_delivery bmi_cat age_cat mat_degree cc_anxiety_bin epds_bin parity_bin sexfreq_12yr if sexfreq_12yr !=.
tab1 vaginal_delivery bmi_cat age_cat mat_degree cc_anxiety_bin epds_bin parity_bin sexfreq_18yr if sexfreq_18yr !=.

tab1 vaginal_delivery bmi_cat age_cat mat_degree cc_anxiety_bin epds_bin parity_bin dyspareunia_11yr if dyspareunia_11yr !=.
tab1 vaginal_delivery bmi_cat age_cat mat_degree cc_anxiety_bin epds_bin parity_bin pain_elsewhere_11yr if pain_elsewhere_11yr !=.

* Load in the full cleaned dataset without complete cases removed
use flo_dataset.dta, clear

* Now time for the predictors of being a complete case - exposure = characteristics outcome = being a complete case
logistic cc vaginal_delivery
logistic cc i.bmi_cat
logistic cc age_cat
logistic cc mat_degree
logistic cc cc_anxiety_bin
logistic cc epds_bin
logistic cc parity_bin
logistic cc i.sexsat_33mo 
logistic cc i.sexsat_5yr
logistic cc i.sexsat_12yr
logistic cc i.sexsat_18yr
logistic cc i.sexfreq_33mo
logistic cc i.sexfreq_5yr
logistic cc i.sexfreq_12yr
logistic cc i.sexfreq_18yr
logistic cc i.dyspareunia_11yr
logistic cc i.pain_elsewhere_11yr

* To inform the rationale for multiple imputation, we wanted to see how many people had selectively not responded to the questions regarding sexual outcomes but had returned the questionnaire

* Missingness
* N (total number with missing outcome)
count if sexsat_33mo ==. 
count if sexsat_5yr ==. 
count if sexsat_12yr ==. 
count if sexsat_18yr ==.

count if sexfreq_33mo ==. 
count if sexfreq_5yr ==. 
count if sexfreq_12yr ==. 
count if sexfreq_18yr ==.

count if dyspareunia_11yr ==. 
count if pain_elsewhere_11yr ==.

* Missing outcome who returned the questionnaire
* Missing outcome who did not return the questionnaire

* Sexual enjoyment
count if sexsat_33mo ==. & h001 ==1
count if sexsat_33mo ==. & h001 ==0

count if sexsat_5yr ==. & k0007a ==1
count if sexsat_5yr ==. & k0007a ==0

count if sexsat_12yr ==. & s0007a ==1
count if sexsat_12yr ==. & s0007a ==0

count if sexsat_18yr ==. & t0007a ==1
count if sexsat_18yr ==. & t0007a ==0

* Sexual frequency
count if sexfreq_33mo ==. & h001 ==1
count if sexfreq_33mo ==. & h001 ==0

count if sexfreq_5yr ==. & k0007a ==1
count if sexfreq_5yr ==. & k0007a ==0

count if sexfreq_12yr ==. & s0007a ==1
count if sexfreq_12yr ==. & s0007a ==0

count if sexfreq_18yr ==. & t0007a ==1
count if sexfreq_18yr ==. & t0007a ==0

* Sex-related pain
count if dyspareunia_11yr ==. & r0007a ==1
count if dyspareunia_11yr ==. & r0007a ==0

count if pain_elsewhere_11yr ==. & r0007a ==1
count if pain_elsewhere_11yr ==. & r0007a ==0

* Stop logging
log close
