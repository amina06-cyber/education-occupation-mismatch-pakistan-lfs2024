# Code

Two files here, one Stata do-file that does basically everything, and a Python notebook just for the histogram since I wanted it to look nicer than what Stata produces.

---

## Files

| File | What it does |
|---|---|
| `analysis.do` | Main Stata file, cleaning, mismatch construction, descriptive stats, graphs, regression |
| `histogram.ipynb` | Python notebook for the income distribution histogram |

---

## Running the Stata file

You'll need the raw LFS 2024-25 file from PBS first. Once you have it:

```stata
cd "your/project/folder"
do analysis.do
```

The do-file goes through everything in order — loads the data, cleans it, builds the mismatch variable, runs descriptive stats, makes the graphs, and runs the regression. Comments inside the file explain each step.

---

## Running the Python notebook

Open `histogram.ipynb` in Google Colab or Jupyter. Upload the CSV file from the `data/` folder and run all cells. It uses pandas and matplotlib — no extra installs needed if you're on Colab.

---

## What the do-file actually does 

1. Loads raw LFS data
2. Keeps only employed wage workers
3. Cleans income — drops missing, zero, and top 1% outliers
4. Converts education categories into years of schooling
5. Extracts ISCO-08 major occupation group from 4-digit codes
6. Assigns required education level per occupation group
7. Creates OverEdu, UnderEdu, and matched dummies
8. Creates control variables — female dummy, urban dummy, age squared, experience
9. Runs descriptive stats and cross-tabs
10. Makes graphs
11. Runs OLS regression (two models)
12. Saves final dataset
