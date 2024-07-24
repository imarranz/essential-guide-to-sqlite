
[TOC]

***

## Basic SQL Commands

### Examples

In this section, we'll provide examples of common SQL commands used in SQLite, demonstrating how to create tables, insert data, and select data. Each example will include the SQL input and the expected output.

#### Creating Tables

**Input**:
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

**Output**:
```plaintext
Table created.
Table created.
```

#### Inserting Data

**Input**:

```sql
INSERT INTO users (name, email) VALUES ('John Doe', 'john.doe@example.com');
INSERT INTO users (name, email) VALUES ('Alice Johnson', 'alice.johnson@example.com');
INSERT INTO users (name, email) VALUES ('Bob Smith', 'bob.smith@example.com');

INSERT INTO orders (CustomerID, OrderDate, TotalAmount) VALUES (1, '2024-01-01', 150.00);
INSERT INTO orders (CustomerID, OrderDate, TotalAmount) VALUES (1, '2024-01-02', 200.00);
INSERT INTO orders (CustomerID, OrderDate, TotalAmount) VALUES (2, '2024-01-03', 300.00);
INSERT INTO orders (CustomerID, OrderDate, TotalAmount) VALUES (3, '2024-01-04', 450.00);
```

**Output**:

```plaintext
1 row inserted.
1 row inserted.
1 row inserted.
1 row inserted.
1 row inserted.
1 row inserted.
1 row inserted.
```

#### Selecting Data

##### Select all users

**Input**:

```sql
SELECT * FROM users LIMIT 3;
```

**Output**:

```plaintext
id | name          | email                 | created_at
---|---------------|-----------------------|--------------------------
1  | John Doe      | john.doe@example.com  | 2024-01-01 10:00:00
2  | Alice Johnson | alice.johnson@example.com | 2024-01-01 10:01:00
3  | Bob Smith     | bob.smith@example.com | 2024-01-01 10:02:00
```

##### Select specific columns

**Input**:

```sql
SELECT name, email FROM users LIMIT 3;
```

**Output**:

```plaintext
name          | email
--------------|--------------------------
John Doe      | john.doe@example.com
Alice Johnson | alice.johnson@example.com
Bob Smith     | bob.smith@example.com
```

##### Select orders with a total amount greater than $200

**Input**:

```sql
SELECT * FROM orders WHERE TotalAmount > 200 LIMIT 2;
```

**Output**:

```plaintext
OrderID | CustomerID | OrderDate  | TotalAmount
--------|------------|------------|-------------
3       | 2          | 2024-01-03 | 300.00
4       | 3          | 2024-01-04 | 450.00
```

##### Select all orders and sort them by `OrderDate` in descending order

**Input**:

```sql
SELECT * FROM orders ORDER BY OrderDate DESC LIMIT 3;
```

**Output**:

```plaintext
OrderID | CustomerID | OrderDate  | TotalAmount
--------|------------|------------|-------------
4       | 3          | 2024-01-04 | 450.00
3       | 2          | 2024-01-03 | 300.00
2       | 1          | 2024-01-02 | 200.00
```

##### Count the number of orders placed by each customer

**Input**:

```sql
SELECT CustomerID, COUNT(*) as OrderCount FROM orders GROUP BY CustomerID LIMIT 3;
```

**Output**:

```plaintext
CustomerID | OrderCount
-----------|------------
1          | 2
2          | 1
3          | 1
```

##### Select customers who have placed more than 1 order

**Input**:

```sql
SELECT CustomerID, COUNT(*) as OrderCount FROM orders
 GROUP BY CustomerID
HAVING COUNT(*) > 1
 LIMIT 1;
```

**Output**:

```plaintext
CustomerID | OrderCount
-----------|------------
1          | 2
```

##### Join `orders` and `users` tables to get order details along with customer names

**Input**:

```sql
SELECT o.OrderID, u.name, o.TotalAmount
  FROM orders o
  JOIN users u ON o.CustomerID = u.id
 LIMIT 3;
```

**Output**:

```plaintext
OrderID | name          | TotalAmount
--------|---------------|-------------
1       | John Doe      | 150.00
2       | John Doe      | 200.00
3       | Alice Johnson | 300.00
```

By practicing these examples, you can effectively utilize SQLite's SQL commands to manage and query your data. These examples demonstrate how to create tables, insert data, and select data with various conditions and joins, providing a solid foundation for working with SQLite.
