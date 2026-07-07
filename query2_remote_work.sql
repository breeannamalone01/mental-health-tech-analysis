SELECT 
  Do_you_work_remotely_,
  COUNT(*) AS total,
  COUNTIF(Do_you_currently_have_a_mental_health_disorder_ = 'Yes') AS has_disorder,
  ROUND((COUNTIF(Do_you_currently_have_a_mental_health_disorder_ = 'Yes')/ COUNT(*) * 100), 2) AS pct_with_disorder
FROM `true-elevator-380814.mental_health_project.mental_health_in_tech_2016`
WHERE Do_you_currently_have_a_mental_health_disorder_ IS NOT NULL AND Do_you_work_remotely_ IS NOT NULL
GROUP BY Do_you_work_remotely_
ORDER BY pct_with_disorder DESC