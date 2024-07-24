
[TOC]

***

## Advanced SQL Commands

### Deleting Data

Deleting data is a fundamental operation for managing records in a database. In SQLite, the `DELETE` statement is used to remove one or more rows from a table. This section will guide you through the syntax and provide examples to help you understand how to delete data effectively.

#### Syntax

The basic syntax for deleting data in a table in SQLite is as follows:

```sql
DELETE FROM table_name
 WHERE condition;
```

- **table_name**: The name of the table from which you want to delete data.
- **condition**: A condition to specify which rows should be deleted. If no condition is provided, all rows in the table will be deleted.

#### Examples

##### Deleting a Single Row

**Input**:

```sql
DELETE FROM users
 WHERE id = 1;
```

**Output**:

```plaintext
1 row deleted.
```

**Input**:

```sql
SELECT * FROM users LIMIT 3;
```

**Output**:

```plaintext
id | name          | email                     | created_at
---|---------------|---------------------------|--------------------------
2  | Alice Johnson | alice.johnson@example.com | 2024-01-01 10:01:00
3  | Bob Smith     | bob.smith@example.com     | 2024-01-01 10:02:00
```

##### Deleting Multiple Rows

**Input**:

```sql
DELETE FROM users
 WHERE name LIKE 'Bob%';
```

**Output**:

```plaintext
1 row deleted.
```

**Input**:

```sql
SELECT * FROM users LIMIT 3;
```

**Output**:

```plaintext
id | name          | email                     | created_at
---|---------------|---------------------------|--------------------------
2  | Alice Johnson | alice.johnson@example.com | 2024-01-01 10:01:00
```

##### Deleting All Rows in a Table

**Input**:

```sql
DELETE FROM orders;
```

**Output**:

```plaintext
4 rows deleted.
```

**Input**:

```sql
SELECT * FROM orders LIMIT 3;
```

**Output**:

```plaintext
OrderID | CustomerID | OrderDate  | TotalAmount
--------|------------|------------|-------------
```

*Note: The table is empty after the delete operation.*

##### Using Conditions to Delete Data

**Input**:

```sql
DELETE FROM orders
 WHERE TotalAmount < 200;
```

**Output**:

```plaintext
1 row deleted.
```

**Input**:

```sql
SELECT * FROM orders LIMIT 3;
```

**Output**:

```plaintext
OrderID | CustomerID | OrderDate  | TotalAmount
--------|------------|------------|-------------
2       | 1          | 2024-01-02 | 250.00
3       | 2          | 2024-01-03 | 300.00
4       | 3          | 2024-01-04 | 450.00
```

##### Deleting Rows with Subqueries

**Input**:

```sql
DELETE FROM orders
 WHERE CustomerID IN (SELECT id FROM users WHERE name LIKE 'Alice%');
```

**Output**:

```plaintext
1 row deleted.
```

**Input**:

```sql
SELECT * FROM orders LIMIT 3;
```

**Output**:

```plaintext
OrderID | CustomerID | OrderDate  | TotalAmount
--------|------------|------------|-------------
2       | 1          | 2024-01-02 | 250.00
3       | 2          | 2024-01-03 | 300.00
4       | 3          | 2024-01-04 | 450.00
```

#### Workflow

To illustrate a typical workflow in deleting data, let's go through a simple example:

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

4. **Delete Data**:

```sql
-- Delete a single row
DELETE FROM users
 WHERE id = 1;

-- Delete multiple rows
DELETE FROM users
 WHERE name LIKE 'Bob%';

-- Delete all rows in a table
DELETE FROM orders;

-- Delete with conditions
DELETE FROM orders
 WHERE TotalAmount < 200;

-- Delete using subqueries
DELETE FROM orders
 WHERE CustomerID IN (SELECT id FROM users WHERE name LIKE 'Alice%');
```

By mastering the `DELETE` statement and its various uses, you can effectively manage and remove data from your SQLite database. Deleting data is a crucial operation for maintaining data integrity and relevance.
