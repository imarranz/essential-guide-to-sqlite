
[TOC]

***

## Complex Queries

### Grouping Results with GROUP BY

The `GROUP BY` clause is used to arrange identical data into groups. It is often used in conjunction with aggregate functions to perform calculations on each group of data. This section will guide you through the syntax and provide examples to help you understand how to use `GROUP BY` effectively.

#### Syntax

The basic syntax for using `GROUP BY` in SQLite is as follows:

```sql
SELECT column1_name, aggregate_function(column2_name)
  FROM table_name
 WHERE condition
 GROUP BY column1_name;
```

- **column1_name**: The name of the column to group by.

- **aggregate_function**: The aggregate function to be applied (e.g., `COUNT`, `SUM`, `AVG`).

- **column2_name**: The name of the column on which the aggregate function is applied.

- **table_name**: The name of the table from which to retrieve data.

- **condition**: An optional condition to filter the rows before grouping.

#### Examples

##### Basic GROUP BY

**Input**:

```sql
SELECT CustomerID, COUNT(*) FROM orders
 GROUP BY CustomerID
 LIMIT 3;
```

**Output**:

```plaintext
CustomerID | COUNT(*)
-----------|---------
1          | 2
2          | 1
3          | 1
```

**Explanation**:

The `GROUP BY` clause groups the rows that have the same values in the `CustomerID` column. The `COUNT` function is then used to count the number of orders for each customer.

##### GROUP BY with SUM

**Input**:

```sql
SELECT CustomerID, SUM(TotalAmount) FROM orders
 GROUP BY CustomerID
 LIMIT 3;
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
The `GROUP BY` clause groups the rows by `CustomerID`, and the `SUM` function calculates the total `TotalAmount` for each customer.

##### GROUP BY with AVG

**Input**:

```sql
SELECT CustomerID, AVG(TotalAmount) FROM orders GROUP BY CustomerID LIMIT 3;
```

**Output**:

```plaintext
CustomerID | AVG(TotalAmount)
-----------|-----------------
1          | 175.0
2          | 300.0
3          | 450.0
```

**Explanation**:

The `GROUP BY` clause groups the rows by `CustomerID`, and the `AVG` function calculates the average `TotalAmount` for each customer.

##### GROUP BY with MIN

**Input**:

```sql
SELECT CustomerID, MIN(TotalAmount) FROM orders GROUP BY CustomerID LIMIT 3;
```

**Output**:

```plaintext
CustomerID | MIN(TotalAmount)
-----------|-----------------
1          | 150.0
2          | 300.0
3          | 450.0
```

**Explanation**:
The `GROUP BY` clause groups the rows by `CustomerID`, and the `MIN` function finds the minimum `TotalAmount` for each customer.

##### GROUP BY with MAX

**Input**:

```sql
SELECT CustomerID, MAX(TotalAmount) FROM orders
 GROUP BY CustomerID
 LIMIT 3;
```

**Output**:

```plaintext
CustomerID | MAX(TotalAmount)
-----------|-----------------
1          | 200.0
2          | 300.0
3          | 450.0
```

**Explanation**:
The `GROUP BY` clause groups the rows by `CustomerID`, and the `MAX` function finds the maximum `TotalAmount` for each customer.

##### GROUP BY with HAVING Clause

**Input**:

```sql
SELECT CustomerID, SUM(TotalAmount) FROM orders
 GROUP BY CustomerID
HAVING SUM(TotalAmount) > 300
 LIMIT 3;
```

**Output**:

```plaintext
CustomerID | SUM(TotalAmount)
-----------|-----------------
3          | 450.0
```

**Explanation**:

The `HAVING` clause is used to filter groups based on a condition involving aggregate functions. In this example, it groups the orders by `CustomerID` and selects only those groups where the total sum of `TotalAmount` is greater than 300.

##### GROUP BY Multiple Columns

**Input**:

```sql
SELECT CustomerID, OrderDate, COUNT(*) FROM orders
 GROUP BY CustomerID, OrderDate
 LIMIT 3;
```

**Output**:

```plaintext
CustomerID | OrderDate  | COUNT(*)
-----------|------------|---------
1          | 2024-01-01 | 1
1          | 2024-01-02 | 1
2          | 2024-01-03 | 1
```

**Explanation**:

The `GROUP BY` clause can group by multiple columns. In this example, it groups the rows by both `CustomerID` and `OrderDate`, and the `COUNT` function counts the number of orders for each group.

#### Workflow

To illustrate a typical workflow in using `GROUP BY` with aggregate functions, let's go through a simple example:

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

4. **Use GROUP BY**:

```sql
-- Group by CustomerID and count the number of orders for each customer
SELECT CustomerID, COUNT(*) FROM orders
 GROUP BY CustomerID
 LIMIT 3;

-- Group by CustomerID and calculate the total sum of TotalAmount for each customer
SELECT CustomerID, SUM(TotalAmount) FROM orders
 GROUP BY CustomerID
 LIMIT 3;

-- Group by CustomerID and calculate the average TotalAmount for each customer
SELECT CustomerID, AVG(TotalAmount) FROM orders
 GROUP BY CustomerID
 LIMIT 3;

-- Group by CustomerID and find the minimum TotalAmount for each customer
SELECT CustomerID, MIN(TotalAmount) FROM orders
 GROUP BY CustomerID
 LIMIT 3;

-- Group by CustomerID and find the maximum TotalAmount for each customer
SELECT CustomerID, MAX(TotalAmount) FROM orders
 GROUP BY CustomerID
 LIMIT 3;

-- Group by CustomerID and select only those groups
-- where the total sum of TotalAmount is greater than 300
SELECT CustomerID, SUM(TotalAmount) FROM orders
 GROUP BY CustomerID
HAVING SUM(TotalAmount) > 300
 LIMIT 3;

-- Group by multiple columns: CustomerID and OrderDate,
-- and count the number of orders for each group
SELECT CustomerID, OrderDate, COUNT(*) FROM orders
 GROUP BY CustomerID, OrderDate
 LIMIT 3;
```

By mastering the `GROUP BY` clause and its various usages with aggregate functions, you can effectively group and analyze data in your SQLite database. The `GROUP BY` clause is essential for summarizing data and performing complex data analysis.
