
[TOC]

***

## SQLite with Python

### Setting up SQLite in Python

SQLite is a powerful and lightweight relational database management system that can be easily integrated into Python applications using the built-in `sqlite3` module. This section will guide you through the process of setting up SQLite in Python, covering installation, connection to a database, and performing basic operations.

#### Installing SQLite

Before we start using SQLite with Python, we need to ensure that SQLite is installed on your system. SQLite is included with Python’s standard library, so you do not need to install any additional packages to use the `sqlite3` module.

You can verify if SQLite is installed by running the following command in your terminal or command prompt:

```bash
sqlite3 --version
```

If SQLite is not installed, you can download it from the official [SQLite website](https://www.sqlite.org/download.html) and follow the installation instructions for your operating system.

#### Importing the sqlite3 Module

To use SQLite in Python, you need to import the `sqlite3` module, which is included in Python’s standard library. This module provides an interface for interacting with SQLite databases.

```python
import sqlite3
```

#### Connecting to a Database

To connect to an SQLite database, you can use the `sqlite3.connect()` function. This function returns a connection object, which you can use to interact with the database. If the specified database does not exist, SQLite will create a new database file.

**Example**:

```python
import sqlite3

# Connect to an SQLite database
conn = sqlite3.connect('example.db')

# Create a cursor object
cursor = conn.cursor()
```

In this example, we connect to a database named `example.db`. If the database does not exist, SQLite will create it. We also create a cursor object, which is used to execute SQL commands.

#### Creating a Table

Once connected to the database, you can create a table using the `CREATE TABLE` SQL command. The cursor object’s `execute()` method is used to execute the SQL command.

**Example**:

```python
# Create a table named 'customers'
cursor.execute('''
CREATE TABLE IF NOT EXISTS customers (
    CustomerID INTEGER PRIMARY KEY,
    CustomerName TEXT NOT NULL,
    ContactName TEXT,
    Country TEXT
)
''')

# Commit the changes
conn.commit()
```

In this example, we create a table named `customers` with four columns: `CustomerID`, `CustomerName`, `ContactName`, and `Country`.

#### Inserting Data into a Table

To insert data into a table, you can use the `INSERT INTO` SQL command.

**Example**:

```python
# Insert data into the 'customers' table
cursor.execute('''
INSERT INTO customers (CustomerName, ContactName, Country)
VALUES ('Alfreds Futterkiste', 'Maria Anders', 'Germany')
''')

# Commit the changes
conn.commit()
```

In this example, we insert a new record into the `customers` table.

#### Querying Data from a Table

To retrieve data from a table, you can use the `SELECT` SQL command.

**Example**:

```python
# Query data from the 'customers' table
cursor.execute('SELECT * FROM customers')

# Fetch all rows from the executed query
rows = cursor.fetchall()

# Print the fetched rows
for row in rows:
    print(row)
```

In this example, we query all records from the `customers` table and print the results.

#### Updating Data in a Table

To update data in a table, you can use the `UPDATE` SQL command.

**Example**:

```python
# Update data in the 'customers' table
cursor.execute('''
UPDATE customers
SET ContactName = 'Alfred Schmidt'
WHERE CustomerName = 'Alfreds Futterkiste'
''')

# Commit the changes
conn.commit()
```

In this example, we update the `ContactName` for the record where the `CustomerName` is 'Alfreds Futterkiste'.

#### Deleting Data from a Table

To delete data from a table, you can use the `DELETE FROM` SQL command.

**Example**:

```python
# Delete data from the 'customers' table
cursor.execute('''
DELETE FROM customers
WHERE CustomerName = 'Alfreds Futterkiste'
''')

# Commit the changes
conn.commit()
```

In this example, we delete the record where the `CustomerName` is 'Alfreds Futterkiste'.

#### Closing the Database Connection

Once you have finished interacting with the database, it is important to close the connection using the `close()` method to free up resources.

**Example**:

```python
# Close the cursor
cursor.close()

# Close the connection
conn.close()
```

By following these steps, you can set up SQLite in Python and perform basic database operations. This provides a strong foundation for building more complex data-driven applications and integrating SQLite with your data science workflows.
