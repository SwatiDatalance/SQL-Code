-- General instructions how to open sql script
-- 1)Save sql query file in folder
-- 2) File – open sql script (open your file)
-- 3) Run create database DBNAME;
-- 4) Use DBNAME;
-- 5) Refresh
-- 6) Select entire query after Use statement and execute

-- To create new database
create database dbStudents;
-- always Refresh after creating new database

-- USE is used to tell sqlworkbench that we are using this particular database
use dbStudents;

-- creating new table in database
create table student
(Rollno int,
Sname varchar(40),
Gender varchar(10)
);

-- to display table names only (-- to display all table names in current DB)
show tables;

-- to display all column names of the table
select * from student;

-- insert values to table
insert into student values (1, "Sadiq", 'Male');
insert into student values (4, null, 'Male');

-- if we have to pass values to some specific columns
insert into student(rollno, Gender) values (1, 'Male');
insert into student(rollno, Gender) values (5, 'Female');

-- inserting values when PK and FK both are there
insert into student(rollno,Sname,Gender,Ccode,MobileNo) values(10,'Sam', 'Male', 15, 989961);


-- creating new table with some constraints in database
create table student
(
Rollno int primary key,
Sname varchar(40) not null,
Gender varchar(10) check(Gender in ('Male', 'Female')),
Loc varchar(50) default 'Bangalore'
); 

-- constraint composite primary key
create table student
(
Class int,
Rollno int,
Sname varchar(40) not null,
Gender varchar(10) check(Gender in ('Male', 'Female')),
Loc varchar(50) default 'Bangalore',
MobileNo numeric(10) unique not null,
Ccode int,
constraint fk_code foreign key(Ccode) references Course(Ccode),
constraint CPK_CR primary key(Class, Rollno)
); 

-- delete, drop, truncate
-- to delete table
drop table student;
-- to delete record only but table is there
delete from student where Rollno=10;

-- to UPDATE data  used to modify data
update student set loc ='New York' where loc = 10;

-- ALTER command
-- add new column
alter table student add Email varchar(100);
-- to drop column
alter table student drop column Loc;
-- to drop constraint
alter table student drop constraint  fk_Ccode;
-- to add constarint
alter table student add constraint fk_Ccode  foreign key(Ccode) references Course(Ccode);
-- string functions
-- UCASE to display in uppercase
-- LACSE to dispaly in lowercase
-- LENGTH to display count of character
select ucase(first_name), lcase(last_name), length(first_name) from employees;

-- when we want to dipaly only left cahracters
select left(first_name, 3) from employees;

-- mid, left , right,
select first_name,left(first_name,3), right(last_name,2), mid(first_name, 3,2), length(first_name) from employees;

-- concat 
select first_name, last_name, concat(first_name, ' ', last_name) as fullname from employees;

-- trim to remove those particular spaces that is on the extremes, it will not remove spaces in between the data
select trim('      Mohd     Sadiq      ');
--- output Mohd     Sadiq



-- About select statements
-- TRICK bedore selecting column name, write table name, it will help to autofill the column name

-- to display complete data in employees table
select * from employees;

-- ALIAS AS (to change column name)
select employee_id, first_name, last_name, salary *12 as "Annual Salary" from employees;

-- expressions
select * from employees where first_name regexp '^[a-h]$'
order by first_name;
-- ('^SH') (^representing begining of string)
-- ('na$') ( $ represents end of string)
-- ^[^b-h] (not b-h)
-- ^[^bh] (not bh -- not specific character like bh)

-- distinct is used to remove duplicates recordes
select distinct department_id from employees;

-- =,!=, <>, >=, <=
select * from employees where department_id = 10;
select * from employees where department_id != 10;
select * from employees where department_id <> 10;
select * from employees where salary >=12000;

-- Logical operators AND OR NOT
select * from employees where salary >=12000 and department_id = 10;

-- Use ' ' quotation marks for string and date
select * from employees where first_name = 'Nancy';
select * from employees where hire_date>='1998-02-05';

-- BETWEEN is used to give range
select * from employees where salary >=10000 and salary<=15000;
select * from employees where salary not between 10000 and 15000;

-- IN is used for comparing group of values 
select * from employees where department_id = 5 or department_id =10 or department_id = 6;
select * from employees where department_id IN(5,10,6);
select * from employees where department_id NOT IN(5,10,6);

-- wildcard % (palceholder for any length of characters)
-- wildcard _ ( placeholder for only one character)
select * from employees where first_name like 'A%';
select * from employees where first_name like '%A';
select * from employees where first_name like '_A%';
select * from employees where first_name like '%A%';
select * from employees where first_name not like '%A%';

-- NEXT SESSION

