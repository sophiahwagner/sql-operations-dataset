DROP TABLE IF EXISTS doctors;
DROP TABLE IF EXISTS appointments;
CREATE TABLE DOCTORS (
        doctor_id INTEGER PRIMARY KEY,
        doctor_name TEXT,
        specialty TEXT
);

CREATE TABLE appointments (
        appointment_id INTEGER PRIMARY KEY,
        patient_name TEXT,
        doctor_id INTEGER,
        appointment_time TEXT
);

INSERT INTO doctors VALUES (101, 'Dr. Bell', 'Pediatrics');
INSERT INTO doctors VALUES (102, 'Dr. Chen', 'Orthopedics');
INSERT INTO doctors VALUES (103, 'Dr. Davis', 'Dermatology');
INSERT INTO doctors VALUES (104, 'Dr. Evans', 'General Medicine');
INSERT INTO appointments VALUES (1, 'Alice Smith', 101, '09:00 AM');
INSERT INTO appointments VALUES (2, 'Bob Jones',   102, '10:30 AM');
INSERT INTO appointments VALUES (3, 'Charlie Brown', 101, '11:15 AM');
INSERT INTO appointments VALUES (4, 'Diana Prince', NULL, '01:00 PM'); 
INSERT INTO appointments VALUES (5, 'Evan Wright',  NULL, '02:30 PM');