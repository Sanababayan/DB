CREATE SCHEMA Practice2;

CREATE TABLE Practice2.Patients(
    patient_id VARCHAR(32),
    name VARCHAR(32),
    dob DATE,
    gender CHAR(1),
    address VARCHAR(100),
    PRIMARY KEY (patient_id)
);

CREATE TABLE Practice2.Hospitals(
    hospital_id VARCHAR(32),
    name VARCHAR(32),
    address VARCHAR(32),
    phone VARCHAR(32),
    PRIMARY KEY (hospital_id)
);

CREATE TABLE Practice2.Doctors(
  doctor_id VARCHAR(32),
  name VARCHAR(32),
  specialization VARCHAR(32),
  hospital_id VARCHAR(32),
  PRIMARY KEY (doctor_id),
  foreign key (hospital_id) references Practice2.Hospitals
);

CREATE TABLE Practice2.MedicalRecords(
    record_id VARCHAR(32),
    patient_id VARCHAR(32),
    doctor_id VARCHAR(32),
    diagnosis VARCHAR(32),
    treatment VARCHAR(32),
    PRIMARY KEY (record_id),
    FOREIGN KEY (patient_id) references Practice2.Patients,
    FOREIGN KEY (doctor_id) references Practice2.Doctors
);

CREATE TABLE Practice2.Appointments(
    appointment_id VARCHAR(32),
    patient_id VARCHAR(32),
    doctor_id VARCHAR(32),
    appointment_date DATE,
    status VARCHAR(32),
    PRIMARY KEY (appointment_id),
    FOREIGN KEY (patient_id) references Practice2.Patients,
    FOREIGN KEY (doctor_id) references Practice2.Doctors
);

CREATE TABLE Practice2.Medication(
    medication_id VARCHAR(32),
    name VARCHAR(32),
    manufacturer VARCHAR(32),
    dosage NUMERIC,
    side_effects VARCHAR(32),
    PRIMARY KEY (medication_id)
);