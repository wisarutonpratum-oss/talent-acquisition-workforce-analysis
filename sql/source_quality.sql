/*
===========================================
12. Source Quality Analysis
===========================================
*/

SELECT

    h.source_of_hire,

    COUNT(*) AS hires,

    ROUND(AVG(h.tenure_days),0) AS avg_tenure,

    ROUND(AVG(a.candidate_experience_score),2) AS avg_candidate_experience,

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
        )*100.0

        /

        COUNT(*)

    ,2) AS turnover_rate

FROM ats_recruitment a

JOIN hris_employee h

ON a.candidate_id=h.candidate_id

GROUP BY h.source_of_hire

ORDER BY turnover_rate;