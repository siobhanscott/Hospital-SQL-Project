DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE hospital;

CREATE TABLE Physicians(
Physician_ID INT PRIMARY KEY,
Physician_Phone_Number VARCHAR(300),
Physician_Name VARCHAR(300),
Field_Expertise VARCHAR(300),
Physicians_Address VARCHAR(300),
Physicians_Certification VARCHAR(300)
);

CREATE TABLE Nurses(
Nurse_ID INT PRIMARY KEY,
Nurse_Name VARCHAR(300),
Nurse_Certification VARCHAR(300),
Nurse_Address VARCHAR(300),
Nurse_Phone_Number VARCHAR(300)
);

CREATE TABLE Patients(
Patient_ID INT PRIMARY KEY,
Patient_Name VARCHAR(300),
Patient_Phone_Number VARCHAR(300),
Patient_Address VARCHAR(300),
DOB DATE,
Sex VARCHAR(10),
Nurse_ID INT,
Physician_ID INT,
FOREIGN KEY (Nurse_ID) REFERENCES Nurses(Nurse_ID), 
FOREIGN KEY (Physician_ID) REFERENCES Physicians(Physician_ID)
);

CREATE TABLE Medications(
Medication_ID INT PRIMARY KEY,
Medication_Amount VARCHAR(100),
Patient_ID INT,
Nurse_ID INT,
FOREIGN KEY (Nurse_ID) REFERENCES Nurses(Nurse_ID),
FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

CREATE TABLE HealthRecords(
Record_ID INT PRIMARY KEY,
Status VARCHAR(300),
Date DATE,
Disease VARCHAR(300),
Description VARCHAR(300),
Patient_ID INT,
DOB DATE,
Medication_ID INT,
Physician_ID INT,
Time_Monitored VARCHAR(100),
FOREIGN KEY (Physician_ID) REFERENCES Physicians(Physician_ID),
FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
FOREIGN KEY (Medication_ID) REFERENCES Medications(Medication_ID)
);

CREATE TABLE Rooms(
Room_ID VARCHAR(10) PRIMARY KEY,
Capacity VARCHAR(100),
Room_Fee DECIMAL(10,2),
Patient_ID INT,
FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

CREATE TABLE Invoice(
Invoice_ID INT PRIMARY KEY,
Invoice_Description VARCHAR(300),
Total DECIMAL(10,2),
Patient_ID INT,
FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

CREATE TABLE Payments(
Patient_ID INT,
Invoice_ID INT,
Payment_Date DATE,
Payment_Amount DECIMAL(10,2),
FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
FOREIGN KEY (Invoice_ID) REFERENCES Invoice(Invoice_ID)
);

CREATE TABLE Instructions(
Instruction_Fee DECIMAL (10,2),
Instruction_Description VARCHAR(300),
Instruction_ID INT,
Patient_ID INT,
Nurse_ID INT,
Physician_ID INT,
Order_Date DATE,
Execution_Date DATE,
Execution_Results VARCHAR(300),
PRIMARY KEY(Instruction_ID),
FOREIGN KEY(Nurse_ID) REFERENCES Nurses(Nurse_ID),
FOREIGN KEY (Physician_ID) REFERENCES Physicians(Physician_ID),
FOREIGN KEY(Patient_ID) REFERENCES Patients(Patient_ID)
);
ALTER TABLE Patients ADD INDEX idx_DOB(DOB);
ALTER TABLE HealthRecords ADD FOREIGN KEY (DOB) REFERENCES Patients(DOB);



