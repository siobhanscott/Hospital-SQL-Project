

/*Physician Data*/
INSERT INTO Physicians VALUE ('001', '704-368-4782', 'Dr. June Mayfair', 'Pediatrics', '128 Case Street, Charlotte NC, 28277', 'ABPS');
INSERT INTO Physicians VALUE ('002', '704-368-0229', 'Dr. Henry Alton', 'Orthopedics', '1879 Deer Light Lane, Charlotte NC, 28277', 'ABPS');
INSERT INTO Physicians VALUE ('003', '704-368-9787', 'Dr. Kathleen Sawyer', 'Neurology', '11443 Dixie Hay Drive, Rock Hill SC, 29730', 'ABPS');
INSERT INTO Physicians VALUE ('004', '704-368-3200', 'Dr. Caleb Wright', 'Emergency Medicine', '326 Dayton Hill Road, Charlotte NC, 28173', 'ABPS');
INSERT INTO Physicians VALUE ('005', '704-368-0808', 'Dr. Siobhan Scott', 'Emergency Medicine', '7618 Caspian Drive, Indian Trail NC, 28173', 'ABPS');
INSERT INTO Physicians VALUE ('006', '704-368-2917', 'Dr. Claire Johnson', 'Surgery', '21338 Fox Hill Court, Matthews NC, 28173', 'ABPS');

/*Nurses Data*/ 
INSERT INTO Nurses VALUE ('0306', 'Emily Heart', 'CNA', '768 Oak Street, Charlotte NC, 28277', '704-729-3846');
INSERT INTO Nurses VALUE ('0305', 'Alexis Smith', 'CNA', '233 Elm Avenue, Charlotte NC, 28277', '704-729-1289');
INSERT INTO Nurses VALUE ('0301', 'Jessica Wilson', 'RN', '18376 Coral Reef Lane , Charlotte NC, 28129', '704-729-3747');
INSERT INTO Nurses VALUE ('0302', 'Jared Brown', 'RN', '1025 Cedar Drive, Matthews NC, 28173', '704-729-0070');
INSERT INTO Nurses VALUE ('0303', 'Timothy Marson', 'RN', '262 Lake Drive, Charlotte NC, 28921', '704-729-5678');
INSERT INTO Nurses VALUE ('0304', 'Kayla Rilen', 'RN', '5211 Weddington Road, Matthew NC, 28104', '704-729-1209');

/*Patients Data*/ 
INSERT INTO Patients VALUE('077889', 'Sarah Johnson', '646-289-3276', '5600 Ashberry Drive, Charlotte NC, 28213', '1990-05-10', 'Female', '0301', '005');
INSERT INTO Patients VALUE('022334', 'Mickey Wright', '704-892-6732', '802 Underwood Avenue, Charlotte NC, 28277', '2000-02-20', 'Male', '0302', '004');
INSERT INTO Patients VALUE('011223', 'Lisa Jameson', '298-307-0986', '7889 Marvin Lane, Rock Hill SC, 30429', '1968-11-30', 'Female', '0303', '006');
INSERT INTO Patients VALUE('044556', 'Marcus Smart', '980-432-3252', '4800 Foxburg Court, Charlotte NC, 28277', '2010-08-03', 'Male', '0304', '001');
INSERT INTO Patients VALUE('088991', 'Bam Adebayo', '704-673-9372', '987 Rocky Mountain Road, Indian Trail NC, 28213', '1983-07-23', 'Male', '0305', '003');
INSERT INTO Patients VALUE('066778', 'Kacey Webber', '980-029-4589', '2336 Crestmont Road, Matthews NC, 28029', '1997-01-08', 'Female', '0306', '002');

/*Medications Data*/
INSERT INTO Medications VALUE('123456', '10 units', '077889', '0301');
INSERT INTO Medications VALUE('428628', '10 mL', '022334', '0302');
INSERT INTO Medications VALUE('926826', '800 mg', '011223', '0303');
INSERT INTO Medications VALUE('021023', '2 Puffs', '044556', '0304');
INSERT INTO Medications VALUE('328826', '250 mg', '088991', '0305');
INSERT INTO Medications VALUE('282732', '500 mg', '066778', '0306'); 

