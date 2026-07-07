# Mental Health in Tech — Data Analysis Project

## Overview

This project analyzes the 2016 OSMI Mental Health in Tech Survey to explore patterns in mental health treatment-seeking behavior, workplace stigma, and the relationship between remote work and mental health outcomes in the technology industry.

**Tools used:** BigQuery (SQL), Google Sheets, GitHub

**Dataset:** OSMI 2016 Mental Health in Tech Survey — 1,433 rows

**Analyst:** BreeAnna Malone

**Date completed:** July 7, 2026

## Data Cleaning Notes

- Two duplicate column names ('Why or why not?') were renamed prior to ingestion to distinguish between physical and mental health interview questions.
- Data was loaded via a Google Sheets external table connection. Earlier CSV upload attempts encountered parsing errors due to free-text fields containing commas and special characters. Switching to Google Sheets as the data source resolved these issues and retained all 1,433 rows.
- Age field (Query 3) contained implausible values including ages 3 and 323. An 18–80 age filter was applied. Ages 15 and 99 are noted as edge cases also excluded by this filter.

## Research Questions

1. What percentage of tech workers sought mental health treatment?
2. Does remote work correlate with higher or lower rates of mental health disorders?
3. Does age affect comfort discussing mental health with a direct supervisor?
4. Do workers who fear employer consequences seek treatment at different rates?

## Key Findings

1. 58.55% of respondents (839 of 1,433) reported having sought mental health treatment, suggesting relatively high treatment engagement within this sample.
2. Remote work status shows minimal association with mental health disorder rates — disorder rates range from 38.74% (never remote) to 40.95% (sometimes remote), a spread of only ~2 percentage points.
3. Comfort discussing mental health with a supervisor is low across all age groups (no group exceeds 48%). The youngest group (under 25) showed the lowest comfort at 29.73%; the oldest group (55+) showed the highest at 47.37%.
4. Respondents who feared negative consequences from discussing mental health sought treatment at the highest rate (67.87%), compared to 58.32% (maybe) and 50.91% (no fear). This counterintuitive finding may reflect reverse causality — having sought treatment may increase awareness of workplace stigma rather than fear preventing treatment-seeking.

## Limitations

- Data is from 2016; workplace mental health norms have evolved since.
- Self-reported survey data reflects perception rather than clinical diagnosis.
- Non-random sample — OSMI distributed through tech community networks, which may over-represent individuals already engaged with mental health topics.
- Query 3 restricted to respondents aged 18–80 (n=1,142 of 1,433).

## Files in This Repository

| File | Description |
|---|---|
| query1_treatment_rate.sql | % of respondents who sought mental health treatment |
| query2_remote_work.sql | Mental health disorder rates by remote work status |
| query3_age_comfort.sql | Comfort discussing mental health by age group |
| query4_fear_consequences.sql | Treatment-seeking rates by fear of employer consequences |
| chart1_treatment_rate.png | Chart — treatment-seeking rate |
| chart2_remote_work.png | Chart — remote work vs. disorder rate |
| chart3_age_comfort.png | Chart — age group vs. comfort % |
| chart4_fear_consequences.png | Chart — fear of consequences vs. treatment rate |
