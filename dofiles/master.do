
* Author: 		Flo Martin

* Date: 		30th September 2021

* Description: 	Master file to run all do files in the correct order for mode of 	delivery & maternal sexual outcomes project

* Contents
* 1 - Run global.do
* 2 - Cleaning
* 3 - Analyses
* 4 - Figures
* 5 - Multiple imputation
* 6 - Supplementary material

* 1 - Run global.do - sets the directories for project
do "/Users/ti19522/Documents/GitHub/MoD/dofiles/global.do"


* 2 - Cleaning
do "$Dodir/1_cleaning.do"		// Raw data duplicated & cleaned - datasets created


* 3 - Analyses
do "$Dodir/2_analysis.do"		// Descriptive & substantive analyses


* 4 - Figures
do "$Dodir/3_figures.do"		// Create figures 2 & 3


* 5 - Multiple imputation		
do "$Dodir/4_mi_prep.do"	// Prepare data for multiple imputation
*do "$Dodir/4_mi.do"		// Run the imputation models


* 6 - Supplementary				
do "$Dodir/5_supplementary.do"	// Generate supplementary material (figures & tables)



