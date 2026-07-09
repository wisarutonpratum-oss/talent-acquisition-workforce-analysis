/*
===========================================
07. Offer Acceptance Analysis
===========================================
*/

SELECT

    department,

    COUNT(offer_date) AS total_offers,

    SUM(
        CASE
            WHEN offer_status='Accepted'
            THEN 1
            ELSE 0
        END
    ) AS accepted_offers,

    SUM(
        CASE
            WHEN offer_status='Declined'
            THEN 1
            ELSE 0
        END
    ) AS declined_offers,

    ROUND(

        SUM(
            CASE
                WHEN offer_status='Accepted'
                THEN 1
                ELSE 0
            END
        ) *100.0

        /

        NULLIF(COUNT(offer_date),0)

    ,2) AS offer_acceptance_rate

FROM ats_recruitment

GROUP BY department

ORDER BY offer_acceptance_rate DESC;