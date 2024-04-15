CREATE TABLE employee_table (
    employee TEXT NOT NULL,
    salary INTEGER
);

INSERT INTO employee_table (employee, salary) VALUES
('Alice', 11),
('Benn', 43),
('Charles', 33),
('Dorothy', 55),
('Emma', 22),
('Franklin', 33);

SELECT salary
FROM (
    SELECT DISTINCT salary
    FROM employee_table
    ORDER BY salary DESC
    LIMIT 3
) AS subquery
ORDER BY salary ASC
LIMIT 1;