/*Health Records*/
INSERT INTO HealthRecords VALUE('9991', 'Recovering', '2023-05-02', 'Fractured Left Shoulder', 'Fracture to the Left Shoulder, prescribed pain medication (2 capsules 500 mg every 4 hours)', '066778', '1997-01-08', '282732', '002', '5 Hours'); 
INSERT INTO HealthRecords VALUE('8882', 'Recovering', '2023-02-15', 'Minor Concussion', 'Minor Concussion while laying basketball, prescribed pain medication (1 capsule 250 mg every 2 hours)', '088991', '1983-07-23', '328826', '003', '3 Hours');
INSERT INTO HealthRecords VALUE('7773', 'Recovered', '2022-12-20', 'Athsma Attack', 'Asthma Attack while at school, patient has a history of asthma, prescribed 2 puffs from asthma pump every hour and rest', '044556', '2010-08-03', '021023', '001', '2 Hours');
INSERT INTO HealthRecords VALUE('6644', 'In Surgery', '2023-04-08', 'Fractured Hip', 'Fractured Hip from falling down the stairs, patient had surgery, patient prescribed fluids and medication, along with rest and no physical activities', '011223', '1968-11-30', '926826', '006', '1 week');
INSERT INTO HealthRecords Value('5555', 'Recovering', '2023-05-21', 'Dehydration', 'Patient passed out whle running, patient was given fluids, patient was prescribed water and rest', '022334', '2000-02-20', '428628', '004', '3 Hours');
INSERT INTO HealthRecords VALUE('4447', 'Stable', '2023-05-21', 'Low Blood Sugar', 'Patient passed out from low blood sugar, has a history of diabetes, patient was given insulin', '077889', '1990-05-10', '123456', '005', '4 hours');

/*Rooms Data*/
INSERT INTO Rooms VALUE('100', 'Single', '400.00', '066778');
INSERT INTO Rooms VALUE('200', 'Suite', '600.00', '011223');
INSERT INTO Rooms VALUE('300', 'Double', '200.00', '022334');
INSERT INTO Rooms VALUE('400', 'Double', '200.00', '077889');
INSERT INTO ROOMS VALUE('500', 'Single', '400.00', '088991');
INSERT INTO Rooms VALUE('600', 'Double', '200.00', '044556');

/*Instructions Data*/
INSERT INTO Instructions VALUE('500.00', 'CT Scan','9982','066778', '0301','002','2023-05-02','2023-05-02','Fractured Left Shoulder');
INSERT INTO Instructions VALUE('500.00', 'CT Scan', '8871', '088991', '0302', '003', '2023-02-15', '2023-02-15', 'No damage, minor concussion');
INSERT INTO Instructions VALUE('200.00', 'Pulmonary Function Test', '7762', '044556', '0303', '001', '2022-12-20', '2022-12-20', 'Normal Lung Function');
INSERT INTO Instructions VALUE( '500.00', 'CT Scan', '9983', '011223', '0304', '006', '2023-04-08', '2023-04-08', 'Fractured Right Hip');
INSERT INTO Instructions VALUE('300.00', 'Glucagon Treatment.', '2923', '022334', '0306', '005', '2023-05-21', '2023-05-21', 'Low Blood Sugar');

/*Invoice Data*/
INSERT INTO Invoice VALUE('06000','CT Scan, 1 Day Room Fee','1000.00','066778');
INSERT INTO Invoice VALUE('08000', 'CT Scan, 1 Day Room Fee', '1000.00', '088991');
INSERT INTO Invoice VALUE('04000', 'Pulmonary Function Test, 1 Day Room Fee', '500.00', '044556');
INSERT INTO Invoice VALUE('01000', 'CT Scan, 7 Day Room Fee', '5000.00', '011223');
INSERT INTO Invoice VALUE('02000', '1 Day Room Fee', '300.00', '022334');
INSERT INTO Invoice VALUE('07000', 'Glucagon Treatment, 1 Day Room Fee', '500.00', '077889');

/*Payment Data*/
INSERT INTO Payments VALUE('066778','06000','2023-06-01','1000.00');
INSERT INTO Payments VALUE('088991', '08000', '2023-02-27', '1000.00');
INSERT INTO Payments VALUE('044556', '04000', '2022-12-20', '500.00');
INSERT INTO Payments VALUE('011223', '01000', NULL, '5000.00');
INSERT INTO Payments VALUE('022334', '02000', '2023-06-01', '300.00');
INSERT INTO Payments VALUE('077889', '07000', '2023-05-28', '500.00');
