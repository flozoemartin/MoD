
***************************************************************************************************************************

* Supplementary material - dropoint graphs showing the distribution of each answer at each timepoint by mode of delivery (VD and CS) & exploration of missing data

* Author: Flo Martin

* Date started: 12/04/2021

* Date finished: 29/10/2021

***************************************************************************************************************************

* Contents *
* line 33 - Database management *
* line 43 - Supplementary figure 1 *
* line 313 - Supplementary table 1 - 3 *
* line 343 - Supplementary table 4 *
* line 363 - Supplementary table 5 *
* line 410 - Supplementary table 6 *
* line 441 - Supplementary table 7 *
* line 493 - Supplementary table 9 *
* line 535 - Supplementary figure 2 *
* line 643 - Supplementary table 10 *
* line 689 - Supplementary figure 3 *
* line 797 - Supplementary table 11 *
* line 838 - Supplementary figure 4 *
* line 946 - Supplementary table 12 *
* line 987 - Supplementary figure 5 *

***************************************************************************************************************************

* Start logging

	log using "$Logdir/log_supplementary.txt", text replace

* Change directory for saving graphs

	cd "$Projectdir/graphfiles"
	
***************************************************************************************************************************

* Supplementary figure 1 - likert scale figure to show the distribution of answers (crude proportions)

* Sexual enjoyment

* 33 months
	
	clear
	input float barorder str10 mod float one two three four
		
		1	"VD" 0.81 9.28 41.45 48.45
		2	"CS" 0.29 8.24 41.32 50.15
	
	end

	graph bar one two three four, over(mod, sort(barorder) label(labsize(vsmall))) ///
	legend(label(1 "No, not at all") label(2 "No, not a lot") label(3 "Yes, somewhat") label(4 "Yes a lot") size(vsmall) row(4) region(margin(1 -1 2 2)) symxsize(*0.2)) ///
	bar(4, color("33 103 126%70")) ///
	bar(3, color("106 59 119%70")) ///
	bar(2, color("130 47 90%70")) ///
	bar(1, color("208 114 50%70")) stack ///
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

	graph bar one two three four, over(mod, sort(barorder) label(labsize(vsmall))) ///
	legend(label(1 "No, not at all") label(2 "No, not a lot") label(3 "Yes, somewhat") label(4 "Yes a lot") size(vsmall) row(4) region(margin(1 -1 2 2)) symxsize(*0.2)) ///
	bar(4, color("33 103 126%70")) ///
	bar(3, color("106 59 119%70")) ///
	bar(2, color("130 47 90%70")) ///
	bar(1, color("208 114 50%70")) stack ///
	title("{bf:5 years}" "{bf:postpartum}", size(vsmall) color(black)) ///
	graphregion(color(white) margin(1 1 1 0.8)) ///
	yscale(lstyle(none)) ///
	l2title("{bf:Proportion of women (%)}", size(small) color(white)) ///
	ylabel(, labcolor(white) nogrid notick labsize(vsmall)) ///
	name(sexsat_likert_5yr, replace)

* 12 years

	clear
	input float barorder str10 mod float one two three four
	
		1	"VD" 0.72 7.14 43.65 48.49
		2	"CS" 0.22 6.67 43.44 49.68
	
	end

	graph bar one two three four, over(mod, sort(barorder) label(labsize(vsmall))) ///
	legend(label(1 "No, not at all") label(2 "No, not a lot") label(3 "Yes, somewhat") label(4 "Yes a lot") size(vsmall) row(4) region(margin(1 -1 2 2)) symxsize(*0.2)) ///
	bar(4, color("33 103 126%70")) ///
	bar(3, color("106 59 119%70")) ///
	bar(2, color("130 47 90%70")) ///
	bar(1, color("208 114 50%70")) stack ///
	title("{bf:12 years}" "{bf:postpartum}", size(vsmall) color(black)) ///
	graphregion(color(white) margin(1 1 1 0.8)) ///
	yscale(lstyle(none)) ///
	l2title("{bf:Proportion of women (%)}", size(small) color(white)) ///
	ylabel(, labcolor(white) nogrid notick labsize(vsmall)) ///
	name(sexsat_likert_12yr, replace)

* 18 years

	clear
	input float barorder str10 mod float one two three four

		1	"VD" 1.38 9.36 43.68 45.57
		2	"CS" 1.12 6.34 46.27 46.27

	end

	graph bar one two three four, over(mod, sort(barorder) label(labsize(vsmall))) ///
	legend(label(1 "No, not at all") label(2 "No, not a lot") label(3 "Yes, somewhat") label(4 "Yes a lot") size(vsmall) row(4) region(margin(1 -1 2 2)) symxsize(*0.2)) ///
	bar(4, color("33 103 126%70")) ///
	bar(3, color("106 59 119%70")) ///
	bar(2, color("130 47 90%70")) ///
	bar(1, color("208 114 50%70")) stack ///
	title("{bf:18 years}" "{bf:postpartum}", size(vsmall) color(black)) ///
	graphregion(color(white) margin(1 1 1 0.8)) ///
	yscale(lstyle(none)) ///
	l2title("{bf:Proportion of women (%)}", size(small) color(white)) ///
	ylabel(, labcolor(white) nogrid notick labsize(vsmall)) ///
	name(sexsat_likert_18yr, replace)

	grc1leg2 sexsat_likert_33mo sexsat_likert_5yr sexsat_likert_12yr sexsat_likert_18yr, rows(1) col(4) ///
	legendfrom(sexsat_likert_33mo) ring(1) pos(6) graphregion(lcolor(none) ilcolor(none) fcolor(white) ///
	ifcolor(white)) plotregion(lcolor(none) ilcolor(none) style(none) margin(zero)) name("likert_sat", replace) ///
	title("{bf: Sexual enjoyment}" "{bf:}", size(small) color(black) ring(1)) fxsize(100) fysize(100) 

* Dyspareunia

	clear
	input float barorder str10 mod float one two three four

		1	"VD" 79.31 18.06 1.93 0.70
		2	"CS" 69.15 26.06 3.55 1.24

	end

	graph bar one two three four, over(mod, sort(barorder) label(labsize(*0.45))) ///
	legend(label(1 "Not at all") label(2 "A little") label(3 "Moderate") label(4 "A lot") size(vsmall) row(4) region(margin(1 -1 2 2)) symxsize(*0.2)) ///
	bar(4, color("208 114 50%70")) ///
	bar(3, color("130 47 90%70")) ///
	bar(2, color("106 59 119%70")) ///
	bar(1, color("33 103 126%70")) stack ///
	title("{bf:Pain in the vagina}" "{bf:during sex}", size(small) color(black) margin(b=2)) ///
	subtitle("{bf:11 years}" "{bf:postpartum}", size(*0.42) color(black) margin(b=-0.5)) ///
	graphregion(color(white) margin(1 1 1 0.8)) ///
	yscale(lstyle(none)) ///
	ylabel("", nogrid notick labsize(vsmall)) ///
	b2title("t", color(white) size(*0.12)) ///
	fxsize(20) fysize(100) ///
	name(dyspareunia_likert_11yr, replace)

	graph combine likert_sat dyspareunia_likert_11yr, graphregion(color(white)) name("supp_fig_1a", replace) 

