-- create Databases
CREATE DATABASE Hospital_Analysis;
use Hospital_Analysis;

-- Create departments Table
CREATE TABLE departments (
  dept_id      INT PRIMARY KEY AUTO_INCREMENT,
  dept_name    VARCHAR(100) NOT NULL,
  head_doctor_id INT,
  location     VARCHAR(50)
);

-- Create Doctors Table
CREATE TABLE doctors (
  doctor_id      INT PRIMARY KEY AUTO_INCREMENT,
  doctor_name    VARCHAR(100) NOT NULL,
  specialization VARCHAR(100),
  dept_id        INT,
  experience_yrs INT,
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

select * from doctors;

-- Create Patients Table
CREATE TABLE patients (
  patient_id  INT PRIMARY KEY AUTO_INCREMENT,
  name        VARCHAR(100) NOT NULL,
  age         INT,
  gender      ENUM('Male','Female','Other'),
  blood_group VARCHAR(5),
  city        VARCHAR(50),
  contact     VARCHAR(15)
);
select * from patients;

-- Create Admissions Table
CREATE TABLE admissions (
  admission_id   INT PRIMARY KEY AUTO_INCREMENT,
  patient_id     INT NOT NULL,
  doctor_id      INT NOT NULL,
  admit_date     DATE NOT NULL,
  discharge_date DATE,
  ward_type      ENUM('General','ICU','Private','Emergency'),
  status         ENUM('Admitted','Discharged','Under Observation'),
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  FOREIGN KEY (doctor_id)  REFERENCES doctors(doctor_id)
);

select * from admissions;


-- Create Diagnoses Table
CREATE TABLE diagnoses (
  diagnosis_id   INT PRIMARY KEY AUTO_INCREMENT,
  admission_id   INT NOT NULL,
  icd_code       VARCHAR(10),          -- e.g. J18.9 for Pneumonia
  diagnosis_name VARCHAR(200),
  severity       ENUM('Mild','Moderate','Severe','Critical'),
  FOREIGN KEY (admission_id) REFERENCES admissions(admission_id)
);
select * from diagnoses;

-- Create Billing Table
CREATE TABLE billing (
  bill_id           INT PRIMARY KEY AUTO_INCREMENT,
  admission_id      INT NOT NULL,
  total_amount      DECIMAL(10,2),
  insurance_covered DECIMAL(10,2),
  payment_status    ENUM('Paid','Pending','Waived'),
  payment_mode      ENUM('Cash','Card','Insurance','UPI'),
  FOREIGN KEY (admission_id) REFERENCES admissions(admission_id)
);
select * from billing;

select * from departments;

INSERT INTO departments
(dept_id, dept_name, head_doctor_id, location)
VALUES
(1, 'Cardiology', 1, 'Building A'),
(2, 'Neurology', 2, 'Building B'),
(3, 'Orthopedics', 3, 'Building C'),
(4, 'Pediatrics', 4, 'Building D'),
(5, 'Emergency', 5, 'Ground Floor'),
(6, 'Oncology', 6, 'Building E'),
(7, 'Dermatology', 7, 'Building F'),
(8, 'Psychiatry', 8, 'Building G'),
(9, 'ENT', 9, 'Building H'),
(10, 'Gastroenterology', 10, 'Building I'),
(11, 'Nephrology', 11, 'Building J'),
(12, 'Pulmonology', 12, 'Building K'),
(13, 'Urology', 13, 'Building L'),
(14, 'Radiology', 14, 'Building M'),
(15, 'General Medicine', 15, 'Building N');

SELECT COUNT(*) FROM patients;
SELECT COUNT(*) FROM admissions;
SELECT COUNT(*) FROM billing;
SELECT COUNT(*) FROM departments;
SELECT COUNT(*) FROM diagnoses;
SELECT COUNT(*) FROM doctors;

SELECT * FROM patients LIMIT 10;

-- Business Problems & Insights for Hospital Analytics
-- 1 Which Department Generates the Most Revenue?
-- Business Problem -> Hospital management wants to know which department contributes the highest revenue.

SELECT d.dept_name,
       SUM(b.total_amount) AS total_revenue
FROM departments d
JOIN doctors doc ON d.dept_id = doc.dept_id
JOIN admissions a ON doc.doctor_id = a.doctor_id
JOIN billing b ON a.admission_id = b.admission_id
GROUP BY d.dept_name
ORDER BY total_revenue DESC;

-- 2. Which Doctor Handles the Most Patients?
-- Business Problem -> Identify workload distribution among doctors.

SELECT d.doctor_name,
       COUNT(a.patient_id) AS total_patients
FROM doctors d
JOIN admissions a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name
ORDER BY total_patients DESC;

-- 3. Average Length of Stay
-- Business Problem -> Longer stays increase hospital costs.

SELECT ward_type,
       AVG(DATEDIFF(discharge_date,admit_date))
       AS avg_stay_days
FROM admissions
WHERE discharge_date IS NOT NULL
GROUP BY ward_type;

-- 4. Most Common Diseases
-- Business Problem - > Which diseases occur most frequently?

SELECT diagnosis_name,
       COUNT(*) AS total_cases
FROM diagnoses
GROUP BY diagnosis_name
ORDER BY total_cases DESC;

-- 5. Severity Analysis
-- Business Problem - > How critical are admitted patients?

SELECT severity,
       COUNT(*) AS total_patients
FROM diagnoses
GROUP BY severity;

-- 6. Insurance Dependency
-- Business Problem -> How much revenue depends on insurance?

SELECT
SUM(insurance_covered) AS insurance_amount,
SUM(total_amount) AS total_revenue,
ROUND(
SUM(insurance_covered)/
SUM(total_amount)*100,2
) AS insurance_percentage
FROM billing;

-- 7. Pending Payments Analysis
-- Business Problem -> Find unpaid bills.

SELECT payment_status,
       COUNT(*) AS bills,
       SUM(total_amount) AS amount
FROM billing
GROUP BY payment_status;

-- 8. Monthly Admission Trend
-- Business Problem - > When does patient volume increase?

SELECT YEAR(admit_date) AS year,
       MONTH(admit_date) AS month,
       COUNT(*) AS admissions
FROM admissions
GROUP BY year,month
ORDER BY year,month;

-- 9. City-wise Patient Analysis
-- Business Problem -> Which cities send the most patients?

SELECT city,
       COUNT(*) AS patients
FROM patients
GROUP BY city
ORDER BY patients DESC;

-- 10. Revenue by Payment Mode
-- Business Problem -> Preferred payment method?

SELECT payment_mode,
       SUM(total_amount) AS revenue
FROM billing
GROUP BY payment_mode;

-- 11. Doctor Performance Dashboard
-- Business Problem -> Measure doctor productivity.

SELECT d.doctor_name,
       COUNT(a.admission_id) AS patients,
       SUM(b.total_amount) AS revenue
FROM doctors d
JOIN admissions a
ON d.doctor_id = a.doctor_id
JOIN billing b
ON a.admission_id = b.admission_id
GROUP BY d.doctor_name;

-- 13. Readmission Analysis (Advanced)
-- Business Problem -> Patients returning frequently may indicate treatment issues.

SELECT patient_id,
       COUNT(*) AS admissions
FROM admissions
GROUP BY patient_id
HAVING COUNT(*) > 1;

-- 14 Top 10 Highest Billing Patients
-- Business Problem -> Identify high-value patients.

SELECT p.name,
       SUM(b.total_amount) AS spending
FROM patients p
JOIN admissions a
ON p.patient_id=a.patient_id
JOIN billing b
ON a.admission_id=b.admission_id
GROUP BY p.name
ORDER BY spending DESC
LIMIT 10;

-- 15.Top 10 Highest Revenue Doctors
SELECT
    d.doctor_name,
    SUM(b.total_amount) AS revenue
FROM doctors d
JOIN admissions a
ON d.doctor_id = a.doctor_id
JOIN billing b
ON a.admission_id = b.admission_id
GROUP BY d.doctor_name
ORDER BY revenue DESC
LIMIT 5;

-- 16. Most Common Diagnoses Per Ward Type
-- Business Problem -> Which diseases are most common in each ward?

SELECT
    a.ward_type,
    d.diagnosis_name,
    COUNT(*) AS total_cases
FROM diagnoses d
JOIN admissions a
ON d.admission_id = a.admission_id
GROUP BY
    a.ward_type,
    d.diagnosis_name
ORDER BY
    a.ward_type,
    total_cases DESC;
    
-- 17. Patient Age Group Analysis
-- Business Problem -> Which age group contributes the most hospital visits?

SELECT
CASE
    WHEN age < 18 THEN 'Children'
    WHEN age BETWEEN 18 AND 35 THEN 'Young Adults'
    WHEN age BETWEEN 36 AND 60 THEN 'Adults'
    ELSE 'Senior Citizens'
END AS age_group,
COUNT(*) AS total_patients
FROM patients
GROUP BY age_group
ORDER BY total_patients DESC;

-- 18. Outstanding Billing (> ₹50,000)
-- Business Problem -> Which patients have large unpaid bills?

SELECT
    p.name,
    b.total_amount,
    b.payment_status
FROM patients p
JOIN admissions a
ON p.patient_id = a.patient_id
JOIN billing b
ON a.admission_id = b.admission_id
WHERE b.payment_status = 'Pending'
AND b.total_amount > 50000
ORDER BY b.total_amount DESC;

-- 19 Bed Occupancy Rate Analysis (Extremely Impactful)
-- Business Problem -> Is the hospital running out of beds?

SELECT
    ward_type,
    COUNT(*) AS occupied_beds
FROM admissions
WHERE status = 'Admitted'
GROUP BY ward_type;