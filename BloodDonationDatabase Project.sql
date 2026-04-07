-- GROUP 10 BLOOD DONATION DATABASE --
CREATE DATABASE IF NOT EXISTS bloodDonationGrp10;
USE bloodDonationGrp10;
-- TABLES--

------------------------------------------------------------------------------------------------  
CREATE TABLE Donor(
    DonorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 18 AND Age <= 75),
    Gender ENUM('Male', 'Female', 'Other'),
    Role ENUM('Student', 'Faculty', 'Staff', 'Alumni', 'Visitor', 'Other') NOT NULL,
    RoleDetails VARCHAR(150),              -- e.g. "B.Tech CSE 3rd Year", "Professor, JSOM", "Dining Services"
    ContactNumber VARCHAR(15) UNIQUE,
    Email VARCHAR(100) UNIQUE,
    DOB DATE,
    Department VARCHAR(100),               -- e.g. JSOM, ECS, Dining Services
    LastDonationDate DATE,
    Availability BOOLEAN DEFAULT TRUE,
	FingerprintVerified BOOLEAN DEFAULT FALSE
);

INSERT INTO Donor 
(Name, Age, Gender, Role, RoleDetails, ContactNumber, Email, DOB, Department, LastDonationDate, Availability, FingerprintVerified)
VALUES
-- STUDENTS (1–25)
('Aarav Mehta', 21, 'Male', 'Student', 'B.Tech CSE 3rd Year', '9000000001', 'aarav.mehta@utdallas.edu', '2004-02-15', 'Computer Science', '2025-03-12', 1, 1),
('Priya Sharma', 22, 'Female', 'Student', 'MS ITM 1st Year', '9000000002', 'priya.sharma@utdallas.edu', '2003-08-10', 'JSOM', '2024-12-20', 1, 1),
('Rahul Verma', 23, 'Male', 'Student', 'MS BA 2nd Year', '9000000003', 'rahul.verma@utdallas.edu', '2002-05-22', 'JSOM', '2025-03-05', 1, 1),
('Neha Patel', 21, 'Female', 'Student', 'BS Biotech 3rd Year', '9000000004', 'neha.patel@utdallas.edu', '2004-09-13', 'Biotechnology', '2025-01-18', 1, 1),
('Karan Singh', 24, 'Male', 'Student', 'MS CS 1st Year', '9000000005', 'karan.singh@utdallas.edu', '2001-06-27', 'Computer Science', '2025-02-15', 0, 0),
('Riya Nair', 22, 'Female', 'Student', 'MBA 1st Year', '9000000006', 'riya.nair@utdallas.edu', '2003-02-05', 'JSOM', '2025-03-09', 1, 1),
('Vikram Das', 23, 'Male', 'Student', 'B.Tech Mechanical 4th Year', '9000000007', 'vikram.das@utdallas.edu', '2002-10-08', 'Mechanical Engg', '2025-02-02', 1, 0),
('Isha Gupta', 20, 'Female', 'Student', 'BS Physics 3rd Year', '9000000008', 'isha.gupta@utdallas.edu', '2005-01-12', 'Physics', '2025-03-06', 1, 1),
('Rohit Jain', 22, 'Male', 'Student', 'BBA 2nd Year', '9000000009', 'rohit.jain@utdallas.edu', '2003-07-09', 'JSOM', '2025-01-10', 1, 1),
('Simran Kaur', 21, 'Female', 'Student', 'B.Tech ECE 3rd Year', '9000000010', 'simran.kaur@utdallas.edu', '2004-05-15', 'ECS', '2025-02-10', 1, 0),
('Aditya Menon', 24, 'Male', 'Student', 'MS DS 1st Year', '9000000011', 'aditya.menon@utdallas.edu', '2001-04-22', 'ECS', '2024-12-14', 0, 0),
('Sneha Iyer', 22, 'Female', 'Student', 'B.Tech IT 4th Year', '9000000012', 'sneha.iyer@utdallas.edu', '2003-03-25', 'Information Technology', '2025-03-01', 1, 1),
('Ankit Yadav', 23, 'Male', 'Student', 'MBA 2nd Year', '9000000013', 'ankit.yadav@utdallas.edu', '2002-11-17', 'JSOM', '2025-03-15', 1, 1),
('Tanya Bose', 21, 'Female', 'Student', 'B.Tech CS 3rd Year', '9000000014', 'tanya.bose@utdallas.edu', '2004-08-11', 'ECS', '2024-09-22', 1, 0),
('Ritesh Sharma', 22, 'Male', 'Student', 'MS ITM 1st Year', '9000000015', 'ritesh.sharma@utdallas.edu', '2003-01-05', 'JSOM', '2025-02-11', 1, 1),
('Mitali Ghosh', 23, 'Female', 'Student', 'B.Tech Biotech 4th Year', '9000000016', 'mitali.ghosh@utdallas.edu', '2002-07-19', 'Biotechnology', '2025-01-26', 0, 0),
('Aman Tiwari', 24, 'Male', 'Student', 'MS CS 2nd Year', '9000000017', 'aman.tiwari@utdallas.edu', '2001-03-12', 'ECS', '2025-02-18', 1, 1),
('Pooja Sinha', 22, 'Female', 'Student', 'BBA 3rd Year', '9000000018', 'pooja.sinha@utdallas.edu', '2003-09-27', 'JSOM', '2025-03-10', 1, 0),
('Rohan Desai', 21, 'Male', 'Student', 'B.Tech Mechanical 3rd Year', '9000000019', 'rohan.desai@utdallas.edu', '2004-06-05', 'Mechanical Engg', '2025-03-19', 1, 1),
('Kavya Pillai', 22, 'Female', 'Student', 'MBA 1st Year', '9000000020', 'kavya.pillai@utdallas.edu', '2003-02-10', 'JSOM', '2025-02-21', 1, 1),
('Harsh Raj', 23, 'Male', 'Student', 'MS ITM 1st Year', '9000000021', 'harsh.raj@utdallas.edu', '2002-08-23', 'JSOM', '2024-11-30', 1, 0),
('Ananya Dey', 21, 'Female', 'Student', 'B.Tech CSE 3rd Year', '9000000022', 'ananya.dey@utdallas.edu', '2004-03-16', 'ECS', '2025-01-12', 1, 1),
('Nikhil Reddy', 23, 'Male', 'Student', 'MS DS 2nd Year', '9000000023', 'nikhil.reddy@utdallas.edu', '2002-05-14', 'ECS', '2025-02-27', 1, 1),
('Shruti Patel', 22, 'Female', 'Student', 'MBA 1st Year', '9000000024', 'shruti.patel@utdallas.edu', '2003-07-25', 'JSOM', '2025-03-04', 1, 0),
('Gaurav Singh', 24, 'Male', 'Student', 'MS CS 2nd Year', '9000000025', 'gaurav.singh@utdallas.edu', '2001-12-18', 'ECS', '2025-03-15', 1, 1),

-- FACULTY (26–40)
('Dr. Kavita Rao', 45, 'Female', 'Faculty', 'Professor, JSOM', '9000000026', 'kavita.rao@utdallas.edu', '1980-06-10', 'JSOM', '2025-02-18', 1, 1),
('Dr. Deepak Sharma', 50, 'Male', 'Faculty', 'Associate Professor, ECS', '9000000027', 'deepak.sharma@utdallas.edu', '1975-04-22', 'ECS', '2024-11-25', 0, 0),
('Prof. Nisha Iyer', 40, 'Female', 'Faculty', 'Assistant Professor, IT', '9000000028', 'nisha.iyer@utdallas.edu', '1985-09-15', 'IT', '2025-03-14', 1, 1),
('Dr. Rohan Kumar', 38, 'Male', 'Faculty', 'Professor, Mechanical Engg', '9000000029', 'rohan.kumar@utdallas.edu', '1987-02-20', 'Mechanical Engg', '2025-03-03', 1, 1),
('Prof. Meena Singh', 44, 'Female', 'Faculty', 'Lecturer, Mathematics', '9000000030', 'meena.singh@utdallas.edu', '1981-12-04', 'Mathematics', '2025-01-10', 1, 0),
('Dr. Sandeep Yadav', 46, 'Male', 'Faculty', 'Professor, Physics', '9000000031', 'sandeep.yadav@utdallas.edu', '1979-05-09', 'Physics', '2024-12-30', 1, 1),
('Prof. Anjali Nair', 47, 'Female', 'Faculty', 'Lecturer, Economics', '9000000032', 'anjali.nair@utdallas.edu', '1978-11-12', 'Economics', '2025-02-08', 0, 0),
('Dr. Amit Patel', 49, 'Male', 'Faculty', 'Professor, Finance', '9000000033', 'amit.patel@utdallas.edu', '1976-03-28', 'Finance', '2025-03-14', 1, 1),
('Prof. Ritu Joshi', 42, 'Female', 'Faculty', 'Lecturer, Computer Science', '9000000034', 'ritu.joshi@utdallas.edu', '1983-07-10', 'Computer Science', '2025-02-19', 1, 0),
('Dr. Vikram Rao', 39, 'Male', 'Faculty', 'Assistant Professor, Statistics', '9000000035', 'vikram.rao@utdallas.edu', '1986-09-25', 'Statistics', '2025-01-15', 1, 1),
('Prof. Kavya Kulkarni', 43, 'Female', 'Faculty', 'Professor, Biotechnology', '9000000036', 'kavya.kulkarni@utdallas.edu', '1982-04-12', 'Biotechnology', '2025-03-20', 1, 1),
('Dr. Raj Mehta', 48, 'Male', 'Faculty', 'Professor, JSOM', '9000000037', 'raj.mehta@utdallas.edu', '1977-08-22', 'JSOM', '2025-02-16', 0, 0),
('Prof. Pooja Shah', 41, 'Female', 'Faculty', 'Lecturer, ECS', '9000000038', 'pooja.shah@utdallas.edu', '1984-02-11', 'ECS', '2024-10-15', 1, 1),
('Dr. Manish Desai', 52, 'Male', 'Faculty', 'Professor, Civil Engg', '9000000039', 'manish.desai@utdallas.edu', '1973-06-18', 'Civil Engg', '2025-03-11', 1, 1),
('Prof. Snehal Patil', 38, 'Female', 'Faculty', 'Assistant Professor, Psychology', '9000000040', 'snehal.patil@utdallas.edu', '1987-10-29', 'Psychology', '2025-02-25', 1, 0),

