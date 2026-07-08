SELECT
  CASE
    WHEN What_is_your_age_ < 25 THEN 'Under_25'
    WHEN What_is_your_age_ BETWEEN 25 AND 34 THEN '25-34'
    WHEN What_is_your_age_ BETWEEN 35 AND 44 THEN '35-44'
    WHEN What_is_your_age_ BETWEEN 45 AND 54 THEN '45-54'
    WHEN What_is_your_age_ >= 55 THEN '55+'
  END AS Age_group,
  COUNT(*) AS total,
  COUNTIF(Would_you_feel_comfortable_discussing_a_mental_health_disorder_with_your_direct_supervisor_s__ = 'Yes') as Comfortable,
  ROUND(COUNTIF(Would_you_feel_comfortable_discussing_a_mental_health_disorder_with_your_direct_supervisor_s__ = 'Yes')/ COUNT(*) * 100, 2) AS pct_comfortable
FROM `true-elevator-380814.mental_health_project.mental_health_in_tech_2016`
WHERE What_is_your_age_ IS NOT NULL
  AND What_is_your_age_ BETWEEN 18 AND 80
  AND Would_you_feel_comfortable_discussing_a_mental_health_disorder_with_your_direct_supervisor_s__ IS NOT NULL
GROUP BY Age_group