# Education–Occupation Mismatch and Its Impact on Individual Earnings in Pakistan

**Course Project: Data Analysis | Information Technology University, Lahore**
**Data: Labour Force Survey 2024–25 | Pakistan Bureau of Statistics**

---

## What This Project Is About

Getting more education doesn't always mean earning more money, what matters is whether your education actually matches your job. In Pakistan, a large share of workers are either over-qualified or under-qualified for what they do.

This project uses microdata from the Labour Force Survey 2024–25 to answer one question:

> Does education–occupation mismatch significantly affect individual monthly earnings in Pakistan?

---

## Key Findings

- Only **20% of workers** are properly matched to their jobs
- **Over-educated workers** earn **15.5% less** than matched workers despite having more education
- **Under-educated workers** earn **19.5% less** than matched workers
- **Women** earn **3.8% less** than men after controlling for everything else
- **Urban workers** earn **7.4% more** than rural workers
- Women make up only **5.6% of over-educated workers** but **22.9% of under-educated workers**

---

## Data

- **Source:** Pakistan Labour Force Survey 2024–25 (Pakistan Bureau of Statistics)
- **Raw sample:** 325,445 individuals
- **Final sample:** 24,042 employed wage workers aged 15–65 with positive monthly income
- **Note:** Raw LFS microdata not included due to access restrictions. Download from PBS website.

---

## Methodology

### Mismatch Construction (ORU Approach)
Following Duncan & Hoffman (1981), I constructed the mismatch variable by:
1. Converting education categories to years of schooling
2. Extracting ISCO-08 major occupation groups from 4-digit codes
3. Assigning required education per occupation group
4. Comparing actual vs required education

| Mismatch Status | Definition |
|---|---|
| Over-educated | Actual education > Required education |
| Under-educated | Actual education < Required education |
| Matched (base) | Actual education = Required education |

### Regression Model
ln(Income) = β0 + β1OverEdu + β2UnderEdu + β3Age + β4Age² + β5Female + β6Urban + Province FE + ε

---
## Repository Structure

```
education-occupation-mismatch-pakistan/
│
├── data/
│   ├── LFS_2024_25_clean_mismatch_project.dta
│   ├── Mismatch_Earnings_LFS2024_25_clean.csv
│   └── README.md
│
├── code/
│   ├── analysis.do
│   ├── histogram.ipynb
│   └── README.md
│
├── maps/
│   ├── map_graph_updated.dta
│   ├── pakprovcoord.dta
│   ├── map_province.png
│   └── README.md
│
├── graphs/
│   ├── histogram.png
│   ├── mismatch_rate_by_gender.png
│   ├── log_income_by_mismatch.png
│   ├── monthly_income_of_workers.png
│   ├── age_income_relationship.png
│   └── README.md
│
├── poster/
│   └── poster.png
│
└── README.md
```

---

## Tools Used

- **Stata 17** — data cleaning, variable construction, regression, maps
- **Python (Google Colab)** — histogram visualization
- **Power BI** — additional graphs
- **Canva** — poster design

---

## References

- Duncan & Hoffman (1981). Occupational Choice and Distribution of Earnings.
- PIDE (2024). Impact of Education Mismatch on Earnings: Evidence from Pakistan.
- Mahmood & Rana (2026). Education-Occupation Mismatch and the Role of Internal Migration Streams in Shaping Returns to Education. *Asian Journal of Applied Economics.*
- Pakistan Bureau of Statistics. Labour Force Survey 2024–25.

---

*This project was completed as part of the Data Analysis course (Semester 4, 2026).*