* Save supplementary figure 1a as .tif in graphfiles

	graph export supp_fig_1a.tif, name(supp_fig_1a) replace

* Sexual frequency

* 33 months

	clear
	input float barorder str10 mod float one two three four five six

		1	"VD" 9.71 11.41 27.34 25.30 24.19 2.04
		2	"CS" 9.46 15.00 26.89 26.22 20.27 2.16

	end

	graph bar one two three four five six, over(mod, sort(barorder) label(labsize(vsmall))) ///
	legend(label(1 "Not at all") label(2 "Less than once" "a month") label(3 "1-3 times" "a month") label(4 "About once" "a week") label(5 "2-4 times" "a week") label(6 "5+ times" "a week") size(vsmall) row(3) region(margin(1 -1 2 2)) symxsize(*0.2)) ///
	bar(6, color("33 103 126%70")) ///
	bar(5, color("106 59 119%70")) ///
	bar(4, color("130 47 90%70")) ///
	bar(3, color("208 114 50%70")) ///
	bar(2, color("255 219 0%70")) ///
	bar(1, color("181 211 52%70")) stack ///
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
	graph bar one two three four five six, over(mod, sort(barorder) label(labsize(vsmall))) ///
	legend(label(1 "Not at all") label(2 "Less than once" "a month") label(3 "1-3 times" "a month") label(4 "About once" "a week") label(5 "2-4 times" "a week") label(6 "5+ times" "a week") size(vsmall) row(3) region(margin(1 -1 2 2)) symxsize(*0.2)) ///
	bar(6, color("33 103 126%70")) ///
	bar(5, color("106 59 119%70")) ///
	bar(4, color("130 47 90%70")) ///
	bar(3, color("208 114 50%70")) ///
	bar(2, color("255 219 0%70")) ///
	bar(1, color("181 211 52%70")) stack ///
	title("{bf:5 years}" "{bf:postpartum}", size(vsmall) color(black)) ///
	graphregion(color(white)) ///
	yscale(lstyle(none)) ///
	l2title("{bf:Proportion of women (%)}", size(small) color(white)) ///
	ylabel(, labcolor(white) nogrid notick labsize(vsmall)) ///
	name(sexfreq_likert_5yr, replace)

* 12 years

	clear
	input float barorder str10 mod float one two three four five six

		1	"VD" 12.40 13.81 25.68 23.02 22.95 2.15
		2	"CS" 12.06 13.23 30.16 20.62 22.57 1.36

	end

	graph bar one two three four five six, over(mod, sort(barorder) label(labsize(vsmall))) ///
	legend(label(1 "Not at all") label(2 "Less than once" "a month") label(3 "1-3 times" "a month") label(4 "About once" "a week") label(5 "2-4 times" "a week") label(6 "5+ times" "a week") size(vsmall) row(3) region(margin(1 -1 2 2)) symxsize(*0.2)) ///
	bar(6, color("33 103 126%70")) ///
	bar(5, color("106 59 119%70")) ///
	bar(4, color("130 47 90%70")) ///
	bar(3, color("208 114 50%70")) ///
	bar(2, color("255 219 0%70")) ///
	bar(1, color("181 211 52%70")) stack ///
	title("{bf:12 years}" "{bf:postpartum}", size(vsmall) color(black)) ///
	graphregion(color(white)) ///
	yscale(lstyle(none)) ///
	l2title("{bf:Proportion of women (%)}", size(small) color(white)) ///
	ylabel(, labcolor(white) nogrid notick labsize(vsmall)) ///
	name(sexfreq_likert_12yr, replace)

* 18 years

	clear
	input float barorder str10 mod float one two three four five six

		1	"VD" 19.20 17.62 21.83 22 18.15 1.19
		2	"CS" 18.99 20.89 20.89 18.35 19.30 1.58

	end

	graph bar one two three four five six, over(mod, sort(barorder) label(labsize(vsmall))) ///
	legend(label(1 "Not at all") label(2 "Less than once" "a month") label(3 "1-3 times" "a month") label(4 "About once" "a week") label(5 "2-4 times" "a week") label(6 "5+ times" "a week") size(vsmall) row(3) region(margin(1 -1 2 2)) symxsize(*0.2)) ///
	bar(6, color("33 103 126%70")) ///
	bar(5, color("106 59 119%70")) ///
	bar(4, color("130 47 90%70")) ///
	bar(3, color("208 114 50%70")) ///
	bar(2, color("255 219 0%70")) ///
	bar(1, color("181 211 52%70")) stack ///
	title("{bf:18 years}" "{bf:postpartum}", size(vsmall) color(black)) ///
	graphregion(color(white)) ///
	yscale(lstyle(none)) ///
	l2title("{bf:Proportion of women (%)}", size(small) color(white)) ///
	ylabel(, labcolor(white) nogrid notick labsize(vsmall)) ///
	name(sexfreq_likert_18yr, replace)

	grc1leg2 sexfreq_likert_33mo sexfreq_likert_5yr sexfreq_likert_12yr sexfreq_likert_18yr, rows(1) col(4) ///
	legendfrom(sexfreq_likert_33mo) ring(1) pos(6) graphregion(lcolor(none) ilcolor(none) fcolor(white) ///
	ifcolor(white)) plotregion(lcolor(none) ilcolor(none) style(none) margin(zero)) name("likert_freq", replace) ///
	title("{bf: Sexual frequency}", size(small) color(black) ring(1)) fxsize(100) fysize(100) 

* Pain elsewhere

	clear
	input float barorder str10 mod float one two three four

		1	"VD" 92.16 6.58 1.07 0.19
		2	"CS" 88.67 9.51 1.65 0.18

	end

	graph bar one two three four, over(mod, sort(barorder) label(labsize(*0.45))) ///
	legend(label(1 "Never") label(2 "Occasional") label(3 "Often") label(4 "Always") size(vsmall) row(4) region(margin(1 -1 2 2)) symxsize(*0.2)) ///
	bar(4, color("208 114 50%70")) ///
	bar(3, color("130 47 90%70")) ///
	bar(2, color("106 59 119%70")) ///
	bar(1, color("33 103 126%70")) stack ///
	title("{bf:Pain elsewhere}" "{bf:after sex}", size(small) color(black) margin(b=2)) ///
	subtitle("{bf:11 years}" "{bf:postpartum}", size(*0.42) color(black) margin(b=-0.5)) ///
	graphregion(color(white) margin(1 1 1 0.8)) ///
	yscale(lstyle(none)) ///
	ylabel("", nogrid notick labsize(vsmall)) ///
	fxsize(20) fysize(100) ///
	name(pain_elsewhere, replace)

	graph combine likert_freq pain_elsewhere, rows(1) graphregion(color(white)) name("supp_fig_1b", replace)

