

### Filtering Groups with HAVING

The `HAVING` clause is used to filter groups of rows after they have been grouped by the `GROUP BY` clause. It is similar to the `WHERE` clause but is applied to groups rather than individual rows. This section will guide you through the syntax and provide examples to help you understand how to use `HAVING` effectively.

#### Syntax

The basic syntax for using `HAVING` in SQLite is as follows:

```sql
SELECT column1_name, aggregate_function(column2_name)
  FROM table_name
 WHERE condition
 GROUP BY column1_name
HAVING aggregate_function(column2_name) condition;
```

- **column1_name**: The name of the column to group by.

- **aggregate_function**: The aggregate function to be applied (e.g., `COUNT`, `SUM`, `AVG`).

- **column2_name**: The name of the column on which the aggregate function is applied.

- **table_name**: The name of the table from which to retrieve data.

- **condition**: An optional condition to filter the rows before grouping and another condition to filter the groups after aggregation.

#### Examples

##### Basic HAVING with COUNT

**Input**:

```sql
SELECT CustomerID, COUNT(*) FROM orders
 GROUP BY CustomerID
HAVING COUNT(*) > 1
 LIMIT 3;
```

**Output**:

```plaintext
CustomerID | COUNT(*)
-----------|---------
1          | 2
```

**Explanation**:

The `GROUP BY` clause groups the rows by `CustomerID`, and the `COUNT` function counts the number of orders for each customer. The `HAVING` clause then filters the groups to include only those customers who have more than one order.

##### HAVING with SUM

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

The `GROUP BY` clause groups the rows by `CustomerID`, and the `SUM` function calculates the total `TotalAmount` for each customer. The `HAVING` clause then filters the groups to include only those customers whose total amount exceeds 300.

##### HAVING with AVG

**Input**:

```sql
SELECT CustomerID, AVG(TotalAmount) FROM orders
 GROUP BY CustomerID
HAVING AVG(TotalAmount) > 200
 LIMIT 3;
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

The `GROUP BY` clause groups the rows by `CustomerID`, and the `AVG` function calculates the average `TotalAmount` for each customer. The `HAVING` clause then filters the groups to include only those customers whose average order amount exceeds 200.

##### HAVING with MIN

**Input**:

```sql
SELECT CustomerID, MIN(TotalAmount) FROM orders
 GROUP BY CustomerID
HAVING MIN(TotalAmount) > 150
 LIMIT 3;
```

**Output**:

```plaintext
CustomerID | MIN(TotalAmount)
-----------|-----------------
2          | 300.0
3          | 450.0
```

**Explanation**:

The `GROUP BY` clause groups the rows by `CustomerID`, and the `MIN` function finds the minimum `TotalAmount` for each customer. The `HAVING` clause then filters the groups to include only those customers whose minimum order amount exceeds 150.

##### HAVING with MAX

**Input**:

```sql
SELECT CustomerID, MAX(TotalAmount) FROM orders
 GROUP BY CustomerID
HAVING MAX(TotalAmount) > 200
 LIMIT 3;
```

**Output**:

```plaintext
CustomerID | MAX(TotalAmount)
-----------|-----------------
2          | 300.0
3          | 450.0
```

**Explanation**:

The `GROUP BY` clause groups the rows by `CustomerID`, and the `MAX` function finds the maximum `TotalAmount` for each customer. The `HAVING` clause then filters the groups to include only those customers whose maximum order amount exceeds 200.

##### Combining HAVING with WHERE Clause

**Input**:

```sql
SELECT CustomerID, SUM(TotalAmount) FROM orders
 WHERE OrderDate > '2024-01-01'
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

The `WHERE` clause filters the rows to include only those orders placed after '2024-01-01'. The `GROUP BY` clause then groups these filtered rows by `CustomerID`, and the `SUM` function calculates the total `TotalAmount` for each customer. The `HAVING` clause filters the groups to include only those customers whose total amount exceeds 300.

##### HAVING with Multiple Conditions

**Input**:

```sql
SELECT CustomerID, COUNT(*), SUM(TotalAmount) FROM orders
 GROUP BY CustomerID
HAVING COUNT(*) > 1 AND SUM(TotalAmount) > 300
 LIMIT 3;
```

**Output**:

```plaintext
CustomerID | COUNT(*) | SUM(TotalAmount)
-----------|----------|-----------------
1          | 2        | 350.0
```

**Explanation**:

The `GROUP BY` clause groups the rows by `CustomerID`, and the `COUNT` function counts the number of orders while the `SUM` function calculates the total `TotalAmount` for each customer. The `HAVING` clause filters the groups to include only those customers who have more than one order and whose total amount exceeds 300.

#### Workflow

To illustrate a typical workflow in using `HAVING` with aggregate functions and `GROUP BY`, let's go through a simple example:

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

4. **Use HAVING with Aggregate Functions**:

```sql
-- Group by CustomerID and count the number of orders for each customer,
-- having more than one order
SELECT CustomerID, COUNT(*) FROM orders
 GROUP BY CustomerID
HAVING COUNT(*) > 1
 LIMIT 3;

-- Group by CustomerID and calculate the total sum of TotalAmount
-- for each customer, having sum greater than 300
SELECT CustomerID, SUM(TotalAmount) FROM orders
 GROUP BY CustomerID
HAVING SUM(TotalAmount) > 300
 LIMIT 3;

-- Group by CustomerID and calculate the average TotalAmount
-- for each customer, having average greater than 200
SELECT CustomerID, AVG(TotalAmount) FROM orders
 GROUP BY CustomerID
HAVING AVG(TotalAmount) > 200
 LIMIT 3;

-- Group by CustomerID and find the minimum TotalAmount
-- for each customer, having minimum greater than 150
SELECT CustomerID, MIN(TotalAmount) FROM orders
 GROUP BY CustomerID
HAVING MIN(TotalAmount) > 150
 LIMIT 3;

-- Group by CustomerID and find the maximum TotalAmount
-- for each customer, having maximum greater than 200
SELECT CustomerID, MAX(TotalAmount) FROM orders
 GROUP BY CustomerID
HAVING MAX(TotalAmount) > 200
 LIMIT 3;

-- Group by CustomerID and calculate the total sum of TotalAmount
-- for each customer after filtering by OrderDate, having sum greater than 300
SELECT CustomerID, SUM(TotalAmount) FROM orders
 WHERE OrderDate > '2024-01-01'
 GROUP BY CustomerID
HAVING SUM(TotalAmount) > 300
 LIMIT 3;

-- Group by CustomerID, count the number of orders and calculate
-- the total sum of TotalAmount for each customer,
-- having more than one order and sum greater than 300
SELECT CustomerID, COUNT(*), SUM(TotalAmount) FROM orders
 GROUP BY CustomerID
HAVING COUNT(*) > 1 AND SUM(TotalAmount) > 300
 LIMIT 3;
```

By mastering the `HAVING` clause and its various usages with aggregate functions and `GROUP BY`, you can effectively filter and analyze grouped data in your SQLite database. The `HAVING` clause is essential for refining grouped results and performing complex data analysis.
