/*
Subqueries (in the Select, From, and Where Statement)
*/

Select EmplyoeeID, JobTitle, Salary
From EmployeeSalary

-- Subquery in Select

Select EmplyoeeID, Salary, (Select AVG(Salary) From EmployeeSalary) as AllAvgSalary
From EmployeeSalary

-- How to do it with Partition By
Select EmplyoeeID, Salary, AVG(Salary) over () as AllAvgSalary
From EmployeeSalary

-- Why Group By doesn't work
Select EmplyoeeID, Salary, AVG(Salary) as AllAvgSalary
From EmployeeSalary
Group By EmplyoeeID, Salary
order by EmplyoeeID


-- Subquery in From

Select a.EmplyoeeID, AllAvgSalary
From 
	(Select EmplyoeeID, Salary, AVG(Salary) over () as AllAvgSalary
	 From EmployeeSalary) a
Order by a.EmplyoeeID


-- Subquery in Where


Select EmplyoeeID, JobTitle, Salary
From EmployeeSalary
where EmplyoeeID in (
	Select EmplyoeeID 
	From EmplyoeeDemographics
	where Age > 30)