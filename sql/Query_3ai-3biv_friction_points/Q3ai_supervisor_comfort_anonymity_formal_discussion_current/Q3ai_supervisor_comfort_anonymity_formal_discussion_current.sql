-- Q3ai two-way deep-dive: Observed negative consequences x anonymity protection -> supervisor comfort (current employer)
-- FINDING: Within the observed-consequences group, anonymity roughly triples comfort (7.7%/17.2% -> 46.2%),
-- but still doesn't reach the no-consequences group's 55.6% ceiling — policy helps but doesn't fully
-- substitute for a track record of safety. Smallest cell is n=13, treat as directional not conclusive.

SELECT
  observed_mh_negative_consequences_current,
  mh_anonymity_protected_current,
  COUNT(*) AS total,
  COUNTIF(comfortable_supervisor_mh_current = 'Yes') AS comfortable_supervisor,
  ROUND(COUNTIF(comfortable_supervisor_mh_current = 'Yes') / COUNT(*) * 100, 2)
    AS pct_comfortable_supervisor
FROM
  `true-elevator-380814.mental_health_project.mental_health_in_tech_2016_cleaned`
WHERE
  self_employed = 0
  AND observed_mh_negative_consequences_current IS NOT NULL
  AND mh_anonymity_protected_current IS NOT NULL
GROUP BY
  observed_mh_negative_consequences_current, mh_anonymity_protected_current
ORDER BY
  observed_mh_negative_consequences_current, pct_comfortable_supervisor
