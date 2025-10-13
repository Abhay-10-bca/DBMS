-- Lab Experiment 08: Implementation of Procedure ( insert, update and delete)
-- STUDENT NAME: Abhay M Biju
-- USN: 1RUA24BCA0001
-- SECTION: A

SELECT USER(),
       @@hostname AS Host_Name,
       VERSION() AS MySQL_Version,
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- Scenario: Employee Management System
-- CREATE AND LOAD THE database DBLab008
-- Write your SQL query below Codespace:
create database DBLab008;
use DBLab008;
-- Task 1: Create the Employee Table
-- Create a table to store information about Employee.
-- Include the following columns:
 --   empid INT PRIMARY KEY,
   -- empname VARCHAR(50),
   -- age INT,
   -- salary DECIMAL(10,2),
   -- designation VARCHAR(30),
   -- address VARCHAR(100),
   -- date_of_join DATE
-- Write your SQL query below Codespace:
create table employee(
empid INT PRIMARY KEY,
empname VARCHAR(50),
age INT,
salary DECIMAL(10,2),
designation VARCHAR(30),
address VARCHAR(100),
date_of_join DATE);


-- DESCRIBE THE SCHEMA -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
desc employee;
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
/*
'empid', 'int', 'NO', 'PRI', NULL, ''
'empname', 'varchar(50)', 'YES', '', NULL, ''
'age', 'int', 'YES', '', NULL, ''
'salary', 'decimal(10,2)', 'YES', '', NULL, ''
'designation', 'varchar(30)', 'YES', '', NULL, ''
'address', 'varchar(100)', 'YES', '', NULL, ''
'date_of_join', 'date', 'YES', '', NULL, ''
*/


-- insert 10 records to the table
-- Write your SQL query below Codespace:

insert into employee values(01,'Ram',23,20000,'trainer','rr nagar','2022-09-02');
insert into employee values(02,'Shyam',27,40000,'employee','cv nagar','2024-09-23');
insert into employee values(03,'Kumar',28,50000,'assistant manager','mg road','2020-05-11');
insert into employee values(04,'Shiv',45,65000,'director','halasuru','2021-09-23');
insert into employee values(05,'Basil',34,10000,'intern','banaswadi','2025-11-18');
insert into employee values(06,'Aditya',25,200000,'ceo','hennur','2018-12-31');
insert into employee values(07,'Karan',49,34000,'clerk','kalyan nagar','2022-07-13');
insert into employee values(08,'Arjun',36,35000,'clerk','cox town','2022-09-02');
insert into employee values(09,'Lokesh',31,22000,'intern','indiranagar','2025-12-02');
insert into employee values(10,'Rohit',32,120000,'manager','vijaynagar','2019-09-02');

select* from employee;

-- COPYPASTE OF THE OUTPUT in CSV Format and terminate with ;
/*
'1', 'Ram', '23', '20000.00', 'trainer', 'rr nagar', '2022-09-02'
'2', 'Shyam', '27', '40000.00', 'employee', 'cv nagar', '2024-09-23'
'3', 'Kumar', '28', '50000.00', 'assistant manager', 'mg road', '2020-05-11'
'4', 'Shiv', '45', '65000.00', 'director', 'halasuru', '2021-09-23'
'5', 'Basil', '34', '10000.00', 'intern', 'banaswadi', '2025-11-18'
'6', 'Aditya', '25', '200000.00', 'ceo', 'hennur', '2018-12-31'
'7', 'Karan', '49', '34000.00', 'clerk', 'kalyan nagar', '2022-07-13'
'8', 'Arjun', '36', '35000.00', 'clerk', 'cox town', '2022-09-02'
'9', 'Lokesh', '31', '22000.00', 'intern', 'indiranagar', '2025-12-02'
'10', 'Rohit', '32', '120000.00', 'manager', 'vijaynagar', '2019-09-02'
*/
-- perform the following procedures on the employee database and copy paste the output in the space provided


-- 1. Write a stored procedure named InsertEmployee to insert a new employee record into the Employee table with all fields as input parameters.
DELIMITER $$

