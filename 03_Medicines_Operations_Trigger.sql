-- 1. CREATE: Create the Medicines table with appropriate constraints
CREATE TABLE Medicines (
    Medicine_ID INT PRIMARY KEY,
    Medicine_Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Unit_Price DECIMAL(10,2) NOT NULL,
    Stock_Quantity INT NOT NULL
);


-- 2. INSERT: Populate initial inventory records
INSERT INTO Medicines
(Medicine_ID, Medicine_Name, Category, Unit_Price, Stock_Quantity)
VALUES
(1, 'Paracetamol', 'Analgesic', 5.50, 150),
(2, 'Amoxicillin', 'Antibiotic', 12.00, 80),
(3, 'Ibuprofen', 'Anti-inflammatory', 8.25, 200),
(4, 'Omeprazole', 'Antacid', 15.75, 60),
(5, 'Cetirizine', 'Antihistamine', 6.50, 120),
(6, 'Aspirin', 'Analgesic', 7.00, 90);

-- 3. TRIGGERS: Data validation triggers for inserts and updates
DELIMITER //

CREATE TRIGGER Before_Medicine_Update
BEFORE UPDATE ON Medicines
FOR EACH ROW
BEGIN
    IF NEW.Stock_Quantity < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Stock quantity cannot be negative.';
    END IF;
END //

DELIMITER ;

DELIMITER ;

-- 4. UPDATE: Modify an existing record's price
UPDATE Medicines
SET Unit_Price = 6.00
WHERE Medicine_ID = 1;

-- 5. DELETE: Remove a specific record
DELETE FROM Medicines
WHERE Medicine_ID = 6;

--6 Display medicine records
SELECT *
FROM Medicines;
