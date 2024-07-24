
[TOC]

***

## SQLite with Jupyter

### Running SQLite Queries in Jupyter

Using Jupyter Notebooks to run SQLite queries allows you to interactively explore and manipulate your data. This section will guide you through the process of running SQLite queries in Jupyter Notebooks, using the `ipython-sql` extension and Python’s `sqlite3` module.

#### Loading the SQL Extension

The first step is to load the SQL extension, which allows you to use SQL magic commands within Jupyter Notebook cells.

**Code**:

```python
# Load the SQL extension
%load_ext sql
```

This command loads the `ipython-sql` extension, enabling the use of `%sql` magic commands to run SQL queries directly in the notebook.

#### Connecting to an SQLite Database

You need to establish a connection to an SQLite database. This can be done using the `%sql` magic command with a connection string.

**Code**:

```python
# Connect to the SQLite database
%sql sqlite:///example.db
```

This command connects to the `example.db` SQLite database. If the database file does not exist, it will be created.

#### Creating Tables

You can create tables by writing SQL queries in Jupyter Notebook cells.

**Code**:

```sql
%%sql

CREATE TABLE IF NOT EXISTS customers (
    CustomerID INTEGER PRIMARY KEY,
    CustomerName TEXT NOT NULL,
    ContactName TEXT,
    Country TEXT
);
```

This query creates a `customers` table with columns for `CustomerID`, `CustomerName`, `ContactName`, and `Country`.

#### Inserting Data

To insert data into the table, you can use the `INSERT INTO` SQL command.

**Code**:

```sql
%%sql

INSERT INTO customers (CustomerName, ContactName, Country)
VALUES ('Alfreds Futterkiste', 'Maria Anders', 'Germany');
```

This query inserts a new record into the `customers` table.

#### Querying Data

You can retrieve data from the table using the `SELECT` SQL command and display the results in the notebook.

**Code**:

```sql
%%sql

SELECT * FROM customers;
```

This query selects all records from the `customers` table and displays the results.

#### Using Pandas for Data Analysis

For more advanced data analysis, you can use the `pandas` library to run SQL queries and load the results into a DataFrame.

**Code**:

```python
import pandas as pd
import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('example.db')

# Query the database and load the results into a DataFrame
df = pd.read_sql_query('SELECT * FROM customers', conn)

# Display the DataFrame
print(df)

# Close the connection
conn.close()
```

In this example, we connect to the `example.db` database, execute a SQL query to select all records from the `customers` table, and load the results into a `pandas` DataFrame for further analysis.

#### Visualizing Data with Matplotlib

You can also visualize the data using the `matplotlib` library.

**Code**:

```python
import matplotlib.pyplot as plt

# Create a bar plot of the number of customers per country
df['Country'].value_counts().plot(kind='bar')

# Set the title and labels
plt.title('Number of Customers per Country')
plt.xlabel('Country')
plt.ylabel('Number of Customers')

# Show the plot
plt.show()
```

This example creates a bar plot showing the number of customers per country.

#### Example: Full Workflow in Jupyter Notebook

Here is a complete example of setting up a Jupyter Notebook to create a table, insert data, query the data, and visualize the results.

**Step 1: Load the SQL extension**:

```python
%load_ext sql
```

**Step 2: Connect to the SQLite database**:

```python
%sql sqlite:///example.db
```

**Step 3: Create the `customers` table**:

```sql
%%sql

CREATE TABLE IF NOT EXISTS customers (
    CustomerID INTEGER PRIMARY KEY,
    CustomerName TEXT NOT NULL,
    ContactName TEXT,
    Country TEXT
);
```

**Step 4: Insert data into the `customers` table**:

```sql
%%sql

INSERT INTO customers (CustomerName, ContactName, Country)
VALUES ('Alfreds Futterkiste', 'Maria Anders', 'Germany');
```

**Step 5: Query the `customers` table**:

```sql
%%sql

SELECT * FROM customers;
```

**Step 6: Load the query results into a Pandas DataFrame**:

```python
import pandas as pd
import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('example.db')

# Query the database and load the results into a DataFrame
df = pd.read_sql_query('SELECT * FROM customers', conn)

# Display the DataFrame
print(df)

# Close the connection
conn.close()
```

**Step 7: Visualize the data with Matplotlib**:

```python
import matplotlib.pyplot as plt

# Create a bar plot of the number of customers per country
df['Country'].value_counts().plot(kind='bar')

# Set the title and labels
plt.title('Number of Customers per Country')
plt.xlabel('Country')
plt.ylabel('Number of Customers')

# Show the plot
plt.show()
```

By following these steps, you can efficiently run SQLite queries in Jupyter Notebooks, analyze the results with Pandas, and visualize the data using Matplotlib.
