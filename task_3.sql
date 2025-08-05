-- Use the alx_book_store database
USE alx_book_store;

-- List all tables in the alx_book_store database
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_CATALOG = 'alx_book_store';