/*
===========================================
02. Recruitment Funnel
===========================================
*/

SELECT

'Application' AS stage,
COUNT(*) AS candidates

FROM ats_recruitment

UNION ALL

SELECT

'Screening',
COUNT(screening_date)

FROM ats_recruitment

UNION ALL

SELECT

'Interview',
COUNT(interview_date)

FROM ats_recruitment

UNION ALL

SELECT

'Offer',
COUNT(offer_date)

FROM ats_recruitment

UNION ALL

SELECT

'Hired',
COUNT(hire_date)

FROM ats_recruitment;