# Code

This folder contains all the code used for data cleaning, variable construction, analysis, and visualization.

---

## Files

| File | Software | Description |
|---|---|---|
| `analysis.do` | Stata 17 | Full pipeline — cleaning, mismatch construction, descriptive stats, graphs, regression |
| `histogram.ipynb` | Python (Google Colab) | Income distribution histogram with navy and gold theme |

---

## How to Run

### Stata (`analysis.do`)
1. Download the raw LFS 2024-25 file from PBS
2. Open Stata and set your working directory to the project folder
3. Run `analysis.do` from start to finish
4. All outputs will be saved in the `graphs/` folder

```stata
cd "your/project/folder"
do analysis.do
```

### Python (`histogram.ipynb`)
1. Open Google Colab or Jupyter Notebook
2. Upload `Mismatch_Earnings_LFS2024_25_clean.csv` from the `data/` folder
3. Run all cells in order

---

## What the Stata Do-File Does

| Step | What it does |
|---|---|
| 1 | Loads raw LFS data |
| 2 | Filters to employed wage workers |
| 3 | Cleans income variable — drops missing, zero, outliers |
| 4 | Converts education categories to years of schooling |
| 5 | Extracts ISCO-08 major occupation groups |
| 6 | Assigns required education per occupation group |
| 7 | Creates OverEdu, UnderEdu, matched dummies |
| 8 | Creates control variables — female, urban, age squared, experience |
| 9 | Runs descriptive statistics and cross-tabulations |
| 10 | Generates all graphs |
| 11 | Runs OLS regression — Model 1 (basic) and Model 2 (full) |
| 12 | Saves final cleaned dataset |

---

## Software Requirements

- **Stata 17** or later
- **Python 3** with pandas and matplotlib (`pip install pandas matplotlib`)
