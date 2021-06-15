<div align="center">

<p style="font-family: verdana, sans-serif; font-size:20pt; font-weight:bold"> Associations between mode of delivery & maternal sexual outcomes: a 
longitudinal study using the ALSPAC cohort </p>

</div>

```{s, echo=FALSE, results=FALSE}
	cd "/Users/ti19522/OneDrive - University of Bristol/Documents/PhD/Year 1/ALSPAC MoD Study"
	use flo_dataset2ndDec.dta, clear
```

<p style="font-family: verdana, sans-serif; font-size:18pt; font-weight:bold"> Rationale </p>
<p style="font-family: verdana, sans-serif; font-size:12pt"> Current evidence has been derived using short follow-up times or cross-sectional study designs 
in the immediate postpartum period, limiting our ability to be able to distinguish between the transient and permanent effects of childbirth on sexual outcomes. 
The focus on sexual pain in the absence of other outcomes also leaves questions surrounding enjoyment of sex unanswered in the literature. </p>

<p style="font-family: verdana, sans-serif; font-size:18pt; font-weight:bold"> Aims & Objectives </p>
<p style="font-family: verdana, sans-serif; font-size:12pt"> To investigate the associations between mode of delivery and maternal sexual outcomes, this study 
will use the ALSPAC cohort and examine self-report questionnaire data from four timepoints postpartum: 33 months, 5, 12 and 18 years. Participant characteristics 
of responders at 33 months, who have complete data on covariates and mode of delivery data available, will be described. Responses to questions pertaining to two 
sexual outcomes will be explored: sexual enjoyment and sexual frequency. Mode of delivery (exposure) will be stratified into vaginal delivery and caesarean 
section (CS) for comparison. Vaginal delivery will be further stratified into non-instrumental and instrumental; for caesarean section, elective and emergency CS 
will be compared in the context of both primary outcomes. </p>

```{s, echo=FALSE}
tab vaginal_delivery
```

```{s, echo=FALSE}
tab instrumental_del 
```

```{s, echo=FALSE}
tab caesarean_bin 
```

<p style="font-family: verdana, sans-serif; font-size:12pt"> Secondary outcomes regarding sexual pain, pain in the vagina during sex (dyspareunia) and pain 
elsewhere after sex, measured at 11 years postpartum via self-report questionnaire will also be explored. The same exposures will be investigated. </p>

<p style="font-family: verdana, sans-serif; font-size:12pt"> Sensitivity analyses will be utilised in order to assess the robustness of the findings of a 
complete case analysis, employing multiple imputation & worst case scenario modelling to deal with those who responded "no sex at the moment" in sexual 
enjoyment. </p>

<p style="font-family: verdana, sans-serif; font-size:12pt"> In order to understand the distribution of responses, I have derived histograms at each timepoint 
for each outcome for the three sets of comparisons: </p>

<p style="font-family: verdana, sans-serif; font-size:16pt; font-weight:bold"> Vaginal delivery vs Caesarean section </p>
<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> Sexual enjoyment </p>
<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 33 months postpartum </p>

