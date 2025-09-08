-- Lab Experiment 01: Implementation of DDL Commands in SQL for the given scenarios
-- STUDENT NAME: 
-- USN: 
-- SECTION: 

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- Scenario: College Student Management System

-- CREATE AND LOAD THE database
-- Write your SQL query below Codespace:

create database College;
use College;

-- Task 1: Create the Tables under this system (min 5 tables)
  -- Table 01: Departments ( DepartmentID, DepartmentName, HOD,ContactEmail,PhoneNumber,Location )
  -- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
  -- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
  -- Table 04: Faculty FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
  -- Table 05: Enrollments (  EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
-- Specify the Key (Primary and Foreign) for each table while creating


-- Write your SQL query below Codespace:

create table Departments(
DepartmentID int Primary Key,
DepartmentName varchar(20),
HOD varchar(15),
ContactEmail varchar(20),
PhoneNumber int,
Location varchar(20));
create table Course(
CourseID int Primary Key,
CourseName varchar(15),
Credits int,
DepartmentID int,
Foreign Key (DepartmentID) references Departments (DepartmentID),
Duration varchar(15),
Fee int);
create table Students(
StudentID varchar(15) Primary Key,
FirstName varchar(15),
LastName varchar(15),
Email varchar(20) unique,
DOB date,
CourseID int,
Foreign Key (CourseID) references Course (CourseID));
create table Faculty(
FacultyID varchar(15) Primary Key,
FacultyName varchar(15),
DepartmentID int,
Foreign Key (DepartmentID) references Departments (DepartmentID),
Qualification varchar(15),
Email varchar(20) unique,
PhoneNumber int);
create table Enrollments(
EnrollmentID varchar(15) Primary Key,
StudentID varchar(15),
CourseID int,
Foreign Key (StudentID) references Students (StudentID),
Foreign Key (CourseID) references Course (CourseID),
Semester int,
Year date,
Grade varchar(5));

desc Departments;
desc Course;
desc Students;
desc Faculty;
desc Enrollments;

-- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code


--  describe the structure of each table and copy paste the Output 
/*'DepartmentID', 'int', 'NO', 'PRI', NULL, ''
'DepartmentName', 'varchar(20)', 'YES', '', NULL, ''
'HOD', 'varchar(15)', 'YES', '', NULL, ''
'ContactEmail', 'varchar(20)', 'YES', '', NULL, ''
'PhoneNumber', 'int', 'YES', '', NULL, ''
'Location', 'varchar(20)', 'YES', '', NULL, ''

'CourseID', 'int', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(15)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''
'DepartmentID', 'int', 'YES', 'MUL', NULL, ''
'Duration', 'varchar(15)', 'YES', '', NULL, ''
'Fee', 'int', 'YES', '', NULL, ''

'StudentID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(15)', 'YES', '', NULL, ''
'LastName', 'varchar(15)', 'YES', '', NULL, ''
'Email', 'varchar(20)', 'YES', 'UNI', NULL, ''
'DOB', 'date', 'YES', '', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, ''

'FacultyID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'FacultyName', 'varchar(15)', 'YES', '', NULL, ''
'DepartmentID', 'int', 'YES', 'MUL', NULL, ''
'Qualification', 'varchar(15)', 'YES', '', NULL, ''
'Email', 'varchar(20)', 'YES', 'UNI', NULL, ''
'PhoneNumber', 'int', 'YES', '', NULL, ''

'EnrollmentID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'StudentID', 'varchar(15)', 'YES', 'MUL', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, ''
'Semester', 'int', 'YES', '', NULL, ''
'Year', 'date', 'YES', '', NULL, ''
'Grade', 'varchar(5)', 'YES', '', NULL, ''*/




-- Perform the following operations on the each of the tables
-- 01: add 2 new columns for each table
-- 02: Modify the existing column from a table
-- 03 change the datatypes
-- 04: Rename a column
-- 05: Drop a column
-- 06: Rename the table
-- 07: describe the structure of the new table

alter table Departments
add(Block varchar(10), Room varchar(10));
desc Departments;

alter table Course
add(Subject1 varchar(10), Subject2 varchar(10));
desc Course;

alter table Students
add(height varchar(10), weight varchar(10));
desc Students;

alter table Faculty
add(room varchar(10), course varchar(10));
desc Faculty;

alter table Enrollments
add(StudentName varchar(10), course varchar(10));
desc Enrollments;

alter table Departments
modify DepartmentName varchar(15);
desc Departments;

alter table Students
modify height int;
desc Students;

alter table Students rename column LastName to Surname;
desc Students;

alter table Students drop column weight;
desc Students;

/*  Additional set of questions 
--1 Add a new column Address (VARCHAR(100)) to the Students table.
--2 Add a column Gender (CHAR(1)) to the Students table.
--3 Add a column JoiningDate (DATE) to the Faculty table.
--4 Modify the column CourseName in the Courses table to increase its size from VARCHAR(50) to VARCHAR(100).
--5 Modify the column Location in the Departments table to VARCHAR(80).
--6 Rename the column Qualification in the Faculty table to Degree.
--7 Rename the table Faculty to Teachers.
--8 Drop the column PhoneNumber from the Departments table.
--9 Drop the column Email from the Students table.
--10 Drop the column Duration from the Courses table.
*/

alter table Students
add(Address varchar(100));
desc Students;

alter table Students
add(gender char(1));
desc Students;

alter table Faculty
add(JoiningDate date);
desc Faculty;

alter table Course
modify CourseName varchar(100);
desc Course;

alter table Departments
modify Location varchar(80);
desc Departments;

alter table Faculty rename column Qualification to Degree;
desc Faculty;

alter table Faculty rename to Teachers;
desc Teachers;

alter table Departments drop column PhoneNumber;
desc Departments;

alter table Students drop column Email;
desc Students;

alter table Course drop column Duration;
desc Course;

SHOW TABLES; -- Before dropping the table

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:

drop table Course;
drop table Enrollments;

SHOW TABLES; -- After dropping the table Enrollement and Course

-- Note: Perform the specified operations on all the 5 tables in the system
-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabScenario01
