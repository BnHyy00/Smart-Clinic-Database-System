-- 1. CREATE: Create the Medicines table with appropriate constraints
CREATE TABLE Medicines (
    Medicine_ID INT PRIMARY KEY,
    Medicine_Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Unit_Price DECIMAL(10, 2) NOT NULL,
    Stock_Quantity INT NOT NULL
);

-- 2. INSERT: Populate initial inventory records
INSERT INTO Medicines (Medicine_ID, Medicine_Name, Category, Unit_Price, Stock_Quantity) VALUES
(1, 'Paracetamol', 'Analgesic', 5.50, 150),
(2, 'Amoxicillin', 'Antibiotic', 12.00, 80),
(3, 'Ibuprofen', 'Anti-inflammatory', 8.25, 200),
(4, 'Omeprazole', 'Antacid', 15.75, 60),
(5, 'Cetirizine', 'Antihistamine', 6.50, 120);

-- 3. TRIGGERS: Data validation triggers for inserts and updates
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

-- 4. SELECT: Retrieve all records and conditional data
SELECT * FROM Medicines;

SELECT Medicine_ID, Medicine_Name, Category, Unit_Price
FROM Medicines
WHERE Stock_Quantity > 50;

-- 5. JOIN: Self-JOIN to compare medicines in the same category
SELECT 
    M1.Medicine_Name AS Medicine,
    M1.Category,
    M2.Medicine_Name AS Same_Category_Medicine
FROM Medicines M1
JOIN Medicines M2
    ON M1.Category = M2.Category
    AND M1.Medicine_ID <> M2.Medicine_ID;

-- 6. NESTED QUERY: Find medicines priced higher than the average price
SELECT Medicine_ID, Medicine_Name, Category, Unit_Price
FROM Medicines
WHERE Unit_Price > (
    SELECT AVG(Unit_Price)
    FROM Medicines
);

-- 7. AGGREGATE FUNCTION + GROUP BY: Count and average price per category
SELECT 
    Category,
    COUNT(*) AS Medicine_Count,
    AVG(Unit_Price) AS Average_Price
FROM Medicines
GROUP BY Category;

-- 8. UPDATE: Modify an existing record's price
UPDATE Medicines
SET Unit_Price = 14.00
WHERE Medicine_ID = 2;

-- 9. DELETE: Remove a specific record
DELETE FROM Medicines
WHERE Medicine_ID = 5;

-- 10. VIEW: Create and display the available medicines view
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

SELECT * FROM Available_Medicines;
