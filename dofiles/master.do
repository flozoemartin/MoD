
***************************************************************************************************************************

* Master file to run all do files in the correct order for mode of 	delivery & maternal sexual outcomes project

* Author: 		Flo Martin

* Date started: 30/09/2021

* Date finished:

***************************************************************************************************************************

* Contents
* line 27 - Run global.do *
* line 31 - Cleaning *
* line 35 - Multiple imputation prep *
* line 39 - Multiple imputation *
* line 43 - Analysis *
* line 47 - Figure prep *
* line 51 - Figures *
* line 55 - Supplementary figure prep *
* line 59 - Supplementary material *

***************************************************************************************************************************

* Run global.do - sets the directories for project

	do "/Users/ti19522/Documents/GitHub/MoD/dofiles/global.do"

* 1 - Cleaning

	do "$Dodir/1_cleaning.do"		// Raw data duplicated & cleaned - datasets created

* 2 - Multiple imputation prep

	do "$Dodir/2_mi_prep.do"		// Multiple imputation datasets created 

* 3 - Multiple imputation
	
	do "$Dodir/3_mi.do"				// Imputing two dataset using mi impute chained

* 4 - Analysis

	do "$Dodir/4_analysis.do"		// Descriptive & substantive analysis in imputed dataset - including table creation

* 5 - Figure preparation

	do "$Dodir/5_figure_prep.do" 	// Create dataframes used for figure 3

* 6 - Figures

	do "$Dodir/6_figures.do"		// Create figures 2 & 3

* 7 - Supplementary figure preparation

	do "$Dodir/7_supp_fig_prep.do" 	// Create dataframes used for supplementary figures 2 - 5

* 8 - Supplementary	material			

	do "$Dodir/8_supplementary.do"	// Generate supplementary material (figure 1 - 5 & tables 1 - 12)

