-- Q3b-i: Willingness to discuss MH with previous supervisor, by awareness of options
-- Willingness recoded into 3 buckets (Willing-any / Not willing / Uncertain) since "I don't know" respondents behave differently
-- FINDING: Weakest/most inconsistent predictor of the four (~53-68% range)

SELECT
  know_mh_options_previous,
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
  AND know_mh_options_previous IS NOT NULL
GROUP BY
  know_mh_options_previous, willingness_group
ORDER BY
  know_mh_options_previous, willingness_group