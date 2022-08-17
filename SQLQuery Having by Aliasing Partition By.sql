
/* Having Clause
*/

SELECT JobTitle, COUNT(JobTitle)
FROM EmplyoeeDemographics
JOIN EmployeeSalary
	ON EmplyoeeDemographics.EmplyoeeID = EmployeeSalary.EmplyoeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1


SELECT JobTitle, AVG(Salary)
FROM EmplyoeeDemographics
JOIN EmployeeSalary
	ON EmplyoeeDemographics.EmplyoeeID = EmployeeSalary.EmplyoeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)

/*
Updating Data
*/

SELECT *
FROM EmplyoeeDemographics

UPDATE EmplyoeeDemographics
SET EmplyoeeID = 1012, Age = 31, Gender = 'Female'
WHERE FirstName = 'Holly' AND LastName = 'Flax'

/* 
Deleting Data
*/

DELETE FROM EmplyoeeDemographics
WHERE EmplyoeeID = 1005

/*
 Aliasing 
 1. aliasing column name
*/

SELECT FirstName Fname
FROM EmplyoeeDemographics

SELECT FirstName + ' ' + LastName AS FullName
FROM EmplyoeeDemographics

SELECT AVG(Age) AS AvgAge
FROM EmplyoeeDemographics

/*
Aliasing Table Name
*/

SELECT Demo.EmplyoeeID,Sal.Salary
FROM EmplyoeeDemographics AS Demo
JOIN EmployeeSalary AS Sal
	ON Demo.EmplyoeeID = Sal.EmplyoeeID

SELECT Demo.EmplyoeeID,Sal.Salary
FROM EmplyoeeDemographics AS Demo
LEFT JOIN EmployeeSalary AS Sal
	ON Demo.EmplyoeeID = Sal.EmplyoeeID
LEFT JOIN WareHouseEmployeeDemographics AS Ware
	ON Demo.EmplyoeeID = Ware.EmployeeID

/*
Partition By
*/

SELECT FirstName, LastName, Gender, Salary,
	COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM EmplyoeeDemographics AS DemO
JOIN EmployeeSalary AS Sal
	ON DemO.EmplyoeeID = Sal.EmplyoeeID