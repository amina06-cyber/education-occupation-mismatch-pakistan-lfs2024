* ================================================
* Education-Occupation Mismatch and Earnings
* Labour Force Survey 2024-25
* Author: Amina Ashfaq
* Date: 2026
* ================================================

* ---- STEP 1: LOAD RAW DATA ----
clear all
set more off
use "LFS 2024-25.dta", clear

* ---- STEP 2: KEEP RELEVANT VARIABLES ----
keep PCode EBCode HHNo Weights Province Region S4C5 S4C6 S4C9 S5C12 S7C43 S5C1 S5C2 S5C4

* ---- STEP 3: FILTER TO EMPLOYED WAGE WORKERS ----
keep if S5C1 == 1 | S5C2 == 1 | S5C4 == 1

* ---- STEP 4: CLEAN INCOME ----
drop if S7C43 == . 
drop if S7C43 <= 0
sum S7C43, detail
drop if S7C43 > r(p99)

* Rename income
rename S7C43 income

* ---- STEP 5: RENAME VARIABLES ----
rename S4C5 gender
rename S4C6 age
rename S4C9 education
rename S5C12 occupation

* ---- STEP 6: CREATE LOG INCOME ----
gen ln_income = ln(income)

* ---- STEP 7: EDUCATION TO YEARS OF SCHOOLING ----
gen schooling_years = .
replace schooling_years = 0  if education == 1
replace schooling_years = 2  if education == 2
replace schooling_years = 5  if education == 3
replace schooling_years = 8  if education == 4
replace schooling_years = 10 if education == 5
replace schooling_years = 12 if education == 6
replace schooling_years = 14 if education == 7
replace schooling_years = 16 if inlist(education, 8, 9, 10, 11, 13)
replace schooling_years = 18 if education == 14
replace schooling_years = 20 if education == 15
replace schooling_years = 22 if education == 16

* ---- STEP 8: OCCUPATION MAJOR GROUP ----
gen occ_major = floor(occupation/1000)

* ---- STEP 9: REQUIRED EDUCATION PER OCCUPATION ----
gen req_edu = .
replace req_edu = 16 if inlist(occ_major, 1, 2)
replace req_edu = 12 if inlist(occ_major, 3, 4)
replace req_edu = 10 if occ_major == 5
replace req_edu = 8  if inlist(occ_major, 6, 7, 8)
replace req_edu = 5  if occ_major == 9

* ---- STEP 10: MISMATCH DUMMIES ----
gen OverEdu  = (schooling_years > req_edu)
gen UnderEdu = (schooling_years < req_edu)
gen matched  = (schooling_years == req_edu)

* ---- STEP 11: CONTROL VARIABLES ----
gen female = (gender == 2)
gen urban  = (Region == 2)
gen age_sq = age^2
gen experience = age - schooling_years - 6
replace experience = 0 if experience < 0

* ---- STEP 12: DESCRIPTIVE STATISTICS ----
tabstat income age schooling_years OverEdu UnderEdu female urban, stats(mean sd min max) columns(statistics) format(%9.2f)

* Correlation
pwcorr income schooling_years age, sig

* Cross tabulation
tab mismatch female, row nofreq

* ---- STEP 13: GRAPHS ----

* Graph 1 - Mean income by mismatch
graph bar (mean) income, over(mismatch) title("Mean Monthly Income by Mismatch Status") ytitle("Mean Monthly Income (PKR)") blabel(bar, format(%9.0f))
graph export "graph1_income_mismatch.png", replace width(2000)

* Graph 2 - Histogram
histogram income, title("Distribution of Monthly Income") xtitle("Monthly Income (PKR)") ytitle("Density") color("26 82 118%70") lcolor(white) graphregion(color(white))
graph export "graph2_histogram.png", replace width(2000)

* Graph 3 - Mismatch by gender
graph bar (mean) OverEdu UnderEdu, over(female) title("Mismatch Rate by Gender") ytitle("Proportion of Workers") legend(label(1 "Over-Educated") label(2 "Under-Educated"))
graph export "graph3_gender_mismatch.png", replace width(2000)

* Graph 4 - KDensity by mismatch
twoway (kdensity income if mismatch==1) (kdensity income if mismatch==2) (kdensity income if mismatch==3), title("Income Distribution by Mismatch Status") xtitle("Monthly Income (PKR)") 
ytitle("Density")
graph export "graph4_kdensity.png", replace width(2000)

* ---- STEP 14: REGRESSION ----

* Model 1 - Basic
reg ln_income OverEdu UnderEdu age age_sq female

* Model 2 - Full with controls
reg ln_income OverEdu UnderEdu age age_sq female urban i.Province

* ---- STEP 15: SAVE FINAL DATASET ----
save "LFS_2024_25_clean_mismatch_project.dta", replace