* Save supplementary figure 1b as .tif in graphfiles
	
	graph export supp_fig_1b.tif, name(supp_fig_1b) replace
	
***************************************************************************************************************************

* Supplementary tables exploring missing data

* Supplementary tables 1 - 3

* Load in the full cleaned dataset without complete cases removed

	use "$Projectdir/datafiles/mi_dataset.dta", clear

* Count the total number of participants in the cleaned dataset

	count 

* Count the complete cases for each individual variable
	tab1 vaginal_delivery bmi_cat age_cat mat_degree cc_anxiety_bin epds_bin parity_bin sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr dyspareunia_11yr pain_elsewhere_11yr

* Now count all these in my complete cases for sexual enjoyment, frequency and pain
	
	use "$Projectdir/datafiles/flo_dataset_cc.dta", clear

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

* Supplementary table 4
	
* Load in the full cleaned dataset without complete cases removed

	use "$Projectdir/datafiles/flo_dataset.dta", clear

* Now time for the predictors of being a complete case - exposure = characteristics outcome = being a complete case
	
	foreach var of varlist vaginal_delivery bmi_cat age_cat mat_degree cc_anxiety_bin epds_bin parity_bin sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr dyspareunia_11yr pain_elsewhere_11yr {
		
	logistic cc i.`var'
		
	}

***************************************************************************************************************************

* To inform the rationale for multiple imputation, we wanted explore unobserved outcomes more thoroughly - in other words, compare the proportion of missing in those who had returned the questionnaire and the proportion of missing in other questions for returned questionnaires 

***************************************************************************************************************************

* Supplementary table 5

* Load in the complete cases dataset

	use "$Projectdir/datafiles/flo_dataset_cc.dta", clear

* Missingness
* Participants with missing outcome data

		foreach var of varlist sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr dyspareunia_11yr pain_elsewhere_11yr {
		
	count if `var' ==.
		
	}
	
* Participants missing who returned the questionnaire 

	count if sexsat_33mo ==. & h001 ==1
	count if sexsat_5yr ==. & k0007a ==1
	count if sexsat_12yr ==. & s0007a ==1
	count if sexsat_18yr ==. & t0007a ==1

	count if sexfreq_33mo ==. & h001 ==1
	count if sexfreq_5yr ==. & k0007a ==1
	count if sexfreq_12yr ==. & s0007a ==1
	count if sexfreq_18yr ==. & t0007a ==1

	count if dyspareunia_11yr ==. & r0007a ==1
	count if pain_elsewhere_11yr ==. & r0007a ==1
	
* Participants missing who did not return the questionnaire 

	count if sexsat_33mo ==. & h001 ==0
	count if sexsat_5yr ==. & k0007a ==0
	count if sexsat_12yr ==. & s0007a ==0
	count if sexsat_18yr ==. & t0007a ==0

	count if sexfreq_33mo ==. & h001 ==0
	count if sexfreq_5yr ==. & k0007a ==0
	count if sexfreq_12yr ==. & s0007a ==0
	count if sexfreq_18yr ==. & t0007a ==0

	count if dyspareunia_11yr ==. & r0007a ==0
	count if pain_elsewhere_11yr ==. & r0007a ==0
	
***************************************************************************************************************************
	
* Supplementary table 6
	
* Within participants who returned the questionnaire, % that were missing for previous question, sex-related questions and random questions later in the questionnaire
	
	count if h_prev_miss ==. & h001==1
	count if sexfreq_33mo ==. & h001 ==1
	count if sexsat_33mo ==. & h001==1
	count if h_rand_miss ==. & h001==1
	
	count if k_prev_miss ==. & k0007a ==1
	count if sexfreq_5yr ==. & k0007a ==1
	count if sexsat_5yr ==. & k0007a ==1
	count if k_rand_miss ==. & k0007a ==1
	
	count if r_prev_miss ==. & r0007a ==1
	count if dyspareunia_11yr ==. & r0007a ==1
	count if pain_elsewhere_11yr ==. & r0007a ==1
	count if r_rand_miss ==. & r0007a ==1
	
	count if s_prev_miss ==. & s0007a ==1
	count if sexfreq_12yr ==. & s0007a ==1
	count if sexsat_12yr ==. & s0007a ==1
	count if s_rand_miss ==. & s0007a ==1
	
	count if t_prev_miss ==. & t0007a ==1
	count if sexfreq_18yr ==. & t0007a ==1
	count if sexsat_18yr ==. & t0007a ==1
	count if t_rand_miss ==. & t0007a ==1
	
***************************************************************************************************************************

* Supplementary table 7
	
* In order to identify whether the outcomes are good auxiliaries for eachother, we regressed them against eachother to see if they were associated with eachother

	use "$Datadir/mi_dataset.dta"
	
	count // n=13,299 (participants with complete x)

	foreach var of varlist sexsat_18yr sexfreq_33mo sexfreq_18yr dyspareunia_11yr pain_elsewhere_11yr {
		
		ologit sexsat_33mo `var', or
		
	}
	
	foreach var of varlist sexsat_33mo sexfreq_33mo sexfreq_18yr dyspareunia_11yr pain_elsewhere_11yr {
		
		ologit sexsat_18yr `var', or
		
	}

	foreach var of varlist sexsat_33mo sexsat_18yr sexfreq_18yr dyspareunia_11yr pain_elsewhere_11yr {
		
		ologit sexfreq_33mo `var', or
		
	}
	
		foreach var of varlist sexsat_33mo sexsat_18yr sexfreq_33mo dyspareunia_11yr pain_elsewhere_11yr {
		
		ologit sexfreq_18yr `var', or
		
	}
	
		foreach var of varlist sexsat_33mo sexsat_18yr sexfreq_33mo sexfreq_18yr pain_elsewhere_11yr {
		
		ologit dyspareunia_11yr `var', or
		
	}
	
		foreach var of varlist sexsat_33mo sexsat_18yr sexfreq_33mo sexfreq_18yr dyspareunia_11yr {
		
		ologit pain_elsewhere_11yr `var', or
		
	}
	
***************************************************************************************************************************

* Change directory for saving graphs

	cd "$Graphdir"
	
***************************************************************************************************************************

