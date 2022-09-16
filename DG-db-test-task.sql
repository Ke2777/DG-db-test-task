USE TestDb

-- 1. ��������� � ������������ ���������� ������.
SELECT [name], salary 
FROM Employees 
WHERE salary = (SELECT max(salary) FROM Employees);

-- 2. �����, � ����� ������� ���������� ������ ����� ������������.
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

-- 3. �����, � ������������ ��������� ��������� �����������. 
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

-- 4. ����������, ��� ��� ���������� �� �л � ������������� �� ��.
SELECT [name]
FROM Employees
WHERE [name] like '�%�'