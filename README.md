# HEDIS Preventive Care Compliance Analysis

## Overview
This project analyzes preventive care compliance rates for HEDIS measures, such as Breast Cancer Screening and Diabetes A1C testing. It uses a MySQL database to store patient data and SQL queries to calculate compliance rates. The dataset is generated using Mockaroo to simulate realistic patient records.

### Project Goals
- Track compliance for HEDIS measures like mammograms (every 2 years for women aged 50–74) and A1C tests (annually for diabetic patients).
- Provide insights into compliance rates by insurance type (Medicare, Medicaid, Commercial).
- Demonstrate skills in database design, data generation, and SQL analysis.

## Repository Contents
- **`create_hedis_compliance.sql`**: SQL script to create the `hedis_compliance` table in MySQL.
- **`hedis_compliance_data.csv`**: Mock dataset with 500 patient records, generated using Mockaroo.
- **`hedis_analysis_queries.sql`**: SQL queries to analyze compliance rates for HEDIS measures.

## Table Structure
The `hedis_compliance` table in MySQL has the following structure:
- `patient_id` (INT, Primary Key): Unique identifier for each patient.
- `first_name` (VARCHAR(50)): Patient's first name.
- `last_name` (VARCHAR(50)): Patient's last name.
- `dob` (DATE): Date of birth.
- `gender` (CHAR(1)): Gender ('M' or 'F').
- `last_primary_care_visit` (DATE): Date of the last primary care visit.
- `last_mammogram_date` (DATE): Date of the last mammogram (NULL if not applicable).
- `last_a1c_test_date` (DATE): Date of the last A1C test (NULL if not applicable).
- `insurance_type` (VARCHAR(50)): Insurance type ('Medicare', 'Medicaid', 'Commercial').

## Sample Analysis Query
Below is an example query to calculate Breast Cancer Screening compliance for women aged 50–74 (mammogram within the last 2 years):

```sql
SELECT 
    COUNT(*) AS total_women_50_74,
    SUM(CASE WHEN last_mammogram_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR) THEN 1 ELSE 0 END) AS compliant,
    (SUM(CASE WHEN last_mammogram_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR) THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS compliance_rate
FROM hedis_compliance
WHERE gender = 'F'
AND DATEDIFF(CURDATE(), dob) / 365 BETWEEN 50 AND 74;
