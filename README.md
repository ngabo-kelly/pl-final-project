# 🏥 Hospital Management System – PL/SQL Capstone Project

**Course:** Advanced Database Programming and Auditing (INSY 8311)  
**Lecturer:** Eric Maniraguha  
**Student:** NGABO MULISA KELLY  
**Student ID:** 27145  
**Academic Year:** 2024–2025  
**Project Type:** Final Capstone Project

---

## 📘 Overview

The **Hospital Management System (HMS)** is an Oracle-based solution developed using PL/SQL. It aims to automate hospital operations including patient management, appointment scheduling, billing, staff monitoring, and secure auditing. The system integrates logical data modeling, advanced PL/SQL features, triggers, and database auditing to ensure smooth, secure, and accountable medical data processing.

---

## 🎯 Objectives

- Automate routine hospital operations
- Secure data access and log all critical events
- Prevent unauthorized DML operations during sensitive periods
- Use BPMN for process modeling and ERD for database design
- Demonstrate advanced PL/SQL development skills

---

## 🧩 Logical Data Model (ERD)

- **Entities:**
  - `Patients`, `Doctors`, `Appointments`, `Medical_Records`, `Billing`, `Departments`, `Users`, `Audit_Log`
- **Design Notes:**
  - Fully normalized to 3NF
  - Primary keys and foreign keys ensure relational integrity
  - Relationships reflect real-world operations (e.g., one doctor → many appointments)

---

## 🔄 BPMN – Business Process Model

The BPMN diagram models hospital workflows such as:

- Patient Registration  
- Appointment Scheduling  
- Doctor Consultation  
- Lab Testing  
- Billing and Discharge
- <img width="956" alt="bpmn " src="https://github.com/user-attachments/assets/3384a4b0-5c6a-4e17-96a8-7c135c55de03" />
 

**Actors:** Patient, Receptionist, Doctor, Lab Technician, Cashier    
**Value:** BPMN helps visualize operations and detect inefficiencies early in system design.

---

## 🛠️ DDL & DML Scripts
<img width="959" alt="ddl create and alter table" src="https://github.com/user-attachments/assets/a325f9b5-671c-42af-a45c-121c31c011ba" />


### 📌 DDL (Data Definition Language)

- `CREATE TABLE`, `ALTER`, `DROP`
- Defined keys, constraints (PRIMARY, FOREIGN, CHECK), and indexes
- 

### 🧾 DML (Data Manipulation Language)

- `INSERT INTO`, `UPDATE`, `DELETE`, `SELECT`
- Test data added to simulate realistic hospital operations
- Sample queries:
  - Find patient visits by doctor
  - Generate unpaid bills report
  - Schedule a doctor’s availability
  - <img width="958" alt="dml insert,update and delete" src="https://github.com/user-attachments/assets/be909163-43dd-4f9c-b3b8-c63650b6ca5a" />


---

## 🔐 Triggers & Restrictions

Triggers were used to enforce business rules and security:
<img width="959" alt="trigger implementation" src="https://github.com/user-attachments/assets/a16f6161-d035-474e-b226-8a222731d17d" />


### ✔️ Key Triggers

- **BEFORE INSERT:** Validate patient data
- **AFTER DELETE:** Log deletions from `Appointments`
- **INSTEAD OF UPDATE:** For secure views (if any)
- **Compound Trigger:** Blocks INSERT, UPDATE, DELETE by employees:
  - During weekdays (Mon–Fri)
  - On public holidays (stored in `HOLIDAYS` table)

#### 🔒 Example Logic
```plsql
IF TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') IN ('MON','TUE','WED','THU','FRI')
   OR SYSDATE IN (SELECT holiday_date FROM HOLIDAYS)
THEN
   RAISE_APPLICATION_ERROR(-20001, 'Action not allowed on weekdays or public holidays');
END IF;
