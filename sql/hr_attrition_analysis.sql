
-- ==========================================
-- HR ANALYTICS & EMPLOYEE ATTRITION PROJECT
-- Dataset: IBM HR Analytics Employee Attrition
-- Database: SQLite
-- ==========================================

-- 1. OVERALL HR KPIs

SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        AS employees_who_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS attrition_rate
FROM WA_FnUseC_HREmployeeAttrition
WHERE age IS NOT NULL AND TRIM(age) <> '';


-- 2. DEPARTMENT-WISE ATTRITION ANALYSIS

SELECT
    department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        AS employees_who_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS attrition_rate
FROM WA_FnUseC_HREmployeeAttrition
WHERE age IS NOT NULL AND TRIM(age) <> ''
GROUP BY department
ORDER BY attrition_rate DESC;


-- 3. JOB ROLE ANALYSIS

SELECT
    jobrole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        AS employees_who_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS attrition_rate
FROM WA_FnUseC_HREmployeeAttrition
WHERE age IS NOT NULL AND TRIM(age) <> ''
GROUP BY jobrole
ORDER BY attrition_rate DESC;


-- 4. OVERTIME ANALYSIS

SELECT
    overtime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        AS employees_who_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS attrition_rate
FROM WA_FnUseC_HREmployeeAttrition
WHERE age IS NOT NULL AND TRIM(age) <> ''
GROUP BY overtime
ORDER BY attrition_rate DESC;


-- 5. AGE GROUP ANALYSIS

SELECT
    CASE
        WHEN CAST(age AS INTEGER) < 25 THEN 'Under 25'
        WHEN CAST(age AS INTEGER) BETWEEN 25 AND 34 THEN '25-34'
        WHEN CAST(age AS INTEGER) BETWEEN 35 AND 44 THEN '35-44'
        WHEN CAST(age AS INTEGER) BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        AS employees_who_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS attrition_rate
FROM WA_FnUseC_HREmployeeAttrition
WHERE age IS NOT NULL AND TRIM(age) <> ''
GROUP BY age_group
ORDER BY MIN(CAST(age AS INTEGER));
