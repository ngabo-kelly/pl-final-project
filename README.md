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
<img width="959" alt="trigger to restrict in weekdays" src="https://github.com/user-attachments/assets/fb8253c0-bb16-4773-8928-64b2ca591530" />

- **BEFORE INSERT:** Validate patient data
- **AFTER DELETE:** Log deletions from `Appointments`
- **INSTEAD OF UPDATE:** For secure views (if any)
- **Compound Trigger:** Blocks INSERT, UPDATE, DELETE by employees:
  - During weekdays (Mon–Fri)
  - On public holidays (stored in `HOLIDAYS` table)
 
## ⚙️ Procedures & Cursors

To support modular design and report generation, **stored procedures** and **cursors** were implemented. These help automate complex actions like registering patients, generating bills, and reporting medical activity.

### 📋 Stored Procedures

#### 🔹 1. `add_patient` – Register new patients
```plsql
CREATE OR REPLACE PROCEDURE add_patient (
    p_patient_id       IN PATIENTS.PATIENT_ID%TYPE,
    p_full_name        IN PATIENTS.FULL_NAME%TYPE,
    p_gender           IN PATIENTS.GENDER%TYPE,
    p_date_of_birth    IN PATIENTS.DATE_OF_BIRTH%TYPE,
    p_phone_number     IN PATIENTS.PHONE_NUMBER%TYPE
)
IS
BEGIN
    INSERT INTO PATIENTS (PATIENT_ID, FULL_NAME, GENDER, DATE_OF_BIRTH, PHONE_NUMBER)
    VALUES (p_patient_id, p_full_name, p_gender, p_date_of_birth, p_phone_number);
    DBMS_OUTPUT.PUT_LINE('Patient registered successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
```

#### 🔹 2. `generate_bill` – Insert billing details
```plsql
CREATE OR REPLACE PROCEDURE generate_bill (
    p_patient_id   IN BILLING.PATIENT_ID%TYPE,
    p_amount       IN BILLING.AMOUNT%TYPE,
    p_method       IN BILLING.PAYMENT_METHOD%TYPE
)
IS
BEGIN
    INSERT INTO BILLING (BILL_ID, PATIENT_ID, AMOUNT, PAYMENT_METHOD, BILL_DATE)
    VALUES (BILL_SEQ.NEXTVAL, p_patient_id, p_amount, p_method, SYSDATE);
    DBMS_OUTPUT.PUT_LINE('Bill generated successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Billing error: ' || SQLERRM);
END;
```

---

### 🔄 Cursors

#### 🔸 1. `get_patient_visits` – Retrieve a patient’s appointment history
```plsql
DECLARE
    CURSOR patient_visits_cur IS
        SELECT a.APPOINTMENT_ID, a.APPOINTMENT_DATE, d.FULL_NAME AS DOCTOR
        FROM APPOINTMENTS a
        JOIN DOCTORS d ON a.DOCTOR_ID = d.DOCTOR_ID
        WHERE a.PATIENT_ID = 1001;

    v_appt_id       APPOINTMENTS.APPOINTMENT_ID%TYPE;
    v_appt_date     APPOINTMENTS.APPOINTMENT_DATE%TYPE;
    v_doctor_name   DOCTORS.FULL_NAME%TYPE;
BEGIN
    OPEN patient_visits_cur;
    LOOP
        FETCH patient_visits_cur INTO v_appt_id, v_appt_date, v_doctor_name;
        EXIT WHEN patient_visits_cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Appointment ID: ' || v_appt_id || ', Date: ' || v_appt_date || ', Doctor: ' || v_doctor_name);
    END LOOP;
    CLOSE patient_visits_cur;
END;
```

#### 🔸 2. `list_bills_by_patient` – Show billing records for a patient
```plsql
DECLARE
    CURSOR bill_cur (p_patient_id BILLING.PATIENT_ID%TYPE) IS
        SELECT BILL_ID, AMOUNT, BILL_DATE
        FROM BILLING
        WHERE PATIENT_ID = p_patient_id;

BEGIN
    FOR record IN bill_cur(1001) LOOP
        DBMS_OUTPUT.PUT_LINE('Bill ID: ' || record.BILL_ID || ', Amount: ' || record.AMOUNT || ', Date: ' || record.BILL_DATE);
    END LOOP;
END;
```

---

## 📌 Conclusion

This project not only automates essential hospital workflows but also strengthens the security, traceability, and maintainability of healthcare data. The integration of **advanced PL/SQL components** like **procedures**, **cursors**, and **triggers** reflects mastery in database development and a deep understanding of real-world system requirements.


#### 🔒 Example Logic
```plsql
IF TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') IN ('MON','TUE','WED','THU','FRI')
   OR SYSDATE IN (SELECT holiday_date FROM HOLIDAYS)
THEN
   RAISE_APPLICATION_ERROR(-20001, 'Action not allowed on weekdays or public holidays');
END IF;
