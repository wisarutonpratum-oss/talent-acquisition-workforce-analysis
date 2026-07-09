/*
===========================================
13. Salary Analysis
===========================================
*/

SELECT

    department,

    job_level,

    COUNT(*) AS employees,

    ROUND(AVG(annual_salary_thb),0) AS avg_salary,

    MIN(annual_salary_thb) AS min_salary,

    MAX(annual_salary_thb) AS max_salary

FROM hris_employee

GROUP BY department,job_level

ORDER BY avg_salary DESC;