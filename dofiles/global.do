
* Mode of delivery on sexual health outcomes using ALSPAC - Runs all the global macros for the ALSPAC MoD & sexual outcomes project. To be run at the start of all Stata sessions

* Author: Flo Martin 

* Date started: 30/09/2021

clear 

global Projectdir "/Users/ti19522/OneDrive - University of Bristol/Mode of delivery study/Analysis"

global Dodir 		"/Users/ti19522/Documents/GitHub/MoD/dofiles"
global Logdir 		"$Projectdir/logfiles"
global Datadir 		"$Projectdir/datafiles"
global Rawdatdir 	"$Projectdir/rawdata"
global Graphdir 	"$Projectdir/graphfiles"

cd "$Projectdir"
