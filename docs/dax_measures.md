# DAX Measures

## Overview

This project uses DAX measures to calculate recruitment KPIs, candidate experience metrics, and workforce analytics. The measures are designed to support interactive Power BI dashboards while following best practices for reusable calculations.

---

# Recruitment KPIs

## Total Requisitions

Counts the total number of recruitment requisitions.

```DAX
Total Requisitions =
DISTINCTCOUNT(ATS_recruitment[requisition_id])
```

---

## Filled Requisitions

Counts requisitions successfully filled.

```DAX
Filled Requisitions =
CALCULATE(
    DISTINCTCOUNT(ATS_recruitment[requisition_id]),
    ATS_recruitment[requisition_status] = "Filled"
)
```

---

## Total Hires

Counts successfully hired candidates.

```DAX
Total Hires =
COUNTROWS(HRIS_employee)
```

---

## Hiring Rate

Percentage of requisitions resulting in successful hires.

```DAX
Hiring Rate =
DIVIDE(
    [Total Hires],
    [Total Requisitions],
    0
)
```

---

## Average Time to Fill

Average number of days required to fill a position.

```DAX
Average Time to Fill =
AVERAGE(ATS_recruitment[days_to_fill])
```

---

## Offer Acceptance Rate

Percentage of accepted offers among all offers extended.

```DAX
Offer Acceptance Rate =
DIVIDE(
    CALCULATE(
        COUNTROWS(ATS_recruitment),
        ATS_recruitment[offer_status] = "Accepted"
    ),
    CALCULATE(
        COUNTROWS(ATS_recruitment),
        ATS_recruitment[offer_status] IN {"Accepted","Declined"}
    ),
    0
)
```

---

# Candidate Experience

## Average Candidate Experience

```DAX
Average Candidate Experience =
AVERAGE(ATS_recruitment[candidate_experience_score])
```

---

## Candidate Experience Group

```DAX
Candidate Experience Group =
SWITCH(
    TRUE(),
    ATS_recruitment[candidate_experience_score] < 2, "Poor",
    ATS_recruitment[candidate_experience_score] < 3, "Average",
    ATS_recruitment[candidate_experience_score] < 4, "Good",
    "Excellent"
)
```

---

# Workforce Analytics

## Active Employees

```DAX
Active Employees =
CALCULATE(
    COUNTROWS(HRIS_employee),
    HRIS_employee[employment_status] = "Active"
)
```

---

## Terminated Employees

```DAX
Terminated Employees =
CALCULATE(
    COUNTROWS(HRIS_employee),
    HRIS_employee[employment_status] = "Terminated"
)
```

---

## Turnover Rate

```DAX
Turnover Rate =
DIVIDE(
    [Terminated Employees],
    COUNTROWS(HRIS_employee),
    0
)
```

---

## Average Salary

```DAX
Average Salary =
AVERAGE(HRIS_employee[annual_salary_thb])
```

---

## Average Tenure

```DAX
Average Tenure =
AVERAGE(HRIS_employee[tenure_days])
```

---

# Source Quality Metrics

These measures evaluate the long-term effectiveness of each recruitment channel.

Examples include:

- Hiring Rate by Source
- Offer Acceptance Rate by Source
- Candidate Experience by Source
- Turnover Rate by Source
- Average Employee Tenure by Source

Together, these metrics help determine not only which recruitment channels generate hires, but also which produce high-quality, long-tenured employees.

---

# Dashboard KPIs

The DAX measures support all KPI cards and visualizations used throughout the Power BI dashboard.

## Executive Overview

- Total Requisitions
- Filled Requisitions
- Total Hires
- Average Time to Fill
- Offer Acceptance Rate
- Average Candidate Experience

## Recruitment Performance

- Average Time to Fill
- Hiring Rate
- Offer Acceptance Rate

## Candidate Experience

- Candidate Experience Score
- Candidate Experience Group

## Workforce Analytics

- Active Employees
- Turnover Rate
- Average Salary
- Average Employee Tenure
