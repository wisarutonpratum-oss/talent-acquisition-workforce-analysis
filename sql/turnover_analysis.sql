/*
===========================================
11. Turnover by Department
===========================================
*/

SELECT

    h.department,

    COUNT(*) AS employees,

    SUM(
        CASE
            WHEN h.employment_status='Terminated'
            THEN 1
            ELSE 0
        END
    ) AS terminated,

    ROUND(

        SUM(
            CASE
                WHEN h.employment_status='Terminated'
                THEN 1
                ELSE 0
            END
        ) *100.0

        /

        COUNT(*)

    ,2) AS turnover_rate,

    ROUND(AVG(h.tenure_days),0) AS avg_tenure

FROM hris_employee h

GROUP BY h.department

ORDER BY turnover_rate DESC;