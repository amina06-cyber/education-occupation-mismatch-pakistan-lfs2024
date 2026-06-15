# Data

This folder has the cleaned dataset I used for the analysis. The raw LFS file from PBS was too large to upload and also has access restrictions, so what's here is the cleaned version after all the processing.

---

## Files

| File | Description |
|---|---|
| `LFS_2024_25_clean_mismatch_project.dta` | Final cleaned dataset — Stata format (24,042 obs, 26 variables) |
| `Mismatch_Earnings_LFS2024_25_clean.csv` | Same thing but in CSV so you can open it without Stata |

---

## Where to Get the Raw Data

**Pakistan Labour Force Survey 2024–25**
Pakistan Bureau of Statistics (PBS)

🔗 https://www.pbs.gov.pk/content/labour-force-survey

Download the raw file from there, then run `code/analysis.do` to replicate everything from scratch.

---

## Variables

| Variable | Description |
|---|---|
| `PCode` | Unique processing code |
| `Province` | Punjab, Sindh, KPK, Balochistan |
| `age` | Age in years |
| `female` | 1 = Female, 0 = Male |
| `urban` | 1 = Urban, 0 = Rural |
| `schooling_years` | Years of schooling (converted from education categories) |
| `occ_major` | ISCO-08 major occupation group (1–9) |
| `income` | Monthly net earnings in PKR |
| `ln_income` | Log of monthly income — used as dependent variable in regression |
| `experience` | Approximate work experience using Mincer formula |
| `OverEdu` | 1 = over-educated for their job |
| `UnderEdu` | 1 = under-educated for their job |
| `mismatch` | Categorical — Over-educated / Under-educated / Matched |
| `age_sq` | Age squared — captures the non-linear age-earnings relationship |

---

## How the Sample Was Built

Started with 325,445 individuals in the raw LFS file. Kept only employed wage workers, dropped missing and zero incomes, and removed the top 1% of earners as outliers. Final sample: **24,042 workers**.
