USE TestDb

-- 1. Сотрудник с максимальной заработной платой.
SELECT [name], salary 
FROM Employees 
WHERE salary = (SELECT max(salary) FROM Employees);

-- 2. Отдел, с самой высокой заработной платой между сотрудниками.
WITH department_salary AS
	(SELECT department_id, SUM(salary) as salary 
	FROM dbo.Employees
	GROUP BY department_id)
SELECT ID, [name] 
FROM Department
WHERE ID = 
	(SELECT department_id
	FROM department_salary
	WHERE department_salary.salary =
	(SELECT MAX(salary) FROM department_salary));

-- 3. Отдел, с максимальной суммарной зарплатой сотрудников. 
WITH department_salary AS
	(SELECT department_id, SUM(salary) as salary 
	FROM dbo.Employees
	GROUP BY department_id)
SELECT ID, [name] 
FROM Department
WHERE ID = 
	(SELECT department_id
	FROM department_salary
	WHERE department_salary.salary =
	(SELECT MAX(salary) FROM department_salary));

-- 4. Сотрудника, чье имя начинается на «Р» и заканчивается на «н».
SELECT [name]
FROM Employees
WHERE [name] like 'Р%н'