
[TOC]

***

## Advanced SQL Commands

### Sorting Results with ORDER BY

The `ORDER BY` clause is used to sort the result set of a query by one or more columns. By default, the sorting is in ascending order, but it can also be set to descending order. This section will guide you through the syntax and provide examples to help you understand how to sort results effectively.

#### Syntax

The basic syntax for sorting results in SQLite is as follows:

```sql
SELECT column1_name, column2_name, ... FROM table_name
 ORDER BY column_name [ASC|DESC];
```

- **table_name**: The name of the table from which to retrieve data.
- **column_name**: The name of the column by which to sort the results.
- **ASC**: Sorts the results in ascending order (default).
- **DESC**: Sorts the results in descending order.

#### Examples

##### Sorting by a Single Column in Ascending Order

**Input**:

```sql
SELECT * FROM users
 ORDER BY name ASC
 LIMIT 3;
```

**Output**:

```plaintext
id | name          | email                     | created_at
---|---------------|---------------------------|--------------------------
2  | Alice Johnson | alice.johnson@example.com | 2024-01-01 10:01:00
3  | Bob Smith     | bob.smith@example.com     | 2024-01-01 10:02:00
1  | John Doe      | john.doe@example.com      | 2024-01-01 10:00:00
```

##### Sorting by a Single Column in Descending Order

**Input**:

```sql
SELECT * FROM users
 ORDER BY name DESC
 LIMIT 3;
```

**Output**:

```plaintext
id | name          | email                     | created_at
---|---------------|---------------------------|--------------------------
1  | John Doe      | john.doe@example.com      | 2024-01-01 10:00:00
3  | Bob Smith     | bob.smith@example.com     | 2024-01-01 10:02:00
2  | Alice Johnson | alice.johnson@example.com | 2024-01-01 10:01:00
```

##### Sorting by Multiple Columns

**Input**:

```sql
SELECT * FROM orders
 ORDER BY CustomerID ASC, TotalAmount DESC
 LIMIT 3;
```

**Output**:

```plaintext
OrderID | CustomerID | OrderDate  | TotalAmount
--------|------------|------------|-------------
2       | 1          | 2024-01-02 | 200.00
1       | 1          | 2024-01-01 | 150.00
3       | 2          | 2024-01-03 | 300.00
```

##### Combining ORDER BY with WHERE Clause

**Input**:

```sql
SELECT * FROM users
 WHERE email LIKE '%example.com'
 ORDER BY created_at DESC
 LIMIT 3;
```

**Output**:

```plaintext
id | name          | email                     | created_at
---|---------------|---------------------------|--------------------------
3  | Bob Smith     | bob.smith@example.com     | 2024-01-01 10:02:00
2  | Alice Johnson | alice.johnson@example.com | 2024-01-01 10:01:00
1  | John Doe      | john.doe@example.com      | 2024-01-01 10:00:00
```

##### Sorting Numeric Values

**Input**:

```sql
SELECT * FROM orders
 ORDER BY TotalAmount ASC
 LIMIT 3;
```

**Output**:

```plaintext
OrderID | CustomerID | OrderDate  | TotalAmount
--------|------------|------------|-------------
1       | 1          | 2024-01-01 | 150.00
2       | 1          | 2024-01-02 | 200.00
3       | 2          | 2024-01-03 | 300.00
```

**Input**:

```sql
SELECT * FROM orders
 ORDER BY TotalAmount DESC
 LIMIT 3;
```

**Output**:

```plaintext
OrderID | CustomerID | OrderDate  | TotalAmount
--------|------------|------------|-------------
4       | 3          | 2024-01-04 | 450.00
3       | 2          | 2024-01-03 | 300.00
2       | 1          | 2024-01-02 | 200.00
```

#### Workflow

To illustrate a typical workflow in sorting data, let's go through a simple example:

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

4. **Sort Results**:

```sql
-- Sort by a single column in ascending order
SELECT * FROM users
 ORDER BY name ASC
 LIMIT 3;

-- Sort by a single column in descending order
SELECT * FROM users
 ORDER BY name DESC
 LIMIT 3;

-- Sort by multiple columns
SELECT * FROM orders
 ORDER BY CustomerID ASC, TotalAmount DESC
 LIMIT 3;

-- Combine ORDER BY with WHERE clause
SELECT * FROM users
 WHERE email LIKE '%example.com'
 ORDER BY created_at DESC
 LIMIT 3;

-- Sort numeric values in ascending order
SELECT * FROM orders
 ORDER BY TotalAmount ASC
 LIMIT 3;

-- Sort numeric values in descending order
SELECT * FROM orders
 ORDER BY TotalAmount DESC
 LIMIT 3;
```

By mastering the `ORDER BY` clause and its various usages, you can effectively sort and organize the results of your queries in SQLite. Sorting data is a crucial operation for viewing records in a meaningful order and enhancing data analysis.
