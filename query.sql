-- Practice 1: Show all doctors and any matching appointments
SELECT d.doctor_name, d.specialty, a.patient_name, a.appointment_time
FROM doctors AS d
LEFT JOIN appointments AS a
ON d.doctor_id = a.doctor_id;

-- Practice 2: Show all appointments and any assigned doctors
SELECT a.patient_name, a.appointment_time, d.doctor_name, d.specialty
FROM appointments AS a
LEFT JOIN doctors AS d
ON d.doctor_id = a.doctor_id;

-- Practice 3: Find patients who don't have a doctor assigned
SELECT a.appointment_id, a.patient_name, a.appointment_time
FROM appointments AS a
LEFT JOIN doctors AS d
        ON a.doctor_id = d.doctor_id
WHERE d.doctor_id IS NULL;

-- Challenge 1: Find doctors with zero appointments today
SELECT d.doctor_id, d.doctor_name, d.specialty
FROM doctors AS d
LEFT JOIN appointments AS a
ON a.doctor_id = d.doctor_id
WHERE appointment_time IS NULL

-- Challenge 2: List patient names and times for unassigned slots
SELECT a.patient_name, a.appointment_time
FROM appointments AS a
LEFT JOIN doctors as d
ON d.doctor_id = a.doctor_id
WHERE doctor_name IS NULL;

-- Challenge 3: Total appointments per doctor (including 0 for empty schedules)
SELECT d.doctor_name, d.specialty, count(a.appointment_id) AS total_appointments
FROM doctors AS d
LEFT JOIN appointments AS a
ON d.doctor_id = a.doctor_id
GROUP BY doctor_name;

-- Challenge 4: Find specialties with fewer than 2 appointments bookedSELECT d.specialty, count(a.appointment_id) AS total_appointments
FROM doctors as d
LEFT JOIN appointments as a
ON d.doctor_id = a.doctor_id
GROUP BY d.specialty
HAVING total_appointments < 2;

-- Challenge 5: Label appointments as 'Confirmed' or 'Needs Action'
SELECT a.appointment_id, a.patient_name,
        CASE
                WHEN d.doctor_name IS NULL THEN 'Needs Action'
                ELSE 'Confirmed'
        END AS assignment_status
FROM appointments AS a
LEFT JOIN doctors AS d
ON d.doctor_id = a.doctor_id;

-- Challenge 6: Count unassigned appointments by time slot
SELECT a.appointment_time, COUNT(appointment_id) AS unassigned
FROM appointments AS a
LEFT JOIN doctors AS d
ON d.doctor_id = a.doctor_id
WHERE d.doctor_id IS NULL
GROUP BY a.appointment_time;

-- Challenge 7: Rank medical specialties by appointment volume
SELECT d.specialty, COUNT(a.appointment_id) AS total_appointments
FROM doctors AS d
LEFT JOIN appointments AS a
ON d.doctor_id = a.doctor_id
GROUP BY d.specialty
ORDER BY total_appointments DESC;        
       

