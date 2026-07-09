/*
===========================================
01. KPI Summary
Project: Talent Acquisition & Workforce Analytics
===========================================
*/

-- Recruitment KPIs

SELECT
    COUNT(DISTINCT requisition_id) AS total_requisitions,

    SUM(CASE
            WHEN requisition_status = 'Open'
            THEN 1 ELSE 0
        END) AS open_requisitions,

    SUM(CASE
            WHEN requisition_status = 'Filled'
            THEN 1 ELSE 0
        END) AS filled_requisitions,

    COUNT(DISTINCT candidate_id) AS total_candidates,

    SUM(CASE
            WHEN hire_date IS NOT NULL
            THEN 1 ELSE 0
        END) AS total_hires,

    ROUND(AVG(days_to_fill),2) AS avg_time_to_fill,

    ROUND(AVG(candidate_experience_score),2) AS avg_candidate_experience,

    ROUND(
        SUM(CASE
                WHEN offer_status='Accepted'
                THEN 1 ELSE 0
            END)
        *100.0
        /
        NULLIF(
            SUM(CASE
                    WHEN offer_date IS NOT NULL
                    THEN 1 ELSE 0
                END),
            0
        ),
    2) AS offer_acceptance_rate_pct

FROM ats_recruitment;


------------------------------------------------------------

-- Workforce KPIs

SELECT

    COUNT(employee_id) AS total_employees,

    SUM(CASE
            WHEN employment_status='Active'
            THEN 1 ELSE 0
        END) AS active_employees,

    SUM(CASE
            WHEN employment_status='Terminated'
            THEN 1 ELSE 0
        END) AS terminated_employees,

    ROUND(
        SUM(CASE
                WHEN employment_status='Terminated'
                THEN 1 ELSE 0
            END)
        *100.0
        /
        COUNT(employee_id),
    2) AS turnover_rate_pct,

    ROUND(AVG(annual_salary_thb),0) AS avg_salary,

    ROUND(AVG(tenure_days),0) AS avg_tenure_days

FROM hris_employee;