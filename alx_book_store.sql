-- Create the database
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'alx_book_store')
BEGIN
    CREATE DATABASE alx_book_store;
END
GO
USE alx_book_store;
GO

-- Create the Authors table
IF OBJECT_ID('Authors', 'U') IS NOT NULL DROP TABLE Authors;
CREATE TABLE Authors (
    author_id INT IDENTITY(1,1) PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);
GO

-- Create the Books table
IF OBJECT_ID('Books', 'U') IS NOT NULL DROP TABLE Books;
CREATE TABLE Books (
    book_id INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price FLOAT NOT NULL,
    publication_date DATE,
    CONSTRAINT FK_Books_Authors FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);
GO

-- Create the Customers table
IF OBJECT_ID('Customers', 'U') IS NOT NULL DROP TABLE Customers;
CREATE TABLE Customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address NVARCHAR(MAX)
);
GO

-- Create the Orders table
IF OBJECT_ID('Orders', 'U') IS NOT NULL DROP TABLE Orders;
CREATE TABLE Orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
GO

-- Create the Order_Details table
IF OBJECT_ID('Order_Details', 'U') IS NOT NULL DROP TABLE Order_Details;
CREATE TABLE Order_Details (
    orderdetailid INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity FLOAT NOT NULL,
    CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    CONSTRAINT FK_OrderDetails_Books FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
GO