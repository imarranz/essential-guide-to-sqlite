
[TOC]

## Advanced SQL Commands

### Using WHERE Clause

The `WHERE` clause is essential in SQL for filtering records based on specified conditions. It allows you to select, update, and delete specific rows in a table. This section will guide you through various examples of using the `WHERE` clause effectively.

#### Syntax

The basic syntax for using the `WHERE` clause in SQLite is as follows:

```sql
SELECT column1_name, column2_name, ...
  FROM table_name
 WHERE condition;

UPDATE table_name
   SET column1_name = value1, column2_name = value2, ...
 WHERE condition;

DELETE FROM table_name
 WHERE condition;
```

- **table_name**: The name of the table where you want to apply the `WHERE` clause.

- **condition**: A condition to filter the rows affected by the query.

#### Examples

##### Selecting Data with WHERE Clause

**Input**:

```sql
SELECT * FROM users
 WHERE name = 'John Doe'
 LIMIT 3;
```

**Output**:

```plaintext
id | name     | email                 | created_at
---|----------|-----------------------|--------------------------
1  | John Doe | john.doe@example.com  | 2024-01-01 10:00:00
```

**Input**:

```sql
SELECT * FROM users
 WHERE email LIKE '%example.com'
 LIMIT 3;
```

**Output**:

```plaintext
id | name          | email                     | created_at
---|---------------|---------------------------|--------------------------
1  | John Doe      | john.doe@example.com      | 2024-01-01 10:00:00
2  | Alice Johnson | alice.johnson@example.com | 2024-01-01 10:01:00
3  | Bob Smith     | bob.smith@example.com     | 2024-01-01 10:02:00
```

##### Updating Data with WHERE Clause

**Input**:

```sql
UPDATE users
   SET email = 'john.newemail@example.com'
 WHERE name = 'John Doe';
```

**Output**:

```plaintext
1 row updated.
```

**Input**:

```sql
SELECT * FROM users
 WHERE name = 'John Doe'
 LIMIT 3;
```

**Output**:

```plaintext
id | name     | email                     | created_at
---|----------|---------------------------|---------------------
1  | John Doe | john.newemail@example.com | 2024-01-01 10:00:00
```

##### Deleting Data with WHERE Clause

**Input**:

```sql
DELETE FROM users
 WHERE name = 'Bob Smith';
```

**Output**:

```plaintext
1 row deleted.
```

**Input**:

```sql
SELECT * FROM users
 LIMIT 3;
```

**Output**:

```plaintext
id | name          | email                     | created_at
---|---------------|---------------------------|--------------------------
1  | John Doe      | john.newemail@example.com | 2024-01-01 10:00:00
2  | Alice Johnson | alice.johnson@example.com | 2024-01-01 10:01:00
```

##### Using WHERE Clause with AND/OR Operators

**Input**:

```sql
SELECT * FROM users
 WHERE name = 'John Doe' AND email = 'john.newemail@example.com'
 LIMIT 3;
```

**Output**:

```plaintext
id | name     | email                     | created_at
---|----------|---------------------------|--------------------------
1  | John Doe | john.newemail@example.com | 2024-01-01 10:00:00
```

**Input**:

```sql
SELECT * FROM users
 WHERE name = 'John Doe' OR name = 'Alice Johnson'
 LIMIT 3;
```

**Output**:

```plaintext
id | name          | email                     | created_at
---|---------------|---------------------------|--------------------------
1  | John Doe      | john.newemail@example.com | 2024-01-01 10:00:00
2  | Alice Johnson | alice.johnson@example.com | 2024-01-01 10:01:00
```

##### Using WHERE Clause with Comparison Operators

**Input**:

```sql
SELECT * FROM orders
 WHERE TotalAmount > 200
 LIMIT 3;
```

**Output**:

```plaintext
OrderID | CustomerID | OrderDate  | TotalAmount
--------|------------|------------|-------------
3       | 2          | 2024-01-03 | 300.00
4       | 3          | 2024-01-04 | 450.00
```

**Input**:

```sql
SELECT * FROM orders
 WHERE TotalAmount BETWEEN 150 AND 300
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

##### Using WHERE Clause with IN Operator

**Input**:

```sql
SELECT * FROM users
 WHERE name IN ('John Doe', 'Alice Johnson')
 LIMIT 3;
```

**Output**:

```plaintext
id | name          | email                     | created_at
---|---------------|---------------------------|--------------------------
1  | John Doe      | john.newemail@example.com | 2024-01-01 10:00:00
2  | Alice Johnson | alice.johnson@example.com | 2024-01-01 10:01:00
```

##### Using WHERE Clause with IS NULL/IS NOT NULL

**Input**:

```sql
SELECT * FROM users
 WHERE email IS NOT NULL
 LIMIT 3;
```

**Output**:

```plaintext
id | name          | email                     | created_at
---|---------------|---------------------------|--------------------------
1  | John Doe      | john.newemail@example.com | 2024-01-01 10:00:00
2  | Alice Johnson | alice.johnson@example.com | 2024-01-01 10:01:00
3  | Bob Smith     | bob.smith@example.com     | 2024-01-01 10:02:00
```

**Input**:

```sql
SELECT * FROM users WHERE email IS NULL LIMIT 3;
```

**Output**:

```plaintext
id | name | email | created_at
---|------|-------|-----------
```

*Note: This example shows no rows as all emails are not NULL.*

#### Workflow

To illustrate a typical workflow in using the `WHERE` clause, let's go through a simple example:

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

4. **Use WHERE Clause**:

```sql
-- Select data with WHERE clause
SELECT * FROM users
 WHERE name = 'John Doe'
 LIMIT 3;

-- Update data with WHERE clause
UPDATE users SET email = 'john.newemail@example.com'
 WHERE name = 'John Doe';

-- Delete data with WHERE clause
DELETE FROM users
 WHERE name = 'Bob Smith';

-- WHERE clause with AND/OR operators
SELECT * FROM users
 WHERE name = 'John Doe' AND email = 'john.newemail@example.com'
 LIMIT 3;

SELECT * FROM users
 WHERE name = 'John Doe' OR name = 'Alice Johnson'
 LIMIT 3;

-- WHERE clause with comparison operators
SELECT * FROM orders
 WHERE TotalAmount > 200
 LIMIT 3;

SELECT * FROM orders
 WHERE TotalAmount BETWEEN 150 AND 300
 LIMIT 3;

-- WHERE clause with IN operator
SELECT * FROM users
 WHERE name IN ('John Doe', 'Alice Johnson')
 LIMIT 3;

-- WHERE clause with IS NULL

/IS NOT NULL
SELECT * FROM users WHERE email IS NOT NULL LIMIT 3;
SELECT * FROM users WHERE email IS NULL LIMIT 3;
```

By mastering the `WHERE` clause and its various usages, you can effectively filter and manipulate data in your SQLite database. Using the `WHERE` clause is essential for precise data selection, updates, and deletions.
