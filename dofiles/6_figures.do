***************************************************************************************************************************

* Figure 1 - Flow diagram of participants through the study
* Figure 2 - Proportion of women in each category for each outcome at each timepoint
* Figure 3 - Sexual enjoyment, frequency and pain in caesarean section as compared with vaginal delivery

* Author: Flo Martin (Figure 1 and 3 code adapted from Viktor Ahlqvist)

* Date started: 13/04/2021

* Date finished: 29/10/2021

***************************************************************************************************************************

* Contents *
* line 32 - Figure 1 *
* line 78 - Figure 2 *
* line 209 - Figure 3 *

***************************************************************************************************************************

* Start logging

	log using "$Logdir/log_figures.txt", text replace

* Change directory for saving graphs

	cd "$Graphdir"
	
***************************************************************************************************************************

* Figure 1 - flow of participants through the study

	local osmall = 	", box margin(medium) fcolor(white) size(small) justification(centre) placement(3)"

	local omed = 	", box margin(medium) fcolor(white) size(small) justification(centre) placement(3)"

	local bc = ", lwidth(medthick) lcolor(black)" 

	local bca = ", lwidth(medthick) lcolor(black) mlcolor(black) mlwidth(medthick) msize(medlarge)"

	twoway  /// 1) PCI to draw a box 2) PIC horizontal lines 3) pcarrowi: connecting arrows.
   pci 9.95 0.25 9.95 9.95 `bc' || pci 9.95 9.95 3.8 9.95 `bc' || pci 3.8 9.95 3.8 0.25 `bc' || pci 3.8 0.25 9.95 0.25 `bc' ///
	|| pcarrowi 9.5 2.35 6.85 2.35 `bca'  ///
	|| pcarrowi 8 2.35 8 4.98 `bca'  ///
	|| pcarrowi 6.2 2.35 4.91 2.35 `bca'  ///
	|| pcarrowi 5.6 2.35 5.6 4.98 `bca'  ///
	, /// Don't forget this comma if the above is removed
	text(9.35 0.5 "Participants enrolled in" "ALSPAC" "{it:n} = 15,454" `omed') ///
	text(8 5 "{bf:Excluded:}" ///
		"Withdrawn consent" ///
		"{it:n} = 12" ///
		"Mode of delivery missing" ///
		"{it:n} = 1,985" ///
		"Mode of delivery 'other'" ///
		"{it:n} = 157" ///
		"Conflicting mode of delivery" ///
		"{it:n} = 4" ///
		`osmall') ///
	text(6.5 0.5 "Participants with mode" "of delivery data available" "{it:n} = 13,296" `omed') ///
	text(5.6 5 "{bf:Excluded:}" ///
	"Participants with no observed" "outcomes" ///
	"{it:n} = 2,972" ///
	`osmall') ///
	text(4.5 0.5 "Participants with at least" "one observed outcome at" "any timepoint" "{it:n} = 10,324" `omed' ) ///
	legend(off) ///
	xlabel("") ylabel("") xtitle("") ytitle("") ///
	graphregion(lcolor(white) fcolor(white) margin(zero)) yscale(range(4.5 10) noline) xscale(range(0 10) noline) ///
	plotregion(margin(zero) fcolor(white)  lcolor(white)) ///
	xsize(8.27) ysize(11.69) /// A4 aspect ratio
	title("") ///
	scheme(s1mono) name(fig_1, replace)
 
	graph export fig_1.tif, name(fig_1) replace

***************************************************************************************************************************

* Figure 2 and first paragraph of the results

* Overall prevalence

	use "$Datadir/flo_dataset.dta", clear

	foreach var of varlist sexsat_33mo sexsat_5yr sexsat_12yr sexsat_18yr {
		tab `var' if `var'!=0 
	}
	
	foreach var of varlist sexfreq_33mo sexfreq_5yr sexfreq_12yr sexfreq_18yr {
		tab `var' 
	}
	
	 tab dyspareunia_11yr 
	 
	 tab pain_elsewhere_11yr if pain_elsewhere_11yr !=0
	 
	* Sexual enjoyment chunk

	clear
	input float barorder str10 timepoint float one two three four
		
		1	"33 months" 0.78 9.13 41.12 48.97
		2	"5 years" 0.79 7.69 41.13 50.38
		3	"12 years" 0.71 7.14 42.89 49.27
		4	"18 years" 1.34 8.76 43.02 46.87
	
	end

	graph bar one two three four, over(timepoint, sort(barorder) label(labsize(vsmall))) /// 
	legend(label(1 "No, not at all") label(2 "No, not a lot") label(3 "Yes, somewhat") label(4 "Yes a lot") size(vsmall) row(4) region(margin(1 -1 2 2)) symxsize(*0.2)) /// 
	bar(4, color("33 103 126%70")) /// 
	bar(3, color("106 59 119%70")) ///
	bar(2, color("130 47 90%70")) ///
	bar(1, color("208 114 50%70")) stack ///
	title("{bf}Sexual" "{bf}enjoyment", size(small) color(black))  ///
	subtitle("33 months - 18 years postpartum", size(vsmall)) ///
	graphregion(color(white) margin(0 -2 1 1)) ///
	l2title("{bf:Proportion of women (%)}", size(small)) ylabel(, nogrid labsize(vsmall)) ///
	b2title("t", color(white) size(vsmall)) ///
	fxsize(40) fysize(100) ///
	name(sexsat_likert, replace)

* Sexual frequency chunk
	
	clear
	input float barorder str10 timepoint float one two three four five six
		
		1	"33 months" 9.95 11.73 26.56 25.32 24.28 2.16
		2	"5 years" 9.66 10.17 26.08 24.72 27.14 2.23
		3	"12 years" 13.23 13.61 25.72 22.49 22.85 2.09
		4	"18 years" 19.62 17.69 21.75 21.77 17.85 1.32

	end

	graph bar one two three four five six, over(timepoint, sort(barorder) label(labsize(vsmall))) /// 
	legend(label(1 "Not at all") label(2 "Less than once" "a month") label(3 "1-3 times" "a month") label(4 "About once" "a week") label(5 "2-4 times" "a week") label(6 "5+ times" "a week") size(vsmall) row(3) region(margin(1 6 2 2)) symxsize(*0.2)) /// 
	bar(6, color("33 103 126%70")) /// 
	bar(5, color("106 59 119%70")) ///
	bar(4, color("130 47 90%70")) ///
	bar(3, color("208 114 50%70")) ///
	bar(2, color("255 219 0%70")) ///
	bar(1, color("181 211 52%70")) stack ///
	title("{bf}Sexual" "{bf}frequency", size(small) color(black))  ///
	subtitle("33 months - 18 years postpartum", size(vsmall)) ///
	graphregion(color(white) margin(0 -2 1 1)) ///
	yscale(lstyle(none)) ///
	ylabel("", nogrid notick) ///
	b2title("t", color(white) size(*1.4)) ///
	fxsize(38) fysize(100) ///
	name(sexfreq_likert, replace)

* Pain in the vagina chunk
	
	clear
	input float barorder str10 timepoint float one two three four

		1	"11 years" 78.37 18.90 2.00 0.73

	end

	graph bar one two three four, over(timepoint, sort(barorder) label(labsize(vsmall))) /// 
	legend(label(1 "Not at all") label(2 "A little") label(3 "Moderate") label(4 "A lot") size(vsmall) row(4) region(margin(1 7 2 2)) symxsize(*0.5)) /// 
	bar(4, color("208 114 50%70")) /// 
	bar(3, color("130 47 90%70")) ///
	bar(2, color("106 59 119%70")) ///
	bar(1, color("33 103 126%70")) stack ///
	title("{bf}Pain in the vagina" "{bf}during sex", size(small) color(black))  ///
	subtitle("11 years postpartum", size(vsmall)) ///
	graphregion(color(white) margin(-2 -1 1 1)) ///
	yscale(lstyle(none)) ///
	ylabel("", nogrid notick) ///
	b2title("t", color(white) size(vsmall)) ///
	text(99 -20 "2.00%", size(2) color("130 47 90%70")) text(100 120 "0.73%", size(2) color("208 114 50%70")) ///
	fxsize(14) fysize(100) ///
	name(dyspareunia_likert, replace)

* Pain elsewhere chunk

	clear
	input float barorder str10 timepoint float one two three four

			1	"11 years" 91.36 7.31 1.05 0.27

		end

	graph bar one two three four, over(timepoint, sort(barorder) label(labsize(vsmall))) ///
	legend(label(1 "Never") label(2 "Occasional") label(3 "Often") label(4 "Always") size(vsmall) row(4) region(margin(1 9 2 2)) symxsize(*0.9)) ///
	bar(4, color("208 114 50%70")) ///
	bar(3, color("130 47 90%70")) ///
	bar(2, color("106 59 119%70")) ///
	bar(1, color("33 103 126%70")) stack ///
	title("{bf}Pain elsewhere" "{bf}after sex", size(small) color(black))  ///
	subtitle("11 years postpartum", size(vsmall)) ///
	graphregion(color(white) margin(-2 -1 1 1)) ///
	yscale(lstyle(none)) ///
	ylabel("", nogrid notick) ///
	b2title("t", color(white) size(vsmall)) ///
	text(99 -20 "1.05%", size(2) color("130 47 90%70")) text(100 120 "0.27%", size(2) color("208 114 50%70")) ///
	fxsize(14) fysize(100) ///
	name(pain_elsewhere_likert, replace)
	
* Combine the chunks

	graph combine sexsat_likert sexfreq_likert dyspareunia_likert pain_elsewhere_likert, row(1) graphregion(color(white)) name("fig_2", replace)

* Save figure 2 as .tif in graphfiles

	graph export fig_2.tif, name(fig_2) replace
	
***************************************************************************************************************************

* Figure 3 - the results of the multiple imputation

* Sexual enjoyment chunk

	use "$Datadir/Outputs/figure_data/figure_3/MI_sexsat_chunk_1.dta", clear
	
	set scheme s2mono

	twoway (scatter or id, ms(o) mc(black)) (rcap lci uci id, lc(black)) ///
		, name(sexsat_adjonly, replace) ///
		yline(1, lp(dash) lc(red)) ///
		xscale(r(0.9 4.1)) yscale(r(0.8 2.2)) ///
		legend(off) ///
		xtitle("") ///
		title("{bf}Sexual" "{bf}enjoyment", size(small)) ///
		subtitle("33 months - 18 years postpartum", size(vsmall)) ///
		xlab(1 `""33 months" "postpartum""' 2 `""5 years" "postpartum""' 3 `""12 years" "postpartum""' 4 `""18 years" 	"postpartum""', labsize(vsmall)) ///
		graphregion(color(white) margin(-2 0 1 1)) ///
		text(1.113 1.25 "1.11", size(2)) text(0.974 1.25 "0.97", size(2)) text(1.271 1.25 "1.27", size(2)) ///
		text(1.067 2.25 "1.07", size(2)) text(0.931 2.25 "0.93", size(2)) text(1.224 2.25 "1.22", size(2)) ///
		text(1.073 3.25 "1.07", size(2)) text(0.916 3.25 "0.92", size(2)) text(1.257 3.25 "1.26", size(2)) ///
		text(1.207 4.25 "1.21", size(2)) text(0.983 4.25 "0.98", size(2)) text(1.482 4.25 "1.48", size(2)) ///
		text(1.7 1.2 "{it:p} = 0.116", size(2)) text(1.7 2.2 "{it:p} = 0.350", size(2)) text(1.7 3.2 "{it:p} = 0.380", size(2)) text(1.7 4.2 "{it:p} = 0.072", size(2)) ///
		yscale(log range(0.8 2.2)) ylabel(0.8(0.2)2.2,format(%03.1f) labsize(*0.7) nogrid) ///
		text(1.8 0.1 "{bf:Higher category among CS}" , orient(vertical) size(vsmall)) text(0.9 0.1 "{bf:Lower category among CS}", orient(vertical) size(vsmall)) ///
		text(1.3 0.1 "{bf:Adjusted}" "{bf:OR (95%CI)}", orient(vertical) size(vsmall)) ///
		fxsize(40) fysize(100)
	   
	addplot: (pcarrowi 1 0.3 0.8 0.3, color(black) legend(off)), norescaling
	addplot: (pcarrowi 1.6 0.3 2.0 0.3, color(black) legend(off)), norescaling
	     
* Sexual frequency chunk

	use "$Datadir/Outputs/figure_data/figure_3/MI_sexfreq_chunk_1.dta", clear

	set scheme s2mono

	twoway (scatter or id, ms(o) mc(black)) (rcap lci uci id, lc(black)) ///
		, name(sexfreq_adjonly, replace) ///
		yline(1, lp(dash) lc(red)) ///
		xscale(r(0.9 4.1))  yscale(r(0.8 2.2)) ///
		legend(off) ///
		ylab(,nogrid) ///
		xtitle("") ///
		title("{bf}Sexual" "{bf}frequency", size(small))  ///
		subtitle("33 months - 18 years postpartum", size(vsmall)) ///
		xlab(1 `""33 months" "postpartum""' 2 `""5 years" "postpartum""' 3 `""12 years" "postpartum""' 4 `""18 years" "postpartum""', labsize(vsmall)) ///
		graphregion(color(white) margin(-2 -2 1 1)) ///
		text(0.991 1.25 "0.99", size(2)) text(0.881 1.25 "0.88", size(2)) text(1.116 1.25 "1.12", size(2)) ///
		text(0.924 2.25 "0.92", size(2)) text(0.818 2.25 "0.82", size(2)) text(1.044 2.25 "1.04", size(2)) ///
		text(1.009 3.25 "1.01", size(2)) text(0.878 3.25 "0.88", size(2)) text(1.160 3.25 "1.16", size(2)) ///
		text(1.092 4.25 "1.09", size(2)) text(0.919 4.25 "0.92", size(2)) text(1.298 4.25 "1.30", size(2)) ///
		text(1.7 1.2 "{it:p} = 0.844", size(2)) text(1.7 2.2 "{it:p} = 0.205", size(2)) text(1.7 3.2 "{it:p} = 0.897", size(2)) text(1.7 4.2 "{it:p} = 0.317", size(2)) ///
		yscale(log range(0.8 2.2) lstyle(none)) ylabel(0.6(0.2)1.8,angle(.45) format(%5.2f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
		fxsize(40) fysize(100)
	   
* Pain in the vagina during sex chunk

	use "$Datadir/Outputs/figure_data/figure_3/MI_dyspar_chunk_1.dta", clear

	set scheme s2mono

	twoway (scatter or id, ms(o) mc(black)) (rcap lci uci id, lc(black)) ///
		, name(dyspareunia_adjonly, replace) ///
		yline(1, lp(dash) lc(red)) ///
		xscale(r(0.9 1.1))  yscale(r(0.8 2.2)) ///
		legend(off) ///
		ylab(,nogrid) ///
		xtitle("") ///
		title("{bf}Pain in the vagina" "{bf}during sex", size(small))  ///
		subtitle("11 years postpartum", size(vsmall)) ///
		xlab(1 `""11 years" "postpartum""', labsize(vsmall)) ///
		graphregion(color(white) margin(-2 -1 1 1)) ///
		text(1.744 1.07 "1.74", size(2)) text(1.461 1.07 "1.46", size(2)) text(2.083 1.07 "2.08", size(2)) ///
		text(2.2 1 "{it:p} < 0.001", size(2)) ///
		yscale(log range(0.8 2.2) lstyle(none)) ylabel(0.6(0.2)1.8,angle(.45) format(%5.2f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
		fxsize(15) fysize(100)

* Pain elsewhere after sex chunk

	use "$Datadir/Outputs/figure_data/figure_3/MI_pain_chunk_1.dta", clear
	   
	set scheme s2mono

	twoway (scatter or id, ms(o) mc(black)) (rcap lci uci id, lc(black)) ///
		, name(pain_adjonly, replace) ///
		yline(1, lp(dash) lc(red)) ///
		xscale(r(0.9 1.1))  yscale(r(0.8 2.2)) ///
		legend(off) ///
		ylab(,nogrid) ///
		xtitle("") ///
		title("{bf}Pain elsewhere" "{bf}after sex", size(small))  ///
		subtitle("11 years postpartum", size(vsmall)) ///
		xlab(1 `""11 years" "postpartum""', labsize(vsmall)) ///
		graphregion(color(white) margin(-2 -1 1 1)) plotregion(color(white)) ///
		text(1.427 1.07 "1.43", size(2)) text(1.097 1.07 "1.10", size(2)) text(1.857 1.07 "1.86", size(2)) ///
		text(2.2 1 "{it:p} = 0.008", size(2)) ///
		yscale(log range(0.8 2.2) lstyle(none)) ylabel(0.6(0.2)1.8,angle(.45) format(%03.1f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
		fxsize(12) fysize(100)	   

* Combine the chunks
	
	graph combine sexsat_adjonly sexfreq_adjonly dyspareunia_adjonly pain_adjonly, row(1) ///
	graphregion(color(white)) ///
	name("fig_3", replace)

* Save figure 3 as .tif in graphfiles
	
	graph export fig_3.pdf, name(fig_3) replace
	
***************************************************************************************************************************

* Stop logging

	log close
	
***************************************************************************************************************************

	   
