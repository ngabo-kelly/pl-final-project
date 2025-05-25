CREATE TABLE Department (
    DepartmentID VARCHAR2(50) PRIMARY KEY,
    Name VARCHAR2(50),
    Location VARCHAR2(50)
);

CREATE TABLE Doctor (
    DoctorID VARCHAR2(50) PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50),
    Specialization VARCHAR2(50),
    Phone VARCHAR2(50),
    Email VARCHAR2(50),
    DepartmentID VARCHAR2(50),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Patient (
    PatientID VARCHAR2(50) PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50),
    DOB DATE NOT NULL,
    Gender CHAR(1),
    Phone VARCHAR2(50),
    Address VARCHAR2(50)
);

CREATE TABLE Medical_Record (
    RecordID VARCHAR2(50) PRIMARY KEY,
    PatientID VARCHAR2(50),
    Diagnosis VARCHAR2(100),
    Treatment VARCHAR2(50),
    RecordDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

CREATE TABLE Appointment (
    AppointmentID VARCHAR2(50) PRIMARY KEY,
    PatientID VARCHAR2(50),
    DoctorID VARCHAR2(50),
    AppDate DATE,
    Status VARCHAR2(50),
    DefaultStatus VARCHAR2(50),
    Notes VARCHAR2(50),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

CREATE TABLE Room (
    RoomID VARCHAR2(50) PRIMARY KEY,
    RoomNo VARCHAR2(50),
    Type VARCHAR2(50),
    Availability VARCHAR2(50)
);

CREATE TABLE Admission (
    AdmissionID VARCHAR2(50) PRIMARY KEY,
    PatientID VARCHAR2(50),
    Diagnosis VARCHAR2(100),
    RecordID VARCHAR2(50),
    AdmissionDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (RecordID) REFERENCES Medical_Record(RecordID)
);

INSERT INTO Department VALUES ('D001', 'Cardiology', 'Block A');

INSERT INTO Doctor VALUES ('DR001', 'ngabo', 'kelly', 'Cardiologist', '0788001122', 'kelly@.com', 'D001');

INSERT INTO Patient VALUES ('P001', 'shema', 'vicent', TO_DATE('1990-05-12', 'YYYY-MM-DD'), 'M', '0788001234', 'Kigali');

INSERT INTO Medical_Record VALUES ('MR001', 'P001', 'Hypertension', 'Medication', SYSDATE);

INSERT INTO Appointment VALUES ('AP001', 'P001', 'DR001', SYSDATE, 'Scheduled', 'Initial', 'Follow-up in 2 weeks');

INSERT INTO Room VALUES ('R001', '101', 'Single', 'Available');

INSERT INTO Admission VALUES ('AD001', 'P001', 'Hypertension', 'MR001', SYSDATE);


INSERT INTO Department VALUES ('D002', 'Neurology', 'Block B');
INSERT INTO Department VALUES ('D003', 'Pediatrics', 'Block C');
INSERT INTO Department VALUES ('D004', 'Oncology', 'Block D');
INSERT INTO Department VALUES ('D005', 'Orthopedics', 'Block E');
INSERT INTO Department VALUES ('D006', 'Dermatology', 'Block F');
INSERT INTO Department VALUES ('D007', 'Gastroenterology', 'Block G');
INSERT INTO Department VALUES ('D008', 'ENT', 'Block H');
INSERT INTO Department VALUES ('D009', 'General Surgery', 'Block I');
INSERT INTO Department VALUES ('D010', 'Urology', 'Block J');

INSERT INTO Doctor VALUES ('DR002', 'ndayishimiye', 'kerry', 'Neurologist', '0788234567', 'kerry.com', 'D002');
INSERT INTO Doctor VALUES ('DR003', 'davis', 'William', 'Pediatrician', '0788345678', 'davis.com', 'D003');
INSERT INTO Doctor VALUES ('DR004', 'David', 'bayingana', 'Oncologist', '0788456789', 'david.com', 'D004');
INSERT INTO Doctor VALUES ('DR005', 'Evelyn', 'umurerwa', 'Orthopedic', '0788567890', 'evelyn.com', 'D005');
INSERT INTO Doctor VALUES ('DR006', 'Frank', 'habineza', 'Dermatologist', '0788678901', 'frank.com', 'D006');
INSERT INTO Doctor VALUES ('DR007', 'Grace', 'bella', 'Gastroenterologist', '0788789012', 'grace.com', 'D007');
INSERT INTO Doctor VALUES ('DR008', 'Henry', 'uwayo', 'ENT Specialist', '0788890123', 'henry.com', 'D008');
INSERT INTO Doctor VALUES ('DR009', 'karenzi', 'prince', 'Surgeon', '0788901234', 'karenzi.com', 'D009');
INSERT INTO Doctor VALUES ('DR010', 'teta', 'yvonne', 'Urologist', '0788012345', 'teta.com', 'D010');

INSERT INTO Patient VALUES ('P002', 'Jane', 'habyarimana', TO_DATE('1985-11-23', 'YYYY-MM-DD'), 'F', '0788001002', 'Huye');
INSERT INTO Patient VALUES ('P003', 'Thomas', 'sankara', TO_DATE('2000-01-02', 'YYYY-MM-DD'), 'M', '0788001003', 'Muhanga');
INSERT INTO Patient VALUES ('P004', 'aime', 'dieu', TO_DATE('1992-08-17', 'YYYY-MM-DD'), 'F', '0788001004', 'Rubavu');
INSERT INTO Patient VALUES ('P005', 'Christopher', 'barore', TO_DATE('1988-03-08', 'YYYY-MM-DD'), 'M', '0788001005', 'Musanze');
INSERT INTO Patient VALUES ('P006', 'kamali', 'elysee', TO_DATE('1995-09-30', 'YYYY-MM-DD'), 'F', '0788001006', 'Nyagatare');
INSERT INTO Patient VALUES ('P007', 'ronard', 'Martin', TO_DATE('1975-04-25', 'YYYY-MM-DD'), 'M', '0788001007', 'Rwamagana');
INSERT INTO Patient VALUES ('P008', 'Sarah', 'teta', TO_DATE('1993-12-10', 'YYYY-MM-DD'), 'F', '0788001008', 'Gicumbi');
INSERT INTO Patient VALUES ('P009', 'Mark', 'elysee', TO_DATE('1981-07-14', 'YYYY-MM-DD'), 'M', '0788001009', 'Bugesera');
INSERT INTO Patient VALUES ('P010', 'kelly', 'praise', TO_DATE('1997-02-21', 'YYYY-MM-DD'), 'F', '0788001010', 'Ngoma');

INSERT INTO Medical_Record VALUES ('MR002', 'P002', 'Migraine', 'Painkillers', SYSDATE);
INSERT INTO Medical_Record VALUES ('MR003', 'P003', 'Asthma', 'Inhaler', SYSDATE);
INSERT INTO Medical_Record VALUES ('MR004', 'P004', 'Breast Cancer', 'Chemotherapy', SYSDATE);
INSERT INTO Medical_Record VALUES ('MR005', 'P005', 'Broken Arm', 'Casting', SYSDATE);
INSERT INTO Medical_Record VALUES ('MR006', 'P006', 'Eczema', 'Cream Treatment', SYSDATE);
INSERT INTO Medical_Record VALUES ('MR007', 'P007', 'Stomach Ulcer', 'Antacids', SYSDATE);
INSERT INTO Medical_Record VALUES ('MR008', 'P008', 'Sinusitis', 'Antibiotics', SYSDATE);
INSERT INTO Medical_Record VALUES ('MR009', 'P009', 'Appendicitis', 'Surgery', SYSDATE);
INSERT INTO Medical_Record VALUES ('MR010', 'P010', 'Kidney Stones', 'Lithotripsy', SYSDATE);

INSERT INTO Appointment VALUES ('AP002', 'P002', 'DR002', SYSDATE, 'Completed', 'Initial', 'MRI results discussion');
INSERT INTO Appointment VALUES ('AP003', 'P003', 'DR003', SYSDATE, 'Cancelled', 'Follow-up', 'Reschedule needed');
INSERT INTO Appointment VALUES ('AP004', 'P004', 'DR004', SYSDATE, 'Scheduled', 'Initial', 'Cancer treatment consult');
INSERT INTO Appointment VALUES ('AP005', 'P005', 'DR005', SYSDATE, 'Scheduled', 'Follow-up', 'X-ray review');
INSERT INTO Appointment VALUES ('AP006', 'P006', 'DR006', SYSDATE, 'Completed', 'Initial', 'Dermatology exam');
INSERT INTO Appointment VALUES ('AP007', 'P007', 'DR007', SYSDATE, 'Scheduled', 'Follow-up', 'Digestive issues');
INSERT INTO Appointment VALUES ('AP008', 'P008', 'DR008', SYSDATE, 'Scheduled', 'Initial', 'ENT consultation');
INSERT INTO Appointment VALUES ('AP009', 'P009', 'DR009', SYSDATE, 'Completed', 'Follow-up', 'Post-op review');
INSERT INTO Appointment VALUES ('AP010', 'P010', 'DR010', SYSDATE, 'Scheduled', 'Initial', 'Urology check');


INSERT INTO Room VALUES ('R002', '102', 'Double', 'Occupied');
INSERT INTO Room VALUES ('R003', '103', 'ICU', 'Available');
INSERT INTO Room VALUES ('R004', '104', 'Single', 'Occupied');
INSERT INTO Room VALUES ('R005', '105', 'Double', 'Available');
INSERT INTO Room VALUES ('R006', '106', 'ICU', 'Available');
INSERT INTO Room VALUES ('R007', '107', 'Single', 'Maintenance');
INSERT INTO Room VALUES ('R008', '108', 'Double', 'Available');
INSERT INTO Room VALUES ('R009', '109', 'ICU', 'Occupied');
INSERT INTO Room VALUES ('R010', '110', 'Single', 'Available');


INSERT INTO Admission VALUES ('AD002', 'P002', 'Migraine', 'MR002', SYSDATE);
INSERT INTO Admission VALUES ('AD003', 'P003', 'Asthma', 'MR003', SYSDATE);
INSERT INTO Admission VALUES ('AD004', 'P004', 'Breast Cancer', 'MR004', SYSDATE);
INSERT INTO Admission VALUES ('AD005', 'P005', 'Broken Arm', 'MR005', SYSDATE);
INSERT INTO Admission VALUES ('AD006', 'P006', 'Eczema', 'MR006', SYSDATE);
INSERT INTO Admission VALUES ('AD007', 'P007', 'Stomach Ulcer', 'MR007', SYSDATE);
INSERT INTO Admission VALUES ('AD008', 'P008', 'Sinusitis', 'MR008', SYSDATE);
INSERT INTO Admission VALUES ('AD009', 'P009', 'Appendicitis', 'MR009', SYSDATE);
INSERT INTO Admission VALUES ('AD010', 'P010', 'Kidney Stones', 'MR010', SYSDATE);












-- Create new table
CREATE TABLE Audit_Log (
    LogID NUMBER PRIMARY KEY,
    Operation VARCHAR2(50),
    TableName VARCHAR2(50),
    Timestamp DATE DEFAULT SYSDATE
);

-- Alter table
ALTER TABLE Patient ADD Email VARCHAR2(100);

-- Drop table (if needed)
-- DROP TABLE Audit_Log;











-- Insert
INSERT INTO Audit_Log VALUES (1, 'INSERT', 'Patient', SYSDATE);

-- Update
UPDATE Patient SET Phone = '0788123456' WHERE PatientID = 'P001';

-- Delete
DELETE FROM Appointment WHERE AppointmentID = 'AP010';










-- Find the most recent medical record for each patient.
SELECT *
FROM (
    SELECT 
        RecordID, 
        PatientID, 
        Diagnosis,
        RecordDate,
        ROW_NUMBER() OVER (PARTITION BY PatientID ORDER BY RecordDate DESC) AS rn
    FROM Medical_Record
)
WHERE rn = 1;












--get patient information
CREATE OR REPLACE PROCEDURE Get_Patient_Info(p_patient_id IN VARCHAR2) IS
    v_name VARCHAR2(100);
BEGIN
    SELECT FirstName || ' ' || LastName INTO v_name
    FROM Patient
    WHERE PatientID = p_patient_id;

    DBMS_OUTPUT.PUT_LINE('Patient Name: ' || v_name);
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Patient not found.');
END;
/












---get appointments for a patient
CREATE OR REPLACE FUNCTION Count_Appointments(p_patient_id IN VARCHAR2)
RETURN NUMBER IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Appointment
    WHERE PatientID = p_patient_id;
    RETURN v_count;
EXCEPTION
    WHEN OTHERS THEN
        RETURN -1;
END;
/











DECLARE
    CURSOR c_patients IS
        SELECT PatientID, FirstName, LastName FROM Patient;
    
    v_id Patient.PatientID%TYPE;
    v_fname Patient.FirstName%TYPE;
    v_lname Patient.LastName%TYPE;

BEGIN
    OPEN c_patients;
    LOOP
        FETCH c_patients INTO v_id, v_fname, v_lname;
        EXIT WHEN c_patients%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Patient ID: ' || v_id || 
                             ' Name: ' || v_fname || ' ' || v_lname);
    END LOOP;
    CLOSE c_patients;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;











--package handling
CREATE OR REPLACE PACKAGE Hospital_Pkg AS
    PROCEDURE Get_Patient_Info(p_patient_id IN VARCHAR2);
    FUNCTION Count_Appointments(p_patient_id IN VARCHAR2) RETURN NUMBER;
END Hospital_Pkg;
/









CREATE OR REPLACE PACKAGE BODY Hospital_Pkg AS

    PROCEDURE Get_Patient_Info(p_patient_id IN VARCHAR2) IS
        v_name VARCHAR2(100);
    BEGIN
        SELECT FirstName || ' ' || LastName INTO v_name
        FROM Patient
        WHERE PatientID = p_patient_id;
        DBMS_OUTPUT.PUT_LINE('Patient Name: ' || v_name);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Patient not found.');
    END;

    FUNCTION Count_Appointments(p_patient_id IN VARCHAR2)
    RETURN NUMBER IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count
        FROM Appointment
        WHERE PatientID = p_patient_id;
        RETURN v_count;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN -1;
    END;

END Hospital_Pkg;
/









-- Test procedure
EXEC Hospital_Pkg.Get_Patient_Info('P001');

-- Test function
SELECT Hospital_Pkg.Count_Appointments('P001') AS total_appointments FROM dual;






-----trigger implementation




CREATE TABLE Holidays (
    HolidayDate DATE PRIMARY KEY,
    Description VARCHAR2(100)
);



--months holidays



INSERT INTO Holidays VALUES (TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'National Heroes Day');
INSERT INTO Holidays VALUES (TO_DATE('2025-06-16', 'YYYY-MM-DD'), 'Liberation Day');



--Trigger to Restrict INSERT/UPDATE/DELETE on Weekdays & Holidays

CREATE OR REPLACE TRIGGER Restrict_Weekday_Holiday_DML
BEFORE INSERT OR UPDATE OR DELETE ON Patient
FOR EACH ROW
DECLARE
    v_today DATE := TRUNC(SYSDATE);
    v_day VARCHAR2(10);
    v_count NUMBER;
BEGIN
    -- Check day of the week (e.g., 'MONDAY')
    SELECT TO_CHAR(v_today, 'DAY') INTO v_day FROM dual;

    -- Count if today is a holiday
    SELECT COUNT(*) INTO v_count FROM Holidays WHERE HolidayDate = v_today;

    -- Block on Monday–Friday or if it's a holiday
    IF TRIM(v_day) IN ('MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY') OR v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'DML operations are not allowed on weekdays or holidays.');
    END IF;
