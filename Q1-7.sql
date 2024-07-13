SELECT Practice2.Patients.name, string_agg(DISTINCT Practice2.Hospitals.name, ', ')
    From Practice2.Hospitals
    INNER JOIN Practice2.doctors on Practice2.Hospitals.hospital_id = Practice2.doctors.hospital_id
    INNER JOIN Practice2.Appointments on Practice2.doctors.doctor_id = Practice2.Appointments.doctor_id
    INNER JOIN Practice2.Patients on Practice2.Appointments.patient_id = Practice2.Patients.patient_id
    GROUP BY Practice2.Patients.patient_id
    HAVING COUNT(DISTINCT Practice2.Hospitals.hospital_id) > 1;