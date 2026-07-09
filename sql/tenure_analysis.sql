/*
===========================================
14. Employee Tenure Analysis
===========================================
*/

SELECT

    source_of_hire,

    COUNT(*) AS employees,

    ROUND(AVG(tenure_days),0) AS avg_tenure,

    ROUND(

        SUM(
            CASE
                WHEN employment_status='Active'
                THEN 1
                ELSE 0
            END
        )*100.0

        /

        COUNT(*)

    ,2) AS retention_rate

FROM hris_employee

GROUP BY source_of_hire

ORDER BY retention_rate DESC;