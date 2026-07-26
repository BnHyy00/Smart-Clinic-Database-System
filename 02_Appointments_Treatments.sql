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
SELECT * FROM Appointments;
SELECT * FROM Treatments;



