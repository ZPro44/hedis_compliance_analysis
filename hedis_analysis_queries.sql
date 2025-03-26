-- Query 1: Breast Cancer Screening Compliance (Women aged 50-74, mammogram within 2 years)
SELECT 
    COUNT(*) AS total_women_50_74,
    SUM(CASE WHEN last_mammogram_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR) THEN 1 ELSE 0 END) AS compliant,
    (SUM(CASE WHEN last_mammogram_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR) THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS compliance_rate
FROM hedis_compliance
WHERE gender = 'F'
AND DATEDIFF(CURDATE(), dob) / 365 BETWEEN 50 AND 74;

-- Query 2: A1C Testing Compliance (Annual A1C test for all patients)
SELECT 
    COUNT(*) AS total_patients,
    SUM(CASE WHEN last_a1c_test_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) THEN 1 ELSE 0 END) AS compliant,
    (SUM(CASE WHEN last_a1c_test_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS compliance_rate
FROM hedis_compliance;

-- Query 3: Breast Cancer Screening Compliance by Insurance Type
SELECT 
    insurance_type,
    COUNT(*) AS total_women_50_74,
    SUM(CASE WHEN last_mammogram_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR) THEN 1 ELSE 0 END) AS compliant,
    (SUM(CASE WHEN last_mammogram_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR) THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS compliance_rate
FROM hedis_compliance
WHERE gender = 'F'
AND DATEDIFF(CURDATE(), dob) / 365 BETWEEN 50 AND 74
GROUP BY insurance_type;