USE SmartClinicDB;

/*-------------------------------------
-- Here is the Appointments table creation
-------------------------------------*/
CREATE TABLE Appointments (
    appointment_ID INT AUTO_INCREMENT PRIMARY KEY,
    patient_ID INT NOT NULL,
    doctor_ID INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    appointment_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (patient_ID)
        REFERENCES Patients(patient_ID),
    FOREIGN KEY (doctor_ID)
        REFERENCES Doctors(doctor_ID)
);

/*-------------------------------------
-- Here is the Treatments table creation
-------------------------------------*/
CREATE TABLE Treatments (
    treatment_ID INT AUTO_INCREMENT PRIMARY KEY,
    appointment_ID INT NOT NULL,
    diagnosis VARCHAR(150) NOT NULL,
    treatment_details VARCHAR(255),
    FOREIGN KEY (appointment_ID)
        REFERENCES Appointments(appointment_ID)
);

/*-------------------------------------
-- Insert appointment records
-------------------------------------*/


