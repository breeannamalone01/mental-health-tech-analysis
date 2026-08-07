-- Q2b: Same as Q2a, but for previous employer
-- FINDING: Same pattern — 79-85% (unaware of options) up to 95-100% (aware of all options)

SELECT
  know_mh_options_previous,
  mh_anonymity_protected_previous,
  COUNT(*) AS total,
  COUNTIF(sought_mh_treatment = 1) AS sought_treatment,
  ROUND(COUNTIF(sought_mh_treatment = 1) / COUNT(*) * 100, 2)
    AS pct_sought_treatment
FROM
  `true-elevator-380814.mental_health_project.mental_health_in_tech_2016_cleaned`
WHERE
  has_previous_employers = 1
  AND has_mh_disorder_current = 'Yes'
GROUP BY
  know_mh_options_previous, mh_anonymity_protected_previous
ORDER BY
  pct_sought_treatment