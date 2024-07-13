UPDATE Practice2.Appointments
SET status = 'completed'
WHERE appointment_date < NOW() AND status = 'pending';