/*
Last updated	: 04/10/2024
Author			: Anh Do
Affiliation		: MSU CSTAT
Software		: Stata/SE 18.0
Project			: 2024 Stata Workshop
Purpose			: Explore data with summary tables and graphs
Do file			: 03_process_data.do
*/


*-------------------------------------------------------------------------------
* Setup
*-------------------------------------------------------------------------------
version 18
set more off, permanently
clear all
set linesize 115
capture log close
log using "$LOG/03_explore_data_$DATE.log", replace


*-------------------------------------------------------------------------------
* Read in clean data
*-------------------------------------------------------------------------------
use "$FINAL/gpa2_clean.dta", clear


*-------------------------------------------------------------------------------
* Summarize Data
*-------------------------------------------------------------------------------
* summarize
* summarize, detail
sum colgpa if female == 1
tabstat sat, by(athlete) stat(n mean sd)

// Summary statistics table
estpost sum, listwise
esttab using "$OUTPUT/summary_stats_$DATE.doc", cells("mean sd min max") ///
	nomtitle nonumber replace	
//or
asdoc sum, replace save($OUTPUT/summary_stats_$DATE.doc) ///
	title(Descriptive statistics for GPA2 data)
	
// Correlations
correlate // listwise deletion of missing data
*pwcorr, obs // pairwise deletion
	// Export
asdoc corr sat colgpa hsrank, save($OUTPUT/corr_mat_$DATE.doc) replace
	
	
*-------------------------------------------------------------------------------
* Data Visualization: One Variable
*-------------------------------------------------------------------------------	
// Continuous:
histogram sat, normal
graph export "$OUTPUT/sat_hist.pdf"

// Discrete:
graph bar (mean) athlete, over(female) ytitle("Proportion of athletes")
* graph export ...

*-------------------------------------------------------------------------------
* Data Visualization: One Continuous, One Discrete
*-------------------------------------------------------------------------------
// Box plot
graph box sat, over(athlete) by(female)


*-------------------------------------------------------------------------------
* Data Visualization: Two+ Continuous
*-------------------------------------------------------------------------------
// Scatterplot
twoway scatter colgpa sat

// Scatterplot with linear fitted line
twoway (scatter colgpa sat, msymbol(oh)) (lfitci colgpa sat, legend(off))
	
// Close log file and end do file
log close
	