-- STAFF (41–50)
('Ramesh Pawar', 36, 'Male', 'Staff', 'Security Officer', '9000000041', 'ramesh.pawar@utdallas.edu', '1989-09-25', 'Security', '2025-01-30', 1, 1),
('Sunita Desai', 33, 'Female', 'Staff', 'Dining Supervisor', '9000000042', 'sunita.desai@utdallas.edu', '1992-07-13', 'Dining Services', '2025-03-01', 1, 0),
('Arun Kumar', 39, 'Male', 'Staff', 'Facilities Manager', '9000000043', 'arun.kumar@utdallas.edu', '1986-11-21', 'Facilities', '2025-02-10', 1, 1),
('Meena Sharma', 37, 'Female', 'Staff', 'Library Assistant', '9000000044', 'meena.sharma@utdallas.edu', '1988-04-05', 'Library', '2025-02-20', 0, 0),
('Vijay Singh', 35, 'Male', 'Staff', 'Security Guard', '9000000045', 'vijay.singh@utdallas.edu', '1990-01-18', 'Security', '2024-12-18', 1, 1),
('Tina George', 34, 'Female', 'Staff', 'Health Center Nurse', '9000000046', 'tina.george@utdallas.edu', '1991-03-20', 'Student Health Center', '2025-03-03', 1, 1),
('Rajeev Menon', 38, 'Male', 'Staff', 'Housing Coordinator', '9000000047', 'rajeev.menon@utdallas.edu', '1987-02-02', 'Housing', '2025-02-27', 1, 0),
('Rachita Paul', 29, 'Female', 'Staff', 'Career Advisor', '9000000048', 'rachita.paul@utdallas.edu', '1996-09-08', 'Career Center', '2025-03-09', 1, 1),
('Sourav Ghosh', 31, 'Male', 'Staff', 'Finance Clerk', '9000000049', 'sourav.ghosh@utdallas.edu', '1994-06-22', 'Finance', '2025-01-14', 1, 0),
('Preeti Nanda', 28, 'Female', 'Staff', 'Admissions Assistant', '9000000050', 'preeti.nanda@utdallas.edu', '1997-12-09', 'Admissions', '2024-12-21', 1, 1),

-- OTHER / EXTERNAL DONORS (51–60)
('Sonia Paul', 26, 'Female', 'Other', 'Volunteer, Red Cross Dallas', '9000000051', 'sonia.paul@redcross.org', '1999-03-08', 'External', '2025-02-10', 1, 1),
('Harish Rao', 29, 'Male', 'Other', 'Corporate Donor, Infosys', '9000000052', 'harish.rao@infosys.com', '1996-08-05', 'External', '2025-03-04', 0, 0),
('Nivedita Menon', 32, 'Female', 'Other', 'Community Donor', '9000000053', 'nivedita.menon@gmail.com', '1993-05-10', 'External', '2024-12-17', 1, 1),
('Ajay Ghosh', 34, 'Male', 'Other', 'Volunteer, Blood Connect NGO', '9000000054', 'ajay.ghosh@bloodconnect.org', '1991-11-02', 'External', '2025-02-20', 1, 0),
('Vandana Pillai', 30, 'Female', 'Other', 'Corporate Donor, TCS', '9000000055', 'vandana.pillai@tcs.com', '1995-09-19', 'External', '2025-03-15', 1, 1),
('Manoj Tiwari', 40, 'Male', 'Other', 'Frequent Donor', '9000000056', 'manoj.tiwari@gmail.com', '1985-04-14', 'External', '2025-03-09', 0, 0),
('Rupal Shah', 27, 'Female', 'Other', 'Red Cross Volunteer', '9000000057', 'rupal.shah@redcross.org', '1998-02-25', 'External', '2025-02-27', 1, 1),
('Anand Das', 31, 'Male', 'Other', 'Community Blood Donor', '9000000058', 'anand.das@gmail.com', '1994-07-12', 'External', '2025-03-06', 1, 1),
('Mona Aggarwal', 29, 'Female', 'Other', 'Donor - NGO Event', '9000000059', 'mona.aggarwal@gmail.com', '1996-10-04', 'External', '2025-02-13', 1, 0),
('Nikhil Agarwal', 33, 'Male', 'Other', 'Private Sector Volunteer', '9000000060', 'nikhil.agarwal@outlook.com', '1992-03-19', 'External', '2025-03-19', 1, 1);

------------------------------------------------------------------------------------------------  
-- HEALTH RECORD TABLE 
------------------------------------------------------------------------------------------------  
CREATE TABLE HealthRecord(
    DonorID INT PRIMARY KEY,   -- same as donor, ensures one health record per donor
    Name VARCHAR(100) NOT NULL,
    Height_cm DECIMAL(5,2),       -- e.g. 172.50 cm
    Weight_kg DECIMAL(5,2),       -- e.g. 68.40 kg
    BMI DECIMAL(5,2),             -- auto-calculated or stored manually
    Haemoglobin_g_dL DECIMAL(4,1),-- e.g. 13.5 g/dL
    BloodPressure VARCHAR(10),    -- e.g. '120/80'
	MedicalConditions TEXT,       -- e.g. 'Asthma, Mild Hypertension'
    IsEligible BOOLEAN DEFAULT 1, -- 1 = eligible for donation
    FOREIGN KEY (DonorID) REFERENCES Donor(DonorID) ON DELETE CASCADE
);

INSERT INTO HealthRecord
(DonorID, Name, Height_cm, Weight_kg, BMI, Haemoglobin_g_dL, BloodPressure, MedicalConditions, IsEligible)
VALUES
-- STUDENTS (1–25)
(1, 'Aarav Mehta', 175.0, 70.0, 22.9, 14.2, '120/80', 'None', 1),
(2, 'Priya Sharma', 162.0, 55.0, 20.9, 12.8, '115/78', 'None', 1),
(3, 'Rahul Verma', 180.0, 85.0, 26.2, 13.1, '125/82', 'Overweight', 1),
(4, 'Neha Patel', 165.0, 60.0, 22.0, 12.3, '118/76', 'None', 1),
(5, 'Karan Singh', 178.0, 95.0, 29.9, 13.0, '130/85', 'Slightly High BP', 0),
(6, 'Riya Nair', 160.0, 54.0, 21.1, 13.2, '110/75', 'None', 1),
(7, 'Vikram Das', 182.0, 82.0, 24.7, 13.8, '122/79', 'None', 1),
(8, 'Isha Gupta', 158.0, 51.0, 20.4, 12.9, '116/77', 'None', 1),
(9, 'Rohit Jain', 172.0, 68.0, 23.0, 13.4, '119/80', 'None', 1),
(10, 'Simran Kaur', 164.0, 58.0, 21.6, 12.7, '117/76', 'None', 1),
(11, 'Aditya Menon', 181.0, 90.0, 27.5, 12.9, '128/84', 'Overweight', 1),
(12, 'Sneha Iyer', 160.0, 56.0, 21.9, 13.5, '118/78', 'None', 1),
(13, 'Ankit Yadav', 177.0, 74.0, 23.6, 13.9, '120/79', 'None', 1),
(14, 'Tanya Bose', 162.0, 59.0, 22.5, 12.4, '117/78', 'None', 1),
(15, 'Ritesh Sharma', 179.0, 76.0, 23.7, 13.6, '121/81', 'None', 1),
(16, 'Mitali Ghosh', 166.0, 65.0, 23.6, 11.5, '120/82', 'Low Haemoglobin', 0),
(17, 'Aman Tiwari', 182.0, 80.0, 24.1, 14.1, '119/79', 'None', 1),
(18, 'Pooja Sinha', 164.0, 55.0, 20.4, 12.7, '116/78', 'None', 1),
(19, 'Rohan Desai', 180.0, 83.0, 25.6, 13.3, '124/82', 'None', 1),
(20, 'Kavya Pillai', 160.0, 54.0, 21.1, 13.0, '112/76', 'None', 1),
(21, 'Harsh Raj', 176.0, 78.0, 25.2, 13.9, '121/80', 'None', 1),
(22, 'Ananya Dey', 165.0, 59.0, 21.7, 13.2, '116/77', 'None', 1),
(23, 'Nikhil Reddy', 182.0, 84.0, 25.3, 13.4, '125/83', 'None', 1),
(24, 'Shruti Patel', 163.0, 58.0, 21.8, 12.9, '118/79', 'None', 1),
(25, 'Gaurav Singh', 180.0, 80.0, 24.7, 13.8, '122/80', 'None', 1),

-- FACULTY (26–40)
(26, 'Dr. Kavita Rao', 158.0, 58.0, 23.2, 13.0, '118/78', 'None', 1),
(27, 'Dr. Deepak Sharma', 174.0, 82.0, 27.1, 12.5, '138/88', 'Mild Hypertension', 0),
(28, 'Prof. Nisha Iyer', 162.0, 57.0, 21.7, 12.9, '116/77', 'None', 1),
(29, 'Dr. Rohan Kumar', 178.0, 79.0, 24.9, 13.4, '122/80', 'None', 1),
(30, 'Prof. Meena Singh', 165.0, 62.0, 22.8, 13.0, '118/79', 'None', 1),
(31, 'Dr. Sandeep Yadav', 180.0, 85.0, 26.2, 13.6, '125/82', 'None', 1),
(32, 'Prof. Anjali Nair', 160.0, 60.0, 23.4, 11.9, '120/85', 'Low Haemoglobin', 0),
(33, 'Dr. Amit Patel', 176.0, 78.0, 25.2, 13.3, '123/80', 'None', 1),
(34, 'Prof. Ritu Joshi', 164.0, 59.0, 21.9, 12.8, '117/77', 'None', 1),
(35, 'Dr. Vikram Rao', 182.0, 84.0, 25.3, 13.9, '121/81', 'None', 1),
(36, 'Prof. Kavya Kulkarni', 161.0, 60.0, 23.1, 13.1, '119/78', 'None', 1),
(37, 'Dr. Raj Mehta', 175.0, 83.0, 27.1, 12.7, '128/85', 'Slightly High BP', 0),
(38, 'Prof. Pooja Shah', 160.0, 58.0, 22.6, 13.0, '117/77', 'None', 1),
(39, 'Dr. Manish Desai', 180.0, 88.0, 27.2, 13.4, '122/80', 'None', 1),
(40, 'Prof. Snehal Patil', 162.0, 59.0, 22.5, 13.2, '118/79', 'None', 1),

