# Analysis Plan for Mode of Delivery Study

Author: Flo Martin

Date: 11/11/2020

## Research question
Is mode of delivery associated with subsequent maternal enjoyment, frequency or pain at different time-points in the ALSPAC cohort? Is caesarean section protective of sexual function or is type of intervention more prone to sexual function decline than others?

## Overview
I am going to use the Avon Longitudinal Study of Parents and Children (ALSPAC) cohort to investigate mode of delivery and its potential association with maternal sexual outcomes at various time-points postpartum. I will first describe the participant characteristics of the women enrolled at the earliest time-point with both sexual enjoyment and frequency (33 months postpartum) and then compare these characteristics to responders at 18 years to both questions. Still working out which time-points and who is to be included in the analyses!

Having described the women in the delivery groups, I will then move onto using ordinal logistic regression to understand the relationship between mode of delivery and sexual outcomes. I will generate crude and adjusted models for maternal age, parity, maternal BMI, anxiety and depression. I will then develop an imputation model to deal with missing data in this dataset and perform a sensitivity analysis for women reporting 'no sex at the moment'.

### Section 1 - Preparing & cleaning the data
- [x] Check the cleaning & recoding script from Jun/Jul '20
- [x] Condense the regressions for each time-point into loops
- [ ] Decide on who to include at each time-point & which time-points to include
- [ ] Decide how to lay out characteristics for whom
- [ ] Re-pull the dataset including variable stratifying type of caesarean section

### Section 2 - Analysing the data
- [ ] Run ordinal logistic regression models for crude & adjusted (for maternal age & BMI, parity, anxiety & depression) models
  - Vaginal delivery vs caesarean section for outcomes at each timepoint
  - Instrumental vs non-instrumental vaginal for outcomes at each timepoint
  - Elective vs emergency caesarean section for outcomes at each timepoint (if N high enough)
- [ ] Develop imputation model & run
- [ ] Perform sensitivity analysis for excluded mother's