CREATE PROCEDURE InsertEmployee(
    IN p_empid INT,
    IN p_empname VARCHAR(50),
    IN p_age INT,
    IN p_salary DECIMAL(10,2),
    IN p_designation VARCHAR(30),
    IN p_address VARCHAR(100),
    IN p_date_of_join DATE
)
BEGIN
    INSERT INTO employee(empid, empname, age, salary, designation, address, date_of_join)
    VALUES(p_empid, p_empname, p_age, p_salary, p_designation, p_address, p_date_of_join);
END $$

DELIMITER ;
CALL InsertEmployee(11, 'Meena', 29, 45000, 'HR', 'Rajajinagar', '2023-06-15');


-- 2. Modify the insert procedure to ensure the employee’s age must be between 18 and 60.
      -- If not, display a message: "Invalid age, employee not added." n
DELIMITER $$

CREATE PROCEDURE InsertEmployeeAge(
    IN p_empid INT,
    IN p_empname VARCHAR(50),
    IN p_age INT,
    IN p_salary DECIMAL(10,2),
    IN p_designation VARCHAR(30),
    IN p_address VARCHAR(100),
    IN p_date_of_join DATE
)
BEGIN
    -- Check age condition
    IF p_age < 18 OR p_age > 60 THEN
        SELECT 'Invalid age, employee not added.' AS Message;
    ELSE
        INSERT INTO employee(empid, empname, age, salary, designation, address, date_of_join)
        VALUES(p_empid, p_empname, p_age, p_salary, p_designation, p_address, p_date_of_join);
        SELECT 'Employee added successfully.' AS Message;
    END IF;
END $$

DELIMITER ;

CALL InsertEmployeeAge(14, 'Reena', 17, 35000.00, 'Intern', 'Jayanagar', '2024-05-15');
CALL InsertEmployeeAge(15, 'Suresh', 30, 50000.00, 'Manager', 'Hebbal', '2022-11-01');

-- 3. Create a procedure that inserts a new employee record.
          -- If the salary is not provided, assign a default salary of 20000.
DELIMITER $$

CREATE PROCEDURE InsertEmployeeWithDefaultSalary(
    IN p_empid INT,
    IN p_empname VARCHAR(50),
    IN p_age INT,
    IN p_salary DECIMAL(10,2),
    IN p_designation VARCHAR(30),
    IN p_address VARCHAR(100),
    IN p_date_of_join DATE
)
BEGIN
    -- If salary is NULL or 0, assign default value 20000
    IF p_salary IS NULL OR p_salary = 0 THEN
        SET p_salary = 20000.00;
    END IF;

    INSERT INTO employee(empid, empname, age, salary, designation, address, date_of_join)
    VALUES(p_empid, p_empname, p_age, p_salary, p_designation, p_address, p_date_of_join);

    SELECT CONCAT('Employee ', p_empname, ' added successfully with salary ', p_salary) AS Message;
END $$

DELIMITER ;

CALL InsertEmployeeWithDefaultSalary(16, 'Ananya', 26, NULL, 'Designer', 'BTM Layout', '2024-10-13');

-- 4. Write a procedure that inserts three new employee records in a single procedure using multiple INSERT statements.
DELIMITER $$

CREATE PROCEDURE InsertThreeEmployees()
BEGIN
    INSERT INTO employee(empid, empname, age, salary, designation, address, date_of_join)
    VALUES (18, 'Neha', 25, 30000.00, 'Assistant', 'Rajajinagar', '2024-01-10');

    INSERT INTO employee(empid, empname, age, salary, designation, address, date_of_join)
    VALUES (19, 'Ramesh', 35, 45000.00, 'Supervisor', 'Koramangala', '2023-11-05');

    INSERT INTO employee(empid, empname, age, salary, designation, address, date_of_join)
    VALUES (20, 'Sneha', 28, 38000.00, 'Coordinator', 'Banashankari', '2024-02-20');

    SELECT 'Three employee records added successfully.' AS Message;
END $$

DELIMITER ;
CALL InsertThreeEmployees();

SELECT * FROM employee;


-- B.  Update Procedure
/*
Update Salary:
Write a stored procedure named UpdateSalary to update an employee’s salary based on their empid.*/
DELIMITER $$

CREATE PROCEDURE UpdateSalary(
    IN p_empid INT,
    IN p_new_salary DECIMAL(10,2)
)
BEGIN
    
    UPDATE employee
    SET salary = p_new_salary
    WHERE empid = p_empid;

    
    IF ROW_COUNT() = 0 THEN
        SELECT CONCAT('Employee with ID ', p_empid, ' not found.') AS Message;
    ELSE
        SELECT CONCAT('Salary of Employee ID ', p_empid, ' updated to ', p_new_salary) AS Message;
    END IF;