-- STAFF (41–50)
(41, 'Ramesh Pawar', 178.0, 75.0, 23.7, 13.5, '120/80', 'None', 1),
(42, 'Sunita Desai', 160.0, 56.0, 21.9, 13.0, '115/77', 'None', 1),
(43, 'Arun Kumar', 176.0, 78.0, 25.2, 13.8, '122/82', 'None', 1),
(44, 'Meena Sharma', 162.0, 63.0, 24.0, 12.1, '124/85', 'Slightly High BP', 0),
(45, 'Vijay Singh', 175.0, 72.0, 23.5, 13.6, '121/80', 'None', 1),
(46, 'Tina George', 160.0, 54.0, 21.1, 13.0, '116/76', 'None', 1),
(47, 'Rajeev Menon', 180.0, 82.0, 25.3, 13.4, '124/83', 'None', 1),
(48, 'Rachita Paul', 164.0, 57.0, 21.2, 12.7, '117/77', 'None', 1),
(49, 'Sourav Ghosh', 179.0, 80.0, 24.9, 13.5, '120/80', 'None', 1),
(50, 'Preeti Nanda', 160.0, 54.0, 21.1, 12.4, '115/77', 'Low Haemoglobin', 0),

-- OTHER / EXTERNAL DONORS (51–60)
(51, 'Sonia Paul', 162.0, 55.0, 21.0, 12.9, '116/78', 'None', 1),
(52, 'Harish Rao', 178.0, 80.0, 25.3, 13.3, '123/81', 'None', 1),
(53, 'Nivedita Menon', 160.0, 60.0, 23.4, 12.8, '118/79', 'None', 1),
(54, 'Ajay Ghosh', 180.0, 86.0, 26.5, 13.6, '125/82', 'None', 1),
(55, 'Vandana Pillai', 164.0, 59.0, 22.0, 13.0, '117/77', 'None', 1),
(56, 'Manoj Tiwari', 177.0, 85.0, 27.1, 12.0, '132/88', 'High BP', 0),
(57, 'Rupal Shah', 162.0, 58.0, 22.1, 13.1, '118/78', 'None', 1),
(58, 'Anand Das', 179.0, 79.0, 24.6, 13.5, '121/80', 'None', 1),
(59, 'Mona Aggarwal', 160.0, 55.0, 21.5, 12.9, '116/77', 'None', 1),
(60, 'Nikhil Agarwal', 182.0, 88.0, 26.6, 13.8, '123/81', 'None', 1);

------------------------------------------------------------------------------------------------  
-- BLOODGROUP TABLE 
------------------------------------------------------------------------------------------------  
CREATE TABLE BloodGroup(
    DonorID INT PRIMARY KEY,
    BloodGroup VARCHAR(30) NOT NULL,
    FOREIGN KEY (DonorID) REFERENCES Donor(DonorID) ON DELETE CASCADE
);

INSERT INTO BloodGroup (DonorID, BloodGroup) VALUES
-- STUDENTS (1–25, mostly common)
(1, 'A+'),
(2, 'O+'),
(3, 'B+'),
(4, 'AB+'),
(5, 'O-'),
(6, 'A-'),
(7, 'B+'),
(8, 'O+'),
(9, 'A+'),
(10, 'B-'),
(11, 'O+'),
(12, 'A+'),
(13, 'AB+'),
(14, 'O-'),
(15, 'B+'),
(16, 'A-'),
(17, 'O+'),
(18, 'A+'),
(19, 'B+'),
(20, 'AB-'),
(21, 'O+'),
(22, 'A+'),
(23, 'B+'),
(24, 'O+'),
(25, 'AB+'),

-- FACULTY (26–40, mix of common & uncommon)
(26, 'A+'),
(27, 'O-'),
(28, 'B-'),
(29, 'A2'),
(30, 'A+'),
(31, 'O+'),
(32, 'A2B'),
(33, 'B+'),
(34, 'AB+'),
(35, 'O-'),
(36, 'A-'),
(37, 'B+'),
(38, 'A+'),
(39, 'AB-'),
(40, 'O+'),

-- STAFF (41–50)
(41, 'B+'),
(42, 'A+'),
(43, 'O+'),
(44, 'AB+'),
(45, 'O-'),
(46, 'A+'),
(47, 'B-'),
(48, 'O+'),
(49, 'AB+'),
(50, 'A-'),

-- OTHER / EXTERNAL (51–60, includes rare types)
(51, 'Bombay (hh)'),
(52, 'Rh-null'),
(53, 'Kell-'),
(54, 'Duffy-'),
(55, 'Kidd-'),
(56, 'Lutheran-'),
(57, 'MNS-'),
(58, 'Diego-'),
(59, 'Gerbich-'),
(60, 'Colton-');

------------------------------------------------------------------------------------------------  
-- DONATION HISTORY TABLE 
------------------------------------------------------------------------------------------------  
CREATE TABLE DonationHistory(

    DonationID INT AUTO_INCREMENT PRIMARY KEY,

    DonorID INT NOT NULL,

    EventName VARCHAR(150),

    LastDonatedDate DATE NOT NULL,

    Quantity_ml INT DEFAULT 450,   -- default unit of blood collected

    Location VARCHAR(100),

    FOREIGN KEY (DonorID) REFERENCES Donor(DonorID) ON DELETE CASCADE

);
 


INSERT INTO DonationHistory (DonorID, EventName, LastDonatedDate, Quantity_ml, Location)
VALUES

-- STUDENTS (1–25)

(1, 'UTD Annual Blood Drive 2025', '2025-03-12', 450, 'Student Union Hall'),

(1, 'UTD Emergency Drive', '2025-03-20', 450, 'UTD Health Center'),

(1, 'Red Cross Donation Camp', '2025-04-10', 450, 'Dallas HQ'),

(2, 'UTD Health Week', '2024-12-20', 450, 'JSOM Lobby'),

(3, 'Red Cross Drive', '2025-03-05', 450, 'ECS Atrium'),

(4, 'UTD Annual Blood Drive 2025', '2025-01-18', 450, 'Student Union Hall'),

(5, 'UTD Health Camp', '2025-02-15', 450, 'ECS Block'),

(5, 'UTD Wellness Blood Drive', '2025-03-25', 450, 'Student Union'),

(6, 'UTD Health Week', '2025-03-09', 450, 'JSOM Lobby'),

(7, 'UTD Annual Blood Drive 2025', '2025-02-02', 450, 'Student Center'),

(8, 'UTD Red Cross Event', '2025-03-06', 450, 'ECS Lab'),

(9, 'UTD Annual Blood Drive 2025', '2025-01-10', 450, 'Union Hall'),

(10, 'ECS Tech for Humanity', '2025-02-10', 450, 'ECS Atrium'),

(11, 'UTD Red Cross Camp', '2024-12-14', 450, 'ECS Lobby'),

(12, 'UTD Health Week', '2025-03-01', 450, 'Student Union'),

(12, 'Blood Connect Camp', '2025-03-18', 450, 'Plano Center'),

(13, 'UTD Annual Blood Drive 2025', '2025-03-15', 450, 'JSOM Hall'),

(14, 'ECS Awareness Camp', '2024-09-22', 450, 'ECS Building'),

(15, 'UTD Health Drive', '2025-02-11', 450, 'JSOM Lobby'),

(16, 'UTD Wellness Week', '2025-01-26', 450, 'Biotech Lab'),

(17, 'UTD Annual Blood Drive 2025', '2025-02-18', 450, 'ECS Center'),

(18, 'UTD Red Cross Event', '2025-03-10', 450, 'JSOM Atrium'),

(19, 'UTD Annual Blood Drive 2025', '2025-03-19', 450, 'ECS Hall'),

(20, 'UTD Health Week', '2025-02-21', 450, 'Student Union'),

(20, 'UTD Health Week Special Drive', '2025-03-21', 450, 'JSOM'),

(20, 'Frisco General Blood Event', '2025-04-01', 450, 'Frisco Hospital'),

(21, 'UTD Wellness Drive', '2024-11-30', 450, 'JSOM Lobby'),

(22, 'UTD Red Cross Camp', '2025-01-12', 450, 'ECS Atrium'),

(23, 'UTD Health Week', '2025-02-27', 450, 'ECS Block'),

(24, 'UTD Annual Blood Drive 2025', '2025-03-04', 450, 'Student Union'),

(25, 'UTD Health Camp', '2025-03-15', 450, 'ECS Center'),
 
-- FACULTY (26–40)

(26, 'JSOM Faculty Drive', '2025-02-18', 450, 'JSOM Faculty Lounge'),

(27, 'UTD Wellness Week', '2024-11-25', 450, 'ECS Hall'),

(28, 'ECS Health Camp', '2025-03-14', 450, 'ECS Atrium'),

(29, 'Mechanical Awareness Drive', '2025-03-03', 450, 'Mechanical Dept Hall'),

(30, 'UTD Faculty Blood Camp', '2025-01-10', 450, 'Math Block'),

(31, 'UTD Health Week', '2024-12-30', 450, 'Physics Dept'),

(32, 'UTD Annual Blood Drive 2025', '2025-02-08', 450, 'ECS Hall'),

(33, 'UTD Health Camp', '2025-03-14', 450, 'Finance Wing'),

(34, 'CS Department Drive', '2025-02-19', 450, 'CS Lab'),

(35, 'UTD Research Health Week', '2025-01-15', 450, 'Statistics Block'),

(36, 'Biotech Health Drive', '2025-03-20', 450, 'BioTech Wing'),

