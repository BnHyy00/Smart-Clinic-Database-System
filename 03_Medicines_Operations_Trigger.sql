
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


-- 1. SELECT
SELECT *
FROM Medicines;

-- 2. SELECT with WHERE condition
SELECT Medicine_ID, Medicine_Name, Category, Unit_Price
FROM Medicines
WHERE Stock_Quantity > 50;

-- 3. JOIN
-- Self-JOIN to compare medicines in the same category
SELECT 
    M1.Medicine_Name AS Medicine,
    M1.Category,
    M2.Medicine_Name AS Same_Category_Medicine
FROM Medicines M1
JOIN Medicines M2
    ON M1.Category = M2.Category
    AND M1.Medicine_ID <> M2.Medicine_ID;

-- 4. NESTED QUERY
-- Find medicines with a price higher than the average price
SELECT Medicine_ID, Medicine_Name, Category, Unit_Price
FROM Medicines
WHERE Unit_Price > (
    SELECT AVG(Unit_Price)
    FROM Medicines
);

-- 5. AGGREGATE FUNCTION + GROUP BY
SELECT 
    Category,
    COUNT(*) AS Medicine_Count,
    AVG(Unit_Price) AS Average_Price
FROM Medicines
GROUP BY Category;

-- 6. UPDATE
UPDATE Medicines
SET Unit_Price = 14.00
WHERE Medicine_ID = 2;

SELECT *
FROM Medicines
WHERE Medicine_ID = 2;

-- 7. DELETE
DELETE FROM Medicines
WHERE Medicine_ID = 5;

SELECT *
FROM Medicines;

-- 8. VIEW
DROP VIEW IF EXISTS Available_Medicines;

CREATE VIEW Available_Medicines AS
SELECT 
    Medicine_ID,
    Medicine_Name,
    Category,
    Unit_Price,
    Stock_Quantity
FROM Medicines
WHERE Stock_Quantity > 0;

SELECT *
FROM Available_Medicines;

-- 9. TRIGGER
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

DELIMITER ;
