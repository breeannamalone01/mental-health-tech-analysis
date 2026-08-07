-- Q3b-iii: Willingness to discuss MH with previous supervisor, by whether employer formally discussed MH
-- FINDING: Second-strongest predictor (~54.2% -> 78.8%, ~25pt spread)

SELECT
  employer_formal_mh_discussion_previous,
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
  AND employer_formal_mh_discussion_previous IS NOT NULL
GROUP BY
  employer_formal_mh_discussion_previous, willingness_group
ORDER BY
  employer_formal_mh_discussion_previous, willingness_group