(37, 'JSOM Faculty Blood Camp', '2025-02-16', 450, 'JSOM Atrium'),

(38, 'UTD Red Cross Event', '2024-10-15', 450, 'ECS Block'),

(39, 'UTD Faculty Health Week', '2025-03-11', 450, 'Civil Engg Lab'),

(40, 'UTD Psychology Drive', '2025-02-25', 450, 'Psychology Lab'),
 
-- STAFF (41–50)

(41, 'UTD Staff Blood Camp', '2025-01-30', 450, 'Security Office'),

(42, 'Dining Team Health Camp', '2025-03-01', 450, 'Dining Hall'),

(43, 'Facilities Blood Drive', '2025-02-10', 450, 'Maintenance Wing'),

(44, 'Library Health Week', '2025-02-20', 450, 'Main Library'),

(45, 'Security Blood Drive', '2024-12-18', 450, 'Security Post'),

(46, 'Health Center Drive', '2025-03-03', 450, 'Student Health Center'),

(47, 'Housing Team Drive', '2025-02-27', 450, 'Housing Office'),

(48, 'Career Center Health Camp', '2025-03-09', 450, 'Career Center'),

(49, 'Finance Dept Drive', '2025-01-14', 450, 'Finance Wing'),

(50, 'Admissions Blood Camp', '2024-12-21', 450, 'Admissions Office'),
 
-- OTHER / EXTERNAL (51–60)

(51, 'Red Cross Dallas Blood Camp', '2025-02-10', 450, 'Dallas HQ'),

(52, 'Infosys CSR Blood Drive', '2025-03-04', 450, 'Plano Center'),

(53, 'Community Health Week', '2024-12-17', 450, 'Downtown Dallas'),

(54, 'Blood Connect NGO Camp', '2025-02-20', 450, 'Fort Worth'),

(55, 'TCS Life Blood Drive', '2025-03-15', 450, 'Irving Office'),

(56, 'Dallas Public Donation Day', '2025-03-09', 450, 'Downtown Park'),

(57, 'Red Cross Volunteer Camp', '2025-02-27', 450, 'Red Cross Dallas'),

(58, 'Community Blood Camp', '2025-03-06', 450, 'Plano Center'),

(59, 'NGO Awareness Drive', '2025-02-13', 450, 'Addison Hall'),

(60, 'Health Foundation Global Drive', '2025-03-19', 450, 'Frisco Hospital');
 
------------------------------------------------------------------------------------------------  
-- DONATION EVENT 
------------------------------------------------------------------------------------------------  
CREATE TABLE DonationEvent(
    EventID INT AUTO_INCREMENT PRIMARY KEY,
    EventName VARCHAR(150) NOT NULL,
    Location VARCHAR(100) NOT NULL
);

INSERT INTO DonationEvent (EventID, EventName, Location)
VALUES
(1, 'UTD Annual Blood Drive 2025', 'Student Union Hall'),
(2, 'UTD Health Week', 'JSOM Lobby'),
(3, 'Red Cross Drive', 'ECS Atrium'),
(4, 'UTD Health Camp', 'ECS Block'),
(5, 'UTD Red Cross Event', 'ECS Lab'),
(6, 'ECS Tech for Humanity', 'ECS Atrium'),
(7, 'ECS Awareness Camp', 'ECS Building'),
(8, 'UTD Wellness Week', 'Biotech Lab'),
(9, 'UTD Health Drive', 'JSOM Lobby'),
(10, 'JSOM Faculty Drive', 'JSOM Faculty Lounge'),
(11, 'ECS Health Camp', 'ECS Atrium'),
(12, 'Mechanical Awareness Drive', 'Mechanical Dept Hall'),
(13, 'UTD Faculty Blood Camp', 'Math Block'),
(14, 'UTD Research Health Week', 'Statistics Block'),
(15, 'Biotech Health Drive', 'Biotech Wing'),
(16, 'UTD Staff Blood Camp', 'Security Office'),
(17, 'Dining Team Health Camp', 'Dining Hall'),
(18, 'Facilities Blood Drive', 'Maintenance Wing'),
(19, 'Red Cross Dallas Blood Camp', 'Dallas HQ'),
(20, 'Infosys CSR Blood Drive', 'Plano Center');

------------------------------------------------------------------------------------------------  
-- HOSPITAL TABLE 
------------------------------------------------------------------------------------------------  
CREATE TABLE Hospital(
    HospitalID INT AUTO_INCREMENT PRIMARY KEY,
    HospitalName VARCHAR(150) NOT NULL,
    ContactNumber VARCHAR(15),
    City VARCHAR(100),
    State VARCHAR(100),
    ZipCode VARCHAR(10)
)AUTO_INCREMENT = 1001;

INSERT INTO Hospital (HospitalName, ContactNumber, City, State, ZipCode)
VALUES
('UTD Student Health Center', '9728832747', 'Richardson', 'Texas', '75080'),
('Texas Health Presbyterian Hospital Dallas', '2143456789', 'Dallas', 'Texas', '75231'),
('Baylor University Medical Center', '2148200111', 'Dallas', 'Texas', '75246'),
('Methodist Richardson Medical Center', '4692041000', 'Richardson', 'Texas', '75082'),
('Medical City Plano', '9725966800', 'Plano', 'Texas', '75075'),
('Baylor Scott & White Medical Center – Frisco', '2144075000', 'Frisco', 'Texas', '75034'),
('Parkland Health & Hospital System', '2145908000', 'Dallas', 'Texas', '75235'),
('Children’s Medical Center Dallas', '2144567000', 'Dallas', 'Texas', '75235'),
('Texas Health Allen', '9727471000', 'Allen', 'Texas', '75013'),
('UT Southwestern Medical Center', '2146483111', 'Dallas', 'Texas', '75390');

