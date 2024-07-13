INSERT INTO Practice2.Patients(patient_id, name, dob, gender, address)
VALUES ('1', 'Farzam', '2004-03-28', 'M', 'Rey');
INSERT INTO Practice2.Patients(patient_id, name, dob, gender, address)
VALUES ('2', 'Ali', '2003-03-07', 'M', 'Rey');

INSERT INTO Practice2.Hospitals(hospital_id, name, address, phone)
VALUES ('1', 'Razi', 'Engelab', '09109052583');
INSERT INTO Practice2.Hospitals(hospital_id, name, address, phone)
VALUES ('2', 'Behbud', 'Azadi', '09385975076');
INSERT INTO Practice2.Hospitals(hospital_id, name, address, phone)
VALUES ('3', 'Kavos', 'Banafshe', '09385000076');

INSERT INTO Practice2.Doctors(doctor_id, name, specialization, hospital_id)
VALUES ('1', 'Kosar', 'Heart', '1');
INSERT INTO Practice2.Doctors(doctor_id, name, specialization, hospital_id)
VALUES ('2', 'Nana', 'Leg', '2');

INSERT INTO Practice2.MedicalRecords(record_id, patient_id, doctor_id, diagnosis, treatment)
VALUES ('1', '1', '1', 'Death', 'Kafan');
INSERT INTO Practice2.MedicalRecords(record_id, patient_id, doctor_id, diagnosis, treatment)
VALUES ('2', '2', '2', 'Cancer', 'Pray');

INSERT INTO Practice2.Appointments(appointment_id, patient_id, doctor_id, appointment_date, status)
VALUES ('1', '1', '1', '2024-04-25', 'pending');
INSERT INTO Practice2.Appointments(appointment_id, patient_id, doctor_id, appointment_date, status)
VALUES ('2', '2', '2', '2024-04-26', 'pending');
INSERT INTO Practice2.Appointments(appointment_id, patient_id, doctor_id, appointment_date, status)
VALUES ('3', '2', '1', '2024-04-26', 'pending');

INSERT INTO Practice2.Medication(medication_id, name, manufacturer, dosage, side_effects)
VALUES ('1', 'Dava', 'DavaSaz', 100, 'insomnia');
INSERT INTO Practice2.Medication(medication_id, name, manufacturer, dosage, side_effects)
VALUES ('2', 'Daro', 'DaroSaz', 10, 'Khoshbini');
INSERT INTO Practice2.Medication(medication_id, name, manufacturer, dosage, side_effects)
VALUES ('3', 'Dava', 'DavaSaz', 800, 'severe');
INSERT INTO Practice2.Medication(medication_id, name, manufacturer, dosage, side_effects)
VALUES ('4', 'Dava', 'DavaSaz', 400, 'severe');