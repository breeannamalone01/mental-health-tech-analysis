SELECT
  `Do you work remotely_` AS remote_work_status,
  COUNT(*) AS total,
  COUNTIF(`Do you currently have a mental health disorder_` = 'Yes') AS has_disorder,
  ROUND(COUNTIF(`Do you currently have a mental health disorder_` = 'Yes') / COUNT(*) * 100, 2) AS pct_with_disorder
FROM
  `true-elevator-380814.mental_health_project.mental_health_in_tech_2016_cleaned`
GROUP BY
  remote_work_status
ORDER BY
  pct_with_disorder DESC