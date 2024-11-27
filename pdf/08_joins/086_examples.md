
### Examples

In this section, we will provide several examples demonstrating how to use different types of joins in SQLite. These examples will cover inner joins, left joins, right joins, and full joins using Python's `sqlite3` module. We will use the `customers` and `orders` tables to illustrate these join operations.

#### Tables for Examples

To follow along with the examples, let's create the `customers` and `orders` tables with some sample data.

**Customers Table**:

```sql
CREATE TABLE customers (
    CustomerID INTEGER PRIMARY KEY,
    CustomerName TEXT NOT NULL,
    ContactName TEXT,
    Country TEXT
);

INSERT INTO customers (CustomerID, CustomerName, ContactName, Country) VALUES
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Germany'),
(2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Mexico'),
(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mexico'),
(4, 'Around the Horn', 'Thomas Hardy', 'UK'),
(5, 'Berglunds snabbköp', 'Christina Berglund', 'Sweden'),
(6, 'Blauer See Delikatessen', 'Hanna Moos', 'Germany');
```

**Orders Table**:

```sql
CREATE TABLE orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    OrderDate TEXT,
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);

INSERT INTO orders (OrderID, CustomerID, OrderDate) VALUES
(10248, 1, '2024-07-04'),
(10249, 2, '2024-07-05'),
(10250, 3, '2024-07-06'),
(10251, 4, '2024-07-07'),
(10252, 5, '2024-07-08'),
(10253, 7, '2024-07-09'),
(10254, 8, '2024-07-10');
```

#### Inner Join

An inner join returns only the rows that have matching values in both tables.

**Code**:

```python
import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('example.db')

# Create a cursor object
cursor = conn.cursor()

# Perform an inner join
cursor.execute('''
SELECT customers.CustomerName, orders.OrderID
FROM customers
INNER JOIN orders
ON customers.CustomerID = orders.CustomerID
LIMIT 10;
''')

# Fetch and print the results
rows = cursor.fetchall()
for row in rows:
    print(row)

# Close the cursor and connection
cursor.close()
conn.close()
```

**Explanation**:

This query selects the `CustomerName` from the `customers` table and the `OrderID` from the `orders` table where the `CustomerID` matches in both tables.

**Output**:

```plaintext
('Alfreds Futterkiste', 10248)
('Ana Trujillo Emparedados y helados', 10249)
('Antonio Moreno Taquería', 10250)
('Around the Horn', 10251)
('Berglunds snabbköp', 10252)
```

#### Left Join

A left join returns all records from the left table and the matched records from the right table. The result is `NULL` from the right side if there is no match.

**Code**:

```python
import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('example.db')

# Create a cursor object
cursor = conn.cursor()

# Perform a left join
cursor.execute('''
SELECT customers.CustomerName, orders.OrderID
FROM customers
LEFT JOIN orders
ON customers.CustomerID = orders.CustomerID
LIMIT 10;
''')

# Fetch and print the results
rows = cursor.fetchall()
for row in rows:
    print(row)

# Close the cursor and connection
cursor.close()
conn.close()
```

**Explanation**:

This query selects the `CustomerName` from the `customers` table and the `OrderID` from the `orders` table, returning all customers and their corresponding orders. If a customer does not have an order, the `OrderID` will be `NULL`.

**Output**:

```plaintext
('Alfreds Futterkiste', 10248)
('Ana Trujillo Emparedados y helados', 10249)
('Antonio Moreno Taquería', 10250)
('Around the Horn', 10251)
('Berglunds snabbköp', 10252)
('Blauer See Delikatessen', None)
```

#### Right Join

A right join returns all records from the right table and the matched records from the left table. The result is `NULL` from the left side if there is no match.

**Note:** SQLite does not support the `RIGHT JOIN` directly. Instead, you can achieve the functionality of a right join by reversing the table order and using a left join.

**Code**:

```python
import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('example.db')

# Create a cursor object
cursor = conn.cursor()

# Perform a right join (simulated with left join)
cursor.execute('''
SELECT orders.OrderID, customers.CustomerName
FROM orders
LEFT JOIN customers
ON orders.CustomerID = customers.CustomerID
LIMIT 10;
''')

# Fetch and print the results
rows = cursor.fetchall()
for row in rows:
    print(row)

# Close the cursor and connection
cursor.close()
conn.close()
```

**Explanation**:

This query selects the `OrderID` from the `orders` table and the `CustomerName` from the `customers` table, returning all orders and their corresponding customers. If an order does not have a matching customer, the `CustomerName` will be `NULL`.

**Output**:

```plaintext
(10248, 'Alfreds Futterkiste')
(10249, 'Ana Trujillo Emparedados y helados')
(10250, 'Antonio Moreno Taquería')
(10251, 'Around the Horn')
(10252, 'Berglunds snabbköp')
(10253, None)
(10254, None)
```

#### Full Join

A full join returns all records when there is a match in either the left or right table. The result is `NULL` from either side when there is no match.

**Note:** SQLite does not support the `FULL JOIN` directly. Instead, you can achieve the functionality of a full join by combining the results of a left join and a right join using a `UNION`.

**Code**:

```python
import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('example.db')

# Create a cursor object
cursor = conn.cursor()

# Perform a full join (simulated with left join and union)
cursor.execute('''
SELECT customers.CustomerName, orders.OrderID
FROM customers
LEFT JOIN orders
ON customers.CustomerID = orders.CustomerID
UNION
SELECT customers.CustomerName, orders.OrderID
FROM orders
LEFT JOIN customers
ON orders.CustomerID = customers.CustomerID
LIMIT 10;
''')

# Fetch and print the results
rows = cursor.fetchall()
for row in rows:
    print(row)

# Close the cursor and connection
cursor.close()
conn.close()
```

**Explanation**:

This query selects the `CustomerName` from the `customers` table and the `OrderID` from the `orders` table, performing a left join first and then a right join (by reversing the table order) to include all records from both tables.

**Output**:

```plaintext
('Alfreds Futterkiste', 10248)
('Ana Trujillo Emparedados y helados', 10249)
('Antonio Moreno Taquería', 10250)
('Around the Horn', 10251)
('Berglunds snabbköp', 10252)
('Blauer See Delikatessen', None)
(None, 10253)
(None, 10254)
```

#### Joining Multiple Tables

You can perform joins on more than two tables to combine data from multiple sources. Assume we have an additional `employees` table:

**Employees Table**:

```sql
CREATE TABLE employees (
    EmployeeID INTEGER PRIMARY KEY,
    EmployeeName TEXT NOT NULL,
    Title TEXT
);

INSERT INTO employees (EmployeeID, EmployeeName, Title) VALUES
(1, 'Nancy Davolio', 'Sales Representative'),
(2, 'Andrew Fuller', 'Vice President'),
(3, 'Janet Leverling', 'Sales Representative');
```

**Code**:

```python
import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('example.db')

# Create a cursor object
cursor = conn.cursor()

# Perform a join with multiple tables
cursor.execute('''
SELECT o.OrderID, c.CustomerName, e.EmployeeName
FROM orders AS o
LEFT JOIN customers AS c
ON o.CustomerID = c.CustomerID
LEFT JOIN employees AS e
ON o.CustomerID = e.EmployeeID
LIMIT 10;
''')

# Fetch and print the results
rows = cursor.fetchall()
for row in rows:
    print(row)

# Close the cursor and connection
cursor.close()
conn.close()
```

**Explanation**:

This query joins three tables (`orders`, `customers`, and `employees`) on their respective matching columns to provide a more comprehensive result set. Since we use left joins, all records from the `orders` table will be included in the results, even if they
