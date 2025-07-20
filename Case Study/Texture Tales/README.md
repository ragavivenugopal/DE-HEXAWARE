#  Texture Tales Case Study

##  Project Overview

This SQL project is focused on analyzing sales performance using multiple relational tables. It replicates a real-world scenario where multiple sources like sales data, product details, and pricing structure are combined to draw meaningful business insights.

##  1. Created the Database

A new database named `SalesAnalysisDB` was created in SQL Server Management Studio (SSMS) using `CREATE DATABASE` command.

##  2. Designed and Created Tables

## sales Table

Stores transactional data with columns like `txn_id`, `product_id`, `quantity_sold`, `discount`, `txn_date`.

## product_details Table

Contains descriptive information about each product including `product_id`, `product_name`, and `segment_name`.

## product_prices Table

Maintains price-related information for each product, including `product_id` and `price`.

## product_hierarchy Table

Defines the product classification with `product_id`, `category`, and `subcategory` to support hierarchical analysis.

##  3. Inserted Sample Records

Sample data was manually inserted into all four tables using `INSERT INTO` queries. At least five records were added per table to ensure sufficient data for testing joins, filters, and aggregations.

##  4. Performed Data Analysis

Multiple queries were written to analyze sales trends, segment performance, and top products. Aggregates like `SUM`, `AVG`, and SQL joins were used to extract combined insights from all related tables.

##  5. Captured Screenshots

Screenshots were taken for each of the following steps:
Database creation, table creation, data insertion, and final output of each analysis query.

##  6. Practiced Joins and Aggregations

INNER JOIN, LEFT JOIN, and aggregate functions like `SUM`, `COUNT`, and `AVG` were used to connect tables and perform calculations on grouped data.

##  7. Implemented Subqueries and Filters

Subqueries were used for ranking and filtering top-performing products. Filtering was performed using `WHERE`, `GROUP BY`, `HAVING`, and `ORDER BY` clauses.

##  8. Used Window Functions

Applied `ROW_NUMBER()` and `RANK()` functions over partitions to identify top-selling products within segments and categories.

##  About the Case Study

This case study mimics a sales analytics task performed by a data analyst in a retail company. The goal is to integrate data from product, pricing, and transactional sources to uncover insights that support business decisions. The use of multiple normalized tables ensures a realistic, scalable design approach.

##  Purpose of the Project

To gain hands-on experience with SQL Server and apply real-world concepts such as database creation, relational modeling, manual data entry, and multi-table analysis through complex SQL queries.


