#importing the necessary modules
import mysql.connector
from mysql.connector import errorcode

#-- mysql.connector: This module provides a Python interface to MySQL. It allows you to connect to a MySQL server,
#  execute SQL queries, and manage the connection.

#-- errorcode: This submodule contains error codes for specific exceptions raised by mysql.connector

#-- Initializing a variable to hold the database name 

DATABASE_NAME = "alx_book_store"

#Function to create the database
def create_database(cursor):
    try :
        cursor.execute(f'CREATE DATABASE IF NOT EXISTS alx_book_store')
        print(f"Database alx_book_store successfully created")

    except mysql.connector.Error as Err:
        if Err.errno == errorcode.ER_DB_CREATE_EXISTS:
            print(f"Database alx_book_store already exists")
        else:
            print(f"Failed to create database alx_book_store: {Err}")

def main():

    # Create connection
    try:
        # Establish the connection with the mysql server
        cnx = mysql.connector.connect(
            user = "root",
            password = "@Andrew98L",
        )

     # Create a cursor object
        cursor = cnx.cursor()

    # Create the database
        create_database(cursor)

    # Close cursor and the connection
        cursor.close()
        cnx.close()

    except mysql.connector.Error as err:
        print(f"Error connecting to MySQL server: {err}")