------------------------------------------------------------------------------------------------  
-- BLOOD REQUEST TABLE 
------------------------------------------------------------------------------------------------  
CREATE TABLE BloodRequest(
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    HospitalID INT NOT NULL,
    BloodGroup VARCHAR(30) NOT NULL,
    UnitsRequired INT DEFAULT 1,
    RequestDate DATE DEFAULT (CURRENT_DATE),
    Status ENUM('Pending', 'In Progress', 'Fulfilled', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (HospitalID) REFERENCES Hospital(HospitalID) ON DELETE CASCADE
)AUTO_INCREMENT = 202501;

Select * from bloodrequest;

INSERT INTO BloodRequest (HospitalID, BloodGroup, UnitsRequired, RequestDate, Status)
VALUES
-- UTD Student Health Center
(1001,'O+', 2, '2025-10-30', 'Pending'),
(1001,'A+', 1, '2025-10-28', 'Fulfilled'),
(1001,'B+', 3, '2025-10-25', 'In Progress'),

-- Texas Health Presbyterian Hospital Dallas
(1002,'A-', 2, '2025-10-29', 'Pending'),
(1002,'O-', 4, '2025-11-01', 'In Progress'),
(1002,'AB+', 1, '2025-11-02', 'Fulfilled'),

-- Baylor University Medical Center
(1003,'B+', 2, '2025-10-27', 'Pending'),
(1003,'A+', 1, '2025-11-03', 'Pending'),
(1003,'O-', 3, '2025-11-05', 'In Progress'),

-- Methodist Richardson Medical Center
(1004,'O+', 2, '2025-10-30', 'Pending'),
(1004,'AB-', 1, '2025-11-04', 'In Progress'),
(1004,'A+', 2, '2025-11-02', 'Fulfilled'),

-- Medical City Plano
(1005,'O-', 3, '2025-11-01', 'Pending'),
(1005,'B+', 1, '2025-10-29', 'Fulfilled'),
(1005,'AB+', 2, '2025-11-03', 'In Progress'),

-- Baylor Scott & White Medical Center – Frisco
(1006,'A+', 1, '2025-10-31', 'Pending'),
(1006,'O+', 2, '2025-11-05', 'Fulfilled'),
(1006,'B-', 1, '2025-10-27', 'In Progress'),

-- Parkland Health & Hospital System
(1007,'O-', 4, '2025-11-02', 'Pending'),
(1007,'A+', 2, '2025-10-26', 'In Progress'),
(1007,'B+', 3, '2025-10-25', 'Fulfilled'),

-- Children’s Medical Center Dallas
(1008,'AB-', 1, '2025-10-28', 'Pending'),
(1008,'O+', 5, '2025-11-05', 'In Progress'),
(1008,'A-', 2, '2025-10-29', 'Fulfilled'),

-- Texas Health Allen
(1009,'O+', 2, '2025-11-01', 'Pending'),
(1009,'A+', 1, '2025-10-30', 'Fulfilled'),
(1009,'B-', 2, '2025-11-03', 'In Progress'),

-- UT Southwestern Medical Center
(1010,'AB+', 3, '2025-10-31', 'Pending'),
(1010,'O-', 1, '2025-11-02', 'In Progress'),
(1010,'Bombay (hh)', 1, '2025-11-05', 'Pending');

------------------------------------------------------------------------------------------------  
-- EMERGENCY ALERT TABLE 
------------------------------------------------------------------------------------------------  

CREATE TABLE EmergencyAlert(
    AlertID INT AUTO_INCREMENT PRIMARY KEY,
    RequestID INT NOT NULL,
    HospitalID INT NOT NULL,
    BloodGroup VARCHAR(10) NOT NULL,
    AlertTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    Status ENUM('Active', 'Resolved', 'Cancelled') DEFAULT 'Active',
    FOREIGN KEY (RequestID) REFERENCES BloodRequest(RequestID) ON DELETE CASCADE,
    FOREIGN KEY (HospitalID) REFERENCES Hospital(HospitalID) ON DELETE CASCADE
)AUTO_INCREMENT = 101;

INSERT INTO EmergencyAlert (RequestID, HospitalID, BloodGroup, AlertTime, Status)
VALUES
(202501, 1001, 'O+', '2025-11-06 09:10:00', 'Active'),
(202502, 1002, 'A-', '2025-11-07 09:20:00', 'Active'),
(202504, 1004, 'O-', '2025-11-05 09:30:00', 'Resolved'),
(202505, 1005, 'AB+', '2025-11-05 09:45:00', 'Active'),
(202506, 1006, 'A+', '2025-11-05 10:00:00', 'Resolved'),
(202510, 1004, 'O+', '2025-11-05 10:30:00', 'Cancelled');

------------------------------------------------------------------------------------------------  
-- APPOINTMENT TABLE 
------------------------------------------------------------------------------------------------  
CREATE TABLE Appointment(
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    DonorID INT,
    EventID INT,
    AppointmentDate DATE,
    SlotTime TIME,
    Status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (DonorID) REFERENCES Donor(DonorID),
    FOREIGN KEY (EventID) REFERENCES DonationEvent(EventID)
)AUTO_INCREMENT = 9001;

INSERT INTO Appointment (DonorID, EventID, AppointmentDate, SlotTime, Status)
VALUES
-- UTD Annual Blood Drive 2025
(1, 1, '2025-03-12', '09:00:00', 'Scheduled'),
(2, 1, '2025-03-12', '09:30:00', 'Completed'),
(3, 1, '2025-03-12', '10:00:00', 'Scheduled'),
(4, 1, '2025-03-12', '10:30:00', 'Cancelled'),

-- UTD Health Week
(5, 2, '2025-03-14', '09:00:00', 'Scheduled'),
(6, 2, '2025-03-14', '09:30:00', 'Completed'),
(7, 2, '2025-03-14', '10:00:00', 'Scheduled'),
(8, 2, '2025-03-14', '10:30:00', 'Completed'),

-- Red Cross Drive
(9, 3, '2025-03-15', '09:00:00', 'Scheduled'),
(10, 3, '2025-03-15', '09:30:00', 'Completed'),
(11, 3, '2025-03-15', '10:00:00', 'Scheduled'),

-- UTD Wellness Week
(12, 8, '2025-03-20', '09:00:00', 'Scheduled'),
(13, 8, '2025-03-20', '09:30:00', 'Completed'),
(14, 8, '2025-03-20', '10:00:00', 'Scheduled'),
(15, 8, '2025-03-20', '10:30:00', 'Cancelled');

------------------------------------------------------------------------------------------------  
-- VOLUNTEER TABLE 
------------------------------------------------------------------------------------------------  
CREATE TABLE Volunteer(
    VolunteerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    ContactNumber VARCHAR(15),
    Role VARCHAR(50),          -- e.g., 'Coordinator', 'Nurse Assistant'
    AssignedEventID INT,
    Email VARCHAR(100),
    FOREIGN KEY (AssignedEventID) REFERENCES DonationEvent(EventID) ON DELETE SET NULL
)AUTO_INCREMENT= 201;
INSERT INTO Volunteer (Name, ContactNumber, Role, AssignedEventID, Email)
VALUES
-- UTD Annual Blood Drive 2025 (EventID = 1)
('Emily Johnson', '9720001001', 'Event Coordinator', 1, 'emily.johnson@utdallas.edu'),
('Rahul Patel', '9720001002', 'Registration Desk', 1, 'rahul.patel@utdallas.edu'),
('Priya Desai', '9720001003', 'Health Assistant', 1, 'priya.desai@utdallas.edu'),
('Michael Brown', '9720001004', 'Donor Support', 1, 'michael.brown@utdallas.edu'),
('Sarah Lee', '9720001005', 'Data Entry', 1, 'sarah.lee@utdallas.edu'),

-- UTD Health Week (EventID = 2)
('Ananya Sharma', '9720002001', 'Coordinator', 2, 'ananya.sharma@utdallas.edu'),
('David Nguyen', '9720002002', 'Volunteer Lead', 2, 'david.nguyen@utdallas.edu'),
('Jessica Chen', '9720002003', 'Medical Assistant', 2, 'jessica.chen@utdallas.edu'),
('Aarav Singh', '9720002004', 'Logistics Support', 2, 'aarav.singh@utdallas.edu'),
('Sophia Martinez', '9720002005', 'Donor Registration', 2, 'sophia.martinez@utdallas.edu'),

-- Red Cross Drive (EventID = 3)
('Nikhil Kumar', '9720003001', 'Event Planner', 3, 'nikhil.kumar@utdallas.edu'),
('Rachel Adams', '9720003002', 'Medical Assistant', 3, 'rachel.adams@utdallas.edu'),
('Daniel Park', '9720003003', 'Donor Guidance', 3, 'daniel.park@utdallas.edu'),
('Olivia White', '9720003004', 'Record Keeper', 3, 'olivia.white@utdallas.edu'),
('Liam Wilson', '9720003005', 'Setup Crew', 3, 'liam.wilson@utdallas.edu'),

-- UTD Wellness Week (EventID = 8)
('Emma Garcia', '9720008001', 'Coordinator', 8, 'emma.garcia@utdallas.edu'),
('Lucas Hernandez', '9720008002', 'First Aid Assistant', 8, 'lucas.hernandez@utdallas.edu'),
('Maya Patel', '9720008003', 'Donor Registration', 8, 'maya.patel@utdallas.edu'),
('Ethan Roberts', '9720008004', 'Event Volunteer', 8, 'ethan.roberts@utdallas.edu'),
('Chloe Kim', '9720008005', 'Medical Assistant', 8, 'chloe.kim@utdallas.edu'),

-- Community / External Drives (EventID = 19, 20)
('Harper Davis', '9720001901', 'Coordinator', 19, 'harper.davis@redcross.org'),
('Noah Scott', '9720001902', 'Transport Volunteer', 19, 'noah.scott@redcross.org'),
('Ava Lewis', '9720002001', 'Community Outreach', 20, 'ava.lewis@infosys.com'),
('Isabella Torres', '9720002002', 'Event Liaison', 20, 'isabella.torres@infosys.com'),
('James Walker', '9720002003', 'Health Support', 20, 'james.walker@infosys.com');

------------------------------------------------------------------------------------------------  
-- AUDITLOG TABLE 
------------------------------------------------------------------------------------------------  
CREATE TABLE AuditLog(
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    TableName VARCHAR(100),
    Operation ENUM('INSERT', 'UPDATE', 'DELETE'),
    User VARCHAR(100),
    Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    Description TEXT
)AUTO_INCREMENT= 2501;

INSERT INTO AuditLog (TableName, Operation, User, Description)
VALUES
('Donor', 'INSERT', 'admin_kashish', 'Added new donor Emily Johnson with DonorID = 45'),
('BloodRequest', 'UPDATE', 'admin_rahul', 'Updated status of RequestID = 12 from Pending to Fulfilled'),
('Hospital', 'DELETE', 'system_auto', 'Removed duplicate hospital record ID = 1007'),
('DonationEvent', 'INSERT', 'event_manager_sarah', 'Created new event UTD Health Week 2025'),
('EmergencyAlert', 'UPDATE', 'alert_bot', 'AlertID = 5 resolved automatically after donor confirmation'),
('HealthRecord', 'UPDATE', 'nurse_emma', 'Updated Haemoglobin from 12.5 to 13.8 for DonorID = 23'),
('BloodStock', 'INSERT', 'admin_kashish', 'Added 4 O+ units to HospitalID = 1002 inventory'),
('Appointment', 'DELETE', 'donor_ui_app', 'Cancelled appointment ID = 14 for EventID = 8'),
('Volunteer', 'INSERT', 'admin_kashish', 'Added 5 new volunteers for EventID = 2'),
('Admin', 'UPDATE', 'superadmin', 'Changed password for admin_rahul');


------------------------------------------------------------------------------------------------  
-- SPONSOR TABLE 
------------------------------------------------------------------------------------------------  
CREATE TABLE Sponsor(
    SponsorID INT AUTO_INCREMENT PRIMARY KEY,
    SponsorName VARCHAR(150) NOT NULL,
    SponsorType ENUM('Corporate', 'NGO', 'Student Organization', 'Hospital', 'Individual') DEFAULT 'Corporate',
    ContactPerson VARCHAR(100),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    ZipCode VARCHAR(10)
)AUTO_INCREMENT= 301;

INSERT INTO Sponsor (SponsorName, SponsorType, ContactPerson, ContactNumber, Email, City, State, ZipCode)
VALUES
('Infosys Foundation', 'Corporate', 'Ravi Mehta', '9721110001', 'ravi.mehta@infosys.org', 'Plano', 'Texas', '75093'),
('Red Cross Dallas', 'NGO', 'Mary Thomas', '9721110002', 'mary.thomas@redcross.org', 'Dallas', 'Texas', '75235'),
('UTD Student Council', 'Student Organization', 'Kiran Shah', '9721110003', 'kiran.shah@utdallas.edu', 'Richardson', 'Texas', '75080'),
('Texas Health Hospital', 'Hospital', 'Dr. Anjali Rao', '9721110004', 'anjali.rao@texashealth.org', 'Dallas', 'Texas', '75231'),
('H-E-B Grocery', 'Corporate', 'John Stewart', '9721110005', 'john.stewart@heb.com', 'Frisco', 'Texas', '75034'),
('Amazon Dallas', 'Corporate', 'Priya Patel', '9721110006', 'priya.patel@amazon.com', 'Dallas', 'Texas', '75201'),
('Rotary Club Richardson', 'NGO', 'Susan White', '9721110007', 'susan.white@rotary.org', 'Richardson', 'Texas', '75081'),
('PepsiCo', 'Corporate', 'Carlos Lopez', '9721110008', 'carlos.lopez@pepsico.com', 'Plano', 'Texas', '75075'),
('Baylor Medical Group', 'Hospital', 'Dr. David Kim', '9721110009', 'david.kim@baylorhealth.com', 'Dallas', 'Texas', '75246'),
('Tata Consultancy Services', 'Corporate', 'Rohit Kumar', '9721110010', 'rohit.kumar@tcs.com', 'Irving', 'Texas', '75063');

------------------------------------------------------------------------------------------------  
-- EVENTSPONSOR TABLE 
------------------------------------------------------------------------------------------------  
CREATE TABLE EventSponsor(
    EventID INT,
    SponsorID INT,
    ContributionType ENUM('Monetary', 'Equipment', 'Food', 'Venue Support', 'Medical Support', 'Other') DEFAULT 'Monetary',
    Amount DECIMAL(10,2),
    Remarks VARCHAR(255),
    PRIMARY KEY (EventID, SponsorID),
    FOREIGN KEY (EventID) REFERENCES DonationEvent(EventID) ON DELETE CASCADE,
    FOREIGN KEY (SponsorID) REFERENCES Sponsor(SponsorID) ON DELETE CASCADE
);

INSERT INTO EventSponsor (EventID, SponsorID, ContributionType, Amount, Remarks)
VALUES
(1, 301, 'Monetary', 5000.00, 'Provided event funding'),
(1, 303, 'Food', NULL, 'Arranged donor snacks and drinks'),
(2, 302, 'Medical Support', NULL, 'Donated medical kits'),
(2, 304, 'Equipment', 0.00, 'Provided beds and donation chairs'),
(3, 305, 'Food', NULL, 'Provided refreshments'),
(3, 307, 'Monetary', 2500.00, 'Sponsored volunteer T-shirts'),
(8, 306, 'Monetary', 3000.00, 'Donated funds for awareness posters'),
(8, 308, 'Food', NULL, 'Sponsored bottled water'),
(19, 309, 'Medical Support', NULL, 'Supplied doctors and staff'),
(20, 310, 'Monetary', 7000.00, 'Sponsored logistics and venue cost');

------------------------------------------------------------------------------------------------  
-- ADMIN TABLE 
------------------------------------------------------------------------------------------------  

CREATE TABLE Admin_Staff (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    AdminName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Username VARCHAR(50) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    Role VARCHAR(50) DEFAULT 'Admin'
) AUTO_INCREMENT = 223101;

 
INSERT INTO Admin_Staff (AdminName, Email, Username, PasswordHash, Role)
VALUES
-- UTD Student Health Center
('UTD Health Admin 1', 'utdhealth1@bloodcenter.org', 'utdhealth1', 'hashedpassword123', 'Admin'),
('UTD Health Admin 2', 'utdhealth2@bloodcenter.org', 'utdhealth2', 'hashedpassword123', 'Admin'),
 
-- Texas Health Presbyterian Hospital Dallas
('Texas Health Admin 1', 'texashealth1@bloodcenter.org', 'texashealth1', 'hashedpassword123', 'Admin'),
('Texas Health Admin 2', 'texashealth2@bloodcenter.org', 'texashealth2', 'hashedpassword123', 'Admin'),
 
-- Baylor University Medical Center
('Baylor Med Admin 1', 'baylormed1@bloodcenter.org', 'baylormed1', 'hashedpassword123', 'Admin'),
('Baylor Med Admin 2', 'baylormed2@bloodcenter.org', 'baylormed2', 'hashedpassword123', 'Admin'),
 
-- Methodist Richardson Medical Center
('Methodist Richardson Admin 1', 'methodistrich1@bloodcenter.org', 'methodistrich1', 'hashedpassword123', 'Admin'),
('Methodist Richardson Admin 2', 'methodistrich2@bloodcenter.org', 'methodistrich2', 'hashedpassword123', 'Admin'),
 
-- Medical City Plano
('Medical City Plano Admin 1', 'medcityplano1@bloodcenter.org', 'medcityplano1', 'hashedpassword123', 'Admin'),
('Medical City Plano Admin 2', 'medcityplano2@bloodcenter.org', 'medcityplano2', 'hashedpassword123', 'Admin'),
 
-- Baylor Scott & White Medical Center – Frisco
('Baylor Frisco Admin 1', 'baylorfrisco1@bloodcenter.org', 'baylorfrisco1', 'hashedpassword123', 'Admin'),
('Baylor Frisco Admin 2', 'baylorfrisco2@bloodcenter.org', 'baylorfrisco2', 'hashedpassword123', 'Admin'),
 
-- Parkland Health & Hospital System
('Parkland Admin 1', 'parkland1@bloodcenter.org', 'parkland1', 'hashedpassword123', 'Admin'),
('Parkland Admin 2', 'parkland2@bloodcenter.org', 'parkland2', 'hashedpassword123', 'Admin'),
 
-- Children’s Medical Center Dallas
('Childrens Med Admin 1', 'childrens1@bloodcenter.org', 'childrens1', 'hashedpassword123', 'Admin'),
('Childrens Med Admin 2', 'childrens2@bloodcenter.org', 'childrens2', 'hashedpassword123', 'Admin'),
 
-- Texas Health Allen
('Texas Health Allen Admin 1', 'texasallen1@bloodcenter.org', 'texasallen1', 'hashedpassword123', 'Admin'),
('Texas Health Allen Admin 2', 'texasallen2@bloodcenter.org', 'texasallen2', 'hashedpassword123', 'Admin'),
 
-- UT Southwestern Medical Center
('UTSW Admin 1', 'utsw1@bloodcenter.org', 'utsw1', 'hashedpassword123', 'Admin'),
('UTSW Admin 2', 'utsw2@bloodcenter.org', 'utsw2', 'hashedpassword123', 'Admin');

------------------------------------------------------------------------------------------------  
-- BLOOD INVENTORY TABLE
------------------------------------------------------------------------------------------------  
CREATE TABLE BloodInventory(
    InventoryID INT AUTO_INCREMENT PRIMARY KEY,
    HospitalID INT NOT NULL,
    BloodGroup VARCHAR(10) NOT NULL,
    UnitsAvailable INT DEFAULT 0,
    LastUpdated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (HospitalID) REFERENCES Hospital(HospitalID) ON DELETE CASCADE
)AUTO_INCREMENT= 5001;

INSERT INTO BloodInventory (HospitalID, BloodGroup, UnitsAvailable)
VALUES
-- UTD Student Health Center (HospitalID 1001)
(1001, 'A+', 12),
(1001, 'A-', 5),
(1001, 'B+', 10),
(1001, 'B-', 4),
(1001, 'AB+', 6),
(1001, 'AB-', 2),
(1001, 'O+', 15),
(1001, 'O-', 3),

-- Texas Health Presbyterian Hospital Dallas (HospitalID 1002)
(1002, 'A+', 20),
(1002, 'A-', 8),
(1002, 'B+', 15),
(1002, 'B-', 6),
(1002, 'AB+', 7),
(1002, 'AB-', 4),
(1002, 'O+', 25),
(1002, 'O-', 5),

-- Baylor University Medical Center (HospitalID 1003)
(1003, 'A+', 18),
(1003, 'A-', 6),
(1003, 'B+', 12),
(1003, 'B-', 4),
(1003, 'AB+', 8),
(1003, 'AB-', 2),
(1003, 'O+', 22),
(1003, 'O-', 5),

-- Methodist Richardson Medical Center (HospitalID 1004)
(1004, 'A+', 15),
(1004, 'A-', 5),
(1004, 'B+', 10),
(1004, 'B-', 3),
(1004, 'AB+', 5),
(1004, 'AB-', 1),
(1004, 'O+', 20),
(1004, 'O-', 2),

-- Medical City Plano (HospitalID 1005)
(1005, 'A+', 25),
(1005, 'A-', 7),
(1005, 'B+', 18),
(1005, 'B-', 6),
(1005, 'AB+', 9),
(1005, 'AB-', 3),
(1005, 'O+', 28),
(1005, 'O-', 4);


CREATE TABLE EmergencyDonationLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    DonorID INT NOT NULL,
    RequestID INT NOT NULL,
    HospitalID INT NOT NULL,
    BloodGroup VARCHAR(10) NOT NULL,
    UnitsDonated INT NOT NULL,
    DonationTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    Remarks VARCHAR(255),
    FOREIGN KEY (DonorID) REFERENCES Donor(DonorID) ON DELETE CASCADE,
    FOREIGN KEY (RequestID) REFERENCES BloodRequest(RequestID) ON DELETE CASCADE,
    FOREIGN KEY (HospitalID) REFERENCES Hospital(HospitalID) ON DELETE CASCADE
);

