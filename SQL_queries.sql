USE TestDb

-- 1. Ñîòðóäíèê ñ ìàêñèìàëüíîé çàðàáîòíîé ïëàòîé.
SELECT [name], salary 
FROM Employees 
WHERE salary = (SELECT max(salary) FROM Employees);

-- 2. Îòäåë, ñ ñàìîé âûñîêîé çàðàáîòíîé ïëàòîé ìåæäó ñîòðóäíèêàìè.
WITH department_salary  AS
	(SELECT department_id, MAX(salary) as salary 
	FROM dbo.EMPLOYEE 
	GROUP BY department_id)
SELECT [id], [name] FROM dbo.DEPARTMENT
WHERE [id] = (SELECT department_id FROM department_salary 
WHERE department_salary.salary = (SELECT MAX(salary) FROM department_salary ));

-- 3. Îòäåë, ñ ìàêñèìàëüíîé ñóììàðíîé çàðïëàòîé ñîòðóäíèêîâ. 
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

-- 4. Ñîòðóäíèêà, ÷üå èìÿ íà÷èíàåòñÿ íà «Ð» è çàêàí÷èâàåòñÿ íà «í».
SELECT [name]
FROM Employees
WHERE [name] like 'Ð%í'
