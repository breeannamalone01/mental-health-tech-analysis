-- Q1b: Business impact of treatment status among employed respondents with a disorder (Yes/Maybe)
-- UNPIVOTs interference-when-treated vs interference-when-untreated to compare directly
-- FINDING: Strongest treatment-works evidence in the dataset. Among "Yes" disorder (n=538 treated/560 untreated):
-- "Often" interferes: 9.9% treated vs 68.8% untreated. "Rarely" interferes: 37.4% treated vs 2.9% untreated.
-- "Maybe" group shows the same pattern, softer.

SELECT
  has_mh_disorder_current,
  treatment_status,
  interference_level,
  COUNT(*) AS respondent_count
FROM
  `true-elevator-380814.mental_health_project.mental_health_in_tech_2016_cleaned`
    UNPIVOT(
      interference_level
        FOR
          treatment_status IN (
            mh_interferes_work_when_treated AS 'Treated',
            mh_interferes_work_when_untreated AS 'Untreated'))
WHERE
  has_mh_disorder_current IN ('Yes', 'Maybe')
  AND interference_level != 'Not applicable to me'
GROUP BY
  has_mh_disorder_current,
  treatment_status,
  interference_level
ORDER BY
  treatment_status,
  respondent_count DESC;