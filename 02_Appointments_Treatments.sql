USE SmartClinicDB;

/*-------------------------------------
-- Here is the Appointments table creation
-------------------------------------*/
CREATE TABLE Appointments (
    appointment_ID INT AUTO_INCREMENT PRIMARY KEY,
    patient_ID INT NOT NULL,
    doctor_ID INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    appointment_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (patient_ID)
        REFERENCES Patients(patient_ID),
    FOREIGN KEY (doctor_ID)
        REFERENCES Doctors(doctor_ID)
);

/*-------------------------------------
-- Here is the Treatments table creation
-------------------------------------*/
CREATE TABLE Treatments (
    treatment_ID INT AUTO_INCREMENT PRIMARY KEY,
    appointment_ID INT NOT NULL,
    diagnosis VARCHAR(150) NOT NULL,
    treatment_details VARCHAR(255),
    FOREIGN KEY (appointment_ID)
        REFERENCES Appointments(appointment_ID)
);

/*-------------------------------------
-- Insert appointment records
-------------------------------------*/
INSERT INTO Appointments
(patient_ID, doctor_ID, appointment_date, appointment_time, appointment_status)
VALUES
(1, 1, '2026-08-01', '09:00:00', 'Completed'),
(2, 2, '2026-08-02', '10:00:00', 'Completed'),
(3, 3, '2026-08-03', '11:00:00', 'Pending'),
(4, 4, '2026-08-04', '13:00:00', 'Completed'),
(5, 5, '2026-08-05', '14:00:00', 'Cancelled');

/*-------------------------------------
-- Insert treatment records
-------------------------------------*/
INSERT INTO Treatments
(appointment_ID, diagnosis, treatment_details)
VALUES
(1, 'Hypertension', 'Medication'),
(2, 'Tooth Decay', 'Filling'),
(3, 'Flu', 'Rest'),
(4, 'Allergy', 'Cream'),
(5, 'Checkup', 'Advice');

/*-------------------------------------
-- Display all appointment records
-------------------------------------*/
SELECT *
FROM Appointments;

/*-------------------------------------
-- Display all treatment records
-------------------------------------*/
SELECT *
FROM Treatments;

/*-------------------------------------
-- Nested query for completed appointments
-------------------------------------*/
SELECT *
FROM Treatments
WHERE appointment_ID IN (
    SELECT appointment_ID
    FROM Appointments
    WHERE appointment_status = 'Completed'
);

/*-------------------------------------
-- Count appointments by status
-------------------------------------*/
SELECT
    appointment_status,
    COUNT(*) AS total_appointments
FROM Appointments
GROUP BY appointment_status


