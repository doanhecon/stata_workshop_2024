/*
Last updated	: 04/14/2024
Author			: Anh Do
Affiliation		: MSU CSTAT
Software		: Stata/SE 18.0
Project			: 2024 Stata Workshop
Purpose			: Data analysis
Do file			: 04_analysis.do
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
* Import Clean Data
*-------------------------------------------------------------------------------
use "$FINAL/gpa2_clean.dta", clear


*-------------------------------------------------------------------------------
* Statistical Tests
*-------------------------------------------------------------------------------
ttest colgpa, by(athlete) // assume equal variances
ttest colgpa, by(athlete) unequal /* assume unequal variances,
								     use Satterthwaite approx. for dof */
ttest colgpa, by(athlete) welch /* assume unequal variances,
								   use Welch's approx. for dof */

// Export results
estpost ttest colgpa, by(athlete) welch 
esttab using "$OUTPUT/gpa_athlete_ttest_$DATE.csv", wide replace ///
	cells("b(star fmt(3)) se(fmt(3)) t(fmt(2)) df_t(fmt(0)) N_1 mu_1(fmt(3)) N_2 mu_2(fmt(3))") ///
	collabels("Diff" "SE" "t" "df" "N(Athlete)" "Mean(Athlete)" "N(Non-Athlete)" "Mean(Non-Athlete)") ///
	star(* 0.1 ** .05 *** 0.01) nomtitle nonumber // can add more options


*anova {outcome_var} {categorical_var}


*-------------------------------------------------------------------------------
* Simple Linear Regression
*-------------------------------------------------------------------------------
regress colgpa sat

predict colgpa_hat
predict colgpa_resid, residuals

graph twoway (scatter colgpa sat, msymbol(oh)) (lfitci colgpa sat, legend(off) ///
	ytitle("College GPA after fall semester"))
	
graph twoway scatter colgpa_resid sat, msymbol(oh) || function 0, ra(sat) ///
	legend(off) xtitle("Combined SAT score") ytitle("Residuals")
	// or alternatively,
graph twoway scatter colgpa_resid colgpa_hat, msymbol(oh) || ///
	function 0, ra(colgpa_hat) legend(off) xtitle("Fitted values") ytitle("Residuals")
	
qnorm colgpa_resid, msymbol(oh)

*regress colgpa sat, vce(robust)


*-------------------------------------------------------------------------------
* Multiple Linear Regression
*-------------------------------------------------------------------------------
reg colgpa sat hsperc hsize hsizesq i.female ib(0).athlete
	outreg2 using "$OUTPUT/gpa_reg_results_$DATE.doc", replace
	
reg colgpa sat hsperc hsize hsizesq i.female##i.athlete
	outreg2 using "$OUTPUT/gpa_reg_results_$DATE.doc", append

// The "margins" command can be helpful!	
reg colgpa c.sat##i.female

*help margins
margins, dydx(female) at(sat=(400(120)1600)) vsquish
marginsplot, yline(0)



// Close log file and end do file
log close