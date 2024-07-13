UPDATE Practice2.Medication
SET dosage = dosage * 1.5
WHERE side_effects LIKE '%severe%' AND dosage * 1.5 < 1000;