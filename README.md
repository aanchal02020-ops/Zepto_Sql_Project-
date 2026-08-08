# Zepto_Sql_Project-
Zepto Product &amp; Revenue Analysis using complete SQL - An end to end data analysis project covering data exploration, Cleaning, Revenue analysis, category performance , inventory insights , and business recommendations.
Zepto E-Commerce Data Analysis (SQL Project)
A SQL-based data analysis project on Zepto's grocery product catalog. The project covers database design, data import, data cleaning, and business analysis across 15 product categories using PostgreSQL.

# Project Overview

Zepto is a quick-commerce grocery delivery platform. This project simulates their backend product catalog — combining 15 separate category-wise datasets (Fruits & Vegetables, Beverages, Personal Care, etc.) into a single relational database, cleaning the raw data, and running analysis queries to extract business insights around pricing, discounts, stock availability, and revenue.

# Dataset
The raw data was provided as 15 separate CSV files, one per product category:
Category ID	Category Name
1	Fruits & Vegetables
2	Cooking Essentials
3	Munchies
4	Dairy, Bread & Batter
5	Beverages
6	Packaged Food
7	Icecream & Desserts
8	Chocolates & Candies
9	Meats, Fishes & Eggs
10	Biscuits
11	Personal Care
12	Paan Corner
13	Home & Cleaning
14	Health & Hygiene
15	Curated For You


# Each raw table contains the following columns:
Column	Type	Description
Product_Name	varchar(100)	Name of the product
MRP	real	Maximum Retail Price (originally stored in paise)
Discount_Percent	integer	Discount percentage offered
Available_Quantity	integer	Units currently in stock
Discount_Selling_Price	integer	Final selling price after discount
Weighted_In_GMS	integer	Product weight in grams
Out_Of_Stock	boolean	Stock availability flag
Quantity	integer	Package/order quantity

# Database Schema

categories
`category_id` (PK, serial)
`category_name` (varchar)
product (master table combining all 15 category tables)
`Product_id` (PK, serial)
`Product_Name`, `MRP`, `Discount_Percent`, `Available_Quantity`, `Discount_Selling_Price`, `Weighted_In_GMS`, `Out_Of_Stock`, `Quantity`
`category_id` (FK → categories.category_id)
product_backup
Full snapshot of `product` taken before cleaning, kept as a safety net.

# Tech Stack

Database: PostgreSQL
Tool: pgAdmin (for CSV import via Import/Export wizard)
Language: SQL (DDL, DML, joins, aggregates, window functions, CTEs)


# Project Workflow

Schema design – created `categories` table and 15 category-specific staging tables.
Data import – imported each CSV into its staging table via pgAdmin's Import/Export tool (UTF-8, header on).
Consolidation – created a master `product` table and inserted all 15 staging tables into it, tagging each row with its `category_id`.
Data cleaning
Removed invalid rows where `MRP = 0`
Took a full backup (`product_backup`) before modifying data
Converted `MRP` and `Discount_Selling_Price` from paise to rupees (`/ 100.0`)
Checked for NULLs in key columns
Checked for duplicate/grouping anomalies
Analysis – ran business queries covering pricing, discounts, stock status, and revenue (see below).

# Key Business Questions Answered

What are the most expensive and cheapest products?
Which category offers the highest average discount?
What's the overall discount impact (MRP vs. selling price) per category?
Which high-value products are out of stock (lost sales opportunity)?
What is the estimated revenue per category?
Which products are most discounted vs. not discounted at all?
How many products are in stock vs. out of stock?
Which category has the highest product count?
What's the highest available quantity per category (using window functions)?
Which products give customers the highest absolute savings?


# Business Insights (extended analysis)

Revenue share % – each category's contribution to total business revenue
Stock health % – categories with the highest out-of-stock ratio (inventory risk)
Wasted promotions – products with heavy discounts that are still out of stock
Best value-for-money – lowest price-per-gram products
Discount-magnet categories – categories driving the highest total customer savings
Low-stock risk list – products with 1–5 units left, candidates for urgent restocking
Discount vs. stock-out correlation – whether aggressive discounting drains stock faster
Premium vs. budget category profiling – average MRP by category
One-row dashboard summary – total products, avg discount %, total savings, out-of-stock rate

# How to Run

Create a PostgreSQL database.
Run the schema + staging table creation statements from the SQL file.
Import each category CSV into its matching staging table using pgAdmin's Import/Export wizard (header on, UTF-8 encoding).
Run the consolidation inserts to populate the `product` table.
Run the data cleaning block.
Run the analysis queries in Section 4 and 5 of the SQL file to reproduce the insights.

# Author's Note
This project was built as a hands-on SQL practice project to demonstrate database design, ETL-style consolidation of multiple raw sources, data cleaning, and business-focused analytical querying.

