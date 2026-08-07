-- Q3b-iv: Willingness to discuss MH with previous supervisor, by observed negative consequences for coworkers
-- FINDING: Only predictor that runs in reverse — willingness declines as consequences are observed (~61.5% -> 45.9%, ~16pt drop)

SELECT
  observed_mh_negative_consequences_previous,
  CASE
    WHEN
      willing_mh_supervisor_previous
      IN (
        'Yes, at all of my previous employers', 'Some of my previous employers')
      THEN 'Willing (any)'
    WHEN willing_mh_supervisor_previous = 'No, at none of my previous employers'
      THEN 'Not willing (none)'
    WHEN willing_mh_supervisor_previous LIKE '%know%' THEN 'Uncertain'
    END AS willingness_group,
  COUNT(*) AS total
FROM
  `true-elevator-380814.mental_health_project.mental_health_in_tech_2016_cleaned`
WHERE
  has_previous_employers = 1
  AND observed_mh_negative_consequences_previous IS NOT NULL
GROUP BY
  observed_mh_negative_consequences_previous, willingness_group
ORDER BY
  observed_mh_negative_consequences_previous, willingness_group
