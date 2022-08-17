
/* 
Case statement 1
*/

SELECT *
FROM EmplyoeeDemographics

SELECT FirstName, LastName, Age
FROM EmplyoeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age

SELECT FirstName, LastName, Age,
CASE
	WHEN Age > 30 THEN 'Old'
	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
	ELSE 'Baby'
END
FROM EmplyoeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age

SELECT FirstName, LastName, Age,
CASE
	WHEN Age = 38 THEN 'Stanley'
	WHEN Age > 30 THEN 'Old'
	ELSE 'Baby'
END
FROM EmplyoeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age


/*
Case Statement 2
To calculate what their salary will be after they get raise 
*/

SELECT FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary* .10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary* .05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary* .000001)
	ELSE Salary + (Salary* .03)
END AS SalaryAfterRaise
FROM EmplyoeeDemographics
JOIN EmployeeSalary
	ON EmplyoeeDemographics.EmplyoeeID = EmployeeSalary.EmplyoeeID