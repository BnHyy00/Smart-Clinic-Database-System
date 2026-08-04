-- 1. Create database if it does not exist and use it
CREATE DATABASE IF NOT EXISTS clinic_db;
USE clinic_db;

-- 2. Drop tables if they already exist to ensure clean execution
DROP TABLE IF EXISTS Treatments;
DROP TABLE IF EXISTS Appointments;
DROP TABLE IF EXISTS Doctors;
DROP TABLE IF EXISTS Patients;


-- 3. Create Appointments table
CREATE TABLE Appointments (
    appointment_ID INT AUTO_INCREMENT PRIMARY KEY,
    patient_ID INT NOT NULL,
    doctor_ID INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    appointment_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (patient_ID) REFERENCES Patients(patient_ID) ON DELETE CASCADE,
    FOREIGN KEY (doctor_ID) REFERENCES Doctors(doctor_ID) ON DELETE CASCADE
);

-- 4. Create Treatments table
CREATE TABLE Treatments (
    treatment_ID INT AUTO_INCREMENT PRIMARY KEY,
    appointment_ID INT NOT NULL,
    diagnosis VARCHAR(150) NOT NULL,
    treatment_details VARCHAR(255),
    FOREIGN KEY (appointment_ID) REFERENCES Appointments(appointment_ID) ON DELETE CASCADE
);
('Dr. Hossam Zaid', 'Pediatrics');

-- 5. Insert sample data into Appointments
INSERT INTO Appointments (patient_ID, doctor_ID, appointment_date, appointment_time, appointment_status) VALUES
(1, 1, '2026-08-01', '09:00:00', 'Completed'),
(2, 2, '2026-08-02', '10:00:00', 'Completed'),
(3, 3, '2026-08-03', '11:00:00', 'Pending'),
(4, 4, '2026-08-04', '13:00:00', 'Completed'),
(5, 5, '2026-08-05', '14:00:00', 'Cancelled');

-- 6. Insert sample data into Treatments
INSERT INTO Treatments (appointment_ID, diagnosis, treatment_details) VALUES
(1, 'Hypertension', 'Medication prescribed'),
(2, 'Tooth Decay', 'Dental Filling'),
(3, 'Flu', 'Rest and hydration'),
(4, 'Allergy', 'Topical Cream'),
(5, 'Checkup', 'General Health Advice');

-- 7. Select Queries for Output Verification
-- Query A: Display all records from Appointments
SELECT * FROM Appointments;

-- Query B: Display all records from Treatments
SELECT * FROM Treatments;

-- Query C: Nested Query to retrieve treatment details for completed appointments
SELECT * 
FROM Treatments 
WHERE appointment_ID IN (
    SELECT appointment_ID 
    FROM Appointments 
    WHERE appointment_status = 'Completed'
);

-- Query D: Count total appointments grouped by appointment status
SELECT 
    appointment_status, 
    COUNT(*) AS total_appointments 
FROM Appointments 
GROUP BY appointment_status;
USE clinic_db;

-- ---------------------------------------------------------
-- 1. SELECT Statements
-- Description: Retrieves all columns from the Appointments table to view the general list of scheduled appointments.
-- ---------------------------------------------------------
SELECT * FROM Appointments;


-- ---------------------------------------------------------
-- 2. JOIN Queries
-- Description: Joins Appointments, Patients, and Doctors tables to display full appointment details with patient and doctor names.
-- ---------------------------------------------------------
SELECT 
    a.appointment_ID,
    p.patient_name,
    d.doctor_name,
    a.appointment_date,
    a.appointment_time,
    a.appointment_status
FROM Appointments a
JOIN Patients p ON a.patient_ID = p.patient_ID
JOIN Doctors d ON a.doctor_ID = d.doctor_ID;


-- ---------------------------------------------------------
-- 3. Nested Queries
-- Description: Retrieves treatment information for appointments that have a status of 'Completed'.
-- ---------------------------------------------------------
SELECT * 
FROM Treatments 
WHERE appointment_ID IN (
    SELECT appointment_ID 
    FROM Appointments 
    WHERE appointment_status = 'Completed'
);


-- ---------------------------------------------------------
-- 4. Aggregate Functions with GROUP BY
-- Description: Counts the total number of appointments grouped by their current status (Completed, Pending, Cancelled).
-- ---------------------------------------------------------
SELECT 
    appointment_status, 
    COUNT(*) AS total_appointments 
FROM Appointments 
GROUP BY appointment_status;


-- ---------------------------------------------------------
-- 5. UPDATE and DELETE Statements
-- ---------------------------------------------------------

-- UPDATE Statement
-- Description: Updates the appointment status to 'Completed' for a specific appointment ID.
UPDATE Appointments 
SET appointment_status = 'Completed' 
WHERE appointment_ID = 3;

-- Verification for UPDATE
SELECT * FROM Appointments WHERE appointment_ID = 3;

-- DELETE Statement
-- Description: Deletes a treatment record based on its specific treatment ID.
DELETE FROM Treatments 
WHERE treatment_ID = 5;

-- Verification for DELETE
SELECT * FROM Treatments;


-- ---------------------------------------------------------
-- 6. Create one VIEW
-- Description: Creates a reusable view that displays completed appointment details along with patient and doctor names.
-- ---------------------------------------------------------
CREATE OR REPLACE VIEW CompletedAppointmentsView AS
SELECT 
    a.appointment_ID,
    p.patient_name,
    d.doctor_name,
    a.appointment_date,
    t.diagnosis
FROM Appointments a
JOIN Patients p ON a.patient_ID = p.patient_ID
JOIN Doctors d ON a.doctor_ID = d.doctor_ID
JOIN Treatments t ON a.appointment_ID = t.appointment_ID
WHERE a.appointment_status = 'Completed';

-- Test the VIEW
SELECT * FROM CompletedAppointmentsView;


-- ---------------------------------------------------------
-- 7. Create one TRIGGER
-- Description: Automatically prevents inserting an appointment with a date prior to the current date.
-- ---------------------------------------------------------
DELIMITER //

CREATE TRIGGER prevent_past_appointments
BEFORE INSERT ON Appointments
FOR EACH ROW
BEGIN
    IF NEW.appointment_date < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Appointment date cannot be in the past.';
    END IF;
END //

DELIMITER ;