* Supplementary table 9 - instrumental vs non-instrumental vaginal delivery

	use "$Datadir/imputed_data_1.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' str10 outcome str50 model str10 OR str20 OR_CI str10 p  ///
	using "$Datadir/outputs/stata/MI_manuscript_2.dta", replace

	local i = 0
	local exposure instrumental_del  
	
	foreach outcome in sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr dyspareunia_11yr pain_elsewhere_11yr  {
	local i = `i' + 1
	
	mi estimate: ologit `outcome' `exposure' 
	post `memhold' ("`outcome'") ("Unadjusted") ///
		(strofreal(exp(r(table)[1,1]), "%5.2f")) ///
		("(" + strofreal(exp(r(table)[5,1]),"%5.2f") + " to " + strofreal(exp(r(table)[6,1]),"%5.2f") + ")") ///
		(strofreal(r(table)[4,1], "%4.3f")) 

	mi estimate: ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' ("`outcome'") ("Adjusted") ///
		(strofreal(exp(r(table)[1,1]), "%5.2f")) ///
		("(" + strofreal(exp(r(table)[5,1]),"%5.2f") + " to " + strofreal(exp(r(table)[6,1]),"%5.2f") + ")") ///
		(strofreal(r(table)[4,1], "%4.3f")) 

}

	postclose `memhold'

	use "$Datadir/outputs/stata/MI_manuscript_2.dta", clear

* Prepare models for output

	use "$Datadir/outputs/stata/MI_manuscript_2.dta", clear
	export delim using "$Datadir/outputs/MI_manuscript_2.csv", delim(",") replace
	

***************************************************************************************************************************

* Supplementary figure 2 - the results of the sensitivity analysis of instrumental vs non-instrumental vaginal delivery

* Sexual enjoyment chunk

	use "$Datadir/Outputs/figure_data/supp_figure_2/MI_sexsat_chunk_2.dta", clear

	twoway (scatter or id, ms(o) mc(black)) (rcap lci uci id, lc(black))   ///
		, name(sexsat_2, replace) 	   ///
		yline(1, lp(dash) lc(red))  ///
		xscale(r(0.9 4.1))  yscale(r(0.7 1.5)) ///
		legend(off) ///
		xtitle("") ///
		title("{bf}Sexual" "{bf}enjoyment", size(small) color(black))  ///
		subtitle("33 months - 18 years postpartum", size(vsmall)) ///
		xlab(1 `""33 months" "postpartum""' 2 `""5 years" "postpartum""' 3 `""12 years" "postpartum""' 4 `""18 years" "postpartum""', labsize(vsmall)) ///
		graphregion(color(white) margin(0 -2 1 1)) ///
		text(.905 1.25 "0.91", size(2)) text(0.792 1.25 "0.79", size(2)) text(1.034 1.25 "1.03", size(2)) ///
		text(1.008 2.25 "1.01", size(2)) text(0.879 2.25 "0.88", size(2)) text(1.157 2.25 "1.16", size(2)) ///
		text(.937 3.25 "0.94", size(2)) text(0.798 3.25 "0.80", size(2)) text(1.101 3.25 "1.10", size(2)) ///
		text(.963 4.25 "0.96", size(2)) text(0.783 4.25 "0.78", size(2)) text(1.183 4.25 "1.18", size(2)) ///
		text(1.3 1.2 "{it:p} = 0.142", size(2)) text(1.3 2.2 "{it:p} = 0.905", size(2)) text(1.3 3.2 "{it:p} = 0.430", size(2)) text(1.3 4.2 "{it:p} = 0.718", size(2)) ///
		yscale(log range(0.7 1.5)) ylabel(0.8(0.2)1.4,format(%5.2f) labsize(*0.7) nogrid) ///
		text(1.3 0 "{bf:Higher category among}" "{bf:instrumental vaginal delivery}" , orient(vertical) size(vsmall)) text(0.87 0 "{bf:Lower category among}" "{bf:instrumental vaginal delivery}", orient(vertical) size(vsmall)) ///
		text(1.1 0.25 "{bf:Adjusted}" "{bf:odds ratio}" "95%" "confidence" "interval", orient(horizontal) size(vsmall)) ///
		fxsize(40) fysize(100)
	   
	addplot: (pcarrowi 0.95 0.3 0.8 0.3, color(black) legend(off)), norescaling
	addplot: (pcarrowi 1.2 0.3 1.4 0.3, color(black) legend(off)), norescaling
	     
