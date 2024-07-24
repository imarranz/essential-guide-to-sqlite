
[TOC]

***

## SQLite with Jupyter

### Installing Necessary Libraries

To use SQLite within Jupyter Notebooks, you need to install a few essential libraries. These libraries will allow you to create, manipulate, and visualize SQLite databases seamlessly within your Jupyter environment. This section will guide you through the process of installing the necessary libraries.

#### Jupyter Notebook

If you haven't already installed Jupyter Notebook, you can install it using `pip`. Jupyter Notebook is a powerful tool for creating and sharing documents that contain live code, equations, visualizations, and narrative text.

**Installation Command**:

```bash
pip install notebook
```

To launch Jupyter Notebook, use the following command:

```bash
jupyter notebook
```

#### SQLite

SQLite itself is typically included with Python’s standard library, so you do not need to install SQLite separately. However, you can verify if SQLite is available by running the following command in your terminal or command prompt:

**Verification Command**:

```bash
sqlite3 --version
```

If SQLite is not installed, you can download it from the official [SQLite website](https://www.sqlite.org/download.html) and follow the installation instructions for your operating system.

#### ipython-sql

`ipython-sql` is a SQL magic extension for IPython that allows you to write SQL queries directly within Jupyter Notebook cells. This extension makes it easy to interact with SQLite databases using SQL syntax.

**Installation Command**:

```bash
pip install ipython-sql
```

After installation, you can load the extension in a Jupyter Notebook cell using:

```python
%load_ext sql
```

#### pandas

`pandas` is a powerful data manipulation and analysis library for Python. It provides data structures like DataFrame that are ideal for working with structured data, and it integrates well with SQL databases.

**Installation Command**:

```bash
pip install pandas
```

You can import `pandas` in your Jupyter Notebook using:

```python
import pandas as pd
```

#### matplotlib

`matplotlib` is a plotting library for Python that allows you to create static, animated, and interactive visualizations. It is useful for visualizing the data retrieved from SQLite databases.

**Installation Command**:

```bash
pip install matplotlib
```

You can import `matplotlib` in your Jupyter Notebook using:

```python
import matplotlib.pyplot as plt
```

#### sqlalchemy

`sqlalchemy` is a SQL toolkit and Object-Relational Mapping (ORM) library for Python. It provides a full suite of well-known enterprise-level persistence patterns and is designed for efficient and high-performing database access.

**Installation Command**:

```bash
pip install sqlalchemy
```

You can import `sqlalchemy` in your Jupyter Notebook using:

```python
from sqlalchemy import create_engine
```

#### Summary of Installation Commands

For convenience, here are all the installation commands together:

```bash
pip install notebook
pip install ipython-sql
pip install pandas
pip install matplotlib
pip install sqlalchemy
```

#### Example: Setting Up a Jupyter Notebook

Here is an example of setting up a Jupyter Notebook to work with SQLite:

**1. Install the necessary libraries** (if not already installed):

```bash
pip install notebook ipython-sql pandas matplotlib sqlalchemy
```

**2. Create a new Jupyter Notebook** and run the following code cells:

```python
# Load the SQL extension
%load_ext sql

# Import necessary libraries
import sqlite3
import pandas as pd
import matplotlib.pyplot as plt
from sqlalchemy import create_engine

# Create an SQLite database in memory
engine = create_engine('sqlite:///:memory:')

# Create a connection to the database
conn = sqlite3.connect('example.db')

# Create a cursor object
cursor = conn.cursor()

# Create a sample table
cursor.execute('''
CREATE TABLE IF NOT EXISTS customers (
    CustomerID INTEGER PRIMARY KEY,
    CustomerName TEXT NOT NULL,
    ContactName TEXT,
    Country TEXT
)
''')

# Insert sample data
cursor.execute('''
INSERT INTO customers (CustomerName, ContactName, Country)
VALUES ('Alfreds Futterkiste', 'Maria Anders', 'Germany')
''')

# Commit the changes
conn.commit()

# Query the table
df = pd.read_sql('SELECT * FROM customers', conn)

# Display the DataFrame
print(df)

# Close the cursor and connection
cursor.close()
conn.close()
```

In this example, we install and import the necessary libraries, create a connection to an SQLite database, create a table, insert data, and query the table to display the results in a DataFrame.

By following these steps, you can set up a Jupyter Notebook to work with SQLite and perform various data analysis tasks using SQL and Python.
