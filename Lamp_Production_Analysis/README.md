# 📌 Project Overview

This project focuses on analyzing **manufacturing production data using MySQL**. The main objective is to transform raw mould-wise production records into structured data and generate useful insights about production performance.

The project covers data organization, validation, SQL analysis, mould-wise performance comparison, daily production analysis, and identification of no-production days.

---

## 🎯 Problem Statement

Manufacturing companies generate large amounts of daily production data for different moulds and components. Analyzing raw production records manually can make it difficult to identify production trends, compare mould performance, and understand variations in daily output.

This project uses **MySQL and SQL queries** to analyze manufacturing production data and answer important business questions such as:

* What is the total production during the selected period?
* What is the average production for each mould?
* Which moulds have the highest production?
* Which days recorded the highest production?
* How does production vary between different moulds?
* What is the contribution of each mould to total production?
* Which moulds show higher or lower production levels?
* Which days were marked as **No Production**?

---

## 🗂️ Dataset

The dataset contains mould-wise production information for **May 2026**.

The database is divided into three tables:

### 1. `mould_master`

Contains master information about the moulds.

| Column       | Description                          |
| ------------ | ------------------------------------ |
| `mould_id`   | Unique ID of the mould               |
| `mould_name` | Name of the mould                    |
| `component`  | Component category                   |
| `department` | Department responsible for the mould |

### 2. `production_data`

Contains daily production records.

| Column            | Description                 |
| ----------------- | --------------------------- |
| `production_id`   | Unique production record ID |
| `mould_id`        | Mould ID                    |
| `production_date` | Date of production          |
| `quantity`        | Number of units produced    |

Production quantities for production days are maintained between **70 and 150 units**.

### 3. `calendar`

Contains date-related information for the analysis period.

| Column              | Description                    |
| ------------------- | ------------------------------ |
| `calendar_date`     | Calendar date                  |
| `day_name`          | Name of the day                |
| `day_number`        | Day number                     |
| `month`             | Month                          |
| `year`              | Year                           |
| `is_weekend`        | Indicates weekend              |
| `production_status` | Production Day / No Production |

Sundays are marked as **No Production**.

---

## 🛠️ Tools & Technologies

* **MySQL**
* **MySQL Workbench**
* **Microsoft Excel**
* **CSV**
* **SQL**

---

## 🧠 SQL Concepts Used

This project demonstrates practical use of:

* `SELECT`
* `WHERE`
* `ORDER BY`
* `GROUP BY`
* `HAVING`
* `INNER JOIN`
* `LEFT JOIN`
* `CASE`
* `COALESCE`
* Aggregate Functions
* Subqueries
* CTEs
* Date Functions
* Window Functions
* `RANK()`

---

## 📊 Analysis Performed

The project performs the following analysis:

### Production Analysis

* Total production
* Daily production
* Average production
* Minimum production
* Maximum production

### Mould Analysis

* Mould-wise total production
* Mould-wise average production
* Production ranking
* Mould contribution to total production
* Production variation between moulds

### Date Analysis

* Daily production trends
* Production and non-production days
* Calendar-based production analysis
* Identification of no-production days

---

## 🗄️ Database Structure

```text
manufacturing_production
│
├── mould_master
│   ├── mould_id (Primary Key)
│   ├── mould_name
│   ├── component
│   └── department
│
├── production_data
│   ├── production_id (Primary Key)
│   ├── mould_id (Foreign Key)
│   ├── production_date
│   └── quantity
│
└── calendar
    ├── calendar_date (Primary Key)
    ├── day_name
    ├── day_number
    ├── month
    ├── year
    ├── is_weekend
    └── production_status
```

---

