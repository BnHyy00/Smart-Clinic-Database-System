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
