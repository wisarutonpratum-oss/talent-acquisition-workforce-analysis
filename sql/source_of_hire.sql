/*
===========================================
06. Recruitment Source Performance
===========================================
*/

SELECT

    source_of_hire,

    COUNT(*) AS total_candidates,

    SUM(
        CASE
            WHEN hire_date IS NOT NULL
            THEN 1
            ELSE 0
        END
    ) AS total_hires,

    ROUND(
        SUM(
            CASE
                WHEN hire_date IS NOT NULL
                THEN 1
                ELSE 0
            END
        ) * 100.0 /
        COUNT(*),
    2) AS hiring_rate_pct,

    ROUND(AVG(candidate_experience_score),2) AS avg_candidate_experience,

    ROUND(AVG(days_to_fill),1) AS avg_time_to_fill

FROM ats_recruitment

GROUP BY source_of_hire

ORDER BY hiring_rate_pct DESC;