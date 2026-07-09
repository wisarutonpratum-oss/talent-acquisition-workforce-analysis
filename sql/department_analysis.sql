/*
===========================================
05. Recruitment Performance by Department
===========================================
*/

SELECT

department,

COUNT(*) AS candidates,

SUM(
CASE
WHEN hire_date IS NOT NULL
THEN 1
ELSE 0
END
) AS hires,

ROUND(

SUM(
CASE
WHEN hire_date IS NOT NULL
THEN 1
ELSE 0
END
)*100.0

/

COUNT(*)

,2)

AS hiring_rate_pct,

ROUND(AVG(days_to_fill),1) AS avg_days_to_fill,

ROUND(AVG(candidate_experience_score),2) AS candidate_experience

FROM ats_recruitment

GROUP BY department

ORDER BY hiring_rate_pct DESC;