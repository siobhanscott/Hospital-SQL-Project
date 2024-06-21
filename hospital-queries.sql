/*Find the Nurses that are Registered Nurses (RN)*/
SELECT Nurse_ID, Nurse_Name, Nurse_Certification
FROM Nurses
WHERE Nurse_Certification = 'RN';

/*Find the Patients that paid $500 or more for their Hospital Bill*/
SELECT a.Patient_ID, a.Patient_Name, b.Payment_Amount
FROM Patients a
JOIN Payments b ON a.Patient_ID = b.Patient_ID
WHERE b.Payment_Amount >= 500;

/*Find the patients who had a CT Scan and who's status is recovering*/
SELECT p.Patient_ID, p.Patient_Name, h.Status, b.Instruction_Description
FROM Patients p
JOIN HealthRecords h ON p.Patient_ID = h.Patient_ID
JOIN Instructions b ON p.Patient_ID = b.Patient_ID
WHERE b.Instruction_Description = 'CT Scan' AND h.Status = 'Recovering';

/*Find the name, status, disease, and description of the patients who were recommened rest by the Physician*/
SELECT p.Patient_Name, h.Status, h.Disease, h.Description
FROM Patients p
JOIN HealthRecords h ON p.Patient_ID = h.Patient_ID
WHERE h.Description LIKE '%rest%';

/*Find all the Physicians and Nurses who live in Charlotte, NC*/
SELECT Physician_Name, Physicians_Address, NULL AS Nurse_Name, NULL AS Nurse_Adress
FROM Physicians
WHERE Physicians_Address LIKE '%Charlotte NC%'
UNION
SELECT NULL AS Physician_Name, NULL AS Physicians_Address, Nurse_Name, Nurse_Address
FROM Nurses
WHERE Nurse_Address LIKE '%Charlotte NC%';




/*Find the total amount of patients and the total revenue of the patients payments */
SELECT p.Physician_Name, COUNT(DISTINCT pa.Patient_ID) AS TotalPatients, SUM(pm.Payment_Amount) AS TotalRevenue
FROM Physicians p
JOIN Patients pa ON p.Physician_ID = pa.Physician_ID
JOIN Payments pm ON pa.Patient_ID = pm.Patient_ID
GROUP BY p.Physician_ID, p.Physician_Name;


/*Find the lowest and the highest room fees and which patients are in those rooms*/
SELECT DISTINCT r1.Room_Fee AS LowRoomFee, p1.Patient_Name AS PatientInLowestRoom, r2.Room_Fee AS HighRoomFee, p2.Patient_Name AS PatientInHighestRoom
FROM Rooms r1
JOIN Patients p1 ON r1.Patient_ID = p1.Patient_ID
JOIN Rooms r2 ON r2.Room_Fee = (
    SELECT DISTINCT MAX(Room_Fee)
    FROM Rooms
)
JOIN Patients p2 ON r2.Patient_ID = p2.Patient_ID
WHERE r1.Room_Fee = (
    SELECT DISTINCT MIN(Room_Fee) 
    FROM Rooms
);

/*Show the patients and their medication amount where the injury is a fractured hip */
SELECT p.Patient_Name, m.Medication_Amount, h.Disease
FROM Patients p
INNER JOIN Medications m ON p.Patient_ID = m.Patient_ID
INNER JOIN HealthRecords h ON p.Patient_ID = h.Patient_ID
WHERE m.Medication_ID IN(Select Medication_ID FROM HealthRecords WHERE Disease = 'Fractured Hip');

/*Show the Physicians and Nurses that have the same Patient*/
SELECT p.Patient_Name, ph.Physician_Name, n.Nurse_Name 
FROM Patients p 
LEFT JOIN Physicians ph ON p.Physician_ID = ph.Physician_ID 
LEFT JOIN Nurses n ON p.Nurse_ID = n.Nurse_ID; 

/*Show the instructions given to each Nurse*/
SELECT n.Nurse_ID, n.Nurse_Name, i.Instruction_Description
FROM Nurses n
INNER JOIN Instructions i ON n.Nurse_ID = i.Nurse_ID;

/*Find how many rooms for each capacity and their average rate*/
SELECT Capacity, COUNT(*) AS Total, AVG(Room_Fee) AS Average_Fee
FROM Rooms
Group By Capacity;

/*Find the nurses who are CNA's and their assigned patients*/
SELECT p.Patient_Name, p.Patient_ID, n.Nurse_Name, n.Nurse_Certification
FROM (SELECT Patient_Name, Patient_ID, Nurse_ID FROM Patients 
) p
INNER JOIN Nurses n ON p.Nurse_ID = n.Nurse_ID
WHERE n.Nurse_Certification = 'RN';

/*Find the Physicians whose field expertise is Emergency Medicine and the patients assinged to them*/
SELECT p.Patient_Name, h.Disease, ph.Physician_Name
FROM Patients p
INNER JOIN(Select Physician_ID, Physician_Name FROM Physicians WHERE Field_Expertise = 'Emergency Medicine')
ph ON p.Physician_ID = ph.Physician_ID INNER JOIN HealthRecords h ON p.Patient_ID = h. Patient_ID;

/*Find the patients who have a broken bone*/
SELECT p.Patient_Name, h.Disease AS Injury
FROM Patients p
JOIN HealthRecords h ON p.Patient_ID = h.Patient_ID
WHERE h.Disease LIKE '%Fractured%';

/*Find all the patients born in 2000 or after with their status being recovering or recovered*/
SELECT p.Patient_ID, p.Patient_Name, p.DOB, h.Status
FROM Patients p
JOIN HealthRecords h ON p.Patient_ID = h.Patient_ID
WHERE p.DOB >= '2000-01-01' AND (h.Status = 'Recovering' OR h.Status = 'Recovered');

/*View for patient information*/
CREATE VIEW PatientInformationView AS
SELECT p.Patient_ID, p.Patient_Name, p.Patient_Phone_Number, p.Patient_Address, p.DOB, p.Sex, n.Nurse_Name, ph.Physician_Name
FROM Patients p
LEFT JOIN Nurses n ON p.Nurse_ID = n.Nurse_ID
LEFT JOIN Physicians ph ON p.Physician_ID = ph.Physician_ID;

/*View for the total amount paid by the patient*/
CREATE VIEW AmountPaidView AS
SELECT p.Patient_ID, p.Patient_Name, SUM(pa.Payment_Amount) AS AmountPaid
FROM Patients p
LEFT JOIN Payments pa ON p.Patient_ID = pa.Patient_ID
GROUP BY p.Patient_ID, p.Patient_Name;

/*View to get the patients health records and medications*/
CREATE VIEW HealthRecordView AS
SELECT h.Record_ID, h.Status, h.Date, h.Disease, h.Description, p.Patient_Name, m.Medication_Amount
FROM HealthRecords h
JOIN Patients p ON h.Patient_ID = p.Patient_ID
LEFT JOIN Medications m ON h.Patient_ID = m.Patient_ID;