* Sexual frequency chunk

	use "$Datadir/Outputs/figure_data/supp_figure_2/MI_sexfreq_chunk_2.dta", clear 

	twoway (scatter or id, ms(o) mc(black)) (rcap lci uci id, lc(black))   ///
		, name(sexfreq_2, replace) 	   ///
		yline(1, lp(dash) lc(red))  ///
		xscale(r(0.9 4.1))  yscale(r(0.7 1.5)) ///
		legend(off) ///
		ylab(,nogrid) ///
		xtitle("") ///
		title("{bf}Sexual" "{bf}frequency", size(small) color(black))  ///
		subtitle("33 months - 18 years postpartum", size(vsmall)) ///
		xlab(1 `""33 months" "postpartum""' 2 `""5 years" "postpartum""' 3 `""12 years" "postpartum""' 4 `""18 years" "postpartum""', labsize(vsmall)) ///
		graphregion(color(white) margin(-2 -2 1 1)) ///
		text(0.917 1.25 "0.92", size(2)) text(0.814 1.25 "0.81", size(2)) text(1.032 1.25 "1.03", size(2)) ///
		text(0.914 2.25 "0.91", size(2)) text(0.812 2.25 "0.81", size(2)) text(1.029 2.25 "1.03", size(2)) ///
		text(0.881 3.25 "0.88", size(2)) text(0.771 3.25 "0.77", size(2)) text(1.007 3.25 "1.01", size(2)) ///
		text(0.959 4.25 "0.96", size(2)) text(0.815 4.25 "0.82", size(2)) text(1.129 4.25 "1.13", size(2)) ///
		text(1.3 1.2 "{it:p} = 0.148", size(2)) text(1.3 2.2 "{it:p} = 0.135", size(2)) text(1.3 3.2 "{it:p} = 0.062", size(2)) text(1.3 4.2 "{it:p} = 0.617", size(2)) ///
		yscale(log range(0.7 1.5) lstyle(none)) ylabel(0.8(0.2)1.4,angle(.45) format(%5.2f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
		fxsize(40) fysize(100)
	   
* Pain in the vagina during sex chunk

	use "$Datadir/Outputs/figure_data/supp_figure_2/MI_dyspar_chunk_2.dta", clear

	set scheme s2mono

	twoway (scatter or id, ms(o) mc(black)) (rcap lci uci id, lc(black))   ///
		, name(dyspareunia_2, replace) 	   ///
		yline(1, lp(dash) lc(red))  ///
		xscale(r(0.9 1.1))  yscale(r(0.7 1.5)) ///
		legend(off) ///
		ylab(,nogrid) ///
		xtitle("") ///
		title("{bf}Pain in the vagina" "{bf}during sex", size(small))  ///
		subtitle("11 years postpartum", size(vsmall)) ///
		xlab(1 `""11 years" "postpartum""', labsize(vsmall)) ///
		graphregion(color(white) margin(-2 -1 1 1)) ///
		text(1.037 1.07 "1.04", size(2)) text(0.862 1.07 "0.86", size(2)) text(1.248 1.07 "1.25", size(2)) ///
		text(1.45 1 "{it:p} = 0.698", size(2)) ///
		yscale(log range(0.7 1.5) lstyle(none)) ylabel(0.8(0.2)1.4,angle(.45) format(%5.2f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
		fxsize(15) fysize(100)

* Pain elsewhere after sex chunk

	use "$Datadir/Outputs/figure_data/supp_figure_2/MI_pain_chunk_2.dta", clear
	   
	set scheme s2mono

	twoway (scatter or id, ms(o) mc(black)) (rcap lci uci id, lc(black))   ///
		, name(pain_2, replace) 	   ///
		yline(1, lp(dash) lc(red))  ///
		xscale(r(0.9 1.1))  yscale(r(0.7 1.5)) ///
		legend(off) ///
		ylab(,nogrid) ///
		xtitle("") ///
		title("{bf}Pain elsewhere" "{bf}after sex", size(small))  ///
		subtitle("11 years postpartum", size(vsmall)) ///
		xlab(1 `""11 years" "postpartum""', labsize(vsmall)) ///
		graphregion(color(white) margin(-2 -1 1 1)) plotregion(color(white)) ///
		text(1.057 1.07 "1.06", size(2)) text(0.799 1.07 "0.80", size(2)) text(1.397 1.07 "1.40", size(2)) ///
		text(1.45 1 "{it:p} = 0.699", size(2)) ///
		yscale(log range(0.7 1.5) lstyle(none)) ylabel(0.8(0.2)1.4,angle(.45) format(%03.1f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
		fxsize(12) fysize(100)	   

* Combine the chunks
	
	graph combine sexsat_2 sexfreq_2 dyspareunia_2 pain_2, row(1) ///
	graphregion(color(white)) ///
	name("supp_fig_2", replace)

* Save figure 3 as .tif in graphfiles
	
	graph export supp_fig_2.pdf, name(supp_fig_2) replace
	
***************************************************************************************************************************

* Supplementary table 10 - emergency and elective C-section vs vaginal delivery
	
	use "$Datadir/imputed_data_1.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' cs str10 outcome str50 model str10 emer_OR str20 emer_OR_CI str10 emer_p str20 elec_OR str20 elec_OR_CI str20 elec_p ///
	using "$Datadir/outputs/stata/MI_manuscript_3.dta", replace

	local i = 0
	local exposure strat_cs  
	
	foreach outcome in sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr dyspareunia_11yr pain_elsewhere_11yr  {
	local i = `i' + 1
	
	mi estimate: ologit `outcome' i.`exposure'
	post `memhold' (1) ("`outcome'") ("Unadjusted") ///
		(strofreal(exp(r(table)[1,2]), "%5.2f")) ///
		("(" + strofreal(exp(r(table)[5,2]),"%5.2f") + " to " + strofreal(exp(r(table)[6,2]),"%5.2f") + ")") ///
		(strofreal(r(table)[4,2], "%4.3f")) ///
		(strofreal(exp(r(table)[1,3]), "%5.2f")) ///
		("(" + strofreal(exp(r(table)[5,3]),"%5.2f") + " to " + strofreal(exp(r(table)[6,3]),"%5.2f") + ")") ///
		(strofreal(r(table)[4,3], "%4.3f"))

	mi estimate: ologit `outcome' i.`exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi
	post `memhold' (2) ("`outcome'") ("Adjusted") ///
		(strofreal(exp(r(table)[1,2]), "%5.2f")) ///
		("(" + strofreal(exp(r(table)[5,2]),"%5.2f") + " to " + strofreal(exp(r(table)[6,2]),"%5.2f") + ")") ///
		(strofreal(r(table)[4,2], "%4.3f")) ///
		(strofreal(exp(r(table)[1,3]), "%5.2f")) ///
		("(" + strofreal(exp(r(table)[5,3]),"%5.2f") + " to " + strofreal(exp(r(table)[6,3]),"%5.2f") + ")") ///
		(strofreal(r(table)[4,3], "%4.3f")) 
}

	postclose `memhold'

	use "$Datadir/outputs/stata/MI_manuscript_3.dta", clear

* Prepare models for output

	use "$Datadir/outputs/stata/MI_manuscript_3.dta", clear
	export delim using "$Datadir/outputs/MI_manuscript_3.csv", delim(",") replace
	
***************************************************************************************************************************

* Supplementary figure 3 - the results of the sensitivity analysis of elective and emergency C-section vaginal delivery

* Sexual enjoyment chunk

	use "$Datadir/Outputs/figure_data/supp_figure_3/MI_sexsat_chunk_3.dta", clear
	replace id = 1.3 if id ==1 & gr==2
	replace id = 2.3 if id ==2 & gr==2
	replace id = 3.3 if id ==3 & gr==2
	replace id = 4.3 if id ==4 & gr==2

	twoway (scatter or id if gr==1, ms(o) mc(black)) (rcap lci uci id, lc(black))   ///
		(scatter or id if gr==2, ms(s) mc(black)) (rcap lci uci id, lc(black))   ///
		, name(sexsat_3, replace) 	   ///
		yline(1, lp(dash) lc(red))  ///
		xscale(r(0.9 4.3))  yscale(r(0.7 2.3)) ///
		legend(off) ///
		xtitle("") ///
		title("{bf}Sexual" "{bf}enjoyment", size(small))  ///
		subtitle("33 months - 18 years postpartum", size(vsmall)) ///
		xlab(1.15 `""33 months" "postpartum""' 2.15 `""5 years" "postpartum""' 3.15 `""12 years" "postpartum""' 4.15 `""18 years" "postpartum""', labsize(vsmall)) ///
		graphregion(color(white) margin(0 -2 1 1)) ///
		yscale(log range(0.7 2.3)) ylabel(0.7(0.2)2.3,format(%5.2f) labsize(*0.7) nogrid) ///
		text(1.7 -0.05 "{bf:Higher category among}" "{bf:emergency or elective CS}" , orient(vertical) size(vsmall)) text(0.8 -0.05 "{bf:Lower category among}" "{bf:emergency or elective CS}", orient(vertical) size(vsmall)) ///
		text(1.2 0.2 "{bf:Adjusted}" "{bf:odds ratio}" "95%" "confidence" "interval", orient(horizontal) size(vsmall)) ///
		fxsize(40) fysize(100)
	   
	addplot: (pcarrowi 0.9 0.25 0.7 0.25, color(black) legend(off)), norescaling
	addplot: (pcarrowi 1.5 0.25 1.9 0.25, color(black) legend(off)), norescaling
	     
* Sexual frequency chunk

	use "$Datadir/Outputs/figure_data/supp_figure_3/MI_sexfreq_chunk_3.dta", clear
	replace id = 1.3 if id ==1 & gr==2
	replace id = 2.3 if id ==2 & gr==2
	replace id = 3.3 if id ==3 & gr==2
	replace id = 4.3 if id ==4 & gr==2

	twoway (scatter or id if gr==1, ms(o) mc(black)) (rcap lci uci id, lc(black))   ///
		(scatter or id if gr==2, ms(s) mc(black)) (rcap lci uci id, lc(black))   ///
		, name(sexfreq_3, replace) 	   ///
		yline(1, lp(dash) lc(red))  ///
		xscale(r(0.9 4.3))  yscale(r(0.7 2.3)) ///
		legend(off) ///
		ylab(,nogrid) ///
		xtitle("") ///
		title("{bf}Sexual" "{bf}frequency", size(small))  ///
		subtitle("33 months - 18 years postpartum", size(vsmall)) ///
		xlab(1.15 `""33 months" "postpartum""' 2.15 `""5 years" "postpartum""' 3.15 `""12 years" "postpartum""' 4.15 `""18 years" "postpartum""', labsize(vsmall)) ///
		graphregion(color(white) margin(-2 -2 1 1)) ///
		yscale(log range(0.7 2.3) lstyle(none)) ylabel(0.7(0.2)2.3,angle(.45) format(%5.2f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
		fxsize(40) fysize(100)
	   
* Pain in the vagina during sex chunk

	use "$Datadir/Outputs/figure_data/supp_figure_3/MI_dyspar_chunk_3.dta", clear
	replace id = 1.08 if id ==1 & gr==1
	replace id = 1.22 if id ==1 & gr==2

	twoway (scatter or id if gr==1, ms(o) mc(black)) (rcap lci uci id, lc(black))   ///
		(scatter or id if gr==2, ms(s) mc(black)) (rcap lci uci id, lc(black))   ///
		, name(dyspareunia_3, replace) 	   ///
		yline(1, lp(dash) lc(red))  ///
		xscale(r(0.9 1.3))  yscale(r(0.7 2.3)) ///
		legend(off) ///
		ylab(,nogrid) ///
		xtitle("") ///
		title("{bf}Pain in the vagina" "{bf}during sex", size(small))  ///
		subtitle("11 years postpartum", size(vsmall)) ///
		xlab(1.15 `""11 years" "postpartum""', labsize(vsmall)) ///
		graphregion(color(white) margin(-2 -1 1 1)) ///
		yscale(log range(0.7 2.3) lstyle(none)) ylabel(0.7(0.2)2.3,angle(.45) format(%5.2f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
		fxsize(15) fysize(100)

* Pain elsewhere after sex chunk

	use "$Datadir/Outputs/figure_data/supp_figure_3/MI_pain_chunk_3.dta", clear
	replace id = 1.05 if id ==1 & gr==1
	replace id = 1.25 if id ==1 & gr==2
	   
	set scheme s2mono

	twoway (scatter or id if gr==1, ms(o) mc(black)) (rcap lci uci id, lc(black))   ///
		(scatter or id if gr==2, ms(s) mc(black)) (rcap lci uci id, lc(black))   ///
		, name(pain_3, replace) 	   ///
		yline(1, lp(dash) lc(red))  ///
		xscale(r(0.9 1.3))  yscale(r(0.7 2.3)) ///
		legend(off) ///
		ylab(,nogrid) ///
		xtitle("") ///
		title("{bf}Pain elsewhere" "{bf}after sex", size(small))  ///
		subtitle("11 years postpartum", size(vsmall)) ///
		xlab(1.15 `""11 years" "postpartum""', labsize(vsmall)) ///
		graphregion(color(white) margin(-2 -1 1 1)) plotregion(color(white)) ///
		yscale(log range(0.7 2.3) lstyle(none)) ylabel(0.7(0.2)2.3,angle(.45) format(%03.1f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
		fxsize(12) fysize(100)	   

* Combine the chunks
	
	graph combine sexsat_3 sexfreq_3 dyspareunia_3 pain_3, row(1) ///
	graphregion(color(white)) ///
	name("supp_fig_3", replace)

* Save figure 3 as .tif in graphfiles
	
	graph export supp_fig_3.pdf, name(supp_fig_3) replace
	
***************************************************************************************************************************

* Supplementary table 11 - worst case scenario sensititvity analysis

	use "$Datadir/imputed_data_2.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' cs str10 outcome str50 model str10 OR str20 OR_CI str20 p ///
	using "$Datadir/outputs/stata/MI_manuscript_4.dta", replace

	local i = 0
	local exposure vaginal_delivery  
	
	foreach outcome in sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr dyspareunia_11yr pain_elsewhere_11yr {
	local i = `i' + 1
	
	mi estimate: ologit `outcome' `exposure' 
	post `memhold' (1) ("`outcome'") ("Unadjusted") ///
		(strofreal(exp(r(table)[1,1]), "%5.2f")) ///
		("(" + strofreal(exp(r(table)[5,1]),"%5.2f") + " - " + strofreal(exp(r(table)[6,1]),"%5.2f") + ")") ///
		(strofreal(r(table)[4,1]), "%4.3f")

	mi estimate: ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' (2) ("`outcome'") ("Adjusted") ///
		(strofreal(exp(r(table)[1,1]), "%5.2f")) ///
		("(" + strofreal(exp(r(table)[5,1]),"%5.2f") + " - " + strofreal(exp(r(table)[6,1]),"%5.2f") + ")") ///
		(strofreal(r(table)[4,1]), "%4.3f")

}

	postclose `memhold'

	use "$Datadir/outputs/stata/MI_manuscript_4.dta", clear

* Prepare models for output

	use "$Datadir/outputs/stata/MI_manuscript_4.dta", clear
	export delim using "$Datadir/outputs/MI_manuscript_4.csv", delim(",") replace
	
***************************************************************************************************************************

* Supplementary figure 4 - the results of the sensitivity analysis of worst case scenario

* Sexual enjoyment chunk

	use "$Datadir/Outputs/figure_data/supp_figure_4/MI_sexsat_chunk_4.dta", clear

	twoway (scatter or id, ms(o) mc(black)) (rcap lci uci id, lc(black))   ///
		, name(sexsat_4, replace) 	   ///
		yline(1, lp(dash) lc(red))  ///
		xscale(r(0.9 4.1))  yscale(r(0.78 1.8)) ///
		legend(off) ///
		xtitle("") ///
		title("{bf}Sexual" "{bf}enjoyment", size(small))  ///
		subtitle("33 months - 18 years postpartum", size(vsmall)) ///
		xlab(1 `""33 months" "postpartum""' 2 `""5 years" "postpartum""' 3 `""12 years" "postpartum""' 4 `""18 years" "postpartum""', labsize(vsmall)) ///
		graphregion(color(white) margin(0 -2 1 1)) ///
		text(1.103 1.25 "1.01", size(2)) text(0.973 1.25 "0.97", size(2)) text(1.249 1.25 "1.25", size(2)) ///
		text(1.015 2.25 "1.02", size(2)) text(0.891 2.25 "0.89", size(2)) text(1.156 2.25 "1.16", size(2)) ///
		text(1.067 3.25 "1.07", size(2)) text(0.929 3.25 "0.93", size(2)) text(1.226 3.25 "1.23", size(2)) ///
		text(1.172 4.25 "1.17", size(2)) text(0.990 4.25 "0.99", size(2)) text(1.389 4.25 "1.39", size(2)) ///
		text(1.5 1.2 "{it:p} = 0.124", size(2)) text(1.5 2.2 "{it:p} = 0.820", size(2)) text(1.5 3.2 "{it:p} = 0.357", size(2)) text(1.5 4.2 "{it:p} = 0.066", size(2)) ///
		yscale(log range(0.78 1.8)) ylabel(0.8(0.2)1.8,format(%5.2f) labsize(*0.7) nogrid) ///
		text(1.45 0.1 "{bf:Higher category among CS}" , orient(vertical) size(vsmall)) text(0.87 0.1 "{bf:Lower category among CS}", orient(vertical) size(vsmall)) ///
		text(1.1 0.25 "{bf:Adjusted}" "{bf:odds ratio}" "95%" "confidence" "interval", orient(horizontal) size(vsmall)) ///
		fxsize(40) fysize(100)
	   
	addplot: (pcarrowi 0.95 0.3 0.8 0.3, color(black) legend(off)), norescaling
	addplot: (pcarrowi 1.3 0.3 1.6 0.3, color(black) legend(off)), norescaling
	     
* Sexual frequency chunk

	use "$Datadir/Outputs/figure_data/supp_figure_4/MI_sexfreq_chunk_4.dta", clear 

	twoway (scatter or id, ms(o) mc(black)) (rcap lci uci id, lc(black))   ///
		, name(sexfreq_4, replace) 	   ///
		yline(1, lp(dash) lc(red))  ///
		xscale(r(0.9 4.1))  yscale(r(0.78 1.8)) ///
		legend(off) ///
		ylab(,nogrid) ///
		xtitle("") ///
		title("{bf}Sexual" "{bf}frequency", size(small))  ///
		subtitle("33 months - 18 years postpartum", size(vsmall)) ///
		xlab(1 `""33 months" "postpartum""' 2 `""5 years" "postpartum""' 3 `""12 years" "postpartum""' 4 `""18 years" "postpartum""', labsize(vsmall)) ///
		graphregion(color(white) margin(-2 -2 1 1)) ///
		text(0.986 1.25 "0.99", size(2)) text(0.876 1.25 "0.88", size(2)) text(1.109 1.25 "1.11", size(2)) ///
		text(0.891 2.25 "0.89", size(2)) text(0.790 2.25 "0.79", size(2)) text(1.004 2.25 "1.00", size(2)) ///
		text(0.971 3.25 "0.97", size(2)) text(0.847 3.25 "0.85", size(2)) text(1.113 3.25 "1.11", size(2)) ///
		text(1.063 4.25 "1.06", size(2)) text(0.900 4.25 "0.90", size(2)) text(1.255 4.25 "1.26", size(2)) ///
		text(1.5 1.2 "{it:p} = 0.810", size(2)) text(1.5 2.2 "{it:p} = 0.059", size(2)) text(1.5 3.2 "{it:p} = 0.674", size(2)) text(1.5 4.2 "{it:p} = 0.473", size(2)) ///
		yscale(log range(0.78 1.8) lstyle(none)) ylabel(0.8(0.2)1.8,angle(.45) format(%5.2f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
		fxsize(40) fysize(100)
	   
* Pain in the vagina during sex chunk

	use "$Datadir/Outputs/figure_data/supp_figure_4/MI_dyspar_chunk_4.dta", clear

	set scheme s2mono

	twoway (scatter or id, ms(o) mc(black)) (rcap lci uci id, lc(black))   ///
		, name(dyspareunia_4, replace) 	   ///
		yline(1, lp(dash) lc(red))  ///
		xscale(r(0.9 1.1))  yscale(r(0.78 1.8)) ///
		legend(off) ///
		ylab(,nogrid) ///
		xtitle("") ///
		title("{bf}Pain in the vagina" "{bf}during sex", size(small))  ///
		subtitle("11 years postpartum", size(vsmall)) ///
		xlab(1 `""11 years" "postpartum""', labsize(vsmall)) ///
		graphregion(color(white) margin(-2 -1 1 1)) ///
		text(1.475 1.07 "1.48", size(2)) text(1.255 1.07 "1.26", size(2)) text(1.734 1.07 "1.73", size(2)) ///
		text(1.78 1 "{it:p} < 0.001", size(2)) ///
		yscale(log range(0.78 1.8) lstyle(none)) ylabel(0.8(0.2)1.8,angle(.45) format(%5.2f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
		fxsize(15) fysize(100)

* Pain elsewhere after sex chunk

	use "$Datadir/Outputs/figure_data/supp_figure_4/MI_pain_chunk_4.dta", clear
	   
	set scheme s2mono

	twoway (scatter or id, ms(o) mc(black)) (rcap lci uci id, lc(black))   ///
		, name(pain_4, replace) 	   ///
		yline(1, lp(dash) lc(red))  ///
		xscale(r(0.9 1.1))  yscale(r(0.78 1.8)) ///
		legend(off) ///
		ylab(,nogrid) ///
		xtitle("") ///
		title("{bf}Pain elsewhere" "{bf}after sex", size(small))  ///
		subtitle("11 years postpartum", size(vsmall)) ///
		xlab(1 `""11 years" "postpartum""', labsize(vsmall)) ///
		graphregion(color(white) margin(-2 -1 1 1)) plotregion(color(white)) ///
		text(1.184 1.07 "1.18", size(2)) text(0.977 1.07 "0.98", size(2)) text(1.436 1.07 "1.44", size(2)) ///
		text(1.78 1 "{it:p} = 0.086", size(2)) ///
		yscale(log range(0.78 1.8) lstyle(none)) ylabel(0.8(0.2)1.8,angle(.45) format(%03.1f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
		fxsize(12) fysize(100)	   

* Combine the chunks
	
	graph combine sexsat_4 sexfreq_4 dyspareunia_4 pain_4, row(1) ///
	graphregion(color(white)) ///
	name("supp_fig_4", replace)

* Save figure 3 as .tif in graphfiles
	
	graph export supp_fig_4.pdf, name(supp_fig_4) replace
	
***************************************************************************************************************************

* Supplementary table 12 - complete case analysis sensitivity analysis

	use "$Datadir/flo_dataset_cc.dta", clear

	capture postutil close 
	tempname memhold 

	postfile `memhold' str10 outcome str50 model str10 OR str20 OR_CI str20 p ///
	using "$Datadir/outputs/stata/MI_manuscript_5.dta", replace

	local i = 0
	local exposure vaginal_delivery  
	
	foreach outcome in sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr dyspareunia_11yr pain_elsewhere_11yr {
	local i = `i' + 1
	
	ologit `outcome' `exposure' 
	post `memhold' ("`outcome'") ("Unadjusted") ///
		(strofreal(exp(r(table)[1,1]), "%5.2f")) ///
		("(" + strofreal(exp(r(table)[5,1]),"%5.2f") + " - " + strofreal(exp(r(table)[6,1]),"%5.2f") + ")") ///
		(strofreal(r(table)[4,1]), "%4.3f")

	ologit `outcome' `exposure' matage_delivery parity_18wkgest cc_anxiety_18wkgest epds_18wkgest i.mat_edu mat_bmi 
	post `memhold' ("`outcome'") ("Adjusted") ///
		(strofreal(exp(r(table)[1,1]), "%5.2f")) ///
		("(" + strofreal(exp(r(table)[5,1]),"%5.2f") + " - " + strofreal(exp(r(table)[6,1]),"%5.2f") + ")") ///
		(strofreal(r(table)[4,1]), "%4.3f")

}

	postclose `memhold'

	use "$Datadir/outputs/stata/MI_manuscript_5.dta", clear

* Prepare models for output

	use "$Datadir/outputs/stata/MI_manuscript_5.dta", clear
	export delim using "$Datadir/outputs/MI_manuscript_5.csv", delim(",") replace
	
***************************************************************************************************************************

* Supplementary figure 5 - complete case analysis against MI results

* Sexual enjoyment chunk

	use "$Datadir/Outputs/figure_data/supp_figure_5/MI_sexsat_chunk_5.dta", clear
	replace id = 1.3 if id ==1 & gr==2
	replace id = 2.3 if id ==2 & gr==2
	replace id = 3.3 if id ==3 & gr==2
	replace id = 4.3 if id ==4 & gr==2

	twoway (scatter or id if gr==1, ms(o) mc(black)) (rcap lci uci id, lc(black))   ///
		(scatter or id if gr==2, ms(s) mc(black)) (rcap lci uci id, lc(black))   ///
		, name(sexsat_5, replace) 	   ///
		yline(1, lp(dash) lc(red))  ///
		xscale(r(0.9 4.3))  yscale(r(0.8 2.4)) ///
		legend(off) ///
		xtitle("") ///
		title("{bf}Sexual" "{bf}enjoyment", size(small))  ///
		subtitle("33 months - 18 years postpartum", size(vsmall)) ///
		xlab(1.15 `""33 months" "postpartum""' 2.15 `""5 years" "postpartum""' 3.15 `""12 years" "postpartum""' 4.15 `""18 years" "postpartum""', labsize(vsmall)) ///
		graphregion(color(white) margin(0 -2 1 1)) ///
		yscale(log range(0.8 2.4)) ylabel(0.8(0.2)2.4,format(%5.2f) labsize(*0.7) nogrid) ///
		text(1.6 0.05 "{bf:Higher category among CS}" , orient(vertical) size(vsmall)) text(0.87 0.05 "{bf:Lower category among CS}", orient(vertical) size(vsmall)) ///
		text(1.1 0.2 "{bf:Adjusted}" "{bf:odds ratio}" "95%" "confidence" "interval", orient(horizontal) size(vsmall)) ///
		fxsize(40) fysize(100)
	   
	addplot: (pcarrowi 0.95 0.27 0.8 0.27, color(black) legend(off)), norescaling
	addplot: (pcarrowi 1.4 0.27 1.8 0.27, color(black) legend(off)), norescaling
	     
* Sexual frequency chunk

	use "$Datadir/Outputs/figure_data/supp_figure_5/MI_sexfreq_chunk_5.dta", clear
	replace id = 1.3 if id ==1 & gr==2
	replace id = 2.3 if id ==2 & gr==2
	replace id = 3.3 if id ==3 & gr==2
	replace id = 4.3 if id ==4 & gr==2

	twoway (scatter or id if gr==1, ms(o) mc(black)) (rcap lci uci id, lc(black))   ///
		(scatter or id if gr==2, ms(s) mc(black)) (rcap lci uci id, lc(black))   ///
		, name(sexfreq_5, replace) 	   ///
		yline(1, lp(dash) lc(red))  ///
		xscale(r(0.9 4.3))  yscale(r(0.8 2.4)) ///
		legend(off) ///
		ylab(,nogrid) ///
		xtitle("") ///
		title("{bf}Sexual" "{bf}frequency", size(small))  ///
		subtitle("33 months - 18 years postpartum", size(vsmall)) ///
		xlab(1.15 `""33 months" "postpartum""' 2.15 `""5 years" "postpartum""' 3.15 `""12 years" "postpartum""' 4.15 `""18 years" "postpartum""', labsize(vsmall)) ///
		graphregion(color(white) margin(-2 -2 1 1)) ///
		yscale(log range(0.8 2.4) lstyle(none)) ylabel(0.8(0.2)2.4,angle(.45) format(%5.2f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
		fxsize(40) fysize(100)
	   
* Pain in the vagina during sex chunk

	use "$Datadir/Outputs/figure_data/supp_figure_5/MI_dyspar_chunk_5.dta", clear
	replace id = 1.08 if id ==1 & gr==1
	replace id = 1.22 if id ==1 & gr==2

	set scheme s2mono

	twoway (scatter or id if gr==1, ms(o) mc(black)) (rcap lci uci id, lc(black))   ///
		(scatter or id if gr==2, ms(s) mc(black)) (rcap lci uci id, lc(black))   ///
		, name(dyspareunia_5, replace) 	   ///
		yline(1, lp(dash) lc(red))  ///
		xscale(r(1 1.3))  yscale(r(0.8 2.4)) ///
		legend(off) ///
		ylab(,nogrid) ///
		xtitle("") ///
		title("{bf}Pain in the vagina" "{bf}during sex", size(small))  ///
		subtitle("11 years postpartum", size(vsmall)) ///
		xlab(1.15 `""11 years" "postpartum""', labsize(vsmall)) ///
		graphregion(color(white) margin(-2 -1 1 1)) ///
		yscale(log range(0.8 2.4) lstyle(none)) ylabel(0.8(0.2)2.4,angle(.45) format(%5.2f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
		fxsize(15) fysize(100)

* Pain elsewhere after sex chunk

	use "$Datadir/Outputs/figure_data/supp_figure_5/MI_pain_chunk_5.dta", clear
	replace id = 1.05 if id ==1 & gr==1
	replace id = 1.25 if id ==1 & gr==2
	   
	set scheme s2mono

	twoway (scatter or id if gr==1, ms(o) mc(black)) (rcap lci uci id, lc(black))   ///
		(scatter or id if gr==2, ms(s) mc(black)) (rcap lci uci id, lc(black))   ///
		, name(pain_5, replace) 	   ///
		yline(1, lp(dash) lc(red))  ///
		xscale(r(1 1.3))  yscale(r(0.8  2.4)) ///
		legend(off) ///
		ylab(,nogrid) ///
		xtitle("") ///
		title("{bf}Pain elsewhere" "{bf}after sex", size(small))  ///
		subtitle("11 years postpartum", size(vsmall)) ///
		xlab(1.15 `""11 years" "postpartum""', labsize(vsmall)) ///
		graphregion(color(white) margin(-2 -1 1 1)) plotregion(color(white)) ///
		yscale(log range(0.8  2.4) lstyle(none)) ylabel(0.8(0.2)2.4,angle(.45) format(%03.1f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
		fxsize(12) fysize(100)	   

* Combine the chunks
	
	graph combine sexsat_5 sexfreq_5 dyspareunia_5 pain_5, row(1) ///
	graphregion(color(white)) ///
	name("supp_fig_5", replace)

* Save figure 3 as .tif in graphfiles
	
	graph export supp_fig_5.pdf, name(supp_fig_5) replace
	
***************************************************************************************************************************

* Stop logging

	log close

***************************************************************************************************************************
