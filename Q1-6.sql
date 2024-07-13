SELECT Practice2.Hospitals.name, COUNT(DISTINCT Practice2.Patients.patient_id),
    CASE
        WHEN COUNT(DISTINCT Practice2.Patients.patient_id) = 0 THEN 'Empty!'
        ELSE 'Not Empty!'
    END
    From Practice2.Hospitals
    LEFT JOIN Practice2.doctors on hospitals.hospital_id = Practice2.doctors.hospital_id
    LEFT JOIN Practice2.Appointments on Practice2.doctors.doctor_id = Practice2.Appointments.doctor_id
    LEFT JOIN Practice2.Patients on Practice2.Appointments.patient_id = Practice2.Patients.patient_id
    GROUP BY Practice2.Hospitals.hospital_id;