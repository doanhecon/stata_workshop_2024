/*
Last updated	: 04/11/2024
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
* Read in clean data
*-------------------------------------------------------------------------------
use "$FINAL/gpa2_clean.dta", clear