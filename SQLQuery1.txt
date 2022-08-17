SELECT *
FROM SQLTutorial.dbo.EmplyoeeDemographics


Select *
FROM SQLTutorial.dbo.EmployeeSalary

INSERT INTO EmplyoeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly','Flax', NULL, 'Male'),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

INSERT INTO EmployeeSalary VALUES
(1010, NULL, 47000),
(NULL, 'Salesman', 43000)

DELETE FROM EmplyoeeDemographics
WHERE FirstName = 'John'

SELECT *
FROM EmplyoeeDemographics
Inner Join EmployeeSalary
ON EmplyoeeDemographics.EmplyoeeID = EmployeeSalary.EmplyoeeID

SELECT *
FROM EmplyoeeDemographics
Full Outer Join EmployeeSalary
ON EmplyoeeDemographics.EmplyoeeID = EmployeeSalary.EmplyoeeID

SELECT *
FROM EmplyoeeDemographics
Left Outer Join EmployeeSalary
ON EmplyoeeDemographics.EmplyoeeID = EmployeeSalary.EmplyoeeID

SELECT *
FROM EmplyoeeDemographics
Right Outer Join EmployeeSalary
ON EmplyoeeDemographics.EmplyoeeID = EmployeeSalary.EmplyoeeID

SELECT EmplyoeeDemographics.EmplyoeeID FirstName, LastName, JobTitle, Salary
FROM EmplyoeeDemographics 
Inner Join EmployeeSalary
ON EmplyoeeDemographics.EmplyoeeID = EmployeeSalary.EmplyoeeID

SELECT EmployeeSalary.EmplyoeeID FirstName, LastName, JobTitle, Salary
FROM EmplyoeeDemographics 
Inner Join EmployeeSalary
ON EmplyoeeDemographics.EmplyoeeID = EmployeeSalary.EmplyoeeID

SELECT EmplyoeeDemographics.EmplyoeeID FirstName, LastName, JobTitle, Salary
FROM EmplyoeeDemographics 
Right Outer Join EmployeeSalary
ON EmplyoeeDemographics.EmplyoeeID = EmployeeSalary.EmplyoeeID

SELECT EmployeeSalary.EmplyoeeID FirstName, LastName, JobTitle, Salary
FROM EmplyoeeDemographics 
Right Outer Join EmployeeSalary
ON EmplyoeeDemographics.EmplyoeeID = EmployeeSalary.EmplyoeeID

/* 
use case 1
 Find emplyoee who who makes the most money other than Michael Scott
*/

SELECT *
FROM EmplyoeeDemographics 
Full Outer Join EmployeeSalary
ON EmplyoeeDemographics.EmplyoeeID = EmployeeSalary.EmplyoeeID

SELECT EmplyoeeDemographics.EmplyoeeID, FirstName, LastName, Salary
FROM EmplyoeeDemographics 
Inner Join EmployeeSalary
ON EmplyoeeDemographics.EmplyoeeID = EmployeeSalary.EmplyoeeID
WHERE FirstName<> 'Michael'
Order By Salary DESC

/* use case 2
calculate average salary for salesman
*/

SELECT JobTitle, AVG(Salary)
FROM EmplyoeeDemographics 
Inner Join EmployeeSalary
ON EmplyoeeDemographics.EmplyoeeID = EmployeeSalary.EmplyoeeID
WHERE JobTitle = 'Salesman'
Group By JobTitle
