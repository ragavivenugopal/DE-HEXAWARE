# 🍔 Burger Bash SQL Case Study – Delivery & Sales Analysis

## 1. Project Objective

Burger Bash is a fictional burger delivery business that operates with runners (similar to Uber Eats). This case study aims to analyze:

- 🛒 Burger ordering patterns (popular items, customer behavior)
- 🚴 Runner performance (successful deliveries, cancellations)
- 📦 Operational insights to improve delivery efficiency and customer service

---

## 2. Tools Used

- **Database Platform:** Microsoft SQL Server (SSMS)
- **Query Language:** T-SQL
- **Data Entry:** Manual SQL scripts

---

## 3. Database Design

### Tables Included:
| Table Name        | Description                                           |
|-------------------|-------------------------------------------------------|
| `burger_names`    | Contains burger types like Meatlovers, Vegetarian     |
| `burger_runner`   | Runner registration details                           |
| `customer_orders` | Customer burger orders (per burger item)              |
| `runner_orders`   | Runner delivery activity and status                   |

Each table was created with appropriate `PRIMARY KEY` constraints and suitable data types such as `DATETIME2`, `VARCHAR`, and `INT`.

---

## 4. Files Included

| File Name                          | Purpose                                  |
|------------------------------------|------------------------------------------|
| `create_db.sql`                   | Creates the `burger_bash_db` database and selects it |
| `burger_names.sql`                | Creates and inserts data into `burger_names` table |
| `burger_runner.sql`               | Creates and inserts data into `burger_runner` table |
| `customer_orders.sql`             | Creates and inserts data into `customer_orders` table |
| `runner_orders.sql`               | Creates and inserts data into `runner_orders` table |
| `burger_bash_analysis_q1_to_q5.sql` | Contains SQL queries for questions 1 to 5 |

---

## 5. Analysis (Q1 to Q5)

This case study answers the following questions using SQL:

1. **How many burgers were ordered?**  
2. **How many unique customer orders were made?**  
3. **How many successful orders were delivered by each runner?**  
4. **How many of each type of burger was delivered?**  
5. **How many Vegetarian and Meatlovers were ordered by each customer?**

Each query was executed successfully, and insights were derived using `JOIN`, `GROUP BY`, `COUNT`, and conditional filters.

---

## 6. Summary

This SQL case study on Burger Bash helped analyze core delivery operations and customer behavior using raw SQL in Microsoft SQL Server.  
By observing delivery data and order history, we extracted meaningful insights that could help optimize business decisions for this food delivery startup.
