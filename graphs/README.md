# Graphs

All the visualizations from the project. Mix of tools, most were made in Stata, one in Python, and two in Power BI.

---

## Files

| File | Tool | Type |
|---|---|---|
| `histogram.png` | Python | Income distribution |
| `monthly_income_of_workers.png` | Power BI | Mean income by mismatch status |
| `mismatch_rate_by_gender.png` | Power BI | Mismatch rate by gender |
| `log_income_by_mismatch.png` | Stata | KDensity, log income by mismatch |
| `age_income_relationship.png` | Stata | Age vs log income scatter |
| `map_province.png` | Stata + Canva | Province-wise mean income map |

---

## What each graph shows

**histogram.png**
Distribution of monthly income across all 24,042 workers. Most people earn between PKR 25,000 and 60,000 but the long right tail shows a small number of very high earners. This right-skewed shape is exactly why log income was used in the regression instead of raw income.

**monthly_income_of_workers.png**
Mean monthly income for each mismatch group. Matched workers earn PKR 56,023, over-educated earn PKR 45,416, under-educated earn PKR 43,625. This is the most direct visual answer to the research question.

**mismatch_rate_by_gender.png**
Proportion of over-educated and under-educated workers split by gender. Women make up only 5.6% of over-educated workers but 22.9% of under-educated workers, which says a lot about job access and gender in Pakistan's labour market.

**log_income_by_mismatch.png**
KDensity curves showing the full income distribution for each mismatch group. Matched workers' curve sits further right, meaning they earn more across the board, not just on average.

**age_income_relationship.png**
Scatter plot of age vs log income with a fitted line. The curve in the line confirms wages rise with age but slow down later, which is why age squared was included in the regression.

**map_province.png**
Province-wise mean income map. KPK is the darkest (highest income at PKR 50,739), Punjab the lightest (PKR 46,551). Province labels were added in Canva since spmap's built-in legend kept ending up inside the map.
