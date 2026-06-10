# 🏥 Hospital Management Analytics System | MySQL & Power BI

## 📌 Project Overview

The Hospital Management Analytics System is an end-to-end data analytics project designed to manage and analyze hospital operations using MySQL and Power BI. The project focuses on patient records, doctor information, admissions, diagnoses, and billing data to generate meaningful business insights that support healthcare decision-making.

This project demonstrates database design, SQL querying, data analysis, and dashboard development skills commonly required for Data Analyst and Data Scientist roles.

---

## 🎯 Problem Statement

Hospitals generate large volumes of data daily, including patient records, doctor details, admissions, diagnoses, and billing transactions. Without proper data management and analysis, it becomes difficult to monitor hospital performance, optimize resources, and improve patient care.

This project aims to build a centralized hospital database and create interactive dashboards to transform raw healthcare data into actionable insights.

---

## 🎯 Objectives

- Design a relational database for hospital management.
- Store and manage patient, doctor, admission, diagnosis, and billing information.
- Perform SQL-based data analysis and reporting.
- Build interactive Power BI dashboards.
- Generate operational and financial insights for healthcare management.
- Improve decision-making through data visualization.

---

## 🛠️ Technology Stack

| Technology | Purpose |
|------------|----------|
| MySQL | Database Management |
| SQL | Data Querying & Analysis |
| Power BI | Dashboard & Visualization |
| Python (Optional) | Data Processing |
| CSV Files | Dataset Storage |

---

## 📂 Database Structure

The database consists of the following tables:

### 1. Patients
Stores patient demographic information.

**Fields:**
- Patient_ID
- Patient_Name
- Age
- Gender
- Blood_Group
- City
- Contact_Number

---

### 2. Doctors
Stores doctor information.

**Fields:**
- Doctor_ID
- Doctor_Name
- Specialization
- Department
- Experience_Years

---

### 3. Admissions
Stores hospital admission details.

**Fields:**
- Admission_ID
- Patient_ID
- Doctor_ID
- Admission_Date
- Discharge_Date
- Ward_Type
- Admission_Status

---

### 4. Diagnoses
Stores diagnosis information.

**Fields:**
- Diagnosis_ID
- Patient_ID
- Disease_Name
- Severity_Level
- Diagnosis_Date

---

### 5. Billing
Stores patient billing information.

**Fields:**
- Bill_ID
- Patient_ID
- Total_Amount
- Insurance_Coverage
- Payment_Mode
- Payment_Status

---

## 🔗 Entity Relationship (ER) Model

Relationships implemented:

- One Patient → Many Admissions
- One Doctor → Many Admissions
- One Patient → Many Diagnoses
- One Patient → Many Bills

---

## 📊 SQL Analysis Performed

The following SQL analyses were conducted:

### Patient Analysis
- Total Patients
- Gender Distribution
- Age Group Analysis
- City-wise Patient Count

### Doctor Analysis
- Doctor Count by Department
- Specialization Analysis
- Experience Distribution

### Admission Analysis
- Total Admissions
- Monthly Admission Trends
- Ward Utilization
- Average Length of Stay

### Diagnosis Analysis
- Most Common Diseases
- Severity Distribution
- Disease Trends

### Billing Analysis
- Total Revenue
- Average Billing Amount
- Payment Status Distribution
- Insurance Coverage Analysis

---

## 📈 Power BI Dashboard Features

### Executive Summary Dashboard
- Total Patients
- Total Doctors
- Total Admissions
- Total Revenue

### Patient Analytics Dashboard
- Gender Analysis
- Age Distribution
- City-wise Patients

### Admission Analytics Dashboard
- Monthly Admissions
- Ward Utilization
- Admission Status

### Diagnosis Analytics Dashboard
- Disease Frequency
- Severity Analysis
- Diagnosis Trends

### Financial Analytics Dashboard
- Revenue Overview
- Payment Status
- Insurance Coverage
- Billing Distribution

---

## 📊 Key Insights Generated

- Identified the most common diseases among patients.
- Analyzed patient demographics and age groups.
- Evaluated doctor specialization distribution.
- Monitored hospital admission trends.
- Measured ward utilization efficiency.
- Tracked revenue generation patterns.
- Evaluated insurance coverage and payment behavior.
- Identified high-demand hospital departments.

---

## 🚀 Business Impact

This project helps hospitals:

- Improve operational efficiency.
- Monitor healthcare performance.
- Track patient and admission trends.
- Optimize resource allocation.
- Analyze financial performance.
- Support data-driven decision-making.

---

## 💡 Skills Demonstrated

### SQL Skills
- Database Design
- Table Creation
- Primary & Foreign Keys
- Joins
- Aggregations
- Subqueries
- Window Functions
- Data Analysis Queries

### Power BI Skills
- Data Modeling
- Dashboard Design
- KPI Cards
- Slicers & Filters
- DAX Measures
- Interactive Visualizations

### Analytics Skills
- Data Cleaning
- Business Analysis
- KPI Development
- Insight Generation
- Reporting

---

## 📁 Project Files

```text
Hospital-Management-Analytics-SQL-PowerBI/
│
├── SQL Scripts/
│   ├── Database_Schema.sql
│   ├── Data_Insertion.sql
│   └── Analysis_Queries.sql
│
├── Dataset/
│   ├── Patients.csv
│   ├── Doctors.csv
│   ├── Admissions.csv
│   ├── Diagnoses.csv
│   └── Billing.csv
│
├── PowerBI/
│   └── Hospital_Dashboard.pbix
│
├── ER_Diagram/
│   └── ER_Diagram.png
│
└── README.md
```

---

## 📸 Dashboard Preview

### Executive Dashboard
![Dashboard Screenshot](dashboard.png)

---

## 🎓 Learning Outcomes

Through this project, I gained practical experience in:

- Relational Database Design
- SQL Query Optimization
- Healthcare Data Analytics
- Power BI Dashboard Development
- Business Intelligence Reporting
- Data Visualization Best Practices

---

## 🔮 Future Enhancements

- Predictive Patient Admission Analysis
- Disease Prediction Models
- Real-Time Dashboard Integration
- Machine Learning-Based Healthcare Insights
- Automated Reporting System

---

## 👨‍💻 Author

**Kalpesh Patil**
B.Tech (Electronics & Telecommunication)

Aspiring Data Scientist | SQL | Power BI | Python | Machine Learning

GitHub: https://github.com/kalpesh1802

LinkedIn: https://www.linkedin.com/in/kalpesh-patil-1964a7261/

---

## ⭐ If you found this project useful, please give it a star.
-- Thank You 
