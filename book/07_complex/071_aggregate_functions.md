
[TOC]

***

## Complex Queries

### Aggregate Functions

Aggregate functions are used to perform calculations on multiple rows of a table's column and return a single value. Common aggregate functions include `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX`. This section will guide you through the syntax and provide examples to help you understand how to use aggregate functions effectively.

#### Syntax

The basic syntax for using aggregate functions in SQLite is as follows:

```sql

SELECT aggregate_function(column_name)
  FROM table_name
 WHERE condition;
```

- **aggregate_function**: The aggregate function to be applied (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`).

- **column_name**: The name of the column on which the aggregate function is applied.

- **table_name**: The name of the table from which to retrieve data.

- **condition**: An optional condition to filter the rows before applying the aggregate function.

#### Examples

##### COUNT

**Input**:

```sql
SELECT COUNT(*) FROM users;
```

**Output**:

```plaintext
COUNT(*)
---------
3
```

**Explanation**:

The `COUNT` function returns the number of rows in a table. In this example, it counts all rows in the `users` table.

##### SUM

**Input**:

```sql
SELECT SUM(TotalAmount) FROM orders;
```

**Output**:

```plaintext
SUM(TotalAmount)
----------------
1100.0
```

**Explanation**:

The `SUM` function returns the total sum of a numeric column. In this example, it calculates the total sum of the `TotalAmount` column in the `orders` table.

##### AVG

**Input**:

```sql
SELECT AVG(TotalAmount) FROM orders;
```

**Output**:

```plaintext
AVG(TotalAmount)
----------------
275.0
```

**Explanation**:

The `AVG` function returns the average value of a numeric column. In this example, it calculates the average value of the `TotalAmount` column in the `orders` table.

##### MIN

**Input**:

```sql
SELECT MIN(TotalAmount) FROM orders;
```

**Output**:

```plaintext
MIN(TotalAmount)
----------------
150.0
```

**Explanation**:

The `MIN` function returns the minimum value of a numeric column. In this example, it finds the minimum value of the `TotalAmount` column in the `orders` table.

##### MAX

**Input**:

```sql
SELECT MAX(TotalAmount) FROM orders;
```

**Output**:

```plaintext
MAX(TotalAmount)
----------------
450.0
```

**Explanation**:
The `MAX` function returns the maximum value of a numeric column. In this example, it finds the maximum value of the `TotalAmount` column in the `orders` table.

##### Using Aggregate Functions with WHERE Clause

**Input**:

```sql
SELECT COUNT(*) FROM orders
 WHERE TotalAmount > 200;
```

**Output**:

```plaintext
COUNT(*)
---------
2
```

**Explanation**:

Aggregate functions can be combined with the `WHERE` clause to filter rows before performing the calculation. In this example, it counts the number of orders where the `TotalAmount` is greater than 200.

##### Using Aggregate Functions with GROUP BY

**Input**:

```sql
SELECT CustomerID, SUM(TotalAmount) FROM orders GROUP BY CustomerID;
```

**Output**:

```plaintext
CustomerID | SUM(TotalAmount)
-----------|-----------------
1          | 350.0
2          | 300.0
3          | 450.0
```

**Explanation**:

The `GROUP BY` clause is used with aggregate functions to group the result set by one or more columns. In this example, it groups the orders by `CustomerID` and calculates the total sum of `TotalAmount` for each customer.

##### Using HAVING Clause with Aggregate Functions

**Input**:

```sql
SELECT CustomerID, SUM(TotalAmount) FROM orders
 GROUP BY CustomerID
HAVING SUM(TotalAmount) > 300;
```

**Output**:

```plaintext
CustomerID | SUM(TotalAmount)
-----------|-----------------
3          | 450.0
```

**Explanation**:
The `HAVING` clause is used to filter groups based on a condition involving aggregate functions. In this example, it groups the orders by `CustomerID` and selects only those groups where the total sum of `TotalAmount` is greater than 300.

#### Workflow

To illustrate a typical workflow in using aggregate functions, let's go through a simple example:

1. **Create a Database**:

```bash
sqlite3 example.db
```

2. **Create Tables**:

```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    OrderDate DATETIME,
    TotalAmount REAL,
    FOREIGN KEY (CustomerID) REFERENCES users(id)
);
```

3. **Insert Data**:

```sql
INSERT INTO users (name, email) VALUES ('John Doe', 'john.doe@example.com');
INSERT INTO users (name, email) VALUES ('Alice Johnson', 'alice.johnson@example.com');
INSERT INTO users (name, email) VALUES ('Bob Smith', 'bob.smith@example.com');

INSERT INTO orders (CustomerID, OrderDate, TotalAmount) VALUES (1, '2024-01-01', 150.00);
INSERT INTO orders (CustomerID, OrderDate, TotalAmount) VALUES (1, '2024-01-02', 200.00);
INSERT INTO orders (CustomerID, OrderDate, TotalAmount) VALUES (2, '2024-01-03', 300.00);
INSERT INTO orders (CustomerID, OrderDate, TotalAmount) VALUES (3, '2024-01-04', 450.00);
```

4. **Use Aggregate Functions**:

```sql
-- Count the number of users
SELECT COUNT(*) FROM users;

-- Calculate the total sum of TotalAmount in orders
SELECT SUM(TotalAmount) FROM orders;

-- Calculate the average TotalAmount in orders
SELECT AVG(TotalAmount) FROM orders;

-- Find the minimum TotalAmount in orders
SELECT MIN(TotalAmount) FROM orders;

-- Find the maximum TotalAmount in orders
SELECT MAX(TotalAmount) FROM orders;

-- Count the number of orders where TotalAmount is greater than 200
SELECT COUNT(*) FROM orders
 WHERE TotalAmount > 200;

-- Group by CustomerID and calculate the total sum of TotalAmount for each customer
SELECT CustomerID, SUM(TotalAmount) FROM orders
 GROUP BY CustomerID;

-- Group by CustomerID and select only those groups where the total sum of TotalAmount is greater than 300
SELECT CustomerID, SUM(TotalAmount) FROM orders
 GROUP BY CustomerID
HAVING SUM(TotalAmount) > 300;
```

By mastering aggregate functions and their various usages, you can effectively perform calculations on multiple rows of data and derive meaningful insights from your SQLite database. Aggregate functions are essential for data analysis and reporting.
