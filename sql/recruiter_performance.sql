/*
===========================================
09. Recruiter Performance
===========================================
*/

SELECT

    recruiter_name,

    COUNT(*) AS candidates,

    SUM(
        CASE
            WHEN hire_date IS NOT NULL
            THEN 1
            ELSE 0
        END
    ) AS hires,

    ROUND(AVG(days_to_fill),1) AS avg_days_to_fill,

    ROUND(AVG(candidate_experience_score),2) AS candidate_experience

FROM ats_recruitment

GROUP BY recruiter_name

ORDER BY hires DESC;