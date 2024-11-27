
### Error Handling

When working with databases, it's essential to handle potential errors that may arise during database operations. Proper error handling ensures that your application can gracefully handle unexpected situations without crashing or corrupting the database. The `sqlite3` module in Python provides several exception classes to catch and manage errors effectively.

#### Common SQLite Errors

Here are some common errors you might encounter when working with SQLite:

- **sqlite3.OperationalError**: Raised for operational errors like trying to execute an invalid SQL statement or issues with the database connection.
- **sqlite3.IntegrityError**: Raised when a database integrity constraint (such as a foreign key or unique constraint) is violated.
- **sqlite3.ProgrammingError**: Raised for programming errors such as using the cursor incorrectly.
- **sqlite3.DatabaseError**: Raised for errors related to the database.
- **sqlite3.Error**: A base class for all SQLite-related errors.

#### Catching and Handling Errors

You can use try-except blocks to catch and handle errors. This approach ensures that your program can respond appropriately to various issues.

**Example**:

```python
import sqlite3

try:
    # Connect to the SQLite database
    conn = sqlite3.connect('example.db')

    # Create a cursor object
    cursor = conn.cursor()

    # Attempt to create a table with invalid SQL syntax
    cursor.execute('''
    CREATE TABLE customers (
        CustomerID INTEGER PRIMARY KEY,
        CustomerName TEXT NOT NULL,
        ContactName TEXT,
        Country TEXT
    ''')  # Missing closing parenthesis

    # Commit the changes
    conn.commit()

except sqlite3.OperationalError as e:
    print('OperationalError occurred:', e)

except sqlite3.IntegrityError as e:
    print('IntegrityError occurred:', e)

except sqlite3.ProgrammingError as e:
    print('ProgrammingError occurred:', e)

except sqlite3.DatabaseError as e:
    print('DatabaseError occurred:', e)

except sqlite3.Error as e:
    print('SQLite error occurred:', e)

finally:
    # Close the cursor and connection
    if cursor:
        cursor.close()
    if conn:
        conn.close()
```

In this example, we catch and handle various types of SQLite errors using specific exception classes. The `finally` block ensures that the cursor and connection are closed, even if an error occurs.

#### Logging Errors

Logging errors is a good practice for debugging and maintaining your application. You can use Python’s built-in `logging` module to log error messages.

**Example**:

```python
import sqlite3
import logging

# Configure logging
logging.basicConfig(filename='app.log', level=logging.ERROR, format='%(asctime)s %(message)s')

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
    logging.error('IntegrityError occurred: %s', e)

except sqlite3.Error as e:
    logging.error('SQLite error occurred: %s', e)

finally:
    # Close the cursor and connection
    if cursor:
        cursor.close()
    if conn:
        conn.close()
```

In this example, error messages are logged to a file named `app.log`, providing a record of errors that can be reviewed later.

#### Using Custom Error Messages

You can provide custom error messages to make error handling more user-friendly and informative.

**Example**:

```python
import sqlite3

try:
    # Connect to the SQLite database
    conn = sqlite3.connect('example.db')

    # Create a cursor object
    cursor = conn.cursor()

    # Attempt to update a non-existent record
    cursor.execute('''
    UPDATE customers
    SET ContactName = 'Updated Name'
    WHERE CustomerID = 999
    ''')

    # Check if any row was updated
    if cursor.rowcount == 0:
        raise sqlite3.DatabaseError('No record found with the specified CustomerID.')

    # Commit the changes
    conn.commit()

except sqlite3.DatabaseError as e:
    print('DatabaseError occurred:', e)

except sqlite3.Error as e:
    print('SQLite error occurred:', e)

finally:
    # Close the cursor and connection
    if cursor:
        cursor.close()
    if conn:
        conn.close()
```

In this example, a custom error message is raised if no record is found with the specified `CustomerID`.

#### Using Context Managers for Safe Transactions

Using context managers (`with` statements) helps ensure that transactions are committed or rolled back safely, reducing the risk of database corruption.

**Example**:

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
    if conn:
        conn.close()
```

In this example, using `with conn:` ensures that if an error occurs within the block, the transaction is automatically rolled back. If no error occurs, the transaction is committed when the block is exited.

By implementing robust error handling practices, you can create more reliable and maintainable applications that gracefully handle unexpected situations and provide informative feedback to users.
