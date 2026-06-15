# Data

This folder contains the cleaned analytical dataset used in the project.

---

## Files

| File | Description |
|---|---|
| `LFS_2024_25_clean_mismatch_project.dta` | Final cleaned dataset in Stata format (24,042 observations, 26 variables) |
| `Mismatch_Earnings_LFS2024_25_clean.csv` | Same dataset in CSV format, accessible without Stata |

---

## Data Source

**Pakistan Labour Force Survey 2024–25**
Collected by the Pakistan Bureau of Statistics (PBS)

🔗 Download the raw data here: https://www.pbs.gov.pk/content/labour-force-survey

> **Note:** The raw LFS microdata is not included in this repository. The files here are the cleaned and processed versions. To replicate from scratch, download the original LFS file from PBS and run `code/analysis.do`

---

## Variable Description

| Variable | Type | Description |
|---|---|---|
| `PCode` | String | Processing code — unique identifier |
| `Province` | Categorical | Province (Punjab, Sindh, KPK, Balochistan) |
| `Region` | Binary | 1 = Rural, 2 = Urban |
| `age` | Continuous | Age in years (15–65) |
| `female` | Dummy | 1 = Female, 0 = Male |
| `urban` | Dummy | 1 = Urban, 0 = Rural |
| `education` | Categorical | Education level (original LFS codes) |
| `schooling_years` | Continuous | Years of schooling (converted from education categories) |
| `occupation` | Categorical | 4-digit ISCO-08 occupation code |
| `occ_major` | Categorical | ISCO-08 major group (1–9) |
| `income` | Continuous | Monthly net earnings in PKR |
| `ln_income` | Continuous | Natural log of monthly income |
| `experience` | Continuous | Approximate work experience (Mincer formula) |
| `OverEdu` | Dummy | 1 = Over-educated (actual education > required) |
| `UnderEdu` | Dummy | 1 = Under-educated (actual education < required) |
| `mismatch` | Categorical | Over-educated / Under-educated / Matched |
| `expected_education` | Continuous | Required education for occupation (1–5 scale) |
| `age_sq` | Continuous | Age squared (for non-linear age effect) |

---

## Sample Construction

| Step | Observations |
|---|---|
| Raw LFS sample | 325,445 |
| Kept employed wage workers | ~81,000 |
| Dropped missing income | ~24,500 |
| Dropped zero/negative income | ~24,400 |
| Dropped top 1% income outliers | 24,042 |
| **Final sample** | **24,042** |
