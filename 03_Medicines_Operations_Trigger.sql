
-- 1. CREATE: Create the Medicines table with appropriate constraints
CREATE TABLE Medicines (
    Medicine_ID INT PRIMARY KEY,
    Medicine_Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Unit_Price DECIMAL(10, 2) NOT NULL,
    Stock_Quantity INT NOT NULL
);

-- 2. INSERT (ADD): Populate initial inventory records (5+ records included)
INSERT INTO Medicines (Medicine_ID, Medicine_Name, Category, Unit_Price, Stock_Quantity) VALUES
(1, 'Paracetamol', 'Analgesic', 5.50, 150),
(2, 'Amoxicillin', 'Antibiotic', 12.00, 80),
(3, 'Ibuprofen', 'Anti-inflammatory', 8.25, 200),
(4, 'Omeprazole', 'Antacid', 15.75, 60),
(5, 'Cetirizine', 'Antihistamine', 6.50, 120);

-- 3. TRIGGER: Validation trigger to prevent negative stock quantities during an update
DELIMITER //

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

-- 4. UPDATE: Modify an existing record (e.g., updating stock and price for Paracetamol)
UPDATE Medicines 
SET Unit_Price = 6.00 
WHERE Medicine_ID = 1;

-- 5. DELETE: Remove a record from the table (e.g., deleting Omeprazole)
DELETE FROM Medicines 
WHERE Medicine_ID = 6;

-- 6. display medicine records
SELECT* 
FROM Medicines;
