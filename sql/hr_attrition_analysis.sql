
-- HR Analytics & Employee Attrition
-- Project: IBM HR Analytics Attrition Dataset
-- Database: SQLite

-- 1. Check the total number of employee records
SELECT COUNT(*) AS total_employees
FROM hr_employee_attrition;

-- 2. Calculate overall attrition KPIs
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS employees_who_left,
    ROUND(
        100.0 * SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS attrition_rate_pct
FROM hr_employee_attrition;

-- 3. Analyze attrition by department
SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS employees_who_left,
    ROUND(
        100.0 * SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS attrition_rate_pct
FROM hr_employee_attrition
GROUP BY Department
ORDER BY attrition_rate_pct DESC;

-- 4. Analyze attrition by job role
SELECT
    JobRole,
    COUNT(*) AS total_employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS employees_who_left,
    ROUND(
        100.0 * SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS attrition_rate_pct
FROM hr_employee_attrition
GROUP BY JobRole
ORDER BY attrition_rate_pct DESC;

-- 5. Analyze attrition by overtime
SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS employees_who_left,
    ROUND(
        100.0 * SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS attrition_rate_pct
FROM hr_employee_attrition
GROUP BY OverTime
ORDER BY attrition_rate_pct DESC;

-- 6. Analyze attrition by age group
SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS employees_who_left,
    ROUND(
        100.0 * SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS attrition_rate_pct
FROM hr_employee_attrition
GROUP BY age_group
ORDER BY MIN(Age);
