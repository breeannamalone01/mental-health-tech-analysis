-- Q1a: Business impact of MH disorder among self-employed respondents
-- Compares self-reported productivity impact for those with vs without a current MH disorder
-- FINDING: 89% (disorder, n=124) vs 37% (no disorder, n=89) report productivity affected (~52pt gap)

SELECT
  has_mh_disorder_current,
  mh_productivity_affected_selfemployed,
  COUNT(*) AS total
FROM
  `true-elevator-380814.mental_health_project.mental_health_in_tech_2016_cleaned`
WHERE
  self_employed = 1
GROUP BY
  has_mh_disorder_current, mh_productivity_affected_selfemployed
ORDER BY
  has_mh_disorder_current