INSERT INTO EmergencyDonationLog 
(DonorID, RequestID, HospitalID, BloodGroup, UnitsDonated, Remarks)
VALUES
(12, 202501, 1001, 'O+', 2, 'Emergency donation for accident victim'),
(8, 202502, 1002, 'A-', 1, 'Immediate response from nearby donor'),
(19, 202503, 1003, 'B+', 3, 'Critical ICU requirement fulfilled'),
(5, 202504, 1001, 'O-', 2, 'High urgency trauma case'),
(23, 202505, 1004, 'AB+', 1, 'Donor arrived within 30 minutes'),
(9, 202506, 1005, 'A+', 2, 'Multi-unit donation for surgery'),
(15, 202507, 1002, 'O+', 3, 'Donor fulfilled emergency blood request'),
(11, 202508, 1003, 'B-', 1, 'Matched rare B- donor for child case'),
(6, 202509, 1005, 'A+', 2, 'Donor from alumni list'),
(18, 202510, 1004, 'AB-', 1, 'Critical maternity ward patient'),
(4, 202511, 1001, 'O+', 2, 'Emergency request fulfilled midnight'),
(10, 202512, 1002, 'A-', 1, 'Donor from faculty responded quickly'),
(20, 202513, 1003, 'B+', 2, 'Urgent multi-donor coordination'),
(7, 202514, 1004, 'AB+', 1, 'Immediate assistance for liver transplant'),
(13, 202515, 1005, 'A+', 2, 'Emergency response for highway accident'),
(21, 202516, 1002, 'O-', 1, 'Donor volunteered during night shift'),
(16, 202517, 1003, 'B+', 3, 'Fulfilled rare group emergency request'),
(22, 202518, 1004, 'AB-', 1, 'Urgent need for newborn child'),
(14, 202519, 1001, 'O+', 2, 'Donor contacted via alert system'),
(17, 202520, 1005, 'A-', 1, 'Emergency operation fulfilled successfully');


-------------------------------- SECTION 2- COMPLEX QUERIES-PROCEDURE-FUNCTIONS-TRIGGERS ----------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
-- COMPLEX QUERIES 
-- List hospitals with lowest blood stock (less than 5 units) of any group
SELECT h.HospitalName, b.BloodGroup, b.UnitsAvailable
FROM BloodInventory b
JOIN Hospital h ON b.HospitalID = h.HospitalID
WHERE b.UnitsAvailable < 5
ORDER BY b.UnitsAvailable ASC;

