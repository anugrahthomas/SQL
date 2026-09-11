
-- subqueries: query within a query

-- subquery in WHERE clause
SELECT * FROM employees 
WHERE salary > (
    SELECT AVG(salary) FROM employees
);

-- subquery in FROM clause
SELECT department_id, AVG(salary) as avg_salary
FROM (
    SELECT department_id, salary
    FROM employees
) as dept_salaries
GROUP BY department_id;

-- subquery in SELECT clause
SELECT name,
    (SELECT COUNT(*) FROM employees e2 WHERE e2.department_id = e1.department_id) as department_employee_count
FROM employees e1;

-- correlated subquery: a subquery that references a column from the outer query
SELECT name, salary
FROM employees e1
WHERE salary > (
    SELECT AVG(salary)
    FROM employees e2
    WHERE e1.department_id = e2.department_id
);

-- subquery with IN operator
SELECT name, department_id
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'New York'
);
-- subquery with EXISTS operator
SELECT name, department_id
FROM employees e1
WHERE EXISTS (
    SELECT 1
    FROM departments d
    WHERE e1.department_id = d.department_id
    AND d.location = 'New York'
);

-- subquery with NOT EXISTS operator
SELECT name, department_id
FROM employees e1
WHERE NOT EXISTS (
    SELECT 1
    FROM departments d
    WHERE e1.department_id = d.department_id
    AND d.location = 'New York'
);

-- subquery with ANY operator: 
SELECT name, salary
FROM employees
WHERE salary > ANY (
    SELECT salary
    FROM employees
    WHERE department_id = 10
);

-- subquery with ALL operator
SELECT name, salary
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE department_id = 10
);
