-- Smart Clinic Database System
-- Student 1: Patients and Doctors


-- Student 2: Appointments and Treatments


-- Student 3: Medicines, UPDATE, DELETE, and TRIGGER


-- Student 4: Payments, SELECT, and VIEW
USE SmartClinicDB;
/*-------------------------------------
--Here is the Payments table creation
-------------------------------------*/
CREATE TABLE Payments (
    payment_ID INT AUTO_INCREMENT PRIMARY KEY,
    appointment_ID INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(20) NOT NULL,
    payment_type ENUM('Cash','Card') NOT NULL
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
/*-------------------------------------
--Display all payment records
-------------------------------------*/
SELECT *
FROM Payments;
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
/*-------------------------------------
--Display records from Paid_Payments view
-------------------------------------*/
SELECT *
FROM Paid_Payments;
