
* Figure 2 - Proportion of women in each category for each outcome at each timepoint
* Figure 3 - Sexual enjoyment, frequency and pain in caesarean section as compared with vaginal delivery

* Author: Flo Martin

* Date started: 13/04/2021

* Date finished: 07/07/2021

* Contents *
* line 15 - Figure 2 *
* line 90 - Figure 3 *

* Figure 2
clear
input float barorder str10 timepoint float one two three four
1	"33 months" 0.76 9.18 41.44 48.62
2	"5 years" 0.81 7.74 41.50 49.94
3	"12 years" 0.66 7.09 43.63 48.62
4	"18 years" 1.36 9.05 43.95 45.64
end

set scheme s2color
graph bar one two three four, over(timepoint, sort(barorder) label(labsize(vsmall))) legend(label(1 "No, not at all") label(2 "No, not a lot") label(3 "Yes, somewhat") label(4 "Yes a lot") size(vsmall) row(4) region(margin(1 -1 2 2))) bar(4, color("dkorange%70")) bar(3, color("forest_green%70")) bar(2, color("maroon%70")) bar(1, color("navy%70"))  stack ///
title("{bf}Sexual" "{bf}enjoyment", size(small) color(black))  ///
subtitle("33 months - 18 years postpartum", size(vsmall)) ///
graphregion(color(white) margin(0 -2 1 1)) ///
l2title("{bf:Proportion of women (%)}", size(small)) ylabel(, nogrid labsize(vsmall)) ///
b2title("t", color(white) size(vsmall)) ///
fxsize(40) fysize(100) ///
name(sexsat_likert, replace)


clear
input float barorder str10 timepoint float one two three four five six
1	"33 months" 9.69 11.78 27.29 25.39 23.79 2.05
2	"5 years" 9.28 10.27 26.47 24.73 27.11 2.13
3	"12 years" 12.36 13.75 26.13 22.77 22.91 2.07
4	"18 years" 19.18 17.95 21.74 21.64 18.26 1.23
end

set scheme s2color
graph bar one two three four five six, over(timepoint, sort(barorder) label(labsize(vsmall))) legend(label(1 "Not at all") label(2 "Less than once" "a month") label(3 "1-3 times" "a month") label(4 "About once" "a week") label(5 "2-4 times" "a week") label(6 "5+ times" "a week") size(vsmall) row(3) region(margin(1 6 2 2))) bar(6, color("cranberry%70")) bar(5, color("teal%70")) bar(4, color("dkorange%70")) bar(3, color("forest_green%70")) bar(2, color("maroon%70")) bar(1, color("navy%70")) stack ///
title("{bf}Sexual" "{bf}frequency", size(small) color(black))  ///
subtitle("33 months - 18 years postpartum", size(vsmall)) ///
graphregion(color(white) margin(0 -2 1 1)) ///
yscale(lstyle(none)) ///
ylabel("", nogrid notick) ///
b2title("t", color(white) size(*1.4)) ///
fxsize(38) fysize(100) ///
name(sexfreq_likert, replace)


clear
input float barorder str10 timepoint float one two three four
1	"11 years" 78.25 18.89 2.10 0.76
end

set scheme s2color
graph bar one two three four, over(timepoint, sort(barorder) label(labsize(vsmall))) legend(label(1 "Not at all") label(2 "A little") label(3 "Moderate") label(4 "A lot") size(vsmall) row(4) region(margin(1 7 2 2))) bar(1, color("dkorange%70")) bar(2, color("forest_green%70")) bar(3, color("maroon%70")) bar(4, color("navy%70")) stack ///
title("{bf}Pain in the vagina" "{bf}during sex", size(small) color(black))  ///
subtitle("11 years postpartum", size(vsmall)) ///
graphregion(color(white) margin(-2 -1 1 1)) ///
yscale(lstyle(none)) ///
ylabel("", nogrid notick) ///
b2title("t", color(white) size(vsmall)) ///
fxsize(14) fysize(100) ///
name(dyspareunia_likert, replace)


clear
input float barorder str10 timepoint float one two three four
1	"11 years" 91.80 6.89 1.13 0.19
end

