# Mental Health in Tech — Data Analysis Project

## Overview

This project analyzes the 2016 OSMI Mental Health in Tech Survey to explore how confidence in workplace mental health resources relates to treatment-seeking, and how treatment-seeking relates to self-reported productivity and work interference — among survey respondents.

**Tools used:** Python (Jupyter Notebook, pandas), BigQuery (SQL), Tableau, GitHub

**Dataset:** OSMI 2016 Mental Health in Tech Survey — 1,428 rows, 64 columns (cleaned)

**Analyst:** BreeAnna Malone

**Date completed:** [TODO — update once repo/charts are finalized]

## Data Cleaning Notes

- Cleaning performed in Python (Jupyter Notebook, `osmi_data_cleaning.ipynb`), not the original Google Sheets/manual approach.
- All 63 original survey columns were renamed to a consistent snake_case schema (a "translation layer" mapping long survey-question text to short, query-friendly column names) to make SQL queries readable and maintainable.
- Cleaned dataset exported as `mental_health_in_tech_2016_cleaned.csv` and loaded into BigQuery (`true-elevator-380814.mental_health_project.mental_health_in_tech_2016_cleaned`).
- [TODO — port over any other Python-specific cleaning steps from the notebook: missing value handling, gender free-text standardization via `classify_gender()`, etc.]

## Umbrella Question

> Among respondents to this survey, how does confidence in workplace mental health resources relate to self-reported treatment-seeking, and how does treatment-seeking relate to self-reported productivity and work interference?

The "among respondents to this survey" framing is intentional — see **Limitations** below on sampling bias.

## Business Sub-Questions & Key Findings

### 1. Business Impact
**Question:** Among respondents who report a mental health condition, how is that condition associated with self-reported work productivity and time interference?

- **Self-employed branch (n=124 with disorder, n=89 without):** 89% of respondents with a current disorder report productivity is affected, vs. 37% of respondents without one — a ~52-point gap.
- **Employed branch (n=538 treated / n=560 untreated, among "Yes" disorder respondents):** Untreated, ~69% report work interference "often." Treated, that drops to ~10%, with most shifting to "rarely" or "sometimes." This is the strongest single "treatment works" evidence in the dataset. The "Maybe" disorder group shows the same pattern, just softer.

### 2a. High-Risk Segment — Current Employer
**Question:** Among respondents with a mental health condition, is lower confidence in current workplace mental health benefits (awareness of options, anonymity protection) associated with lower rates of treatment-seeking?

- Treatment-seeking climbs fairly consistently as awareness of mental health options increases, regardless of anonymity status. Lowest: "No" options awareness (66.7%–72.2%). Once awareness is "Yes" or "I am not sure," most combinations land 88–100%.
- Awareness of options appears to matter more than anonymity confidence for this specific outcome.

### 2b. High-Risk Segment — Previous Employer
**Question:** Among respondents with a mental health condition, is a reported negative experience with a previous employer's mental health benefits associated with lower current treatment-seeking?

- Same pattern as 2a: lowest treatment-seeking (79–85%) among those unaware of previous-employer options; highest (95–100%) among those fully aware. Confirms 2a's finding holds across both current and previous employer contexts.

### 3a. Friction Points — Current Employer
**Question:** Among current-employer respondents, which factors show the strongest association with lower comfort discussing mental health with a supervisor?

| Predictor | Low | High | Spread |
|---|---|---|---|
| Know options | 31.0% | 46.3% | 15.3 pts |
| Observed negative consequences | 23.7% (true) | 38.5% (false) | 14.8 pts |
| Formal discussion offered | 30.7% | 57.6% | 26.9 pts |
| **Anonymity protected** | 23.8% | 54.9% | **31.1 pts (strongest)** |

**Two-way deep-dive:** Does anonymity protection offset having personally observed negative consequences? Within the "observed consequences" group (worst-case baseline, 23.7% comfort), anonymity protection nearly triples comfort (up to 46.2%) — but that ceiling still falls short of the 55.6% ceiling for the "no observed consequences" group. **Conclusion: policy helps significantly, but doesn't fully substitute for a track record of safety.**

### 3b. Friction Points — Previous Employer
**Question:** Among respondents with a previous employer, which factors show the strongest association with willingness to have discussed mental health there?

