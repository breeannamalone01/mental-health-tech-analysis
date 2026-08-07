-- Q3a-ii: Supervisor comfort by whether employer formally discussed MH (current employer)
-- Fills the gap left by the two-way deep-dive, which only tested anonymity x consequences
-- FINDING: No 30.7% (n=811) -> I don't know 43.1% (n=102) -> Yes 57.6% (n=229) comfortable (~27pt spread)

SELECT
  employer_formal_mh_discussion_current,
  COUNT(*) AS total,
  COUNTIF(comfortable_supervisor_mh_current = 'Yes') AS comfortable_supervisor,
  ROUND(COUNTIF(comfortable_supervisor_mh_current = 'Yes') / COUNT(*) * 100, 2)
    AS pct_comfortable_supervisor
FROM
  `true-elevator-380814.mental_health_project.mental_health_in_tech_2016_cleaned`
WHERE
  self_employed = 0
  AND employer_formal_mh_discussion_current IS NOT NULL
GROUP BY
  employer_formal_mh_discussion_current
ORDER BY
  pct_comfortable_supervisor