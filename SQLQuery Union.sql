SELECT *
FROM EmplyoeeDemographics


Select *
FROM EmployeeSalary

Select *
FROM WareHouseEmployeeDemographics 

Create Table WareHouseEmployeeDemographics
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')


SELECT *
FROM EmplyoeeDemographics
Full Outer Join WareHouseEmployeeDemographics
ON EmplyoeeDemographics.EmplyoeeID = 
   WareHouseEmployeeDemographics.EmployeeID

/* 
union if all columns of both tables are SAME
*/

SELECT *
FROM EmplyoeeDemographics
UNION
Select *
FROM WareHouseEmployeeDemographics 

SELECT *
FROM EmplyoeeDemographics
UNION ALL
Select *
FROM WareHouseEmployeeDemographics
ORDER BY EmplyoeeID

/*
union if columns of both tables are different.
But be careful of selecting data
*/

SELECT EmplyoeeID, FirstName, Age
FROM EmplyoeeDemographics
UNION
Select EmplyoeeID, JobTitle, Salary
FROM EmployeeSalary
ORDER BY EmplyoeeID