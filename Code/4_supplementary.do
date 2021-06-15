
* Supplementary material - dropoint graphs showing the distribution of each answer at each timepoint by mode of delivery (VD and CS) & exploration of missing data

* Author: Flo Martin

* Date started: 12/04/2021

* Date finished: 15/06/2021

* Contents *
* line 14 Figure 1 - Likert scale figure *
* line 350 Missing data tables *

* Supplementary figure 1 - likert scale figure to show the distribution of answers (crude proportions)
* Sexual enjoyment

* 33 months
clear
delivery category id percent
1 Vaginal 1 .81
1 CS 2 .29
2 Vaginal 1.2 9.28
2 CS 2.2 8.24
3 Vaginal 1.4 41.45
3 CS 2.4 41.32
4 Vaginal 1.6 48.45
4 CS 2.6 50.15
end

set scheme s2color

two (dropline percent id if delivery==1, ms(o))  ///
    (dropline percent id if delivery==2, ms(o))  ///
	  (dropline percent id if delivery==3, ms(o))  ///
    (dropline percent id if delivery==4, ms(o))  ///
     , name(sexsat_33mo, replace)  ///
	  xlab(1.3 "{bf}Vaginal delivery" 2.3 "{bf}Caesarean section", labsize(*0.7))  ///
	  xscale(r(0.8 2.8))  xtitle("")  ytitle("") l2title("{bf:Proportion (%)}", size(small))  ///
	  legend(row(1) size(vsmall) lab(1 "No, not at all") lab(2 "No, not a lot") lab(3 "Yes, somewhat") lab(4 "Yes, a lot") symxsize(*.3) )    ///
    title("{bf}33 months" "{bf}postpartum", size(small) color(black)) xtitle("") ///
	  yscale(range (0 52)) ylabel(0(10)50,angle(.45) format(%2.0f) labsize(*0.7)) ///
	  graphregion(color(white) margin(zero)) plotregion(margin(0 0 0 0)) ///
	  text(4 1 "0.81%", size(*0.7)) ///
	  text(4 2 "0.29%", size(*0.7))
    
* 5 years
clear
delivery category id percent
1 Vaginal 1 .79
1 CS 2 .95
2 Vaginal 1.2 7.69
2 CS 2.2 8.21
3 Vaginal 1.4 41.7
3 CS 2.4 39.81
4 Vaginal 1.6 49.82
4 CS 2.6 51.03
end

set scheme s2color

