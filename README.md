# Education–Occupation Mismatch and Its Impact on Individual Earnings in Pakistan

This repository contains the code and outputs for my poster project:

**“Education–Occupation Mismatch and Its Impact on Individual Earnings in Pakistan (Labour Force Survey 2024–25)”**

---

## 1. Project Overview

In many labour markets, getting more education does not always mean earning more money – what matters is whether your education matches your job. In Pakistan, a large share of workers are either over‑qualified or under‑qualified for the jobs they do.

This project uses microdata from the Pakistan Labour Force Survey (LFS) 2024–25 to answer:

> Does education–occupation mismatch significantly affect individual monthly earnings in Pakistan?

---

## 2. Data

- **Source:** Pakistan Labour Force Survey 2024–25 (Pakistan Bureau of Statistics).  
- **Population:** Individuals aged 10+ in Pakistan.  
- **Analytical sample:**
  - Employed individuals aged 15–65  
  - Positive monthly wage/salary income  
  - Final sample size after cleaning: approximately 24,000 workers

> **Note:** The raw LFS microdata are not included in this repository due to access and confidentiality. All code assumes the user has access to the original LFS file from PBS.

### Key variables

- `income` – monthly wage/salary income (PKR)  
- `lnincome` – natural log of monthly income (constructed)  
- `age`, `age2` – age in years and age squared  
- `schooling` – years of schooling (constructed from LFS education codes)  
- `gender` – dummy for female  
- `urban` – dummy for urban location  
- `province` – province identifier / fixed effects  
- `over_educated`, `under_educated`, `matched` – education–occupation mismatch dummies

---

## 3. Methodology

### 3.1 Sample cleaning

Implemented in `code/01_cleaning_and_sample.do`:

1. Load the LFS worker file.  
2. Keep employed / self‑employed individuals.  
3. Drop observations with zero or missing income.  
4. Trim the top 1% of the income distribution to reduce the influence of extreme outliers.  
5. Generate log income:

   - `gen lnincome = ln(income)`

### 3.2 Constructing education–occupation mismatch

Implemented in `code/02_construct_mismatch.do`.

1. Convert categorical education codes to **years of schooling** using an ISCED‑style mapping (e.g., primary, middle, matric, intermediate, bachelor’s, master’s, etc.).  
2. Derive **occupation major groups** from the 4‑digit PSCO/ISCO codes (managers, professionals, technicians, service/sales, agriculture, craft, machine operators, elementary jobs).  
3. Assign a **required education level** to each occupation group (ORU‑style rule), for example:

   - Managers and professionals → degree or above  
   - Technicians and clerical workers → intermediate  
   - Service and skilled agriculture / craft / operators → middle or matric  
   - Elementary jobs → primary

4. Compare actual vs required education to create mismatch dummies:

   - `over_educated = 1` if actual education > required education  
   - `under_educated = 1` if actual education < required education  
   - `matched = 1` if actual education == required education (reference group)

### 3.3 Regression model

Implemented in `code/03_regression_and_tables.do`.

The main earnings equation is a standard OLS model:

> log(income_i) = β0  
> + β1 * OverEdu_i  
> + β2 * UnderEdu_i  
> + β3 * Age_i  
> + β4 * AgeSquared_i  
> + β5 * Female_i  
> + β6 * Urban_i  
> + Province fixed effects  
> + error_i

- **Dependent variable:** `lnincome` (natural log of monthly income).  
- **Key variables of interest:** `over_educated` and `under_educated` (with `matched` as the omitted category).  
- **Controls:** age, age squared, gender, urban/rural, province fixed effects, and years of schooling.

Interpretation (approximate, since the dependent variable is in logs):

- Under‑educated workers earn about **19.5% less** than matched workers, holding other factors constant.  
- Over‑educated workers earn about **15.5% less** than matched workers.  
- Female workers earn about **3.8% less** than otherwise similar male workers.  
- Urban workers earn about **7.4% more** than rural workers.

---

## 4. Key Findings

- Education–occupation mismatch is widespread: roughly **two‑thirds** of workers are either over‑ or under‑educated for their job.  
- Both under‑education and over‑education are associated with substantial earnings penalties relative to matched workers.  
- Women are more likely to be over‑educated and face an additional wage gap.  
- Urban workers earn significantly more than rural workers, even after adjusting for education and mismatch.

These patterns suggest that Pakistan’s labour market is not using human capital efficiently and that better job–education alignment could raise productivity and reduce inequality.

---

## 5. Repository Structure

Suggested layout:

```text
.
├── README.md
├── code
│   ├── 01_cleaning_and_sample.do
│   ├── 02_construct_mismatch.do
│   └── 03_regression_and_tables.do
├── outputs
│   ├── descriptive_stats.csv
│   ├── regression_results.csv
│   └── plots/
│       ├── income_distribution.png
│       ├── log_income_by_mismatch.png
│       ├── mismatch_by_gender.png
│       └── age_income_relationship.png
└── poster
    └── education-occupation-mismatch-poster.jpg
```

---

## 6. Skills Demonstrated

- Data cleaning and wrangling with Stata (LFS microdata)  
- Feature engineering (education years, occupation groups, mismatch indicators)  
- Econometric modelling (log‑income OLS, interpretation of coefficients and significance)  
- Data visualization (distribution plots, group comparisons, regression results)  
- Research communication (academic poster and written summary)
