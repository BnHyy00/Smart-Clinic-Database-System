DROP TABLE IF EXISTS Medicines;
 CREATE TABLE Medicines (
  Medicine_ID INT PRIMARY KEY,
  Medicine_Name VARCHAR(100) NOT NULL,
  Category VARCHAR(50),
  Unit_Price DECIMAL(10, 2) NOT NULL,
  Stock_Quantity INT NOT NULL
);

