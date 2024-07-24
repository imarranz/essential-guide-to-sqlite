

[TOC]

***

## SQLite with Python

### Examples

In this section, we will provide several examples demonstrating how to use SQLite with Python. These examples will cover a range of common tasks such as creating tables, inserting data, querying data, updating records, and handling more complex queries and transactions.

##### Creating a Database and Table

This example demonstrates how to create a new SQLite database and a table within it.

**Code**:

```python
import sqlite3

# Connect to SQLite database (or create it if it doesn't exist)
conn = sqlite3.connect('example.db')

# Create a cursor object
cursor = conn.cursor()

# Create a new table
cursor.execute('''
CREATE TABLE IF NOT EXISTS customers (
    CustomerID INTEGER PRIMARY KEY,
    CustomerName TEXT NOT NULL,
    ContactName TEXT,
    Country TEXT
)
''')

# Commit the changes and close the connection
conn.commit()
cursor.close()
conn.close()
```

**Explanation**:

This script connects to an SQLite database named `example.db` and creates a table named `customers` with columns for `CustomerID`, `CustomerName`, `ContactName`, and `Country`.

##### Inserting Data

This example shows how to insert data into the table created in the previous example.

**Code**:

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

# Commit the changes and close the connection
conn.commit()
cursor.close()
conn.close()
```

**Explanation**:

This script inserts a new record into the `customers` table.

##### Querying Data

This example demonstrates how to query data from the table and print the results.

**Code**:

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

**Explanation**:

This script queries all records from the `customers` table and prints each row.

##### Updating Data

This example shows how to update existing records in the table.

**Code**:

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

# Commit the changes and close the connection
conn.commit()
cursor.close()
conn.close()
```

**Explanation**:

This script updates the `ContactName` for the record where `CustomerName` is 'Alfreds Futterkiste' to 'Alfred Schmidt'.

##### Deleting Data

This example demonstrates how to delete records from the table.

**Code**:

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

# Commit the changes and close the connection
conn.commit()
cursor.close()
conn.close()
```

**Explanation**:

This script deletes the record where the `CustomerName` is 'Alfreds Futterkiste'.

##### Handling Transactions

This example shows how to handle transactions in SQLite.

**Code**:

```python
import sqlite3

try:
    # Connect to the SQLite database
    conn = sqlite3.connect('example.db')

    # Create a cursor object
    cursor = conn.cursor()

    # Begin a transaction
    cursor.execute('BEGIN')

    # Insert data into the 'customers' table
    cursor.execute('''
    INSERT INTO customers (CustomerName, ContactName, Country)
    VALUES ('New Customer', 'Jane Doe', 'USA')
    ''')

    # Simulate an error
    raise Exception('Simulated error')

    # Commit the transaction
    conn.commit()

except Exception as e:
    print('Error occurred:', e)
    # Rollback the transaction
    conn.rollback()

finally:
    # Close the cursor and connection
    cursor.close()
    conn.close()
```

**Explanation**:

This script demonstrates how to handle transactions in SQLite, including rolling back changes if an error occurs.

##### Using Context Managers for Transactions

This example shows how to use context managers for handling transactions safely.

**Code**:

```python
import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('example.db')

try:
    with conn:
        # Create a cursor object
        cursor = conn.cursor()

        # Insert data into the 'customers' table
        cursor.execute('''
        INSERT INTO customers (CustomerName, ContactName, Country)
        VALUES ('New Customer', 'Jane Doe', 'USA')
        ''')

except sqlite3.Error as e:
    print('SQLite error occurred:', e)

finally:
    # Close the connection
    conn.close()
```

**Explanation**:

This script demonstrates using a context manager (`with conn:`) to ensure transactions are committed or rolled back automatically.

##### Querying Data with Parameters

This example shows how to use parameters in queries to avoid SQL injection.

**Code**:

```python
import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('example.db')

# Create a cursor object
cursor = conn.cursor()

# Define the parameter
customer_name = 'New Customer'

# Query data from the 'customers' table using a parameter
cursor.execute('SELECT * FROM customers WHERE CustomerName = ?', (customer_name,))

# Fetch all rows from the executed query
rows = cursor.fetchall()

# Print the fetched rows
for row in rows:
    print(row)

# Close the cursor and connection
cursor.close()
conn.close()
```

**Explanation**:

This script demonstrates how to use parameters in queries to safely query data from the `customers` table.

By following these examples, you can effectively use SQLite with Python to perform various database operations, ensuring your applications are robust and secure.