-- FUNCTIONS
-- Mathematical Functions
-- mathematical calculations can be performed using SELECT clause
select 2/5;
select sqrt(4);
select pow(2,3);
-- MOD() finds the remainder
select mod(11,3);
-- SIGN() wheather the number is positive(green) or negative(red)
select sign(0);
-- ABS() absolute it shows the number positive only, wheather it is negative or positive
select abs(-45);
-- output 45

-- ROUND() rounds to the nearest integer
select round (5.68, 0);
-- output 6
-- to show how many thousnads are there
select round(456883.75, -3);
-- output 457000
-- to show how many lakhs are there
select round(446883.75, -5);
-- output 400000

-- CEIL() finds the next nearest upper integer
select ceil(5.2);
-- output 6
select ceil(45.00000);
-- output 46

-- FLOOR() finds the before lower integer
select floor(5.8);
-- output 6
select floor(45.99999);
-- output 45

-- example from northwind database
show tables;
select productname, unitprice, round(unitprice,0),
ceil(unitprice) as ceiledvalue,
floor(unitprice) as flooredvalue
from products;
-- NOTE: Widely used in financial sector (ROUND(), CEIL() (receive money), FLOOR() (outflow money))

-- DATE FUNCTIONS

-- to show current date
select curdate();
-- or
select current_date();
-- to show current time
select current_time();

-- DATE_ADD(): to add days to present days
-- adding number of days to current date
-- here adding 28 days to current date
select date_add(curdate(), interval 28 day);

-- adding 6 months interval to the current date
select date_add(curdate(), interval 6 month);

-- adding 6 years interval to the current date
select date_add(curdate(), interval 6 year);

-- DAYNAME to extract the week day name from date like mon, tue, wed ....
select dayname(curdate() AS DayName);
-- example from HR database
select first_name, hire_date, dayname(hire_date) from employees;

-- EXTRACT to get year, month, day, hour, minute, second from given date
select extract(year from curdate());
select extract(month from curdate());
select extract(day from curdate());
select extract(hour from curtime());
select extract(minute from curtime());
select extract(second from curtime());

--  example from HR database
select first_name, hire_date, extract(Month from hire_date) from employees;

-- query to show employees hired after 1995 year
select * from employees
where extract(year from hire_date)>1995; 

-- DATEDIFF to get difference between two dates
-- example
select first_name, hire_date, datediff(curdate(), hire_date) from employees;

-- CONVERSION FUNCTIONS (cast, convert)
-- CAST is used to convert one datatype to another
select CAST('-123' AS signed integer) int_char;
select concat('Swati', convert(5, char));


-- JOINS (joining data from multiple tables and getting single table output )

select * from employees;
select * from departments;
select distinct department_id from employees;

select employee_id, first_name, employees.department_id, department_name
from employees, departments
where employees.department_id = departments.department_id;

-- with alias (for our clarity and simplicity)
select employee_id, first_name, e.department_id, department_name
from employees e, departments d
where e.department_id = d.department_id;

-- NOW USING JOIN
select employee_id, first_name, e.department_id, department_name
from employees e JOIN departments d
ON e.department_id = d.department_id;

-- we can use join and where clause both to give conditions
select employee_id, first_name, e.department_id, department_name
from employees e JOIN departments d
ON e.department_id = d.department_id
where d.department_id = 10;

-- if we have multiple columns
select employee_id, first_name, e.department_id, department_name
from employees e JOIN departments d
ON e.department_id = d.department_id and -----
where d.department_id = 10;

-- TYPES OF JOIN (inner and outer)
-- INNER JOIN (same as join)( getting only common information)
select employee_id, first_name, e.department_id, department_name
from employees e INNER JOIN departments d
ON e.department_id = d.department_id;