```{s, echo=FALSE}
tab vaginal_delivery sexsat_33mo if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexsat_33mo if  parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(vaginal_delivery) 
  xlabel(0(1)4, valuelabel labsize(1.5)) title(33 months postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 5 years postpartum </p>

```{s, echo=FALSE}
tab vaginal_delivery sexsat_5yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexsat_5yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(vaginal_delivery) 
  xlabel(0(1)4, valuelabel labsize(1.5)) title(5 years postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 12 years postpartum </p>

```{s, echo=FALSE}
tab vaginal_delivery sexsat_12yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexsat_12yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(vaginal_delivery) 
  xlabel(0(1)4, valuelabel labsize(1.5)) title(12 years postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 18 years postpartum </p>

```{s, echo=FALSE}
tab vaginal_delivery sexsat_18yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexsat_18yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(vaginal_delivery) 
  xlabel(0(1)4, valuelabel labsize(1.5)) title(18 years postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> Sexual frequency </p>
<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 33 months postpartum </p>

```{s, echo=FALSE}
tab vaginal_delivery sexfreq_33mo if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexfreq_33mo if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(vaginal_delivery) 
  xlabel(0(1)4, valuelabel labsize(1.2)) title(33 months postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 5 years postpartum </p>

```{s, echo=FALSE}
tab vaginal_delivery sexfreq_5yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexfreq_5yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(vaginal_delivery) 
  xlabel(0(1)4, valuelabel labsize(1.2)) title(5 years postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 12 years postpartum </p>

```{s, echo=FALSE}
tab vaginal_delivery sexfreq_12yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexfreq_12yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(vaginal_delivery) 
  xlabel(0(1)4, valuelabel labsize(1.2)) title(12 years postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 18 years postpartum </p>

```{s, echo=FALSE}
tab vaginal_delivery sexfreq_18yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexfreq_18yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(vaginal_delivery) 
  xlabel(0(1)4, valuelabel labsize(1.2)) title(18 years postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> Sexual pain </p>
<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 11 years postpartum </p>

```{s, echo=FALSE}
tab vaginal_delivery dyspareunia_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram dyspareunia_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(vaginal_delivery) 
  xlabel(0(1)3, valuelabel labsize(1.8)) title(18 years postpartum, size(3))
```

</div>

```{s, echo=FALSE}
tab vaginal_delivery pain_elsewhere_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram pain_elsewhere_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(vaginal_delivery) 
  xlabel(0(1)4, valuelabel labsize(1.8)) title(18 years postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:16pt; font-weight:bold"> Non-instrumental VD vs Instrumental VD </p>
<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> Sexual enjoyment </p>
<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 33 months postpartum </p>

```{s, echo=FALSE}
tab instrumental_del sexsat_33mo if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexsat_33mo if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(instrumental_del) 
  xlabel(0(1)4, valuelabel labsize(1.5)) title(33 months postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 5 years postpartum </p>

```{s, echo=FALSE}
tab instrumental_del sexsat_5yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexsat_5yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(instrumental_del) 
  xlabel(0(1)4, valuelabel labsize(1.5)) title(5 years postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 12 years postpartum </p>

```{s, echo=FALSE}
tab instrumental_del sexsat_12yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexsat_12yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(instrumental_del) 
  xlabel(0(1)4, valuelabel labsize(1.5)) title(12 years postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 18 years postpartum </p>

```{s, echo=FALSE}
tab instrumental_del sexsat_18yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexsat_18yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(instrumental_del) 
  xlabel(0(1)4, valuelabel labsize(1.5)) title(18 years postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> Sexual frequency </p>
<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 33 months postpartum </p>

```{s, echo=FALSE}
tab instrumental_del sexfreq_33mo if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexfreq_33mo if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(instrumental_del) 
  xlabel(0(1)4, valuelabel labsize(1.2)) title(33 months postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 5 years postpartum </p>

```{s, echo=FALSE}
tab instrumental_del sexfreq_5yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexfreq_5yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(instrumental_del) 
  xlabel(0(1)4, valuelabel labsize(1.2)) title(5 years postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 12 years postpartum </p>

```{s, echo=FALSE}
tab instrumental_del sexfreq_12yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexfreq_12yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(instrumental_del) 
  xlabel(0(1)4, valuelabel labsize(1.2)) title(12 years postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 18 years postpartum </p>

```{s, echo=FALSE}
tab instrumental_del sexfreq_18yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexfreq_18yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(instrumental_del) 
  xlabel(0(1)4, valuelabel labsize(1.2)) title(18 years postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> Sexual pain </p>
<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 11 years postpartum </p>

```{s, echo=FALSE}
tab instrumental_del dyspareunia_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram dyspareunia_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(instrumental_del) 
  xlabel(0(1)3, valuelabel labsize(1.8)) title(18 years postpartum, size(3))
```

</div>

```{s, echo=FALSE}
tab instrumental_del pain_elsewhere_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram pain_elsewhere_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(instrumental_del) 
  xlabel(0(1)4, valuelabel labsize(1.8)) title(18 years postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:16pt; font-weight:bold"> Elective CS vs Emergency CS </p>
<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> Sexual enjoyment </p>
<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 33 months postpartum </p>

```{s, echo=FALSE}
tab caesarean_bin sexsat_33mo if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexsat_33mo if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(caesarean_bin) 
  xlabel(0(1)4, valuelabel labsize(1.5)) title(33 months postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 5 years postpartum </p>

```{s, echo=FALSE}
tab caesarean_bin sexsat_5yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexsat_5yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(caesarean_bin) 
  xlabel(0(1)4, valuelabel labsize(1.5)) title(5 years postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 12 years postpartum </p>

```{s, echo=FALSE}
tab caesarean_bin sexsat_12yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexsat_12yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(caesarean_bin) 
  xlabel(0(1)4, valuelabel labsize(1.5)) title(12 years postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 18 years postpartum </p>

```{s, echo=FALSE}
tab caesarean_bin sexsat_18yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexsat_18yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(caesarean_bin) 
  xlabel(0(1)4, valuelabel labsize(1.5)) title(18 years postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> Sexual frequency </p>
<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 33 months postpartum </p>

```{s, echo=FALSE}
tab caesarean_bin sexfreq_33mo if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexfreq_33mo if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(caesarean_bin) 
  xlabel(0(1)4, valuelabel labsize(1.2)) title(33 months postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 5 years postpartum </p>

```{s, echo=FALSE}
tab caesarean_bin sexfreq_5yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexfreq_5yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(caesarean_bin) 
  xlabel(0(1)4, valuelabel labsize(1.2)) title(5 years postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 12 years postpartum </p>

```{s, echo=FALSE}
tab caesarean_bin sexfreq_12yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexfreq_12yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(caesarean_bin) 
  xlabel(0(1)4, valuelabel labsize(1.2)) title(12 years postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 18 years postpartum </p>

```{s, echo=FALSE}
tab caesarean_bin sexfreq_18yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram sexfreq_18yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(caesarean_bin) 
  xlabel(0(1)4, valuelabel labsize(1.2)) title(18 years postpartum, size(3))
```

</div>

<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> Sexual pain </p>
<p style="font-family: verdana, sans-serif; font-size:14pt; font-weight:bold"> 11 years postpartum </p>

```{s, echo=FALSE}
tab caesarean_bin dyspareunia_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram dyspareunia_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(caesarean_bin) 
  xlabel(0(1)3, valuelabel labsize(1.8)) title(18 years postpartum, size(3))
```

</div>

```{s, echo=FALSE}
tab caesarean_bin pain_elsewhere_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=.
```

<div align="center">

```{s, echo=FALSE}
	histogram pain_elsewhere_11yr if parity_18wkgest !=. & cc_anxiety_18wkgest !=. & epds_18wkgest !=. & mat_edu_2 !=. & mat_bmi !=., discrete by(caesarean_bin) 
  xlabel(0(1)4, valuelabel labsize(1.8)) title(18 years postpartum, size(3))
```

</div>
