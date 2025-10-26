create database hospital;
use hospital;
create table patient(
patientid int primary key,
patientname varchar(15),
gender varchar(15),
dob date);
create table doctor(
doctorid int primary key,
doctorname varchar(15),
gender varchar(15),
departmentname varchar(20));
create table appointment(
appointmentid int primary key,
appointmentdate date,
patientid int,
doctorid int,
foreign key (patientid) references patient (patientid),
foreign key (doctorid) references doctor (doctorid));

INSERT INTO patient VALUES
(1, 'Asha Rao', 'Female', '2003-04-12'),
(2, 'Rahul Kumar', 'Male', '2002-10-05'),
(3, 'Sneha Patil', 'Female', '2003-07-22'),
(4, 'Rohit Sharma', 'Male', '2001-12-11'),
(5, 'Neha Singh', 'Female', '2002-01-25');

INSERT INTO doctor VALUES
(1, 'AA', 'Female', 'Heart'),
(2, 'BB', 'Male', 'Skin'),
(3, 'CC', 'Female','Leg'),
(4, 'DD', 'Male','Eyes'),
(5, 'EE', 'Female','Lungs');

INSERT INTO appointment VALUES
(01, '2024-06-10', 1, 2),
(02, '2024-07-01', 2, 2),
(03, '2024-06-15', 3, 1),
(04, '2024-05-20', 4, 3),
(05, '2024-07-05', 5, 4);

select count(*) as total_patients from patient;

SELECT 
    d.doctorid,
    d.doctorname,
    COUNT(a.appointmentid) AS patients_per_doc
FROM 
    doctor d
LEFT JOIN 
    appointment a ON d.doctorid = a.doctorid
GROUP BY 
    d.doctorid, d.doctorname;

SELECT p.patientname, d.doctorname, a.appointmentid
FROM patient p
INNER JOIN appointment a ON p.patientid = a.patientid
INNER JOIN doctor d ON a.doctorid = d.doctorid;

select d.doctorname,a.patientid, a.appointmentid
from doctor d
left join appointment a on d.doctorid=a.doctorid;

select d.doctorname, count(a.patientid) as patients_per_doc from doctor d left join appointment a on d.doctorid=a.doctorid group by d.doctorname;
