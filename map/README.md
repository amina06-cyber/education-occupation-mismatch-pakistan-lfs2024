# Maps

The map showing mean monthly income by province was honestly one of the trickier parts of this project. Leaving detailed steps here so anyone trying to replicate it doesn't have to figure it out from scratch like I did.

---

## Files

| File | Description |
|---|---|
| `pakprovcoord.dta` | Pakistan province boundary coordinates, needed by spmap to draw the map |
| `map_graph_updated.dta` | Province data with my income values already replaced |
| `map_province.png` | The final exported map |

---

## How to Make the Map

### Step 1 — Install spmap if you don't have it
```stata
ssc install spmap
```

### Step 2 — Load the map data and replace income values
```stata
use "map_graph_updated.dta", clear

replace mpc = 48557 if id == 1   // Balochistan
replace mpc = 50739 if id == 3   // KPK
replace mpc = 46551 if id == 4   // Punjab
replace mpc = 49278 if id == 6   // Sindh
replace mpc = .     if id == 2   // GB
replace mpc = .     if id == 5   // Kashmir
replace mpc = .     if id == 7   // ICT

save "map_graph_updated.dta", replace
```

### Step 3 — Run spmap
```stata
spmap mpc using "pakprovcoord.dta", id(id) fcolor(Blues) title("Mean Monthly Income by Province (PKR)", size(medium)) legstyle(2) legend(position(10) size(small) region(lcolor(white) fcolor(white))) graphregion(color(white)) note("Source: Labour Force Survey 2024-25", size(vsmall))
```

### Step 4 — Export
```stata
graph export "map_province.png", replace width(2000)
```

---

## Province ID Reference

| ID | Province |
|---|---|
| 1 | Balochistan |
| 2 | Gilgit-Baltistan |
| 3 | Khyber Pakhtunkhwa |
| 4 | Punjab |
| 5 | Azad Kashmir |
| 6 | Sindh |
| 7 | ICT Islamabad |

---

## Mean Income Values (LFS 2024-25)

| Province | Mean Monthly Income (PKR) |
|---|---|
| KPK | 50,739 |
| Sindh | 49,278 |
| Balochistan | 48,557 |
| Punjab | 46,551 |

KPK has the highest mean income in the sample. Punjab is the lightest shade on the map.

---

## One thing to note

The spmap legend kept ending up inside the map no matter what position I tried. I ended up removing it with `legstyle(0)` and adding province name labels manually in Canva after exporting. If you find a cleaner fix, let me know.
