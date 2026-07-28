-- =====================================================
-- Smart Clinic Database System
-- =====================================================


/*=======================================================
  1. CREATE TABLES
=======================================================*/


/*-------------------------------------
-- Student 1: Doctors table
-------------------------------------*/


/*-------------------------------------
-- Student 1: Patients table
-------------------------------------*/


/*-------------------------------------
-- Student 2: Appointments table
-------------------------------------*/


/*-------------------------------------
-- Student 2: Treatments table
-------------------------------------*/


/*-------------------------------------
-- Student 3: Medicines table
-------------------------------------*/


/*-------------------------------------
-- Student 1: Prescriptions table
-------------------------------------*/


/*-------------------------------------
-- Student 4: Payments table
-------------------------------------*/


/*-------------------------------------
-- Student 4: Cash_Payments table
-------------------------------------*/


/*-------------------------------------
-- Student 4: Card_Payments table
-------------------------------------*/


/*-------------------------------------
-- Student 1: Prescription_Medicines table
-------------------------------------*/


/*-------------------------------------
-- Student 4: Treatment_Medicines table
-------------------------------------*/




/*=======================================================
  2. INSERT RECORDS
=======================================================*/


/*-------------------------------------
-- Student 1: Insert doctor records
-------------------------------------*/


/*-------------------------------------
-- Student 1: Insert patient records
-------------------------------------*/


/*-------------------------------------
-- Student 2: Insert appointment records
-------------------------------------*/


/*-------------------------------------
-- Student 2: Insert treatment records
-------------------------------------*/


/*-------------------------------------
-- Student 3: Insert medicine records
-------------------------------------*/


/*-------------------------------------
-- Student 1: Insert prescription records
-------------------------------------*/


/*-------------------------------------
-- Student 4: Insert payment records
-------------------------------------*/


/*-------------------------------------
-- Student 4: Insert cash payment details
-------------------------------------*/


/*-------------------------------------
-- Student 4: Insert card payment details
-------------------------------------*/


/*-------------------------------------
-- Student 1: Insert Prescription_Medicines records
-------------------------------------*/


/*-------------------------------------
-- Student 4: Insert Treatment_Medicines records
-------------------------------------*/




/*=======================================================
  3. TRIGGER, UPDATE, DELETE, AND VIEW
=======================================================*/


/*-------------------------------------
-- Student 3: Create trigger
-------------------------------------*/


/*-------------------------------------
-- Student 3: UPDATE query
-------------------------------------*/


/*-------------------------------------
-- Student 3: DELETE query
-------------------------------------*/


/*-------------------------------------
-- Student 4: Create Paid_Payments view
-------------------------------------*/




/*=======================================================
  4. SELECT QUERIES
=======================================================*/


/*-------------------------------------
-- Student 1: SELECT queries
-------------------------------------*/


/*-------------------------------------
-- Student 1: JOIN query
-------------------------------------*/


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


/*-------------------------------------
-- Student 4: Display payment records
-------------------------------------*/


/*-------------------------------------
-- Student 4: Display Paid_Payments view
-------------------------------------*/



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
-- Insert card payment details
-------------------------------------*/
INSERT INTO Card_Payments
(payment_ID, transaction_ID, card_type)
VALUES
(2, 'TRX1001', 'Visa'),
(3, 'TRX1002', 'Mastercard'),
(5, 'TRX1003', 'Visa');
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
