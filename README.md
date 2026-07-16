# Online-Book-Store-SQL-Project
Online Bookstore Management System built with PostgreSQL, showcasing SQL queries, joins, aggregations, and business insights
# 📚 Online Bookstore SQL Project

## 📌 Project Overview
This project demonstrates SQL database design and query writing using an **Online Bookstore Management System**. It includes database creation, table relationships, data retrieval, aggregation, filtering, and advanced SQL queries to analyze bookstore sales and customer behavior.

The project was created to strengthen SQL skills and practice real-world database operations.

---

## 🛠️ Technologies Used

- PostgreSQL
- SQL
- pgAdmin 4

---

## 📂 Database Structure

The project contains the following tables:

### 1. Books
Stores information about books.

Columns:
- Book_ID
- Title
- Author
- Genre
- Published_Year
- Price
- Stock

### 2. Customers
Stores customer information.

Columns:
- Customer_ID
- Name
- Email
- Phone
- City
- Country

### 3. Orders
Stores customer order details.

Columns:
- Order_ID
- Customer_ID (Foreign Key)
- Book_ID (Foreign Key)
- Order_Date
- Quantity
- Total_Amount

---

## 🔑 SQL Concepts Covered

### Database Operations
- Create Database
- Create Tables
- Drop Tables
- Primary Keys
- Foreign Keys

### Basic SQL Queries
- SELECT
- WHERE
- ORDER BY
- DISTINCT
- LIMIT
- BETWEEN

### Aggregate Functions
- SUM()
- AVG()
- COUNT()

### Joins
- INNER JOIN
- LEFT JOIN

### Grouping
- GROUP BY
- HAVING

### Advanced SQL
- Revenue Analysis
- Customer Purchase Analysis
- Book Sales Analysis
- Remaining Stock Calculation
- Sales by Genre
- Sales by Author

---

## 📊 Business Questions Solved

The project answers several business questions, including:

- Retrieve all Fiction books.
- Find books published after 1950.
- List customers from Canada.
- Display orders placed during November 2023.
- Calculate total available book stock.
- Find the most expensive book.
- Identify books with the lowest stock.
- Retrieve orders with total amount greater than $20.
- Show customers who ordered more than one book.
- Calculate total revenue.
- Find total books sold by genre.
- Calculate the average Fantasy book price.
- Identify customers with two or more orders.
- Find the most frequently ordered book.
- Display the top three most expensive Fantasy books.
- Calculate total quantity sold by each author.
- Find cities where customers spent more than $30.
- Identify the highest spending customer.
- Calculate remaining inventory after fulfilling all orders.

---

## 📁 Project Files

```
OnlineBookstore_SQL_Project.sql
README.md
```

---

## 🎯 Learning Outcomes

Through this project I practiced:

- Database design
- Relational database concepts
- Writing SQL queries
- Filtering and sorting data
- Aggregate functions
- Table joins
- Grouping and summarizing data
- Solving real-world business problems using SQL

---

## 🚀 How to Run

1. Open **pgAdmin 4**.
2. Create a PostgreSQL database.
3. Open the SQL script.
4. Execute the script.
5. Run the queries individually to view the results.

---

## 👩‍💻 Author

**Laiba Iftikhar**

Accounting & Finance Student | Aspiring Data Analyst

### Skills
- SQL
- PostgreSQL
- Excel
- Power Query
- Power Pivot
- Power BI
- Data Cleaning
- Data Analysis

---

## ⭐ If you found this project useful, consider giving it a star.
