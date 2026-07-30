SELECT
  COUNTIF(`Have you ever sought treatment for a mental health issue from a mental health professional_` = 1) AS sought_treatment,
  COUNTIF(`Have you ever sought treatment for a mental health issue from a mental health professional_` = 0) AS did_not_seek_treatment,
  COUNT(*) AS total_respondents,
  ROUND(COUNTIF(`Have you ever sought treatment for a mental health issue from a mental health professional_` = 1) / COUNT(*) * 100, 2) AS pct_sought_treatment
FROM
  `true-elevator-380814.mental_health_project.mental_health_in_tech_2016_cleaned`