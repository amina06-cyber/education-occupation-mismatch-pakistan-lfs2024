# Education–Occupation Mismatch and Its Impact on Individual Earnings in Pakistan

This repository contains the code and outputs for my poster project:

> **Education–Occupation Mismatch and Its Impact on Individual Earnings in Pakistan (Labour Force Survey 2024–25)**

---

## 1. Project Overview

In many labour markets, getting more education does not always mean earning more money – what matters is whether your education **matches** your job.[file:74] In Pakistan, a large share of workers are either over‑ or under‑qualified for the jobs they do.  

This project uses microdata from the **Pakistan Labour Force Survey (LFS) 2024–25** to answer:

> **Does education–occupation mismatch significantly affect individual monthly earnings in Pakistan?**[file:74]

---

## 2. Data

- **Source**: Pakistan Labour Force Survey 2024–25 (Pakistan Bureau of Statistics).  
- **Population**: Individuals aged 10+ in Pakistan.  
- **Analytical sample**:
  - Employed individuals aged **15–65**.  
  - Positive monthly wage/salary income.  
  - Final sample size after cleaning: **≈ 24,042 workers**.[file:74]

> **Note**: The raw LFS microdata are not included in this repository due to access and confidentiality. All code assumes the user has access to the original `.sav` / `.dta` file from PBS.

**Key variables used**

- `income`: monthly wage/salary income (PKR).  
- `lnincome`: natural log of monthly income (constructed).  
- `age`, `age2`: age in years and age squared.  
- `schooling`: years of schooling (constructed from LFS education codes).  
- `gender`: female dummy.  
- `urban`: urban dummy.  
- `province`: province fixed effects.  
- `over_educated`, `under_educated`, `matched`: education–occupation mismatch dummies.[file:74]

---

## 3. Methodology

### 3.1 Sample cleaning

Main steps (implemented in `01_cleaning_and_sample.do`):

1. Load LFS worker file.  
2. Keep employed / self‑employed individuals.  
3. Drop observations with zero or missing income.  
4. Trim the top 1% of the income distribution to reduce the influence of extreme outliers.  
5. Generate log income: `lnincome = ln(income)`.[file:74]

### 3.2 Constructing mismatch

Implemented in `02_construct_mismatch.do`.

1. Convert education categories to **years of schooling** using an ISCED‑style mapping.  
2. Derive **occupation major groups** from ISCO/PSCO codes.  
3. Assign a **required education level** to each occupation group (ORU-style rule):[file:74]

| Occupation group              | Examples (ISCO)   | Required level |
|------------------------------|-------------------|----------------|
| Managers & professionals     | 1–2               | Degree or above |
| Technicians & clerical       | 3–4               | Intermediate    |
| Service, skilled agriculture | 5–8               | Middle/Matric   |
| Elementary jobs              | 9                 | Primary         |

4. Compare actual vs required education to create mismatch dummies:
   - `over_educated = 1` if actual > required.  
   - `under_educated = 1` if actual < required.  
   - `matched = 1` if actual == required (reference group).[file:74]

### 3.3 Regression model

Implemented in `03_regression_and_tables.do`.

I estimate an OLS earnings equation:

\[
\ln(\text{income}_i) = \beta_0 + \beta_1 \text{OverEdu}_i + \beta_2 \text{UnderEdu}_i
+ \beta_3 \text{Age}_i + \beta_4 \text{Age}_i^2 + \beta_5 \text{Female}_i
+ \beta_6 \text{Urban}_i + \sum_p \gamma_p \text{Province}_{ip} + \varepsilon_i
\]

- Dependent variable: log monthly income.  
- Main variables of interest: over‑educated and under‑educated (matched is the omitted category).  
- Controls: age, age squared, gender, urban/rural, province fixed effects, years of schooling.[file:74]

Interpretation (approximate, since the DV is in logs):

- **Under‑educated** workers earn about **19.5% less** than matched workers, holding other factors constant.[file:74]  
- **Over‑educated** workers earn about **15.5% less** than matched workers.  
- **Female** workers earn about **3.8% less** than otherwise similar males.  
- **Urban** workers earn about **7.4% more** than rural workers.[file:74]  

---

## 4. Key Findings

- Education–occupation mismatch is widespread: roughly **68%** of workers are either over‑ or under‑educated for their job.[file:74]  
- Both under‑ and over‑education are associated with substantial earnings penalties relative to matched workers.  
- Women are more likely to be over‑educated and face an additional wage gap.  
- Urban workers earn significantly more than rural workers, even after adjusting for education and mismatch.[file:74]

These patterns suggest that Pakistan’s labour market is not using human capital efficiently and that better job–education alignment could raise productivity.

---

## 5. Visuals

The `poster/` and `outputs/` folders include:

- The final **academic poster** (JPG/PDF) summarizing motivation, data, model, and results.  
- Selected figures:
  - Distribution of monthly income.  
  - Log income by mismatch status.  
  - Mismatch rates by gender.  
  - Relationship between age and log income.  
  - Mean monthly income by province.[file:74]

---

## 6. Skills Demonstrated

- **Data cleaning & wrangling** with Stata (LFS microdata).  
- **Feature engineering**: converting categorical education & occupation codes into numeric years and mismatch measures.  
- **Econometric modelling**: OLS with log‑income, interpretation of coefficients and significance.  
- **Data visualization**: descriptive plots and an integrated research poster.  
- **Communication**: translating an empirical labour‑economics question into an applied data‑analysis project.
