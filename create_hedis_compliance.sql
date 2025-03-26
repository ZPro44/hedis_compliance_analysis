CREATE TABLE hedis_compliance (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    gender CHAR(1),
    last_primary_care_visit DATE,
    last_mammogram_date DATE,
    last_a1c_test_date DATE,
    insurance_type VARCHAR(50)
);