-- OUTER JOIN (gives common information and also complete data that doesn't match but based on right or left join)
-- LEFTCOLUMN JOIN RIGHTCOLUMN
-- LEFT JOIN (matching data and also data from left table)
select employee_id, first_name, e.department_id, department_name
from employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;

-- RIGHT JOIN (matching data and also data from right table)
select employee_id, first_name, e.department_id, department_name
from employees e RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id;

-- USING clause (if column name are same then we can use using clause, DB is well structured)
select employee_id, first_name, e.department_id, department_name
from employees e RIGHT OUTER JOIN departments d
using(department_id);

-- SELF JOIN (when FK is refreeing to PK of same table)
select e.employee_id, e.first_name, m.first_name as manager_name
from employees e JOIN employees m
ON e.manager_id = m.employee_id;

-- CROSS JOIN (informal join )
select employee_id, first_name, department_name
from employees CROSS JOIN departments;

-- new version of JOIN is NATURAL JOIN
-- NATURAL JOIN (we dont have to specify ON joining condition, automatically detects that 
-- but common column name should be same in both the table)
-- in case of normal joins we dont have to specify the joining condition and ALIAS
select employee_id, first_name, department_id, department_name
from employees  NATURAL JOIN departments;

-- three table joins

select * from employees;
select * from departments;
select * from locations;

-- to get employee with department name as well as where they are working location
select e.employee_id, First_name, department_name, State_province, City
from employees e JOIN departments d
ON e.department_id = d.department_id
JOIN Locations l
ON d.location_id = l.location_id; 

-- EXAMPLE
-- to show IT guys
select e.employee_id, First_name, department_name, State_province, City
from employees e JOIN departments d
ON e.department_id = d.department_id
JOIN Locations l
ON d.location_id = l.location_id
where d.department_name = 'IT';

-- same query using natural join (best answer)
select e.employee_id, First_name, department_name, State_province, City
from employees e NATURAL JOIN departments d
NATURAL JOIN Locations l;

-- AGGREGATE functions --- COUNT, SUM, MIN, MAX, AVG ---
-- COUNT (returns number of rows) (grouping rows and the counting)
-- * safest way to get row count
select count(*) from products;
-- if we use any specific column name then count will not count null values, 
select count(productid) from products;

-- SUM
select sum(UnitsInStock) from products;

-- AVERAGE
select avg(UnitsInStock) from products;
-- we can write together also
select sum(UnitsInStock), avg(UnitsInStock) from products;

-- MAX
-- to know the costiest price
select max(unitprice) from products;

-- MIN
-- to know lowest price
select min(Unitprice) from products;


-- GROUP BY
-- subtotal -- to see products in categorywise
select count(*) from products
group by categoryID;

-- column name we are using with group by, we can use in select to display data 
-- but generally we do not use other column names with aggreagate functions in select clause
select categoryID, count(*) from products
group by categoryID;

select categoryID, count(*) as NOP, sum(unitsinstock) as TotalStock from products
group by categoryID;

-- ORDER BY
-- grouping on multiple columns(multilevel grouping)
select categoryID, supplierID, count(*) from products
group by categoryID, supplierID
order by categoryID, supplierID;

-- EXAMPLE
-- query to display no. of customers countrywise
select country, count(*) from customers
group by country;
-- query to display no. of customers countrywise and citywise
select country, city,count(*) from customers
group by country, city
order by country, city;

-- IMPORTANT NOTE
-- where clause cannot be used with aggregate functions---cannot be used with aggregated data
-- HAVING Clause -- filtering on grouped data

-- EXAMPLE
-- Query to have only those data where total number of products is minimum or equal to 10
select categoryID, count(*) from products
group by categoryID
having count(*) >=10;

-- IMPORTANT: Difference between WHERE and HAVING
-- WHERE is used filtering on actual data whereas HAVING is used filtering on grouped data
-- WHERE is independent clause but HAVING is always used with group by
-- WHERE cannot be used with aggregated data but HAVING can be used with aggregated data

-- EXAMPLE Query
select categoryID, count(*)  as NOP, sum(Unitsinstock) as TotalStock from products
where unitprice > 5
group by categoryID
having TotalStock > 300;

-- query to have total count of orders employeewise with their firstname
select firstname, count(*) 
from orders natural JOIN employees
group by firstname;

-- query
select firstname, count(*) 
from orders natural JOIN employees
group by firstname
having count(*) >100;
 
-- how to use group by with Date functions
select year(orderdate), count(*) from orders
group by year(orderdate);

-- query to display quaterwise sales,
select  extract(quarter from orderdate), count(*) from orders
group by extract(quarter from orderdate);

-- MULTILEVEL query
-- query quarterwise with year display
select extract(year from orderdate), extract(quarter from orderdate), count(*) from orders
group by extract(year from orderdate), extract(quarter from orderdate);

-- IMPORTANT: SEQUENCE OF QUERY
-- 1 select (to specify what columns name)
-- 2 from (table selection)
-- 3 where
-- 4 group by (if using aggregate functions, subdivide the data)
-- 5 having (filtering on grouped data after group by only)
-- 6 order by (sorting data by default asc or we can use desc, we cannot have any other clause after order by))
select categoryID, count(*)  as NOP, sum(Unitsinstock) as TotalStock 
from products
where unitprice > 5
group by categoryID
having TotalStock > 300
order by totalstock desc;

-- DROP, DELETE AND TRUNCATE

-- DROP --WHOLE TABLE WILL BE REMOVED 
-- DELETE -- SELECTIVELY DELETING THE PARTICULAR RECORD with all constarints of record
-- TRUNCATE -- complete data is gone but table structure is there 
-- table structure like PK, FK, constraints 
select * from emp;
delete from emp where id =3;
truncate table emp;

-- IMPORTANT: Difference between DROP and TRUNCATE
-- IMPORTANT: Difference between DELETE and TRUNCATE
-- With DELTEE, where clause can be used but not with TRUNCATE and DROP
-- DELETE is DML command, -- they manintanin rollback but TRUNCATE is DDL-- we cannot get back to data, much faster
-- DROP is a DDL Command



