-- Smart Clinic Database System
-- Student 1: Patients and Doctors


-- Student 2: Appointments and Treatments


-- Student 3: Medicines, UPDATE, DELETE, and TRIGGER


-- Student 4: Payments, SELECT, and VIEW
USE SmartClinicDB;

CREATE TABLE Payments (
    payment_ID INT AUTO_INCREMENT PRIMARY KEY,
    appointment_ID INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    payment_status VARCHAR(20) NOT NULL
);
