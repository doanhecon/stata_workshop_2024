/*
Last updated	: 03/31/2024
Author			: Anh Do
Affiliation		: MSU CSTAT
Software		: Stata/SE 18.0
Project			: 2024 Stata Workshop
Purpose			: Master do file
Do file			: 01_master.do
*/


*-------------------------------------------------------------------------------
* Setup
*-------------------------------------------------------------------------------
version 18
set more off, permanently
clear all
macro drop _all

*-------------------------------------------------------------------------------
* Define Project Folder Paths And Other Globals
*-------------------------------------------------------------------------------
global ROOT "C:/Users/doanh/Desktop/stata_workshop_2024/"
global CODE "$ROOT/code"
global RAW "$ROOT/raw_data"
global FINAL "$ROOT/final_data"
global OUTPUT "$ROOT/output"
global LOG "$ROOT/log"
global DATE: display %tdCCYY-NN-DD = daily("`c(current_date)'", "DMY")


*-------------------------------------------------------------------------------
* Install Packages
*-------------------------------------------------------------------------------
// For data missingess
ssc install mdesc, replace

// Export codebook
ssc install codebookout, replace // to MS Excel
ssc install wordcb, replace // to MS Word
ssc install htmlcb, replace // to HTML

// Various packages for exporting tables in LaTeX, Word, Excel, HTML, etc.
ssc install outreg2, replace
ssc install estout, replace
ssc install tabout, replace
ssc install asdoc, replace


*-------------------------------------------------------------------------------
* Execute Do Files
*-------------------------------------------------------------------------------
do "$CODE/02_process_data.do"