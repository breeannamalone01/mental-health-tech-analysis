SELECT
  `Do you think that discussing a mental health disorder with your employer would have negative consequences_` AS fear_of_consequences,
  COUNT(*) AS total,
  COUNTIF(`Have you ever sought treatment for a mental health issue from a mental health professional_` = 1) AS sought_treatment,
  ROUND(COUNTIF(`Have you ever sought treatment for a mental health issue from a mental health professional_` = 1) / COUNT(*) * 100, 2) AS pct_sought_treatment
FROM
  `true-elevator-380814.mental_health_project.mental_health_in_tech_2016_cleaned`
GROUP BY
  fear_of_consequences
ORDER BY
  pct_sought_treatment DESC