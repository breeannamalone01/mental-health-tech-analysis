-- Query 4: Coworker comfort vs. the same 4 predictors used in 3a (supervisor comfort)
-- Light addition: tests whether the same predictor ranking holds for peer-level comfort

SELECT
  'Know Options' AS predictor,
  know_mh_options_current AS predictor_value,
  COUNT(*) AS total,
  COUNTIF(comfortable_coworkers_mh_current = 'Yes') AS comfortable_coworkers,
  ROUND(COUNTIF(comfortable_coworkers_mh_current = 'Yes') / COUNT(*) * 100, 2)
    AS pct_comfortable_coworkers
FROM
  `true-elevator-380814.mental_health_project.mental_health_in_tech_2016_cleaned`
WHERE self_employed = 0 AND know_mh_options_current IS NOT NULL
GROUP BY predictor_value
UNION ALL
SELECT
  'Anonymity Protected',
  mh_anonymity_protected_current,
  COUNT(*),
  COUNTIF(comfortable_coworkers_mh_current = 'Yes'),
  ROUND(COUNTIF(comfortable_coworkers_mh_current = 'Yes') / COUNT(*) * 100, 2)
FROM
  `true-elevator-380814.mental_health_project.mental_health_in_tech_2016_cleaned`
WHERE self_employed = 0 AND mh_anonymity_protected_current IS NOT NULL
GROUP BY mh_anonymity_protected_current
UNION ALL
SELECT
  'Formal Discussion Offered',
  employer_formal_mh_discussion_current,
  COUNT(*),
  COUNTIF(comfortable_coworkers_mh_current = 'Yes'),
  ROUND(COUNTIF(comfortable_coworkers_mh_current = 'Yes') / COUNT(*) * 100, 2)
FROM
  `true-elevator-380814.mental_health_project.mental_health_in_tech_2016_cleaned`
WHERE self_employed = 0 AND employer_formal_mh_discussion_current IS NOT NULL
GROUP BY employer_formal_mh_discussion_current
UNION ALL
SELECT
  'Observed Negative Consequences',
  CAST(observed_mh_negative_consequences_current AS STRING),
  COUNT(*),
  COUNTIF(comfortable_coworkers_mh_current = 'Yes'),
  ROUND(COUNTIF(comfortable_coworkers_mh_current = 'Yes') / COUNT(*) * 100, 2)
FROM
  `true-elevator-380814.mental_health_project.mental_health_in_tech_2016_cleaned`
WHERE
  self_employed = 0 AND observed_mh_negative_consequences_current IS NOT NULL
GROUP BY observed_mh_negative_consequences_current
ORDER BY predictor, pct_comfortable_coworkers;
