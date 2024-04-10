// Summary statistics table
estpost sum, listwise
esttab using "$OUTPUT/summary_stats_$DATE.doc", cells("mean sd min max") ///
	nomtitle nonumber replace	
//or
asdoc sum, replace save($OUTPUT/summary_stats_$DATE.doc) ///
	title(Descriptive statistics for GPA2 data)
	