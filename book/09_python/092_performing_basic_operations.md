
[TOC]

***

## SQLite with Python

### Performing Basic Operations

Once you have set up SQLite in Python, you can perform various basic operations to interact with your database. This section will guide you through the fundamental operations such as creating tables, inserting data, querying data, updating records, and deleting records using Python's `sqlite3` module.

#### Creating a Table

Creating a table in SQLite involves defining the table's schema, which includes the table name and the columns with their data types.

**Example**:

```python
import sqlite3

# Connect to an SQLite database (or create it if it doesn't exist)
conn = sqlite3.connect('example.db')

# Create a cursor object
cursor = conn.cursor()

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

# Close the cursor and connection
cursor.close()
conn.close()
```

In this example, we connect to an SQLite database named `example.db`, create a cursor object, and execute a `CREATE TABLE` statement to create a table named `customers` with four columns: `CustomerID`, `CustomerName`, `ContactName`, and `Country`.

#### Inserting Data into a Table

Inserting data into a table involves using the `INSERT INTO` SQL command.

**Example**:

```python
import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('example.db')

# Create a cursor object
cursor = conn.cursor()

# Insert data into the 'customers' table
cursor.execute('''
INSERT INTO customers (CustomerName, ContactName, Country)
VALUES ('Alfreds Futterkiste', 'Maria Anders', 'Germany')
''')

# Commit the changes
conn.commit()

# Close the cursor and connection
cursor.close()
conn.close()
```

In this example, we insert a new record into the `customers` table with the `CustomerName` 'Alfreds Futterkiste', `ContactName` 'Maria Anders', and `Country` 'Germany'.

#### Querying Data from a Table

Querying data from a table involves using the `SELECT` SQL command to retrieve records that match specific criteria.

**Example**:

```python
import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('example.db')

# Create a cursor object
cursor = conn.cursor()

# Query data from the 'customers' table
cursor.execute('SELECT * FROM customers')

# Fetch all rows from the executed query
rows = cursor.fetchall()

# Print the fetched rows
for row in rows:
    print(row)

# Close the cursor and connection
cursor.close()
conn.close()
```

In this example, we retrieve all records from the `customers` table and print the results.

#### Updating Data in a Table

Updating data in a table involves using the `UPDATE` SQL command to modify existing records.

**Example**:

```python
import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('example.db')

# Create a cursor object
cursor = conn.cursor()

# Update data in the 'customers' table
cursor.execute('''
UPDATE customers
SET ContactName = 'Alfred Schmidt'
WHERE CustomerName = 'Alfreds Futterkiste'
''')

# Commit the changes
conn.commit()

# Close the cursor and connection
cursor.close()
conn.close()
```

In this example, we update the `ContactName` for the record where the `CustomerName` is 'Alfreds Futterkiste' to 'Alfred Schmidt'.

#### Deleting Data from a Table

Deleting data from a table involves using the `DELETE FROM` SQL command to remove records that match specific criteria.

**Example**:

```python
import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('example.db')

# Create a cursor object
cursor = conn.cursor()

# Delete data from the 'customers' table
cursor.execute('''
DELETE FROM customers
WHERE CustomerName = 'Alfreds Futterkiste'
''')

# Commit the changes
conn.commit()

# Close the cursor and connection
cursor.close()
conn.close()
```

In this example, we delete the record where the `CustomerName` is 'Alfreds Futterkiste'.

#### Handling Errors

When working with databases, it's important to handle potential errors that may arise during database operations. The `sqlite3` module provides exception classes that you can use to catch and handle these errors.

**Example**:

```python
import sqlite3

try:
    # Connect to the SQLite database
    conn = sqlite3.connect('example.db')

    # Create a cursor object
    cursor = conn.cursor()

    # Attempt to insert a record with a duplicate primary key
    cursor.execute('''
    INSERT INTO customers (CustomerID, CustomerName, ContactName, Country)
    VALUES (1, 'Duplicate Customer', 'John Doe', 'USA')
    ''')

    # Commit the changes
    conn.commit()

except sqlite3.IntegrityError as e:
    print('IntegrityError occurred:', e)

except sqlite3.Error as e:
    print('SQLite error occurred:', e)

finally:
    # Close the cursor and connection
    cursor.close()
    conn.close()
```

In this example, we attempt to insert a record with a duplicate primary key. The `sqlite3.IntegrityError` exception is caught and handled, printing an error message to the console.

By mastering these basic operations, you can effectively interact with your SQLite database using Python, allowing you to build robust data-driven applications and streamline your data science workflows.
