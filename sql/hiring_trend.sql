/*
===========================================
03. Monthly Hiring Trend
===========================================
*/

SELECT

DATE_FORMAT(hire_date,'%Y-%m') AS month,

COUNT(*) AS hires

FROM ats_recruitment

WHERE hire_date IS NOT NULL

GROUP BY month

ORDER BY month;