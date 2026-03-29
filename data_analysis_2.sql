-- Where is location an IT Department?
SELECT
	d.department_name,
	l.state_province,
	c.country_name,
	r.region_name
FROM departments d
LEFT JOIN locations l ON d.location_id = l.location_id
LEFT JOIN countries c ON l.country_id = c.country_id
LEFT JOIN regions r ON c.region_id = r.region_id
WHERE d.department_name = 'IT'

