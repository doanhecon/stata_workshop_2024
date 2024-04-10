/*
Last updated	: 03/31/2024
Author			: Anh Do
Affiliation		: MSU CSTAT
Software		: Stata/SE 18.0
Project			: 2024 Stata Workshop
Purpose			: Import and process raw data
Do file			: 02_process_data.do
*/


*-------------------------------------------------------------------------------
* Setup
*-------------------------------------------------------------------------------
version 18
set more off, permanently
clear all
set linesize 115
capture log close
log using "$LOG/02_process_data_$DATE.log", replace


*-------------------------------------------------------------------------------
* Data Processing
*-------------------------------------------------------------------------------
// Import data
import delimited "$RAW/gpa2_mod.csv"

// First, let's quickly check what's in our dataset
describe, full
summarize
codebook
mdesc
list in 1/10
tabulate athlete, missing
count

// Label variables
label variable sat "Combined SAT score (400-1600)"
lab var tothrs "Total hours of college courses through fall semester"
lab var colgpa "College GPA after fall semester, 4-point scale"
lab var verbmath "Verbal/Math SAT score"
lab var hsize "Size of graduating highschool class, in 100s"
lab var hsrank "Rank in graduating highschool class"
lab var hsperc "High school rank percentile"
lab var female "=1 if female"
lab var white "=1 if white"
lab var black "=1 if black"
lab var hsizesq "hsize^2"
lab var athlete "=1 if athelete"

// Create value labels
label define female_lab 0 "male" 1 "female"
	label values female female_lab

codebook female

// Keep relevant variables
keep sat-colgpa hsize-athlete
	// or drop variables
*drop verbmath

// Clean variable athlete
tab athlete
generate athlete2 = lower(athlete)
replace athlete2 = "no" if athlete2 == "n"
replace athlete2 = "yes" if athlete2 == "y"
tab athlete2

label define athlete_lab 0 "no" 1 "yes"
encode athlete2, generate(athlete_n) label(athlete_lab)

drop athlete athlete2
rename athlete_n athlete
lab var athlete "=1 if athelete" //this is why I usually do this last

// Deal with missingness
list if missing(sat)
count if sat == .
count if sat > 0 
* Note: Numeric missing values are coded as very large positive values in Stata.
* 		Therefore, the expression "sat > 0" is TRUE if sat is greater than 0 or
*		missing.
drop if missing(sat) // listwise deletion because I generated this fake obs

// Remove an obviously wrong data point
histogram colgpa
drop if colgpa > 4


*-------------------------------------------------------------------------------
* Save Clean Data and Export Codebook
*-------------------------------------------------------------------------------
// Save clean data in Stata format
save "$FINAL/gpa2_clean.dta", replace
* Note: Can also save a time-stamped version if needed.

// Codebook
htmlcb, saving($OUTPUT/gpa2_codebook.html) replace //interactive HTML format

// Close log file and end do file
log close