set scheme s2color
graph bar one two three four, over(timepoint, sort(barorder) label(labsize(vsmall))) legend(label(1 "Never") label(2 "Occasional") label(3 "Often") label(4 "Always") size(vsmall) row(4) region(margin(1 9 2 2))) bar(1, color("dkorange%70")) bar(2, color("forest_green%70")) bar(3, color("maroon%70")) bar(4, color("navy%70")) stack ///
title("{bf}Pain elsewhere" "{bf}after sex", size(small) color(black))  ///
subtitle("11 years postpartum", size(vsmall)) ///
graphregion(color(white) margin(-2 -1 1 1)) ///
yscale(lstyle(none)) ///
ylabel("", nogrid notick) ///
b2title("t", color(white) size(vsmall)) ///
fxsize(14) fysize(100) ///
name(pain_elsewhere_likert, replace)

graph combine sexsat_likert sexfreq_likert dyspareunia_likert pain_elsewhere_likert, row(1) graphregion(color(white)) name("fig_2", replace)

* Figure 3
* Sexual enjoyment chunk

clear
input id gr or lci uci
1	1	1.16	.994	1.36
2	1	1.11	.939	1.3
3	1	1.12	.927	1.35
4	1	1.12	.879	1.44
end

twoway (scatter or id, ms(o) mc(black)) (rcap lci uci id, lc(black))   ///
       , name(sexsat_adjonly, replace) 	   ///
	   yline(1, lp(dash) lc(red))  ///
	   xscale(r(0.9 4.1))  yscale(r(0.7 2.4)) ///
	   legend(off) ///
	   xtitle("") ///
	   title("{bf}Sexual" "{bf}enjoyment", size(small))  ///
	   subtitle("33 months - 18 years postpartum", size(vsmall)) ///
	   xlab(1 `""33 months" "postpartum""' 2 `""5 years" "postpartum""' 3 `""12 years" "postpartum""' 4 `""18 years" "postpartum""', labsize(vsmall)) ///
	   graphregion(color(white) margin(0 -2 1 1)) ///
	   text(1.16 1.25 "1.16", size(2)) text(0.994 1.25 "0.99", size(2)) text(1.36 1.25 "1.36", size(2)) ///
	   text(1.11 2.25 "1.11", size(2)) text(0.939 2.25 "0.94", size(2)) text(1.30 2.25 "1.30", size(2)) ///
	   text(1.12 3.25 "1.12", size(2)) text(0.927 3.25 "0.93", size(2)) text(1.35 3.25 "1.35", size(2)) ///
	   text(1.12 4.25 "1.12", size(2)) text(0.879 4.25 "0.88", size(2)) text(1.44 4.25 "1.44", size(2)) ///
	   text(1.55 1.2 "{it:p} = 0.059", size(2)) text(1.55 2.2 "{it:p} = 0.230", size(2)) text(1.55 3.2 "{it:p} = 0.238", size(2)) text(1.55 4.2 "{it:p} = 0.352", size(2)) ///
	   yscale(log range(0.7 2.4)) ylabel(0.8(0.2)2.4,format(%03.1f) labsize(*0.7) nogrid) ///
	   text(1.8 0.1 "{bf:Higher category among CS}" , orient(vertical) size(vsmall)) text(0.8 0.1 "{bf:Lower category among CS}", orient(vertical) size(vsmall)) ///
	   text(1.2 0.1 "{bf:OR 95%CI}", orient(vertical) size(small)) ///
	   fxsize(40) fysize(100)
	   
addplot: (pcarrowi 0.9 0.3 0.7 0.3, color(black) legend(off)), norescaling
addplot: (pcarrowi 1.55 0.3 2.1 0.3, color(black) legend(off)), norescaling
	     
* Sexual frequency chunk

clear
input id gr or lci uci
1	1	.989	.862	1.13
2	1	.953	.828	1.1
3	1	1.06	.897	1.24
4	1	1.14	.927	1.41
end  

set scheme s2mono

twoway (scatter or id, ms(o) mc(black)) (rcap lci uci id, lc(black))   ///
       , name(sexfreq_adjonly, replace) 	   ///
	   yline(1, lp(dash) lc(red))  ///
	   xscale(r(0.9 4.1))  yscale(r(0.7 2.4)) ///
	   legend(off) ///
	   ylab(,nogrid) ///
	   xtitle("") ///
	   title("{bf}Sexual" "{bf}frequency", size(small))  ///
	   subtitle("33 months - 18 years postpartum", size(vsmall)) ///
	   xlab(1 `""33 months" "postpartum""' 2 `""5 years" "postpartum""' 3 `""12 years" "postpartum""' 4 `""18 years" "postpartum""', labsize(vsmall)) ///
	   graphregion(color(white) margin(-2 -2 1 1)) ///
	   text(0.989 1.25 "0.99", size(2)) text(0.862 1.25 "0.86", size(2)) text(1.13 1.25 "1.13", size(2)) ///
	   text(0.953 2.25 "0.95", size(2)) text(0.828 2.25 "0.83", size(2)) text(1.10 2.25 "1.10", size(2)) ///
	   text(1.06 3.25 "1.06", size(2)) text(0.897 3.25 "0.90", size(2)) text(1.24 3.25 "1.24", size(2)) ///
	   text(1.14 4.25 "1.14", size(2)) text(0.927 4.25 "0.93", size(2)) text(1.41 4.25 "1.41", size(2)) ///
	   text(1.55 1.2 "{it:p} = 0.870", size(2)) text(1.55 2.2 "{it:p} = 0.502", size(2)) text(1.55 3.2 "{it:p} = 0.514", size(2)) text(1.55 4.2 "{it:p} = 0.211", size(2)) ///
	   yscale(log range(0.7 2.4) lstyle(none)) ylabel(0.8(0.2)2.4,angle(.45) format(%03.1f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
	   fxsize(40) fysize(100)
	   
* Pain in the vagina during sex chunk

clear
input id gr or lci uci
1	1	1.72	1.42	2.08
end

set scheme s2mono

twoway (scatter or id, ms(o) mc(black)) (rcap lci uci id, lc(black))   ///
       , name(dyspareunia_adjonly, replace) 	   ///
	   yline(1, lp(dash) lc(red))  ///
	   xscale(r(0.9 1.1))  yscale(r(0.7 2.4)) ///
	   legend(off) ///
	   ylab(,nogrid) ///
	   xtitle("") ///
	   title("{bf}Pain in the vagina" "{bf}during sex", size(small))  ///
	   subtitle("11 years postpartum", size(vsmall)) ///
	   xlab(1 `""11 years" "postpartum""', labsize(vsmall)) ///
	   graphregion(color(white) margin(-2 -1 1 1)) ///
	   text(1.72 1.07 "1.72", size(2)) text(1.42 1.07 "1.42", size(2)) text(2.08 1.07 "2.08", size(2)) ///
	   text(2.4 1 "{it:p} = < 0.001", size(2)) ///
	   yscale(log range(0.7 2.4) lstyle(none)) ylabel(0.8(0.2)2.4,angle(.45) format(%03.1f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
	   fxsize(14) fysize(100)

* Pain elsewhere after sex chunk

clear
input id gr or lci uci
1	1	1.67	1.25	2.25
end
	   
set scheme s2mono

twoway (scatter or id, ms(o) mc(black)) (rcap lci uci id, lc(black))   ///
       , name(pain_adjonly, replace) 	   ///
	   yline(1, lp(dash) lc(red))  ///
	   xscale(r(0.9 1.1))  yscale(r(0.7 2.4)) ///
	   legend(off) ///
	   ylab(,nogrid) ///
	   xtitle("") ///
	   title("{bf}Pain elsewhere" "{bf}after sex", size(small))  ///
	   subtitle("11 years postpartum", size(vsmall)) ///
	   xlab(1 `""11 years" "postpartum""', labsize(vsmall)) ///
	   graphregion(color(white) margin(-2 -1 1 1)) plotregion(color(white)) ///
	   text(1.67 1.07 "1.67", size(2)) text(1.25 1.07 "1.25", size(2)) text(2.25 1.07 "2.25", size(2)) ///
	   text(2.4 1 "{it:p} = < 0.001", size(2)) ///
	   yscale(log range(0.7 2.4) lstyle(none)) ylabel(0.8(0.2)2.4,angle(.45) format(%03.1f) notick labcolor(white) labsize(*0.7)) ytitle("") ///
	   fxsize(14) fysize(100)	   

* Combine the chunks

graph combine sexsat_adjonly sexfreq_adjonly dyspareunia_adjonly pain_adjonly, row(1) graphregion(color(white)) name("fig_3", replace)
	   
