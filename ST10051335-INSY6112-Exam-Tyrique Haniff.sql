-- Question 3.1
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    StudentSurname VARCHAR(50) NOT NULL,
    StudentNumber DATE NOT NULL
);

-- Question 3.2
CREATE TABLE Lecturer (
    LecturerID INT PRIMARY KEY,
    LecturerName VARCHAR(50) NOT NULL,
    LecturerSurname VARCHAR(50) NOT NULL
);

-- Question 3.3
CREATE TABLE Tutorial (
    TutorialID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    LecturerID INT NOT NULL,
    TutorialDate DATE NOT NULL,
    TutorialTime TIME NOT NULL,
    TutorialDuration INT NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Patient(StudentID),
    FOREIGN KEY (LecturerID) REFERENCES Doctor(LecturerID)
);

-- Question 3.4
INSERT INTO Student (StudentID, StudentName, StudentSurname, StudentNumber) VALUES
(1, 'Debbie', 'Theart', '123456'),
(2, 'Thomas', 'Duncan', '654321');

INSERT INTO Lecturer (LecturerID, LecturerName, LecturerSurname) VALUES
(1, 'Zintle', 'Nukani'),
(2, 'Ravi', 'Maharaj');

INSERT INTO Tutorials (
    TutorialsID, TutorialsDate, TutorialsTime, 
    TutorialsDuration, LecturerID, StudentID
) VALUES
(1, '2025-01-15', '09:00', 180, 2, 1),
(2, '2025-01-18', '15:00', 240, 2, 2),
(3, '2025-01-20', '10:00', 180, 1, 1),
(4, '2025-01-21', '11:00', 180, 2, 1);

-- Question 3.5
SELECT * 
FROM Tutorials 
WHERE TutorialsDate BETWEEN '2025-01-16' AND '2025-01-20';

-- Question 3.6
SELECT 
    p.StudentName,
    p.StudentSurname,
    COUNT(a.TutorialID) AS TotalTutorials
FROM Student p
LEFT JOIN tutorials a ON p.StudentID = a.StudentID
GROUP BY p.StudentID
ORDER BY TotalTutorials DESC;

-- Question 3.7
CREATE VIEW Lecturer2Students AS
SELECT DISTINCT
    p.StudentName,
    p.StudentSurname
FROM Student p
JOIN Tutorials a ON p.StudentID = a.StudentID
WHERE a.LecturerID = 2
ORDER BY p.StudentSurname ASC;