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