two (dropline percent id if delivery==1, ms(o))  ///
    (dropline percent id if delivery==2, ms(o))  ///
	  (dropline percent id if delivery==3, ms(o))  ///
    (dropline percent id if delivery==4, ms(o))  ///
     , name(sexsat_5yr, replace)  ///
	  xlab(1.3 "{bf}Vaginal delivery" 2.3 "{bf}Caesarean section", labsize(*0.7))  ///
	  xscale(r(0.8 2.8))  xtitle("") ytitle("") ///
	  legend(row(2) size(vsmall) lab(1 "No, not at all") lab(2 "No, not a lot") lab(3 "Yes, somewhat") lab(4 "Yes, a lot") symxsize(*.3))    ///
    title("{bf}5 years" "{bf}postpartum", size(small) color(black)) xtitle("") ///
	  yscale(range(0 52) lstyle(none)) ylabel(,angle(.45) format(%03.1f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
	  graphregion(color(white) margin(zero)) plotregion(margin(0 0 0 0)) ///
	  text(4 1 "0.79%", size(*0.7)) ///
	  text(4 2 "0.95%", size(*0.7))
    
* 12 years
clear
delivery category id percent
1 Vaginal 1 .72
1 CS 2 .22
2 Vaginal 1.2 7.15
2 CS 2.2 6.67
3 Vaginal 1.4 43.65
3 CS 2.4 43.44
4 Vaginal 1.6 48.49
4 CS 2.6 49.68
end

set scheme s2color

two (dropline percent id if delivery==1, ms(o))  ///
    (dropline percent id if delivery==2, ms(o))  ///
	  (dropline percent id if delivery==3, ms(o))  ///
    (dropline percent id if delivery==4, ms(o))  ///
     , name(sexsat_12yr, replace)  ///
	  xlab(1.3 "{bf}Vaginal delivery" 2.3 "{bf}Caesarean section", labsize(*0.7))  ///
	  xscale(r(0.8 2.8))  xtitle("")  ytitle("")  ///
	  legend(row(2) size(vsmall) lab(1 "No, not at all") lab(2 "No, not a lot") lab(3 "Yes, somewhat") lab(4 "Yes, a lot") symxsize(*.3)) ///
    title("{bf}12 years" "{bf}postpartum", size(small) color(black)) xtitle("") ///
	  yscale(range(0 52) lstyle(none)) ylabel(,angle(.45) format(%03.1f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
	  graphregion(color(white) margin(zero)) plotregion(margin(0 0 0 0)) ///
	  text(4 1 "0.72%", size(*0.7)) ///
	  text(4 2 "0.22%", size(*0.7))
    
* 18 years
clear
delivery category id percent
1 Vaginal 1 1.38
1 CS 2 1.12
2 Vaginal 1.2 9.36
2 CS 2.2 6.34
3 Vaginal 1.4 43.68
3 CS 2.4 46.27
4 Vaginal 1.6 45.57
4 CS 2.6 46.27
end

set scheme s2color

two (dropline percent id if delivery==1, ms(o))  ///
    (dropline percent id if delivery==2, ms(o))  ///
	  (dropline percent id if delivery==3, ms(o))  ///
    (dropline percent id if delivery==4, ms(o))  ///
     , name(sexsat_18yr, replace)  ///
	  xlab(1.3 "{bf}Vaginal delivery" 2.3 "{bf}Caesarean section", labsize(*0.7))  ///
	  xscale(r(0.8 2.8))  xtitle("")  ytitle("")  ///
	  legend(row(2) size(vsmall) lab(1 "No, not at all") lab(2 "No, not a lot") lab(3 "Yes, somewhat") lab(4 "Yes, a lot") symxsize(*.3)) ///
    title("{bf}18 years" "{bf}postpartum", size(small) color(black)) xtitle("") ///
	  yscale(range (0 52) lstyle(none)) ylabel(,angle(.45) format(%03.1f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
	  graphregion(color(white) margin(zero)) plotregion(margin(0 0 0 0)) ///
	  text(4.5 1 "1.38%", size(*0.7)) ///
	  text(4.5 2 "1.12%", size(*0.7))
    
* Combine all four sexual enjoyment timepoints
grc1leg2 sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr, rows(1) col(4) legendfrom(sexsat_33mo) ring(1) pos(6) graphregion(lcolor(none) ilcolor(none) fcolor(white) ifcolor(white)) plotregion(lcolor(none) ilcolor(none) style(none) margin(zero)) name("likert_sat", replace) title("{bf: Sexual enjoyment}", size(small) color(black) ring(1))

* Sexual frequency
* 33 months
clear
delivery category id percent
1 Vaginal 1 9.71
1 CS 3 9.46
2 Vaginal 1.2 11.41
2 CS 3.2 15
3 Vaginal 1.4 27.34
3 CS 3.4 26.89
4 Vaginal 1.6 25.3
4 CS 3.6 26.22
5 Vaginal 1.8 24.19
5 CS 3.8 20.27
6 Vaginal 2 2.04
6 CS 4 2.16
end

set scheme s2color

two (dropline percent id if delivery==1, ms(o))  ///
    (dropline percent id if delivery==2, ms(o))  ///
	  (dropline percent id if delivery==3, ms(o))  ///
	  (dropline percent id if delivery==4, ms(o))  ///
	  (dropline percent id if delivery==5, ms(o))  ///
	  (dropline percent id if delivery==6, ms(o))  ///
     , name(sexfreq_33mo, replace)  ///
	  xlab(1.5 "{bf}Vaginal delivery" 3.5 "{bf}Caesarean section", labsize(*0.7))  ///
	  xscale(r(0.8 4.2))  xtitle("")  ytitle("") l2title("{bf:Proportion (%)}", size(small)) ///
	 legend(row(1) size(vsmall) lab(1 "Not at all") lab(2 "< once a week") lab(3 "1-3 times a month") lab(4 "About once a week") lab(5 "1-3 times a week") lab(6 "> 5 times a week") symxsize(*.3) )    ///
    title("{bf}33 months" "{bf}postpartum", size(small) color(black)) xtitle("") ///
	  yscale(range (0 32)) ylabel(0(10)30,angle(.45) format(%2.0f) labsize(*0.7)) ///
	  graphregion(color(white) margin(zero)) plotregion(margin(0 0 0 0)) ///
	  text(4.5 2.1 "2.04%", size(*0.7)) ///
	  text(4.5 4 "2.16%", size(*0.7))
    
* 5 years
clear
delivery category id percent
1 Vaginal 1 9.36
1 CS 3 8.63
2 Vaginal 1.2 9.96
2 CS 3.2 13.01
3 Vaginal 1.4 26.34
3 CS 3.4 27.63
4 Vaginal 1.6 24.37
4 CS 3.6 27.92
5 Vaginal 1.8 27.81
5 CS 3.8 21.05
6 Vaginal 2 2.17
6 CS 4 1.75
end

set scheme s2color

two (dropline percent id if delivery==1, ms(o))  ///
    (dropline percent id if delivery==2, ms(o))  ///
	  (dropline percent id if delivery==3, ms(o))  ///
	  (dropline percent id if delivery==4, ms(o))  ///
	  (dropline percent id if delivery==5, ms(o))  ///
	  (dropline percent id if delivery==6, ms(o))  ///
     , name(sexfreq_5yr, replace)  ///
	 xlab(1.5 "{bf}Vaginal delivery" 3.5 "{bf}Caesarean section", labsize(*0.7))  ///
	 xscale(r(0.8 4.2))  xtitle("")  ytitle("Percent (%)")  ///
	 legend(row(3) size(vsmall) lab(1 "Not at all") lab(2 "< once a week") lab(3 "1-3 times a month") lab(4 "About once a week") lab(5 "1-3 times a week") lab(6 "> 5 times a week") symxsize(*.3))    ///
    title("{bf}5 years" "{bf}postpartum", size(small) color(black)) xtitle("") ///
	  yscale(range (0 32) lstyle(none)) ylabel(,angle(.45) format(%03.1f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
	  graphregion(color(white) margin(zero)) plotregion(margin(0 0 0 0)) ///
	  text(4.5 2.1 "2.17%", size(*0.7)) ///
	  text(4.5 4 "1.75%", size(*0.7))
    
* 12 years
clear
delivery category id percent
1 Vaginal 1 12.4
1 CS 3 12.06
2 Vaginal 1.2 13.81
2 CS 3.2 12.06
3 Vaginal 1.4 25.68
3 CS 3.4 30.16
4 Vaginal 1.6 23.02
4 CS 3.6 20.62
5 Vaginal 1.8 22.95
5 CS 3.8 22.57
6 Vaginal 2 2.15
6 CS 4 1.36
end

set scheme s2color

two (dropline percent id if delivery==1, ms(o))  ///
    (dropline percent id if delivery==2, ms(o))  ///
	  (dropline percent id if delivery==3, ms(o))  ///
	  (dropline percent id if delivery==4, ms(o))  ///
	  (dropline percent id if delivery==5, ms(o))  ///
	  (dropline percent id if delivery==6, ms(o))  ///
     , name(sexfreq_12yr, replace)  ///
	   xlab(1.5 "{bf}Vaginal delivery" 3.5 "{bf}Caesarean section", labsize(*0.7))  ///
	  xscale(r(0.8 4.2))  xtitle("")  ytitle("Percent (%)")  ///
    legend(row(3) size(vsmall) lab(1 "Not at all") lab(2 "< once a week") lab(3 "1-3 times a month") lab(4 "About once a week") lab(5 "1-3 times a week") lab(6 "> 5 times a week") symxsize(*.3) )    ///
    title("{bf}12 years" "{bf}postpartum", size(small) color(black)) xtitle("") ///
	  yscale(range (0 32) lstyle(none)) ylabel(,angle(.45) format(%03.1f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
	  graphregion(color(white) margin(zero)) plotregion(margin(0 0 0 0)) ///
	  text(4.5 2.1 "2.15%", size(*0.7)) ///
	  text(4 4 "1.36%", size(*0.7))
    
* 18 years
clear
delivery category id percent
1 Vaginal 1 19.2
1 CS 3 18.99
2 Vaginal 1.2 17.62
2 CS 3.2 20.89
3 Vaginal 1.4 21.83
3 CS 3.4 20.89
4 Vaginal 1.6 22
4 CS 3.6 18.35
5 Vaginal 1.8 18.15
5 CS 3.8 19.3
6 Vaginal 2 1.19
6 CS 4 1.58
end

set scheme s2color

two (dropline percent id if delivery==1, ms(o))  ///
    (dropline percent id if delivery==2, ms(o))  ///
	  (dropline percent id if delivery==3, ms(o))  ///
	  (dropline percent id if delivery==4, ms(o))  ///
	  (dropline percent id if delivery==5, ms(o))  ///
	  (dropline percent id if delivery==6, ms(o))  ///
     , name(sexfreq_18yr, replace)  ///
	  xlab(1.5 "{bf}Vaginal delivery" 3.5 "{bf}Caesarean section", labsize(*0.7))  ///
	  xscale(r(0.8 4.2))  xtitle("")  ytitle("Percent (%)")  ///
	  legend(row(3) size(vsmall) lab(1 "Not at all") lab(2 "< once a week") lab(3 "1-3 times a month") lab(4 "About once a week") lab(5 "1-3 times a week") lab(6 "> 5 times a week") symxsize(*.3) )    ///
    title("{bf}18 years" "{bf}postpartum", size(small) color(black)) xtitle("") ///
	  yscale(range (0 32) lstyle(none)) ylabel(,angle(.45) format(%03.1f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
	  graphregion(color(white) margin(zero)) plotregion(margin(0 0 0 0)) ///
	  text(4 2.1 "1.19%", size(*0.7)) ///
	  text(4 4 "1.58%", size(*0.7))
    
* Combine the sexual frequency bits
grc1leg2 sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr, rows(1) col(4) legendfrom(sexfreq_33mo) ring(1) pos(6) graphregion(lcolor(none) ilcolor(none) fcolor(white) ifcolor(white)) plotregion(lcolor(none) ilcolor(none) style(none) margin(zero)) name("likert_freq", replace) title("{bf:Sexual frequency}", size(small) color(black) ring(1)) 

* Now combine sexual enjoyment with sexual frequency
graph combine likert_sat likert_freq, row(2) name("likert_sat_freq", replace) fxsize(200) fysize(300) plotregion(margin(-2 -2 -2 -2))

* Pain in the vagina during sex
* 11 years
clear
delivery category id percent
1 Vaginal 1 79.31
1 CS 2 69.15
2 Vaginal 1.2 18.06
2 CS 2.2 26.06
3 Vaginal 1.4 1.93
3 CS 2.4 3.55
4 Vaginal 1.6 .7
4 CS 2.6 1.24

set scheme s2color

two (dropline percent id if delivery==1, ms(o))  ///
    (dropline percent id if delivery==2, ms(o))  ///
	  (dropline percent id if delivery==3, ms(o))  ///
    (dropline percent id if delivery==4, ms(o))  ///
     , name(dyspareunia_11yr, replace)  ///
	  xlab(1.3 "{bf}Vaginal delivery" 2.3 "{bf}Caesarean section", labsize(*0.5))  ///
	  xscale(r(0.8 2.8))  xtitle("")  ytitle("{bf:Proportion (%)}", size(vsmall)) ///
	  legend(row(1) size(vsmall) lab(1 "Not at all") lab(2 "A little") lab(3 "Moderate") lab(4 "A lot") symxsize(*.3)) ///
    title("{bf}Pain in the vagina during sex", size(small) color(black)) subtitle("{bf}11 years" "{bf}postpartum", size(vsmall)) xtitle("") ///
	  yscale(log) ylabel(1 10 20 40 100,angle(.45) format(%2.0f) labsize(*0.7)) ///
	  graphregion(color(white) margin(1 1 0 0)) plotregion(margin(0 0 0 0)) ///
	  text(0.875 1.65 "0.70%", size(2)) ///
	  text(1.5 2.65 "1.24%", size(2)) ///
	  fxsize(100) fysize(300)
    
* Pain elsewhere after sex
* 11 years
clear
delivery category id percent
1 Vaginal 1 92.16
1 CS 2 88.67
2 Vaginal 1.2 6.58
2 CS 2.2 9.51
3 Vaginal 1.4 1.07
3 CS 2.4 1.65
4 Vaginal 1.6 .19
4 CS 2.6 .18 
end

set scheme s2color

two (dropline percent id if delivery==1, ms(o))  ///
    (dropline percent id if delivery==2, ms(o))  ///
	  (dropline percent id if delivery==3, ms(o))  ///
    (dropline percent id if delivery==4, ms(o))  ///
     , name(pain_elsewhere_11yr, replace)  ///
	   xlab(1.3 `""{bf}Vaginal delivery""' 2.3 `""{bf}Caesarean section""', labsize(*0.5))  ///
	   xscale(r(0.8 2.8))  xtitle("") ///
	  legend(row(1) size(vsmall) lab(1 "Never") lab(2 "Occasionally") lab(3 "Often") lab(4 "Always") symxsize(*.3)) ///
    title("{bf}Pain elsewhere after sex", size(small) color(black)) subtitle("{bf}11 years" "{bf}postpartum", size(vsmall)) xtitle("") ///
	  yscale(log) ylabel(1 10 20 40 100,angle(.45) format(%2.0f) labsize(*0.7)) ytitle("") ///
	  graphregion(color(white) margin(1 1 0 0)) plotregion(margin(0 0 0 0)) ///
	  text(0.24 1.65 "0.19%", size(2)) ///
	  text(0.24 2.65 "0.18%", size(2)) ///
	  fxsize(100) fysize(300)

* Combine the two pain graphs
graph combine dyspareunia_11yr pain_elsewhere_11yr, col(2)  name("likert_pain", replace) fxsize(200) fysize(220) plotregion(margin(-2 -2 -2 -3))

* Now combine all the graphs
graph combine likert_sat_freq likert_pain, col(1) plotregion(color(white) margin(-2 -2 -2 -2)) graphregion(color(white)) name("likert_fig", replace)

* Supplementary tables exploring missing data
* Load in the full cleaned dataset without complete cases removed
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
logistic cc bmi_cat
logistic cc age_cat
logistic cc mat_degree
logistic cc cc_anxiety_bin
logistic cc epds_bin
logistic cc parity_bin
logistic cc sexsat_33mo 
logistic cc sexsat_5yr
logistic cc sexsat_12yr
logistic cc sexsat_18yr
logistic cc sexfreq_33mo
logistic cc sexfreq_5yr
logistic cc sexfreq_12yr
logistic cc sexfreq_18yr
logistic cc dyspareunia_11yr
logistic cc pain_elsewhere_11yr

