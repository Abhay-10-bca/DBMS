-- Lab Experiment 01: Implementation of DDL Commands in SQL
-- STUDENT NAME: 
-- USN: 
-- SECTION: 

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
/*'root@localhost', 'RVU-PC-018', '8.4.6', '2025-08-18 12:01:27'
*/
-- Scenario: University Course Management System
-- CREATE AND LOAD THE database DBLab001
-- Write your SQL query below Codespace:
create database lab001;
use lab001;
-- Task 1: Create the Students Table
-- Create a table to store information about students.
-- Include the following columns:
-- 1. StudentID (Primary Key)
-- 2. FirstName
-- 3. LastName
-- 4. Email (Unique Constraint)
-- 5. DateOfBirth

-- Write your SQL query below Codespace:
create table Students
(StudentID varchar(10) Primary Key,
firstname varchar(15),
lastname varchar(10),
Email varchar(12) unique,
dob date);

DESC STUDENTS; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
/*'StudentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'firstname', 'varchar(15)', 'YES', '', NULL, ''
'lastname', 'varchar(10)', 'YES', '', NULL, ''
'Email', 'varchar(12)', 'YES', 'UNI', NULL, ''
'dob', 'date', 'YES', '', NULL, ''
*/


-- Alter the table and 2 new columns
alter table Students
add (gender varchar(2));
desc Students;
alter table Students
add (age int);
desc Students;
-- Modify a column data type
alter table Students
modify lastname varchar(15);
desc Students;

-- Rename a column
alter table Students rename column lastname to surname;
desc Students;
-- Drop a column
alter table Students drop column age;
desc Students;
-- Rename the table
alter table Students rename to StudentDetails;
desc StudentDetails;
 




-- Task 2: Create the Courses Table
-- Create a table to store information about courses.
-- Include the following columns:
-- - CourseID (Primary Key)
-- - CourseName
-- - Credits

-- Write your SQL query below Codespace:
create table Courses
(CourseID varchar(10) Primary Key,
CourseName varchar(15),
Credits int);

DESC Courses; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- OUTPUT :
/*'CourseID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(15)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''
*/

-- Alter the table and 2 new columns
alter table Courses
add (CourseFaculty varchar(15));
desc Courses;
alter table Courses
add (CourseDept varchar(15));
desc Courses;
-- Modify a column data type
alter table Courses
modify CourseName varchar(15);
desc Courses;
-- Rename a column
alter table Courses rename column CourseFaculty to CourseFlt;
desc Courses;
-- Drop a column
alter table Courses drop column Credits;
desc Courses;
-- Rename the table
alter table Courses rename to CourseDetails;
desc CourseDetails;

-- Task 3: Create the Enrollments Table
-- Create a table to store course enrollment information.
-- Include the following columns:
-- - EnrollmentID (Primary Key)
-- - StudentID (Foreign Key referencing Students table)
-- - CourseID (Foreign Key referencing Courses table)
-- - EnrollmentDate

-- Write your SQL query below Codespace:
create table Enrollments
(EnrollmentID varchar(10) Primary Key,
StudentID varchar(10),
CourseID varchar(10),
Foreign Key (StudentID) references StudentDetails(StudentID),
Foreign Key (CourseID) references CourseDetails(CourseID));

DESC ENROLLMENTS; -- [ [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ] ]
-- OUTPUT :
/*'EnrollmentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'StudentID', 'varchar(10)', 'YES', 'MUL', NULL, ''
'CourseID', 'varchar(10)', 'YES', 'MUL', NULL, ''
*/
-- Alter the table and 2 new columns
alter table Enrollments
add (Year int);
desc Enrollments;
alter table Enrollments
add (Grade int);
desc Enrollments;
-- Modify a column data type
alter table Enrollments
modify grade varchar(5);
desc Enrollments;
-- Rename a column
alter table Enrollments rename column year to batch;
desc Enrollments;
-- Drop a column
alter table Enrollments drop column grade;
desc Enrollments;
-- Rename the table
alter table Enrollments rename to EnrollmentDetails;
desc EnrollmentDetails;

-- Task 4: Alter the Students Table
-- Add a column 'PhoneNumber' to store student contact numbers.

-- Write your SQL query below Codespace:
alter table StudentDetails
add(PhoneNumber int);

DESC STUDENTDETAILS; -- [[ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]]

-- Task 5: Modify the Courses Table
-- Change the data type of the 'Credits' column to DECIMAL.
-- Write your SQL query below Codespace:
alter table CourseDetails
modify Credits DECIMAL;
desc CourseDetails;

-- Task 6: Drop Tables

SHOW TABLES; -- Before dropping the table

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
desc CourseDetails;
desc EnrollmentDetails;

SHOW TABLES; -- After dropping the table Enrollement and Course
drop table CourseDetails;
drop table EnrollmentDetails;
-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01