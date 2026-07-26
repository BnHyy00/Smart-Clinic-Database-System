CREATE TABLE Appointments(
AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
PatientID INT NOT NULL,
DoctorID INT NOT NULL,
AppointmentDate DATE NOT NULL,
AppointmentTime TIME NOT NULL,
Status VARCHAR(20) NOT NULL,
FOREIGN KEY(PatientID) REFERENCES Patients(PatientID),
FOREIGN KEY(DoctorID) REFERENCES Doctors(DoctorID));

CREATE TABLE Treatments(
TreatmentID INT AUTO_INCREMENT PRIMARY KEY,
AppointmentID INT NOT NULL,
Diagnosis VARCHAR(150) NOT NULL,
TreatmentDetails VARCHAR(255),
FOREIGN KEY(AppointmentID) REFERENCES Appointments(AppointmentID));
CREATE TABLE Medicines(
MedicineID INT AUTO_INCREMENT PRIMARY KEY,
MedicineName VARCHAR(100) NOT NULL,
Price DECIMAL(8,2) NOT NULL,
Stock INT NOT NULL);
INSERT INTO Patients(FullName,Gender,DateOfBirth,Phone,Address) VALUES
('Ahmed Ali','Male','1998-04-12','0501111111','Riyadh'),
('Sara Omar','Female','1999-08-20','0502222222','Jeddah'),
('Khalid Salem','Male','1995-10-05','0503333333','Dammam'),
('Mona Hassan','Female','2000-01-15','0504444444','Abha'),
('Faisal Mohammed','Male','1997-06-18','0505555555','Makkah');

INSERT INTO Doctors(FullName,Specialization,Phone,Email) VALUES
('Dr Ali Hassan','Cardiology','0551111111','ali@clinic.com'),
('Dr Noor Ahmed','Dentist','0552222222','noor@clinic.com'),
('Dr Sami Saleh','Pediatrics','0553333333','sami@clinic.com'),
('Dr Lama Khaled','Dermatology','0554444444','lama@clinic.com'),
('Dr Omar Adel','General','0555555555','omar@clinic.com');

INSERT INTO Appointments(PatientID,DoctorID,AppointmentDate,AppointmentTime,Status) VALUES
(1,1,'2026-08-01','09:00:00','Completed'),
(2,2,'2026-08-02','10:00:00','Completed'),
(3,3,'2026-08-03','11:00:00','Pending'),
(4,4,'2026-08-04','13:00:00','Completed'),
(5,5,'2026-08-05','14:00:00','Cancelled');

INSERT INTO Treatments(AppointmentID,Diagnosis,TreatmentDetails) VALUES
(1,'Hypertension','Medication'),
(2,'Tooth Decay','Filling'),
(3,'Flu','Rest'),
(4,'Allergy','Cream'),
(5,'Checkup','Advice');

INSERT INTO Medicines VALUES
(1,'Paracetamol',15,100),
(2,'Ibuprofen',25,80),
(3,'Amoxicillin',40,50),
(4,'Vitamin C',30,120),
(5,'Allergy Cream',45,35);

INSERT INTO Payments(PatientID,Amount,PaymentDate,PaymentMethod) VALUES
(1,250,'2026-08-01','Cash'),
(2,300,'2026-08-02','Card'),
(3,180,'2026-08-03','Cash'),
(4,220,'2026-08-04','Card'),
(5,150,'2026-08-05','Cash');

SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Appointments;
SELECT * FROM Treatments;
SELECT * FROM Medicines;
SELECT * FROM Payments;

