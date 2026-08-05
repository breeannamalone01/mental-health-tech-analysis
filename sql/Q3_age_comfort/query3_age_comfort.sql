SELECT
  CASE
    WHEN `What is your age_` < 25 THEN 'Under_25'
    WHEN `What is your age_` BETWEEN 25 AND 34 THEN '25-34'
    WHEN `What is your age_` BETWEEN 35 AND 44 THEN '35-44'
    WHEN `What is your age_` BETWEEN 45 AND 54 THEN '45-54'
    ELSE '55_and_over'
  END AS age_group,
  COUNT(*) AS total,
  COUNTIF(`Would you feel comfortable discussing a mental health disorder with your direct supervisor_s__` = 'Yes') AS comfortable,
  ROUND(COUNTIF(`Would you feel comfortable discussing a mental health disorder with your direct supervisor_s__` = 'Yes') / COUNT(*) * 100, 2) AS pct_comfortable
FROM
  `true-elevator-380814.mental_health_project.mental_health_in_tech_2016_cleaned`
GROUP BY
  age_group
ORDER BY
  age_group