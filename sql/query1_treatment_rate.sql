SELECT
  COUNTIF(Have_you_ever_sought_treatment_for_a_mental_health_issue_from_a_mental_health_professional_ = 1) AS sought_treatment,
  COUNTIF(Have_you_ever_sought_treatment_for_a_mental_health_issue_from_a_mental_health_professional_ = 0) AS did_not_seek_treatment,
  COUNT(*) AS total_respondents,
  ROUND((COUNTIF(Have_you_ever_sought_treatment_for_a_mental_health_issue_from_a_mental_health_professional_ = 1)/ COUNT(*) * 100.0), 2) AS pct_sought_treatment
FROM `true-elevator-380814.mental_health_project.mental_health_in_tech_2016`
WHERE Have_you_ever_sought_treatment_for_a_mental_health_issue_from_a_mental_health_professional_ IS NOT NULL