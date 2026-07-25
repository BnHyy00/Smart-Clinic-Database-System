DROP TABLE IF EXISTS Medicines;
 CREATE TABLE Medicines (
  Medicine_ID INT PRIMARY KEY,
  Medicine_Name VARCHAR(100) NOT NULL,
  Category VARCHAR(50),
  Unit_Price DECIMAL(10, 2) NOT NULL,
  Stock_Quantity INT NOT NULL
);
INSERT INTO Medicines (Medicine_ID, Medicine_Name, Category, Unit_Price, Stock_Quantity) VALUES
(1, 'Paracetamol', 'Analgesic', 5.50, 150),
(2, 'Amoxicillin', 'Antibiotic', 12.00, 80),
(3, 'Ibuprofen', 'Anti-inflammatory', 8.25, 200),
(4, 'Omeprazole', 'Antacid', 15.75, 60),
(5, 'Cetirizine', 'Antihistamine', 6.00, 120);
UPDATE Medicines
SET Unit_Price = 6.00
WHERE Medicine_ID = 1;
DELETE FROM Medicines
WHERE Medicine_ID = 5;
