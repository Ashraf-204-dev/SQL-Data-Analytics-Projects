CREATE DATABASE manufacturing_production;

USE manufacturing_production;

SELECT database();

CREATE TABLE mould_master (
    mould_id VARCHAR(10) PRIMARY KEY,
    mould_name VARCHAR(255) NOT NULL,
    component VARCHAR(100),
    department VARCHAR(100)
);

SELECT * FROM mould_master;

# No.of Moulds
SELECT COUNT(*) AS total_moulds
FROM mould_master;

CREATE TABLE production_data (
    production_id INT PRIMARY KEY,
    mould_id VARCHAR(10) NOT NULL,
    production_date DATE NOT NULL,
    quantity INT NOT NULL,

    FOREIGN KEY (mould_id)
        REFERENCES mould_master(mould_id)
);

SELECT *  FROM production_data;

# No.of Production Records 
SELECT count(*) AS total_records FROM production_data;

CREATE TABLE calendar (
    calendar_date DATE PRIMARY KEY,
    day_name VARCHAR(15),
    day_number INT,
    month VARCHAR(15),
    year INT,
    is_weekend VARCHAR(3),
    production_status VARCHAR(20)
);

SELECT * FROM calendar;


SELECT count(*) AS total_records FROM calendar;

SHOW tables;

# Date Range
SELECT
    MIN(production_date) AS start_date,
    MAX(production_date) AS end_date
FROM production_data;

# Minimum Quantity
SELECT MIN(quantity) AS minimum_production
FROM production_data;

# Maximun Quantity
SELECT MAX(quantity) AS maximum_production
FROM production_data;

# Finding Invalid quantities
SELECT * FROM production_data
WHERE quantity < 70
   OR quantity > 150;

# Total Production
SELECT sum(quantity) as Total_Production FROM production_data;

#Daily Production 
SELECT
    production_date,
    SUM(quantity) AS daily_production
FROM production_data
GROUP BY production_date
ORDER BY production_date;

# Mould-Wise Production
SELECT
    m.mould_name,
    SUM(p.quantity) AS total_production
FROM production_data p
JOIN mould_master m
    ON p.mould_id = m.mould_id
GROUP BY
    m.mould_id,
    m.mould_name
ORDER BY total_production DESC;

# Average Production for all Moulds
SELECT
    m.mould_name,
    ROUND(AVG(p.quantity), 2) AS average_production
FROM mould_master m
JOIN production_data p
    ON m.mould_id = p.mould_id
GROUP BY
    m.mould_id,
    m.mould_name
ORDER BY average_production DESC;

# Production Ranking
SELECT
    m.mould_name,
    SUM(p.quantity) AS total_production,
    RANK() OVER (
        ORDER BY SUM(p.quantity) DESC
    ) AS production_rank
FROM mould_master m
JOIN production_data p
    ON m.mould_id = p.mould_id
GROUP BY
    m.mould_id,
    m.mould_name;
    
# Daily Production Ranking
WITH daily_production AS (
    SELECT
        production_date,
        SUM(quantity) AS total_production
    FROM production_data
    GROUP BY production_date
) SELECT
    production_date,
    total_production,
    RANK() OVER (
        ORDER BY total_production DESC
    ) AS day_rank
FROM daily_production
ORDER BY day_rank;    
    
# Production Contribution %
SELECT
    m.mould_name,
    SUM(p.quantity) AS total_production,
    ROUND(
        SUM(p.quantity) * 100.0 /
        (SELECT SUM(quantity) FROM production_data),
        2
    ) AS production_percentage
FROM mould_master m
JOIN production_data p
    ON m.mould_id = p.mould_id
GROUP BY
    m.mould_id,
    m.mould_name
ORDER BY production_percentage DESC;    
    
# Production Consistency
SELECT
    m.mould_name,
    MIN(p.quantity) AS minimum_production,
    MAX(p.quantity) AS maximum_production,
    ROUND(AVG(p.quantity), 2) AS average_production
FROM mould_master m
JOIN production_data p
    ON m.mould_id = p.mould_id
GROUP BY
    m.mould_id,
    m.mould_name
ORDER BY average_production DESC;
    
# Production Variation for Each Day
SELECT
    c.calendar_date,
    c.day_name,
    c.production_status,
    COALESCE(SUM(p.quantity), 0) AS total_production
FROM calendar c
LEFT JOIN production_data p
    ON c.calendar_date = p.production_date
GROUP BY
    c.calendar_date,
    c.day_name,
    c.production_status
ORDER BY c.calendar_date;


