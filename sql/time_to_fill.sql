/*
===========================================
04. Average Time to Fill
===========================================
*/

SELECT

department,

COUNT(*) AS hires,

ROUND(AVG(days_to_fill),1) AS avg_days_to_fill,

MIN(days_to_fill) AS min_days,

MAX(days_to_fill) AS max_days

FROM ats_recruitment

WHERE hire_date IS NOT NULL

GROUP BY department

ORDER BY avg_days_to_fill DESC;