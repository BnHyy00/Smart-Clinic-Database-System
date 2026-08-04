-- =====================================================
-- Smart Clinic Database System
-- =====================================================


/*=======================================================
  1. CREATE TABLES
=======================================================*/



CREATE TABLE Doctors (doctor_ID INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  date_of_birth DATE NOT NULL,
  gender ENUM('Male', 'Female') NOT NULL,
  specialization VARCHAR(80) NOT NULL,
  phone_number VARCHAR(15) UNIQUE NOT NULL,
  email VARCHAR(80) UNIQUE NOT NULL);


CREATE TABLE Patients (patient_ID INT AUTO_INCREMENT  PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(80) UNIQUE,
    address VARCHAR(255));

/*-------------------------------------
-- Student 2: Appointments table
-------------------------------------*/


/*-------------------------------------
-- Student 2: Treatments table
-------------------------------------*/


/*-------------------------------------
-- Student 3: Medicines table
-------------------------------------*/
CREATE TABLE Medicines (
    Medicine_ID INT PRIMARY KEY,
    Medicine_Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Unit_Price DECIMAL(10, 2) NOT NULL,
    Stock_Quantity INT NOT NULL
);


CREATE TABLE Prescriptions (prescription_ID INT AUTO_INCREMENT  PRIMARY KEY,
  patient_ID INT NOT NULL,
  doctor_ID INT NOT NULL,
  prescription_date DATE NOT NULL,
  FOREIGN KEY (patient_ID) REFERENCES Patients(patient_ID),
  FOREIGN KEY (doctor_ID) REFERENCES Doctors(doctor_ID));

/*-------------------------------------
--Here is the Payments table creation
-------------------------------------*/
CREATE TABLE Payments (
    payment_ID INT AUTO_INCREMENT PRIMARY KEY,
    appointment_ID INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(20) NOT NULL,
    payment_type ENUM('Cash','Card') NOT NULL,
    
    FOREIGN KEY (appointment_ID)
        REFERENCES Appointments(appointment_ID)
);


/*-------------------------------------
--Here is the Cash_Payments table creation
-------------------------------------*/
CREATE TABLE Cash_Payments (
    payment_ID INT PRIMARY KEY,
    received_by VARCHAR(80) NOT NULL,
    FOREIGN KEY (payment_ID)
        REFERENCES Payments(payment_ID)
        ON DELETE CASCADE
);


/*-------------------------------------
--Here is the Card_Payments table creation
-------------------------------------*/
CREATE TABLE Card_Payments (
    payment_ID INT PRIMARY KEY,
    transaction_ID VARCHAR(100) UNIQUE NOT NULL,
    card_type VARCHAR(30) NOT NULL,
    FOREIGN KEY (payment_ID)
        REFERENCES Payments(payment_ID)
        ON DELETE CASCADE
);



CREATE TABLE Prescription_Medicines (prescription_ID INT,
  Medicine_ID INT,
  dosage VARCHAR(100) NOT NULL,
  PRIMARY KEY (prescription_ID, Medicine_ID),
  FOREIGN KEY (prescription_ID) REFERENCES Prescriptions(prescription_ID) ON DELETE CASCADE,
  FOREIGN KEY(Medicine_ID) REFERENCES Medicines(Medicine_ID));

/*-------------------------------------
--Here is the Treatment_Medicines table creation
-------------------------------------*/
CREATE TABLE Treatment_Medicines (
    treatment_ID INT,
    medicine_ID INT,
    dosage VARCHAR(50),
    duration VARCHAR(50),

    PRIMARY KEY (treatment_ID, medicine_ID),

    FOREIGN KEY (treatment_ID)
        REFERENCES Treatments(treatment_ID),

    FOREIGN KEY (medicine_ID)
        REFERENCES Medicines(medicine_ID)
);




/*=======================================================
  2. INSERT RECORDS
=======================================================*/



INSERT INTO Doctors (first_name, last_name,date_of_birth, gender, specialization, phone_number, email) VALUES
('Ahmed', 'Ali', '1980-05-10', 'Male', 'Cardiology', '0501112233', 'ahmed.otaibi@clinic.com'),
('Fatima', 'Husain', '1985-08-15', 'Female', 'Pediatrics', '0552223344', 'fatima.harbi@clinic.com'),
('Mohammed', 'Salem', '1978-12-01', 'Male', 'Dermatology', '0563334455', 'mohammed.salem@clinic.com'),
('Sara', 'Mohammed', '1990-03-22', 'Female', 'General Practice', '0544445566', 'sara.qahtani@clinic.com'),
('Rakan', 'Saud', '1982-11-05', 'Male', 'Orthopedics', '0535556677', 'khalid.sultan@clinic.com');


INSERT INTO Patients (first_name, last_name,date_of_birth, gender, phone_number, email, address) VALUES
('Noura', 'Abdullah', '1995-04-12', 'Female', '0509998877', 'noura@email.com', 'Riyadh - An Nafal'),
('Abdullah', 'Nasser', '1988-09-23', 'Male', '0558887766', 'abdullah@email.com', 'Riyadh - Al-Falah'),
('Reem', 'Fahad', '2001-01-15', 'Female', '0567776655', 'reem@email.com', 'Riyadh - Al-Narjis'),
('Mohammed', 'Mansour', '1975-11-30', 'Male', '0546665544', '', 'Riyadh - An nada'),
('Layan', 'Tariq', '1999-06-05', 'Female', '0535554433', 'layan@email.com', 'Riyadh - Al-Yasmin');

