-- Practice 1: Combine doctor rosters and remove duplicates, sorted by name
SELECT doctor_name, specialty 
FROM doctors
UNION 
SELECT 'Dr. Green' AS doctor_name, 'Cardiology' AS specialty
UNION  
SELECT 'Dr. Bell' AS doctor_name, 'Pediatrics' AS specialty
ORDER BY doctor_name;

-- Practice 2: Combine all unique staff and patient names into a master roster
SELECT doctor_name AS master_roster 
FROM doctors
UNION
SELECT patient_name AS master_roster 
FROM appointments
ORDER BY master_roster;

-- Challenge 1: Combine staff and patients into a master directory
SELECT doctor_name, 
FROM doctors
UNION ALL
SELECT patient_name
FROM appointments

-- Challenge 2: Append extra shifts to the schedule
SELECT patient_name, appointment_time
FROM appointments
UNION ALL
SELECT 'Diana Prince' AS patient_name, '08:00 AM' AS appointment_time;

-- Challenge 3: Identify duplicate names across staff and patients
SELECT name_list, COUNT(*) AS name_count
FROM (
        SELECT doctor_name AS name_list FROM doctors
        UNION ALL
        SELECT patient_name AS name_list FROM appointments
)
GROUP BY name_list
HAVING COUNT(*) > 1;
