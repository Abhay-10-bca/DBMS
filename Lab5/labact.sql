-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Abhay M Biju
-- USN: 1RUA24BCA0001
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
create database lab004;
use lab004;

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate 
create table employee(
empID varchar(10) primary key,
firstname varchar(15),
lastname varchar(15),
salary int,
birthdate date,
hiredate date);

desc employee;

-- 2. Insert 10 records to employee;
insert into employee values('101','Raj','Kumar',2000,'2001-2-5','2024-4-3');
insert into employee values('102','Monish','Vijay',4000,'1999-4-7','2022-8-23');
insert into employee values('103','Ramesh','Vijay',5000,'1996-4-8','2021-8-25');
insert into employee values('104','Gaurav','Rao',10000,'2000-7-11','2019-5-11');
insert into employee values('105','Laxman','Bhat',7000,'2001-8-16','2019-10-6');
insert into employee values('106','Prahlad','Bhat',10000,'2002-11-19','2021-1-3');
insert into employee values('107','Varun','Mudaliar',8000,'1990-11-23','2017-9-30');
insert into employee values('108','Abhay','Biju',15000,'2003-12-12','2022-12-12');
insert into employee values('109','Akshatha','Kumar',8000,'2001-4-22','2022-1-24');
insert into employee values('110','Jhanavi','Kumar',4000,'2001-4-22','2022-1-24');
-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key)  
create table orders(
orderID varchar(10) primary key,
orderdate date,
totalamount int,
empID varchar(10),
foreign key(empID) references employee(empID));

desc orders;
-- 4. Insert 10 records to Orders
insert into orders values('1A','2025-8-2',200,101);
insert into orders values('1B','2025-8-2',400,102);
insert into orders values('1C','2025-8-2',500,103);
insert into orders values('1D','2025-8-2',700,104);
insert into orders values('1E','2025-8-2',100,105);
insert into orders values('1F','2025-8-2',250,106);
insert into orders values('1G','2025-8-2',180,107);
insert into orders values('1H','2025-8-2',780,108);
insert into orders values('1I','2025-8-2',220,109);
insert into orders values('1J','2025-8-2',1000,110);
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.

select* from employee;
select* from orders;


-- Output: 

/*
'101', 'Raj', 'Kumar', '2000', '2001-02-05', '2024-04-03'
'102', 'Monish', 'Vijay', '4000', '1999-04-07', '2022-08-23'
'103', 'Ramesh', 'Vijay', '5000', '1996-04-08', '2021-08-25'
'104', 'Gaurav', 'Rao', '10000', '2000-07-11', '2019-05-11'
'105', 'Laxman', 'Bhat', '7000', '2001-08-16', '2019-10-06'
'106', 'Prahlad', 'Bhat', '10000', '2002-11-19', '2021-01-03'
'107', 'Varun', 'Mudaliar', '8000', '1990-11-23', '2017-09-30'
'108', 'Abhay', 'Biju', '15000', '2003-12-12', '2022-12-12'
'109', 'Akshatha', 'Kumar', '8000', '2001-04-22', '2022-01-24'
'110', 'Jhanavi', 'Kumar', '4000', '2001-04-22', '2022-01-24'

'1A', '2025-08-02', '200', '101'
'1B', '2025-08-02', '400', '102'
'1C', '2025-08-02', '500', '103'
'1D', '2025-08-02', '700', '104'
'1E', '2025-08-02', '100', '105'
'1F', '2025-08-02', '250', '106'
'1G', '2025-08-02', '180', '107'
'1H', '2025-08-02', '780', '108'
'1I', '2025-08-02', '220', '109'
'1J', '2025-08-02', '1000', '110'
*/


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */

select firstname, round(salary) as roundedsalary from employee;
-- Output: 
/*
'Raj', '2000'
'Monish', '4000'
'Ramesh', '5000'
'Gaurav', '10000'
'Laxman', '7000'
'Prahlad', '10000'
'Varun', '8000'
'Abhay', '15000'
'Akshatha', '8000'
'Jhanavi', '4000'
*/