-- Least donors
SELECT 
    d.DonorID,
    d.Name AS DonorName,
    d.Email,
    d.ContactNumber,
    d.Department,
    d.Availability,
    COUNT(e.LogID) AS TotalDonations,
    IFNULL(MAX(e.DonationTime), 'No Donations Yet') AS LastDonationTime
FROM Donor d
LEFT JOIN EmergencyDonationLog e 
    ON d.DonorID = e.DonorID
GROUP BY d.DonorID, d.Name, d.Email, d.ContactNumber, d.Department, d.Availability
HAVING TotalDonations <= (
    SELECT MIN(cnt)
    FROM (
        SELECT COUNT(ed.DonorID) AS cnt
        FROM EmergencyDonationLog ed
        GROUP BY ed.DonorID
    ) AS donation_counts
)
ORDER BY TotalDonations ASC, LastDonationTime ASC;


-- ALERTS RECEIVED AND ACCEPTED
SELECT 
    d.DonorID,
    d.Name AS DonorName,
    bg.BloodGroup,
    d.Availability AS ActiveStatus,   -- 1 = Active, 0 = Inactive

    -- Total number of alerts for their blood group
    (SELECT COUNT(*)
     FROM EmergencyAlert ea
     WHERE ea.BloodGroup = bg.BloodGroup) AS TotalAlertsReceived,

    -- Total number of times donor accepted & donated for alerts
    (SELECT COUNT(DISTINCT edl.RequestID)
     FROM EmergencyDonationLog edl
     JOIN BloodRequest br ON edl.RequestID = br.RequestID
     WHERE edl.DonorID = d.DonorID
       AND br.BloodGroup = bg.BloodGroup) AS TotalAlertsAccepted,

    -- Acceptance percentage (protects against division by zero)
    CASE 
        WHEN (SELECT COUNT(*) FROM EmergencyAlert ea WHERE ea.BloodGroup = bg.BloodGroup) = 0 THEN 0
        ELSE ROUND(
            (
                (SELECT COUNT(DISTINCT edl.RequestID)
                 FROM EmergencyDonationLog edl
                 JOIN BloodRequest br ON edl.RequestID = br.RequestID
                 WHERE edl.DonorID = d.DonorID
                   AND br.BloodGroup = bg.BloodGroup)
                /
                (SELECT COUNT(*) FROM EmergencyAlert ea WHERE ea.BloodGroup = bg.BloodGroup)
            ) * 100, 2)
    END AS AcceptanceRatePercent

FROM Donor d
JOIN BloodGroup bg ON d.DonorID = bg.DonorID
ORDER BY d.Availability DESC, AcceptanceRatePercent DESC, TotalAlertsAccepted DESC
LIMIT 0, 5000;

 
-- Donors who donated more than once in a year
SELECT DonorID, COUNT(*) AS TotalDonations
FROM DonationHistory
GROUP BY DonorID
HAVING COUNT(*) > 1;

-- This query lists all donors who have fulfilled at least one emergency blood request, showing how many times they donated, total units given, their last donation date, and classifying them as Elite, Regular, or First-Time heroes based on activity.

SELECT 
    d.DonorID,
    d.Name AS DonorName,
    bg.BloodGroup,
    COUNT(edl.LogID) AS TotalEmergencyRequestsFulfilled,
    SUM(edl.UnitsDonated) AS TotalUnitsDonated,
    MAX(edl.DonationTime) AS LastEmergencyDonation,
    h.HospitalName,
    CASE 
        WHEN COUNT(edl.LogID) >= 5 THEN 'Elite Donor'
        WHEN COUNT(edl.LogID) BETWEEN 2 AND 4 THEN 'Regular Responder'
        ELSE 'First-Time Hero '
    END AS DonorStatus
FROM EmergencyDonationLog edl
JOIN Donor d ON edl.DonorID = d.DonorID
JOIN Hospital h ON edl.HospitalID = h.HospitalID
JOIN BloodGroup bg ON d.DonorID = bg.DonorID
GROUP BY d.DonorID, d.Name, bg.BloodGroup, h.HospitalName
HAVING COUNT(edl.LogID) >= 1
ORDER BY TotalEmergencyRequestsFulfilled DESC, LastEmergencyDonation DESC;


-- Blood groups most frequently requested across hospitals
SELECT BloodGroup, COUNT(*) AS RequestCount
FROM BloodRequest
GROUP BY BloodGroup
ORDER BY RequestCount DESC;
  
-- Count donors by role (student, faculty, staff, etc.) --Nivethidha
SELECT Role, COUNT(*) AS TotalDonors
FROM Donor
GROUP BY Role
ORDER BY TotalDonors DESC;

-- Total blood collected per event-- 
SELECT EventName, SUM(Quantity_ml)/1000 AS TotalLiters
FROM DonationHistory
GROUP BY EventName
ORDER BY TotalLiters DESC;

-- Show donors whose health records show “Low Haemoglobin”
SELECT d.Name, h.Haemoglobin_g_dL, h.MedicalConditions
FROM Donor d
JOIN HealthRecord h ON d.DonorID = h.DonorID
WHERE h.MedicalConditions LIKE '%Low Haemoglobin%';

-- Donors eligible but not yet fingerprint verified
SELECT d.Name, d.Role, h.IsEligible, d.FingerprintVerified
FROM Donor d
JOIN HealthRecord h ON d.DonorID = h.DonorID
WHERE h.IsEligible = 1 AND d.FingerprintVerified = 0;

-- Volunteers per event
SELECT e.EventName, COUNT(v.VolunteerID) AS TotalVolunteers
FROM Volunteer v
JOIN DonationEvent e ON v.AssignedEventID = e.EventID
GROUP BY e.EventName
ORDER BY TotalVolunteers DESC;

-- Lists all blood donation events, showing how many donors attended each and which sponsors supported them, ranked from the most attended event to the least attended one.
SELECT 
    de.EventID,
    de.EventName,
    de.Location,
    COUNT(DISTINCT dh.DonorID) AS TotalDonorsAttended,
    GROUP_CONCAT(DISTINCT es.SponsorID SEPARATOR ', ') AS Sponsors
FROM DonationEvent de
LEFT JOIN DonationHistory dh 
    ON de.EventName = dh.EventName
LEFT JOIN EventSponsor es 
    ON de.EventID = es.EventID
GROUP BY 
    de.EventID, 
    de.EventName, 
    de.Location
ORDER BY 
    TotalDonorsAttended DESC;
  

-- Total units of each blood group available across all hospitals
SELECT BloodGroup, SUM(UnitsAvailable) AS TotalUnits
FROM BloodInventory
GROUP BY BloodGroup
ORDER BY TotalUnits DESC;
----------------------------------------
-- To identify donors who haven’t been active (no donation or unverified fingerprint) for 30+ days and then “gently nudge” them with a friendly motivational message to encourage participation.
SELECT 
    d.DonorID,
    d.Name AS DonorName,
    d.Email,
    d.ContactNumber,
    d.Department,
    d.Availability,
    d.FingerprintVerified,
    d.LastDonationDate,
    DATEDIFF(CURDATE(), d.LastDonationDate) AS DaysSinceLastDonation,

    CASE 
        WHEN d.Availability = 0 THEN 'Bro... vanished from the donation scene? The blood bank’s missing you, not your excuses'
        WHEN d.FingerprintVerified = 0 THEN 'Verify your fingerprint already! Even your phone unlocks faster than your sense of responsibility'
        WHEN DATEDIFF(CURDATE(), d.LastDonationDate) > 60 THEN 'Two months gone. What’s next? A museum exhibit called “Once a Donor”?'
        WHEN DATEDIFF(CURDATE(), d.LastDonationDate) > 30 THEN 'Tick tock... it’s been over 30 days. Heroes don’t take month-long naps'
        ELSE 'Okay okay, you’re active. Don’t get too comfy — we’re still watching'
    END AS SavageMessage
FROM Donor d
WHERE 
    (d.LastDonationDate IS NULL 
     OR DATEDIFF(CURDATE(), d.LastDonationDate) > 30 
     OR d.Availability = 0 
     OR d.FingerprintVerified = 0)
ORDER BY DaysSinceLastDonation DESC, d.Availability ASC;


-- Donors who are not available but eligible for donation
SELECT d.Name, d.Role, d.Availability, h.IsEligible
FROM Donor d
JOIN HealthRecord h ON d.DonorID = h.DonorID
WHERE d.Availability = 0 AND h.IsEligible = 1;


------------------------------------------------------------------------------------------------  
------------------------------------- Procedure ------------------------------------------------
-- PROCEDURE 
------------------------------------------------------------------------------------------------  
-- Add a New Blood Request
DELIMITER $$
CREATE PROCEDURE AddBloodRequest(
    IN p_HospitalID INT,
    IN p_BloodGroup VARCHAR(30),
    IN p_Units INT
)
BEGIN
    INSERT INTO BloodRequest (HospitalID, BloodGroup, UnitsRequired, Status)
    VALUES (p_HospitalID, p_BloodGroup, p_Units, 'Pending');
END$$
DELIMITER ;

CALL AddBloodRequest(1001, 'O+', 3);
select * from bloodrequest;
SELECT * FROM BloodRequest ORDER BY RequestID DESC LIMIT 5;

-- Insert into Audit Log
DELIMITER $$
CREATE PROCEDURE LogAction(
    IN p_TableName VARCHAR(100),
    IN p_Operation VARCHAR(20),
    IN p_User VARCHAR(100),
    IN p_Description TEXT
)
BEGIN
    INSERT INTO AuditLog (TableName, Operation, User, Description)
    VALUES (p_TableName, p_Operation, p_User, p_Description);
END$$
DELIMITER ;
CALL LogAction(
    'Donor', 
    'INSERT', 
    'admin_test', 
    'Added new donor record for testing'
);
SELECT * 
FROM AuditLog 
ORDER BY LogID DESC 
LIMIT 5;

