CREATE DATABASE SmartClinicDB;
/*-------------------------------------
--Here is the Doctors table creation
-------------------------------------*/
CREATE TABLE Doctors (doctor_ID INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  date_of_birth DATE NOT NULL,
  gender ENUM('Male', 'Female') NOT NULL,
  specialization VARCHAR(80) NOT NULL,
  phone_number VARCHAR(15) UNIQUE NOT NULL,
  email VARCHAR(80) UNIQUE NOT NULL);

/*-------------------------------------
--Here is the Patients table creation
-------------------------------------*/
CREATE TABLE Patients (patient_ID INT AUTO_INCREMENT  PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(80) UNIQUE,
    address VARCHAR(255));

/*-------------------------------------
--Here to Insert into Doctors table
-------------------------------------*/
INSERT INTO Doctors (first_name, last_name,date_of_birth, gender, specialization, phone_number, email) VALUES
('Ahmed', 'Ali', '1980-05-10', 'Male', 'Cardiology', '0501112233', 'ahmed.otaibi@clinic.com'),
('Fatima', 'Husain', '1985-08-15', 'Female', 'Pediatrics', '0552223344', 'fatima.harbi@clinic.com'),
('Mohammed', 'Salem', '1978-12-01', 'Male', 'Dermatology', '0563334455', 'mohammed.salem@clinic.com'),
('Sara', 'Mohammed', '1990-03-22', 'Female', 'General Practice', '0544445566', 'sara.qahtani@clinic.com'),
('Rakan', 'Saud', '1982-11-05', 'Male', 'Orthopedics', '0535556677', 'khalid.sultan@clinic.com');

/*-------------------------------------
--Here to Insert into Patients table
-------------------------------------*/
INSERT INTO Patients (first_name, last_name,date_of_birth, gender, phone_number, email, address) VALUES
('Noura', 'Abdullah', '1995-04-12', 'Female', '0509998877', 'noura@email.com', 'Riyadh - An Nafal'),
('Abdullah', 'Nasser', '1988-09-23', 'Male', '0558887766', 'abdullah@email.com', 'Riyadh - Al-Falah'),
('Reem', 'Fahad', '2001-01-15', 'Female', '0567776655', 'reem@email.com', 'Riyadh - Al-Narjis'),
('Mohammed', 'Mansour', '1975-11-30', 'Male', '0546665544', '', 'Riyadh - An nada'),
('Layan', 'Tariq', '1999-06-05', 'Female', '0535554433', 'layan@email.com', 'Riyadh - Al-Yasmin');

/*------------------------------------------
--Here some SELECT queries for data retrival 
------------------------------------------*/
SELECT * FROM Doctors;
SELECT patient_ID, first_name, last_name, gender, phone_number FROM Patients;

/*-------------------------------------
--Here JOIN query 
-------------------------------------*/