END $$

DELIMITER ;
CALL UpdateSalary(5, 15000.00);

/*Increment Salary by Percentage:
Create a procedure to increase the salary by 10% for all employees whose designation = 'Manager'.*/

DELIMITER $$

CREATE PROCEDURE IncrementManagerSalary()
BEGIN
    
    UPDATE employee
	SET salary = salary * 1.10
	WHERE designation = 'Manager' AND empid >= 1;


END $$

DELIMITER ;

CALL IncrementManagerSalary();

/*Update Designation:
Write a procedure to update the designation of an employee by empid.
Example: Promote an employee from 'Clerk' to 'Senior Clerk'.*/

DELIMITER $$

CREATE PROCEDURE UpdateDesignation(
    IN p_empid INT,
    IN p_new_designation VARCHAR(30)
)
BEGIN
    -- Update the designation for the given empid
    UPDATE employee
    SET designation = p_new_designation
    WHERE empid = p_empid;

    
END $$

DELIMITER ;
CALL UpdateDesignation(7, 'Senior Clerk');

/*Update Address:
Write a procedure to update the address of an employee when empid is given as input.*/
DELIMITER $$

CREATE PROCEDURE UpdateAddress(
    IN p_empid INT,
    IN p_new_address VARCHAR(100)
)
BEGIN
    
    UPDATE employee
    SET address = p_new_address
    WHERE empid = p_empid;

    
END $$

DELIMITER ;
CALL UpdateAddress(3, 'Fraser Town');

/*Conditional Update (Age Check):
Create a procedure that updates salary only if the employee’s age > 40; otherwise, print "Not eligible for salary update."
*/
DELIMITER $$

CREATE PROCEDURE UpdateSalaryIfAgeAbove40(
    IN p_empid INT,
    IN p_new_salary DECIMAL(10,2)
)
BEGIN
    DECLARE emp_age INT;
    
    SELECT age INTO emp_age
    FROM employee
    WHERE empid = p_empid;

   
	IF emp_age > 40 THEN
        UPDATE employee
        SET salary = p_new_salary
        WHERE empid = p_empid;
        SELECT CONCAT('Salary of Employee ID ', p_empid, ' updated to ', p_new_salary) AS Message;
    ELSE
        SELECT 'Not eligible for salary update.' AS Message;
    END IF;
END $$

DELIMITER ;
CALL UpdateSalaryIfAgeAbove40(4, 70000.00);

-- C. Delete Procedure
/*
Delete by empid:
Write a stored procedure named DeleteEmployee to delete an employee record using their empid.*/
DELIMITER $$

CREATE PROCEDURE DeleteEmployee(
    IN p_empid INT
)
BEGIN
    -- Delete the employee with the given empid
    DELETE FROM employee
    WHERE empid = p_empid;

END $$

DELIMITER ;
CALL DeleteEmployee(5);

/*Delete by Designation:
Create a procedure that deletes all employees belonging to a specific designation (e.g., 'Intern').*/
DELIMITER $$

CREATE PROCEDURE DeleteByDesignation(
    IN p_designation VARCHAR(30)
)
BEGIN
    DELETE FROM employee
	WHERE designation = 'Intern' AND empid >= 1;


END $$

DELIMITER ;
CALL DeleteByDesignation('Intern');

/*Delete Based on Salary Range:
Write a procedure to delete employees whose salary is less than ₹15000.*/
DELIMITER $$

CREATE PROCEDURE DeleteBySalaryRange()
BEGIN
    DELETE FROM employee
    WHERE salary < 15000 AND empid >= 1;

END $$

DELIMITER ;
CALL DeleteBySalaryRange();

/*Delete by Joining Year:
Write a procedure to delete employees who joined before the year 2015.
*/
DELIMITER $$

CREATE PROCEDURE DeleteByJoiningYear()
BEGIN
    DELETE FROM employee
    WHERE YEAR(date_of_join) < 2015 AND empid >= 1;

END $$

DELIMITER ;
CALL DeleteByJoiningYear();

select* from employee;

-- End of Lab Experiment
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01
