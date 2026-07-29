CREATE DATABASE SmartClinicDB;
/*---------Doctors table creation*/
CREATE TABLE Doctors (doctor_ID INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  date_of_birth DATE NOT NULL,
  gender ENUM('Male', 'Female') NOT NULL,
  specialization VARCHAR(80) NOT NULL,
  phone_number VARCHAR(15) UNIQUE NOT NULL,
  email VARCHAR(80) UNIQUE NOT NULL);

/*---------Patients table creation*/
CREATE TABLE Patients (patient_ID INT AUTO_INCREMENT  PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(80) UNIQUE,
    address VARCHAR(255));

/*---------Prescriptions table creation*/
CREATE TABLE Prescriptions (prescription_ID INT AUTO_INCREMENT  PRIMARY KEY,
  patient_ID INT NOT NULL,
  doctor_ID INT NOT NULL,
  prescription_date DATE NOT NULL,
  FOREIGN KEY (patient_ID) REFERENCES Patients(patient_ID),
  FOREIGN KEY (doctor_ID) REFERENCES Doctors(doctor_ID));

/*---------Prescription_Medicines table creation*/
CREATE TABLE Prescription_Medicines (prescription_ID INT,
  Medicine_ID INT,
  dosage VARCHAR(100) NOT NULL,
  PRIMARY KEY (prescription_ID, Medicine_ID),
  FOREIGN KEY (prescription_ID) REFERENCES Prescriptions(prescription_ID) ON DELETE CASCADE,
  FOREIGN KEY(Medicine_ID) REFERENCES Medicines(Medicine_ID));

/*-------------------------------------
-----------Insertions into tables
-------------------------------------*/

/*---------Insert into Doctors table*/
INSERT INTO Doctors (first_name, last_name,date_of_birth, gender, specialization, phone_number, email) VALUES
('Ahmed', 'Ali', '1980-05-10', 'Male', 'Cardiology', '0501112233', 'ahmed.otaibi@clinic.com'),
('Fatima', 'Husain', '1985-08-15', 'Female', 'Pediatrics', '0552223344', 'fatima.harbi@clinic.com'),
('Mohammed', 'Salem', '1978-12-01', 'Male', 'Dermatology', '0563334455', 'mohammed.salem@clinic.com'),
('Sara', 'Mohammed', '1990-03-22', 'Female', 'General Practice', '0544445566', 'sara.qahtani@clinic.com'),
('Rakan', 'Saud', '1982-11-05', 'Male', 'Orthopedics', '0535556677', 'khalid.sultan@clinic.com');

/*---------Insert into Patients table*/
INSERT INTO Patients (first_name, last_name,date_of_birth, gender, phone_number, email, address) VALUES
('Noura', 'Abdullah', '1995-04-12', 'Female', '0509998877', 'noura@email.com', 'Riyadh - An Nafal'),
('Abdullah', 'Nasser', '1988-09-23', 'Male', '0558887766', 'abdullah@email.com', 'Riyadh - Al-Falah'),
('Reem', 'Fahad', '2001-01-15', 'Female', '0567776655', 'reem@email.com', 'Riyadh - Al-Narjis'),
('Mohammed', 'Mansour', '1975-11-30', 'Male', '0546665544', '', 'Riyadh - An nada'),
('Layan', 'Tariq', '1999-06-05', 'Female', '0535554433', 'layan@email.com', 'Riyadh - Al-Yasmin');

/*---------Insert into Prescriptions table*/
INSERT INTO Prescriptions (prescription_ID, patient_ID, doctor_ID, prescription_date) VALUES
(1, 1, 4, '2026-03-01'),  
(2, 2, 5, '2026-03-02'),  
(3, 3, 3, '2026-03-03');

/*---------Insert into Prescription_Medicines table*/
INSERT INTO Prescription_Medicines (prescription_ID, Medicine_ID, dosage) VALUES
(1, 1, '1 tablet every 8 hours'),       
(1, 3, '1 tablet after meals'),         
(2, 2, '1 capsule twice daily'),         
(3, 4, '1 tablet before breakfast');

/*------------------------------------------
--SELECT queries for data retrival 
------------------------------------------*/
SELECT * FROM Doctors;
SELECT patient_ID, first_name, last_name, gender, phone_number FROM Patients;

/*-------------------------------------
--Here JOIN query 
-------------------------------------*/
SELECT CONCAT (P.first_name, ' ', P.last_name) AS Patient_Name,
P.phone_number,
M.Medicine_Name,
M.Category As Medicine_Category,
PM.dosage,
CONCAT (D.first_name, ' ', D.last_name) AS Doctor_Name,
Pr.prescription_date
FROM Patients P
INNER JOIN Prescriptions Pr ON P.patient_ID = Pr.patient_ID
INNER JOIN Doctors D ON D.doctor_ID = Pr.doctor_ID
INNER JOIN Prescription_Medicines PM ON Pr.prescription_ID = PM.prescription_ID
INNER JOIN Medicines M ON PM.medicine_ID = M.Medicine_ID;
--
