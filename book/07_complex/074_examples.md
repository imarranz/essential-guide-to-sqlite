
[TOC]

***

## Complex Queries

### Examples

In this section, we'll provide extended examples of complex SQL commands used in SQLite, demonstrating how to use `GROUP BY`, `HAVING`, multiple aggregate functions, and aliasing with the `AS` keyword. Each example will include the SQL input and the expected output, with `LIMIT` applied to shorten the outputs for readability. Additionally, each example is followed by a detailed explanation of the SQL syntax used.

#### GROUP BY with COUNT

**Input**:

```sql
SELECT CustomerID,
       COUNT(*) AS OrderCount
  FROM orders
 GROUP BY CustomerID
 LIMIT 3;
```

**Output**:

```plaintext
CustomerID | OrderCount
-----------|------------
1          | 2
2          | 1
3          | 1
```

**Explanation**:

The `GROUP BY` clause groups the rows by `CustomerID`, and the `COUNT` function counts the number of orders for each customer. The `AS` keyword is used to rename the result of `COUNT(*)` to `OrderCount` for better readability.

#### GROUP BY with SUM

**Input**:

```sql
SELECT CustomerID,
       SUM(TotalAmount) AS TotalSpent
  FROM orders
 GROUP BY CustomerID
 LIMIT 3;
```

**Output**:

```plaintext
CustomerID | TotalSpent
-----------|-----------
1          | 350.0
2          | 300.0
3          | 450.0
```

**Explanation**:

The `GROUP BY` clause groups the rows by `CustomerID`, and the `SUM` function calculates the total `TotalAmount` spent by each customer. The `AS` keyword renames the result of `SUM(TotalAmount)` to `TotalSpent`.

#### GROUP BY with HAVING and COUNT

**Input**:

```sql
SELECT CustomerID,
       COUNT(*) AS OrderCount
  FROM orders
 GROUP BY CustomerID
HAVING COUNT(*) > 1
 LIMIT 3;
```

**Output**:

```plaintext
CustomerID | OrderCount
-----------|------------
1          | 2
```

**Explanation**:

The `GROUP BY` clause groups the rows by `CustomerID`, and the `COUNT` function counts the number of orders for each customer. The `HAVING` clause filters the groups to include only those customers who have more than one order. The `AS` keyword renames the result of `COUNT(*)` to `OrderCount`.

#### GROUP BY with HAVING and SUM

**Input**:

```sql
SELECT CustomerID,
       SUM(TotalAmount) AS TotalSpent
  FROM orders
 GROUP BY CustomerID
HAVING SUM(TotalAmount) > 300
 LIMIT 3;
```

**Output**:

```plaintext
CustomerID | TotalSpent
-----------|-----------
3          | 450.0
```

**Explanation**:

The `GROUP BY` clause groups the rows by `CustomerID`, and the `SUM` function calculates the total `TotalAmount` spent by each customer. The `HAVING` clause filters the groups to include only those customers whose total spending exceeds 300. The `AS` keyword renames the result of `SUM(TotalAmount)` to `TotalSpent`.

#### GROUP BY with Multiple Aggregate Functions

**Input**:

```sql
SELECT CustomerID,
       COUNT(*) AS OrderCount,
       SUM(TotalAmount) AS TotalSpent,
       AVG(TotalAmount) AS AverageSpent
  FROM orders
 GROUP BY CustomerID
 LIMIT 3;
```

**Output**:

```plaintext
CustomerID | OrderCount | TotalSpent | AverageSpent
-----------|------------|------------|--------------
1          | 2          | 350.0      | 175.0
2          | 1          | 300.0      | 300.0
3          | 1          | 450.0      | 450.0
```

**Explanation**:

The `GROUP BY` clause groups the rows by `CustomerID`, and multiple aggregate functions (`COUNT`, `SUM`, and `AVG`) are used to calculate the number of orders, total spending, and average spending for each customer. The `AS` keyword renames the results for better readability.

#### GROUP BY with HAVING, Multiple Aggregate Functions, and Alias

**Input**:

```sql
SELECT CustomerID,
       COUNT(*) AS OrderCount,
       SUM(TotalAmount) AS TotalSpent,
       AVG(TotalAmount) AS AverageSpent
  FROM orders
 GROUP BY CustomerID
HAVING SUM(TotalAmount) > 300
 LIMIT 3;
```

**Output**:

```plaintext
CustomerID | OrderCount | TotalSpent | AverageSpent
-----------|------------|------------|--------------
3          | 1          | 450.0      | 450.0
```

**Explanation**:

The `GROUP BY` clause groups the rows by `CustomerID`, and multiple aggregate functions (`COUNT`, `SUM`, and `AVG`) are used to calculate the number of orders, total spending, and average spending for each customer. The `HAVING` clause filters the groups to include only those customers whose total spending exceeds 300. The `AS` keyword renames the results for better readability.

### Workflow

To illustrate a typical workflow in using complex SQL commands with aggregate functions, `GROUP BY`, `HAVING`, and aliasing, let's go through a simple example:

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

4. **Use Complex SQL Commands**:

```sql
-- Group by CustomerID and count the number of orders
-- for each customer
SELECT CustomerID, COUNT(*) AS OrderCount FROM orders
 GROUP BY CustomerID
 LIMIT 3;

-- Group by CustomerID and calculate the total sum of TotalAmount
-- for each customer
SELECT CustomerID, SUM(TotalAmount) AS TotalSpent FROM orders
 GROUP BY CustomerID
 LIMIT 3;

-- Group by CustomerID and count the number of orders for each customer,
-- having more than one order
SELECT CustomerID, COUNT(*) AS OrderCount FROM orders
 GROUP BY CustomerID
HAVING COUNT(*) > 1
 LIMIT 3;

-- Group by CustomerID and calculate the total sum of TotalAmount for each customer,
-- having sum greater than 300
SELECT CustomerID, SUM(TotalAmount) AS TotalSpent FROM orders
 GROUP BY CustomerID
HAVING SUM(TotalAmount) > 300
 LIMIT 3;

-- Group by CustomerID and use multiple aggregate functions: COUNT, SUM, and AVG
SELECT CustomerID,
       COUNT(*) AS OrderCount,
       SUM(TotalAmount) AS TotalSpent,
       AVG(TotalAmount) AS AverageSpent FROM orders
 GROUP BY CustomerID
 LIMIT 3;

-- Group by CustomerID and use multiple aggregate functions with HAVING clause
SELECT CustomerID,
       COUNT(*) AS OrderCount,
       SUM(TotalAmount) AS TotalSpent,
       AVG(TotalAmount) AS AverageSpent FROM orders
 GROUP BY CustomerID
HAVING SUM(TotalAmount) > 300
 LIMIT 3;
```

By mastering these complex SQL commands and their various usages with aggregate functions, `GROUP BY`, `HAVING`, and aliasing with `AS`, you can effectively manage and analyze grouped data in your SQLite database. These commands are essential for performing advanced data analysis and reporting.
