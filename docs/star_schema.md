# Star Schema

## Overview

This project integrates recruitment data from an Applicant Tracking System (ATS) with employee information from a Human Resource Information System (HRIS) to evaluate recruitment performance and workforce quality across the entire employee lifecycle.

A star schema was designed to simplify reporting, improve query performance, and support reusable DAX measures in Power BI.

---

# Data Model

The data model consists of:

- **1 Fact Table**
- **2 Dimension Tables**

```
                    Dim_Date
                       │
                       │
                       │
Dim_SourceOfHire ───── Fact_Recruitment
```

The fact table stores recruitment events and hiring outcomes, while the dimension tables provide descriptive attributes for filtering and slicing the data.

---

# Fact Table

## Fact_Recruitment

Contains one record for each recruitment requisition (candidate application).

### Primary Key

- requisition_id

### Measures

- Days to Fill
- Candidate Experience Score
- Hiring Status
- Offer Status
- Application Status

### Foreign Keys

- Date
- Source of Hire

---

# Dimension Tables

## Dim_Date

Created from the recruitment date fields to enable time intelligence.

Typical columns include:

- Date
- Year
- Quarter
- Month
- Month Number
- Month Name
- Year-Month

Used for:

- Monthly Hiring Trend
- Year Filter
- Time-based Analysis

---

## Dim_SourceOfHire

Contains recruitment channel information.

Example values:

- Employee Referral
- LinkedIn
- Job Board
- Recruitment Agency
- Company Career Site
- University Career Fair
- Social Media

Used for:

- Hiring Rate
- Offer Acceptance Rate
- Candidate Experience
- Turnover Rate
- Average Tenure

---

# Relationships

| From | To | Cardinality |
|------|----|-------------|
| Dim_Date[Date] | Fact_Recruitment[Hire Date] | One-to-Many |
| Dim_SourceOfHire[Source of Hire] | Fact_Recruitment[Source of Hire] | One-to-Many |

Relationships use **single-direction filtering** from dimensions to the fact table following star schema best practices.

---

# Why Star Schema?

Using a star schema provides several advantages:

- Simplifies dashboard development
- Improves Power BI performance
- Supports reusable DAX measures
- Enables consistent filtering across visuals
- Reduces model complexity
- Makes future dataset expansion easier

---

# Dashboard Metrics Supported

The data model supports all KPIs used in the dashboard, including:

## Recruitment

- Total Requisitions
- Filled Requisitions
- Hiring Rate
- Offer Acceptance Rate
- Average Time to Fill

## Candidate Experience

- Candidate Experience Score
- Candidate Experience Group
- Candidate Stage Distribution

## Workforce

- Active Employees
- Turnover Rate
- Average Tenure
- Average Salary

## Source Quality

- Hiring Rate by Source
- Turnover Rate by Source
- Average Candidate Experience
- Average Employee Tenure

---

# Data Modeling Notes

Although two operational systems (ATS and HRIS) were available, they were integrated through **Candidate ID**, allowing recruitment outcomes and employee retention metrics to be analyzed within a single analytical model.

This design enables end-to-end workforce analytics, from recruitment performance through long-term employee retention.
