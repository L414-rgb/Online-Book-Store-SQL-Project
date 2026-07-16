--CREATE Database
CREATE DATABASE onlineBookstore;

--Switch to the database
\c onlinebooksstore;

--Create Tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
     Book_id SERIAL PRIMARY KEY,
	 Title VARCHAR(100),
	 Author VARCHAR(100),
	 Genre VARCHAR(50),
	 Published_Year INT,
	 Price NUMERIC(10,2),
	 Stock INT
);
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
      Customer_id SERIAL PRIMARY KEY,
	  Name VARCHAR(100),
	  Email VARCHAR(100),
	  Phone VARCHAR(15),
	  City VARCHAR(50),
	  Country VARCHAR(150)
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
   Order_id SERIAL PRIMARY KEY,
   Customer_id INT REFERENCES Customers(Customer_id),
   Book_id INT REFERENCES Books(Book_id),
   Order_Date Date,
   Quantity INT,
   Total_Amount NUMERIC(10,2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;


--Retrive all Books in the 'fiction' genre:
SELECT * FROM Books
WHERE (Genre='Fiction');

--find books published after 1950:
SELECT * FROM Books
WHERE (Published_Year>1950);

--list all customers from canada
SELECT * FROM Customers
WHERE (Country='Canada');

--Show orders placed in November 2023:
SELECT * FROM orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

--Retrive total stocks of books available
SELECT SUM(Stock) AS new_stock FROM Books;

--Find the details of most expensive books
SELECT * FROM Books
WHERE Price>=40;

SELECT * FROM Books ORDER BY Price DESC Limit 1;

--Show all customers who order books more than one qantity
SELECT * FROM Orders
WHERE Quantity>1;

--Retrive all orders where total amount exceeds $20
SELECT * FROM Orders
WHERE Total_Amount>20;

--List all genre available in Books
SELECT DISTINCT Genre FROM Books;

--Find the books with lower stock
SELECT * FROM Books ORDER BY Stock ASC Limit 1;

--Calculate total revenue generated from all orders
SELECT SUM(Total_Amount) AS Total_Revenue FROM Orders;


-- ADVANCE LEVEL

--Retrive total no of books sold for each genre
SELECT b.Genre,SUM(o.Quantity) AS Total_Book_Sold
FROM Orders o
JOIN
Books b
ON o.Book_id=b.book_id
GROUP BY b.Genre;

--find the averge price of books in fantasy genre
SELECT AVG(Price) AS Average_Price
FROM Books
WHERE Genre='Fantasy';

--List of customers who placed atleast 2 orders
SELECT Customer_id, COUNT(Order_id) AS Count_orders
FROM Orders
GROUP BY Customer_id
HAVING COUNT(Order_id)>=2;
---byname
SELECT o.Customer_id,c.Name,COUNT(o.Order_id) AS BY_NAME
FROM Orders o
JOIN
Customers c
ON o.Customer_id=c.Customer_id
GROUP BY o.Customer_id,c.Name
HAVING COUNT(o.Order_id)>=2;


--Find the most Frequently order books
SELECT Book_id,COUNT(Order_id) AS Book_Order
FROM Orders
GROUP BY Book_id
ORDER BY COUNT(Order_id) DESC Limit 1;
--byname
SELECT o.Book_id,b.Title,COUNT(O.Order_id)
FROM Orders o
JOIN
Books b
ON o.Book_id=b.Book_id
GROUP BY o.Book_id,b.Title
ORDER BY COUNT(o.Order_id) DESC Limit 1;

--Show the 3 most expensive books of fantasy genre
SELECT * FROM Books
WHERE Genre='Fantasy'
ORDER BY Price DESC Limit 3;

--Retrive Total quantity of books sold by each author
SELECT b.Author,SUM(o.Quantity) AS Quanity_total
FROM Orders o
JOIN
Books b
ON o.Book_id=b.Book_id
GROUP BY b.Author;

--List the cities where customers who spent over $30 are located
SELECT DISTINCT c.City, o.Total_Amount
FROM Customers c
JOIN
Orders o
ON c.Customer_id=o.Customer_id
WHERE o.Total_Amount>30;

--Find the customers who spent most on orders
SELECT c.Customer_id,c.Name,SUM(o.Total_Amount)
FROM Customers c
JOIN
Orders o
ON c.Customer_id=o.Customer_id
GROUP BY c.Customer_id,c.Name
ORDER BY SUM(o.Total_Amount) DESC LIMIT 1;

--Remaning stock after fullfilling all orders
SELECT b.Book_id,b.Title,b.Stock,COALESCE(SUM(o.Quantity),0) AS Order_Quantity,
b.Stock-COALESCE(SUM(o.Quantity),0) AS Remaining_Quantity
FROM Books b
LEFT JOIN
Orders o
ON b.Book_id=o.Book_id
GROUP BY b.Book_id ORDER BY b.Book_id;