/* b. Absolute Values: Show absolute values of salaries */
select abs(salary) as abssalary from employee;
-- Output: 
/*
'2000'
'4000'
'5000'
'10000'
'7000'
'10000'
'8000'
'15000'
'8000'
'4000'
*/

/* c. Ceiling Values: Get ceiling values of order amounts */
select ceil(totalamount) as ceilingtotalamount from orders;
-- Output: 
/*
'200'
'400'
'500'
'700'
'100'
'250'
'180'
'780'
'220'
'1000'
*/

-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
select count(*) as totalemployees from employee;
-- Output: 
/*
 '10'
 */

/* b. Sum of Salaries: Calculate total salary expense */
select sum(salary) as totalsalary from employee;
-- Output: 
/* 
'73000'
*/

/* c. Average Order Amount: Find average order value */
select avg(totalamount) as averageordervalue from orders;
-- Output: 
/*
'433.0000'
*/
/* d. Max/Min Salary: Find highest and lowest salaries */
select max(salary) as highestsalary, min(salary) as lowestsalary from employee;
-- Output: 
/*
15000	2000
*/
-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
select upper(firstname) as uppername, lower(lastname) as lowername from employee;
-- Output: 
/*
'RAJ', 'kumar'
'MONISH', 'vijay'
'RAMESH', 'vijay'
'GAURAV', 'rao'
'LAXMAN', 'bhat'
'PRAHLAD', 'bhat'
'VARUN', 'mudaliar'
'ABHAY', 'biju'
'AKSHATHA', 'kumar'
'JHANAVI', 'kumar'
*/
/* b. Concatenate Names: Create full names */
select concat(firstname,lastname) as fullname from employee;
-- Output: 
/*
'RajKumar'
'MonishVijay'
'RameshVijay'
'GauravRao'
'LaxmanBhat'
'PrahladBhat'
'VarunMudaliar'
'AbhayBiju'
'AkshathaKumar'
'JhanaviKumar'
*/
/* c. Extract Substring: Get first 3 characters of first names */
select substring(firstname,1,3) as firstthreechars from employee;
-- Output: 
/*
'Raj'
'Mon'
'Ram'
'Gau'
'Lax'
'Pra'
'Var'
'Abh'
'Aks'
'Jha'
*/
-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert DATE to text type */
select cast(orderdate as char) as converteddata from orders;
-- Output: 
/*
'2025-08-02'
'2025-08-02'
'2025-08-02'
'2025-08-02'
'2025-08-02'
'2025-08-02'
'2025-08-02'
'2025-08-02'
'2025-08-02'
'2025-08-02'
*/
-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
select now() as currenttimestamp;
-- Output: 
/*
'2025-09-08 07:23:06'
*/
/* b. Extract Year: Get year from order dates */
select orderID, year(orderdate) as orderyear from orders;
-- Output: 
/*
'1A', 2025
'1B', 2025
'1C', 2025
'1D', 2025
'1E', 2025
'1F', 2025
'1G', 2025
'1H', 2025
'1I', 2025
'1J', 2025
*/
/* c. Add Months: Add 3 months to order dates */
select date_add(orderdate, interval 3 month) as finaldate from orders;
-- Output: 
/*
'2025-11-02'
'2025-11-02'
'2025-11-02'
'2025-11-02'
'2025-11-02'
'2025-11-02'
'2025-11-02'
*/
/* d. Days Since Order: Calculate days between order date and now */
select orderID, datediff(orderdate, now()) as dayssinceorder from orders;
-- Output: 
/*
'1A', '-37'
'1B', '-37'
'1C', '-37'
'1D', '-37'
'1E', '-37'
'1F', '-37'
'1G', '-37'
'1H', '-37'
'1I', '-37'
'1J', '-37'
*/
-- END of the Task -- 
