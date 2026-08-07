-- Q3b-ii: Willingness to discuss MH with previous supervisor, by anonymity protection
-- FINDING: Strongest predictor of the four (~40.8% -> 73-76%, ~33pt spread)

SELECT
  mh_anonymity_protected_previous,
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
  AND mh_anonymity_protected_previous IS NOT NULL
GROUP BY
  mh_anonymity_protected_previous, willingness_group
ORDER BY
  mh_anonymity_protected_previous, willingness_group
