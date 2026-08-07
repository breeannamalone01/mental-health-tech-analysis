-- Q2a: Treatment-seeking rate by awareness of MH options + anonymity protection (current employer)
-- 46 NULLs in know_mh_options_current excluded (filtered group's 89.1% treatment rate matched broader 89.9%, safe to drop)
-- FINDING: Lowest treatment-seeking 66.7-72.2% (no awareness of options), highest 88-100% (aware/unsure)

SELECT
  know_mh_options_current,
  mh_anonymity_protected_current,
  COUNT(*) AS total,
  COUNTIF(sought_mh_treatment = 1) AS sought_treatment,
  ROUND(COUNTIF(sought_mh_treatment = 1) / COUNT(*) * 100, 2)
    AS pct_sought_treatment
FROM
  `true-elevator-380814.mental_health_project.mental_health_in_tech_2016_cleaned`
WHERE
  self_employed = 0
  AND has_mh_disorder_current = 'Yes'
  AND know_mh_options_current IS NOT NULL
GROUP BY
  know_mh_options_current, mh_anonymity_protected_current
ORDER BY
  pct_sought_treatment