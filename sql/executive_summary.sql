/*
===========================================
15. Executive Summary
===========================================
*/

SELECT

    a.department,

    COUNT(DISTINCT a.candidate_id) AS candidates,

    COUNT(DISTINCT h.employee_id) AS hires,

    ROUND(AVG(a.days_to_fill),1) AS avg_time_to_fill,

    ROUND(AVG(a.candidate_experience_score),2) AS candidate_experience,

    ROUND(AVG(h.tenure_days),0) AS avg_tenure,

    ROUND(

        SUM(
            CASE
                WHEN h.employment_status='Terminated'
                THEN 1
                ELSE 0
            END
        )*100.0

        /

        NULLIF(COUNT(h.employee_id),0)

    ,2) AS turnover_rate

FROM ats_recruitment a

LEFT JOIN hris_employee h

ON a.candidate_id=h.candidate_id

GROUP BY a.department

ORDER BY turnover_rate DESC;