/*-------------------------------------
-- Student 2: Insert appointment records
-------------------------------------*/


/*-------------------------------------
-- Student 2: Insert treatment records
-------------------------------------*/


/*-------------------------------------
-- Student 3: Insert medicine records
-------------------------------------*/
INSERT INTO Medicines (Medicine_ID, Medicine_Name, Category, Unit_Price, Stock_Quantity) VALUES
(1, 'Paracetamol', 'Analgesic', 5.50, 150),
(2, 'Amoxicillin', 'Antibiotic', 12.00, 80),
(3, 'Ibuprofen', 'Anti-inflammatory', 8.25, 200),
(4, 'Omeprazole', 'Antacid', 15.75, 60),
(5, 'Cetirizine', 'Antihistamine', 6.50, 120);


INSERT INTO Prescriptions (prescription_ID, patient_ID, doctor_ID, prescription_date) VALUES
(1, 1, 4, '2026-03-01'),  
(2, 2, 5, '2026-03-02'),  
(3, 3, 3, '2026-03-03');

/*-------------------------------------
-- Insert payment records
-------------------------------------*/
INSERT INTO Payments
(appointment_ID, payment_date, amount, payment_status, payment_type)
VALUES
(1, '2026-08-01', 250.00, 'Paid', 'Cash'),
(2, '2026-08-02', 300.00, 'Paid', 'Card'),
(3, '2026-08-03', 150.00, 'Pending', 'Card'),
(4, '2026-08-04', 200.00, 'Paid', 'Cash'),
(5, '2026-08-05', 100.00, 'Cancelled', 'Card');


/*-------------------------------------
-- Insert cash payment details
-------------------------------------*/
INSERT INTO Cash_Payments
(payment_ID, received_by)
VALUES
(1, 'Ahmed Ali'),
(4, 'Sara Mohammed');



/*-------------------------------------
-- Insert card payment details
-------------------------------------*/
INSERT INTO Card_Payments
(payment_ID, transaction_ID, card_type)
VALUES
(2, 'TRX1001', 'Visa'),
(3, 'TRX1002', 'Mastercard'),
(5, 'TRX1003', 'Visa');



INSERT INTO Prescription_Medicines (prescription_ID, Medicine_ID, dosage) VALUES
(1, 1, '1 tablet every 8 hours'),       
(1, 3, '1 tablet after meals'),         
(2, 2, '1 capsule twice daily'),         
(3, 4, '1 tablet before breakfast');


/*=======================================================
  3. TRIGGER, UPDATE, DELETE, AND VIEW
=======================================================*/


/*-------------------------------------
-- Student 3: Create trigger
-------------------------------------*/
DELIMITER //

CREATE TRIGGER Check_Medicine_Price
BEFORE INSERT ON Medicines
FOR EACH ROW
BEGIN
    IF NEW.Unit_Price < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Unit price cannot be negative.';
    END IF;
END//

CREATE TRIGGER Before_Medicine_Update
BEFORE UPDATE ON Medicines
FOR EACH ROW
BEGIN
    IF NEW.Stock_Quantity < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Stock quantity cannot be negative.';
    END IF;
END//

DELIMITER ;

/*-------------------------------------
-- Student 3: UPDATE query
-------------------------------------*/


/*-------------------------------------
-- Student 3: DELETE query
-------------------------------------*/
DELETE FROM Medicines 
WHERE Medicine_ID = 6;

/*-------------------------------------
--Create a view for paid payments
-------------------------------------*/
CREATE VIEW Paid_Payments AS
SELECT
    payment_ID,
    appointment_ID,
    payment_date,
    amount,
    payment_type
FROM Payments
WHERE payment_status = 'Paid';




/*=======================================================
  4. SELECT QUERIES
=======================================================*/



SELECT * FROM Doctors;
SELECT patient_ID, first_name, last_name, gender, phone_number FROM Patients;


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
SELECT CONCAT (P.first_name, ' ', P.last_name) AS Patient_Name,
CONCAT (D.first_name, ' ', D.last_name) AS Doctor_Name,
D.specialization AS Doctor_Specialization,
A.appointment_date,
A.appointment_time,
A.appointment_status,
T.diagnosis,
T.treatment_details
FROM Appointments A
INNER JOIN Patients P ON A.patient_ID = P.patient_ID
INNER JOIN Doctors D ON A.doctor_ID = D.doctor_ID
INNER JOIN Treatments T ON A.appointment_ID = T.appointment_ID;

/*-------------------------------------
-- Student 2: SELECT queries
-------------------------------------*/


/*-------------------------------------
-- Student 2: Nested query
-------------------------------------*/


/*-------------------------------------
-- Student 2: GROUP BY query
-------------------------------------*/


/*-------------------------------------
-- Student 3: Display medicine records
-------------------------------------*/
SELECT* 
FROM Medicines;


/*-------------------------------------
--Display all payment records
-------------------------------------*/
SELECT *
FROM Payments;


/*-------------------------------------
--Display records from Paid_Payments view
-------------------------------------*/
SELECT *
FROM Paid_Payments;