END;
/



---auditing with restriction and tracking

CREATE TABLE holiday_spt (
    LogID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    UserID VARCHAR2(50),
    Operation VARCHAR2(10),
    TableName VARCHAR2(50),
    ActionDate DATE DEFAULT SYSDATE,
    Status VARCHAR2(10)
);


     CREATE OR REPLACE TRIGGER Restrict_Weekday_Holiday_DML
BEFORE INSERT OR UPDATE OR DELETE ON Patient
FOR EACH ROW
DECLARE
    v_today DATE := TRUNC(SYSDATE);
    v_day VARCHAR2(10);
    v_count NUMBER;
BEGIN
    SELECT TRIM(TO_CHAR(v_today, 'DAY')) INTO v_day FROM dual;
    SELECT COUNT(*) INTO v_count FROM Holidays WHERE HolidayDate = v_today;

    IF v_day IN ('MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY') OR v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'DML operations are not allowed on weekdays or holidays.');
    END IF;
END;
/

CREATE OR REPLACE PACKAGE Audit_Pkg AS
    PROCEDURE Log_Audit(
        p_user    VARCHAR2,
        p_op      VARCHAR2,
        p_table   VARCHAR2,
        p_status  VARCHAR2
    );
END Audit_Pkg;
/

-- Step 3: Create package body
CREATE OR REPLACE PACKAGE BODY Audit_Pkg AS
    PROCEDURE Log_Audit(
        p_user    VARCHAR2,
        p_op      VARCHAR2,
        p_table   VARCHAR2,
        p_status  VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Audit_Log (UserID, Operation, TableName, Status)
        VALUES (p_user, p_op, p_table, p_status);
    END;
END Audit_Pkg;
/

-- Step 4: Example of using the package manually
BEGIN
    Audit_Pkg.Log_Audit('admin', 'INSERT', 'Patient', 'Allowed');
END;
/

-- Step 5 (Optional): View audit records
SELECT * FROM Audit_Log;




























