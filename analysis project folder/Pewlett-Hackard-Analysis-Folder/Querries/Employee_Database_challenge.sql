-- deliverable 1

--PART 1/3 D1

SELECT e.emp_no,
		e.first_name,
		e.last_name,
		t.title_name,
		t.from_date,
t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN title AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;
SELECT * FROM retirement_titles
-- Use Dictinct with Orderby to remove duplicate rows for part 2/3 D1
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
		rt.first_name,
		rt.last_name,
		rt.title_name

INTO unique_titles
FROM retirement_titles AS rt
ORDER BY emp_no ASC, to_date DESC;
SELECT * FROM retirement_titles
--part 3/3 D1

SELECT COUNT(ut.emp_no),ut.title_name
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title_name
ORDER BY COUNT(title_name) DESC;
SELECT * FROM retirement_titles
SELECT * FROM retiring_titles
SELECT * FROM unique_titles
SELECT * FROM retirement_info
--Deliverable part 2
SELECT DISTINCT ON(e.emp_no)e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title_name
INTO mentor_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN title AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

SELECT * FROM mentor_eligibility