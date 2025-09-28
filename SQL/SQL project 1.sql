--Project status
With Project_status AS(
SELECT project_id,project_name,project_budget,'upcoming'AS status
FROM [upcoming projects]
UNION
SELECT project_id,project_name,project_budget,'Completed'AS status
FROM completed_projects)
--Big Table
SELECT 
e.employee_id,
e.last_name,
e.first_name,
e.email,
e.job_title,
e.salary,
d.Department_Name,
pa.project_id,
P.project_name,
P.status
FROM employees AS e
JOIN departments AS d
    ON e.department_id = d.department_id
JOIN project_assignments AS PA
	ON PA.employee_id=e.employee_id
JOIN Project_status P
	ON P.project_id=PA.project_id