-- Get Donor Details by Role -- Nivethidha
DELIMITER $$
CREATE PROCEDURE GetDonorsByRole(IN p_Role VARCHAR(50))
BEGIN
    SELECT Name, Age, Gender, Department, Availability
    FROM Donor
    WHERE Role = p_Role;
END$$
DELIMITER ;
CALL GetDonorsByRole('Student');

SELECT Name, Age, Gender, Department, Availability
FROM Donor
WHERE Role = 'Student';

-- Check Total Blood Units by Hospital
DELIMITER $$
CREATE PROCEDURE HospitalInventorySummary(IN p_HospitalID INT)
BEGIN
    SELECT BloodGroup, UnitsAvailable
    FROM BloodInventory
    WHERE HospitalID = p_HospitalID;
END$$
DELIMITER ;
CALL HospitalInventorySummary(1001);
SELECT BloodGroup, UnitsAvailable
FROM BloodInventory
WHERE HospitalID = 1001
ORDER BY BloodGroup;

-- Fulfill a Blood Request and Update Inventory
DELIMITER $$
CREATE PROCEDURE FulfillRequest(IN p_RequestID INT)
BEGIN
    DECLARE v_HospitalID INT;
    DECLARE v_BloodGroup VARCHAR(30);
    DECLARE v_Units INT;

    SELECT HospitalID, BloodGroup, UnitsRequired INTO v_HospitalID, v_BloodGroup, v_Units
    FROM BloodRequest WHERE RequestID = p_RequestID;

    UPDATE BloodInventory
    SET UnitsAvailable = UnitsAvailable - v_Units
    WHERE HospitalID = v_HospitalID AND BloodGroup = v_BloodGroup;

    UPDATE BloodRequest
    SET Status = 'Fulfilled'
    WHERE RequestID = p_RequestID;
END$$
DELIMITER ;
-- Check request details before running the procedure
SELECT * FROM BloodRequest WHERE RequestID = 202501;
 
-- Check current inventory for the same hospital and blood group
SELECT * FROM BloodInventory WHERE HospitalID = 1001 AND BloodGroup = 'O+';
 
-- Call the procedure to fulfill the request
CALL FulfillRequest(202501);
 
-- Verify that the request status changed to 'Fulfilled'
SELECT * FROM BloodRequest WHERE RequestID = 202501;
 
-- Verify that the inventory units were reduced
SELECT * FROM BloodInventory WHERE HospitalID = 1001 AND BloodGroup = 'O+';

------------------------------------------------------------------------------------------------  
------------------------------ Function --------------------------------------------------------

-- Calculate BMI
DELIMITER $$
CREATE FUNCTION CalcBMI(weight DECIMAL(5,2), height DECIMAL(5,2))
RETURNS DECIMAL(5,2)
DETERMINISTIC
RETURN weight / ((height/100)*(height/100));
$$
DELIMITER ;
SELECT CalcBMI(70.00, 175.00) AS BMI;
-- Get Total Blood Requests per Hospital
DELIMITER $$
CREATE FUNCTION TotalRequests(p_HospitalID INT)
RETURNS INT
DETERMINISTIC
RETURN (
    SELECT COUNT(*) FROM BloodRequest WHERE HospitalID = p_HospitalID
);
$$
DELIMITER ;
SELECT TotalRequests(1001) AS TotalRequests_For_Hospital_1001;
-- Check Donor Eligibility--
DELIMITER $$
CREATE FUNCTION IsEligibleForDonation(haemo DECIMAL(4,1))
RETURNS BOOLEAN
DETERMINISTIC
RETURN haemo >= 12.5;
$$
DELIMITER ;
SELECT
    d.Name,
    hr.Haemoglobin_g_dL,
    -- This is the function call part
    IsEligibleForDonation(hr.Haemoglobin_g_dL) AS Eligibility_Check,
    hr.IsEligible AS Actual_Flag
FROM
    HealthRecord hr
JOIN
    Donor d ON hr.DonorID = d.DonorID
WHERE
    hr.Haemoglobin_g_dL < 12.5; 
-- Count Donations by Donor ID
DELIMITER $$
CREATE FUNCTION TotalDonations(p_DonorID INT)
RETURNS INT
DETERMINISTIC
RETURN (
    SELECT COUNT(*) FROM DonationHistory WHERE DonorID = p_DonorID
);
$$
DELIMITER ;
SELECT 
    DonorID, 
    TotalDonations(DonorID) AS TotalDonations
FROM DonationHistory
GROUP BY DonorID
ORDER BY DonorID;
-- Get Donor Age from DOB
DELIMITER $$
CREATE FUNCTION GetDonorAge(dob DATE)
RETURNS INT
DETERMINISTIC
RETURN TIMESTAMPDIFF(YEAR, dob, CURDATE());
$$
DELIMITER ;
SELECT GetDonorAge('2000-01-01') AS Age_Of_2000_01_01;

------------------------------------------------------------------------------------------------  
------------------------------- Trigger---------------------------------------------------------

-- Trigger to Auto-Insert Emergency Alert for Ongoing Requests
DELIMITER $$
CREATE TRIGGER trg_after_request_insert
AFTER INSERT ON BloodRequest
FOR EACH ROW
BEGIN
    IF NEW.Status = 'Pending' THEN
        INSERT INTO EmergencyAlert (RequestID, HospitalID, BloodGroup, Status)
        VALUES (NEW.RequestID, NEW.HospitalID, NEW.BloodGroup, 'Active');
    END IF;
END$$
DELIMITER ;
INSERT INTO BloodRequest (HospitalID, BloodGroup, UnitsRequired, RequestDate, Status)
VALUES (1003, 'A+', 2, CURRENT_DATE, 'Pending');
SELECT LAST_INSERT_ID();
 
SELECT * 
FROM EmergencyAlert
WHERE RequestID = 202532;

-- Auto-update donor eligibility based on health values
 DELIMITER $$
CREATE TRIGGER bu_healthrecord_check_eligibility
BEFORE UPDATE ON HealthRecord
FOR EACH ROW
BEGIN

   IF NEW.Haemoglobin_g_dL < 12.5 OR NEW.BMI < 18.5 OR NEW.BMI > 30 THEN
       SET NEW.IsEligible = 0;   -- donor not fit to donate
   ELSE
       SET NEW.IsEligible = 1;   -- donor fit to donate
   END IF;
END$$
DELIMITER ;

SELECT DonorID, Name, Haemoglobin_g_dL, BMI, IsEligible
FROM HealthRecord
WHERE DonorID = 1;   -- choose any valid donor ID


UPDATE HealthRecord
SET Haemoglobin_g_dL = 11.8, BMI = 32.5
WHERE DonorID = 1;
SELECT DonorID, Name, Haemoglobin_g_dL, BMI, IsEligible
FROM HealthRecord
WHERE DonorID = 1;


UPDATE HealthRecord
SET Haemoglobin_g_dL = 13.5, BMI = 24.0
WHERE DonorID = 1;
SELECT DonorID, Name, Haemoglobin_g_dL, BMI, IsEligible
FROM HealthRecord
WHERE DonorID = 1;


-- Automatic Data Sync Using a Trigger
DELIMITER $$
CREATE TRIGGER trg_auto_log_emergency_donation
AFTER UPDATE ON BloodRequest
FOR EACH ROW
BEGIN
    IF NEW.Status = 'Fulfilled' THEN
        INSERT INTO EmergencyDonationLog (
            DonorID, RequestID, HospitalID, BloodGroup, UnitsDonated, Remarks
        )
        SELECT 
            d.DonorID, 
            NEW.RequestID, 
            NEW.HospitalID, 
            NEW.BloodGroup, 
            NEW.UnitsRequired, 
            CONCAT('Emergency request fulfilled for ', NEW.BloodGroup, ' group')
        FROM Donor d
        WHERE d.Availability = 1 
          AND d.Role IN ('Student', 'Faculty', 'Staff', 'Alumni')
        ORDER BY RAND()
        LIMIT 1;   -- pick any eligible donor randomly
    END IF;
END$$
DELIMITER ;

SELECT * FROM BloodRequest WHERE RequestID = 202507;

UPDATE BloodRequest
SET Status = 'Fulfilled'
WHERE RequestID = 202507;

SELECT * FROM EmergencyDonationLog ORDER BY LogID DESC LIMIT 1;


-- Trigger to Reduce Inventory After Request Fulfilled
DELIMITER $$
CREATE TRIGGER trg_after_request_fulfilled
AFTER UPDATE ON BloodRequest
FOR EACH ROW
BEGIN
    IF NEW.Status = 'Fulfilled' THEN
        UPDATE BloodInventory
        SET UnitsAvailable = UnitsAvailable - NEW.UnitsRequired
        WHERE HospitalID = NEW.HospitalID AND BloodGroup = NEW.BloodGroup;
    END IF;
END$$
DELIMITER ;
SELECT *
FROM BloodInventory
WHERE HospitalID = (SELECT HospitalID FROM BloodRequest WHERE RequestID = 202503)
  AND BloodGroup = (SELECT BloodGroup FROM BloodRequest WHERE RequestID = 202503);
UPDATE BloodRequest
SET Status = 'Fulfilled'
WHERE RequestID = 202503;
SELECT *
FROM BloodInventory
WHERE HospitalID = (SELECT HospitalID FROM BloodRequest WHERE RequestID = 202503)
  AND BloodGroup = (SELECT BloodGroup FROM BloodRequest WHERE RequestID = 202503);



-- Auto Update Audit Log on BloodRequest Update
DELIMITER $$
CREATE TRIGGER trg_after_request_update
AFTER UPDATE ON BloodRequest
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (TableName, Operation, User, Description)
    VALUES ('BloodRequest', 'UPDATE', USER(), CONCAT('Status changed to ', NEW.Status, ' for RequestID ', NEW.RequestID));
END$$
DELIMITER ;

UPDATE BloodRequest
SET Status = 'In Progress'
WHERE RequestID = 202501;

SELECT 
    LogID, 
    TableName, 
    Operation, 
    User, 
    Description 
FROM 
    AuditLog 
ORDER BY 
    LogID DESC 
LIMIT 1;

























































   



