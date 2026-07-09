/*
===========================================
08. Candidate Experience Analysis
===========================================
*/

SELECT

    source_of_hire,

    ROUND(AVG(candidate_experience_score),2) AS avg_candidate_experience,

    ROUND(AVG(days_to_fill),1) AS avg_time_to_fill,

    ROUND(

        SUM(
            CASE
                WHEN offer_status='Accepted'
                THEN 1
                ELSE 0
            END
        )*100.0

        /

        NULLIF(COUNT(offer_date),0)

    ,2) AS offer_acceptance_rate

FROM ats_recruitment

GROUP BY source_of_hire

ORDER BY avg_candidate_experience DESC;