| Predictor | Low | High | Spread |
|---|---|---|---|
| Know options | ~53–68% (inconsistent, no clean ladder) | — | — |
| Observed negative consequences | 61.5% | 45.9% (declining) | ~16 pts |
| Formal discussion offered | 54.2% | 78.8% | ~25 pts |
| **Anonymity protected** | 40.8% | 73–76% | **~33 pts (strongest)** |

Nearly identical ranking to 3a — reinforces that this isn't a one-off pattern of a single dataset.

*Methodology note: willingness responses were collapsed into 3 buckets (Willing-any / Not willing / Uncertain), since "I don't know" respondents were confirmed to behave differently from the rest of the sample and don't belong forced onto a willing/unwilling spectrum.*

### 4. Success Drivers — Coworker Comfort
**Question:** Do the same predictors that drive supervisor comfort (3a) also hold for peer-level (coworker) comfort?

| Predictor | Low | High | Spread |
|---|---|---|---|
| Observed negative consequences | 18.6% | 24.5% | ~5.9 pts |
| Know options | 20.5% | 28.3% | ~7.9 pts |
| Formal discussion offered | 19.6% | 38.4% | ~18.8 pts |
| **Anonymity protected** | 15.5% | 34.5% | **~19.0 pts (strongest)** |

## Cross-Dataset Insight

**Anonymity protection and formal discussion are consistently the two strongest predictors** across all three outcome variables tested — supervisor comfort (3a), previous-employer willingness (3b), and coworker comfort (Query 4) — with spreads of ~19–33 points, well ahead of options-awareness or observed-consequences. This is a genuinely non-coincidental, stakeholder-ready finding: **formal communication and anonymity protection (employer-controlled "policy" levers) matter more than simply offering benefits or the absence of observed negative consequences ("culture/experience" signals) — suggesting that *how* mental health support is communicated matters as much as whether it exists.**

## Key Methodology Notes

1. **Sampling bias:** OSMI 2016 is a self-selected, opt-in survey distributed via advocacy channels — findings describe *respondents*, not "tech workers" broadly.
2. **Current vs. previous employer kept separate** by design, not merged, to avoid blending two different time periods into one variable.
3. **Self-employed vs. employed branches** use the matching parallel question for each group rather than dropping either group's data.
4. **Causal language avoided throughout** — "associated with"/"relates to," never "causes"/"because," since this is correlational survey data.
5. **Four-way combinations avoided** in favor of single-variable comparisons (e.g., 3a, 3b, Q4) after an initial 4-way GROUP BY produced unreliable thin cells (n=1–3); single-variable queries preserve sample size and give cleaner, chartable results.
6. **Missing-data handling:** tested whether missing/uncertain groups behaved differently from the rest of the sample before deciding to filter or recode (e.g., 46 NULLs in 2a matched the broader population and were filtered; "I don't know" in 3b behaved differently and was kept as its own bucket).
7. **Encoding bug:** an apostrophe-encoding mismatch in `willing_mh_supervisor_previous` caused exact-string matches to fail silently; fixed using `LIKE '%know%'` pattern matching instead of exact match.

## Limitations

- Data is from 2016; workplace mental health norms have evolved since.
- Self-reported survey data reflects perception, not clinical diagnosis.
- Non-random sample — OSMI distributed through tech community/advocacy networks, which may over-represent individuals already engaged with mental health topics. Findings describe respondents, not tech workers broadly.
- Several sub-question cells have small sample sizes (n<15) and should be read as directional, not conclusive (flagged inline above where relevant).

## Files in This Repository

[TODO — finalize once all queries/charts are confirmed saved to the repo]

| File | Description |
|---|---|
| `osmi_data_cleaning.ipynb` | Python data cleaning pipeline |
| `sql/Q1a_.../` | Business Impact — self-employed branch |
| `sql/Q1b_.../` | Business Impact — employed branch (UNPIVOT) |
| `sql/Q2a_.../` | High-Risk Segment — current employer |
| `sql/Q2b_.../` | High-Risk Segment — previous employer |
| `sql/Q3a_.../` | Friction Points — current employer (4 single-variable + two-way deep-dive) |
| `sql/Q3b_.../` | Friction Points — previous employer (4 single-variable) |
| `sql/Q4_success_drivers/Q4_coworker_comfort_vs_predictors.sql` | Success Drivers — coworker comfort |
| [TODO] | Tableau dashboard links/screenshots |

## Insights & Recommendations

[TODO — draft once all Tableau visuals are finished; should center on the cross-dataset anonymity/formal-discussion finding above as the primary stakeholder-facing takeaway]
