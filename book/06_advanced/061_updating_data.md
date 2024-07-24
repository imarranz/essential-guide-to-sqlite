
[TOC]

***

## Advanced SQL Commands

### Updating Data

Updating data in tables is a common operation when you need to modify existing records. In SQLite, the `UPDATE` statement is used to change data in one or more rows of a table. This section will guide you through the syntax and provide examples to help you understand how to update data effectively.

#### Syntax

The basic syntax for updating data in a table in SQLite is as follows:

```sql
UPDATE table_name
SET column1_name = value1, column2_name = value2, ...
WHERE condition;
```

- **table_name**: The name of the table where you want to update data.
- **column1_name, column2_name, ...**: The names of the columns you want to update.
- **value1, value2, ...**: The new values to be assigned to the columns.
- **condition**: A condition to specify which rows should be updated.

#### Examples

##### Updating a Single Row

**Input**:
```sql
UPDATE users
   SET email = 'john.newemail@example.com'
 WHERE id = 1;
```

**Output**:
```plaintext
1 row updated.
```

**Input**:
```sql
SELECT * FROM users WHERE id = 1;
```

**Output**:
```plaintext
id | name     | email                     | created_at
---|----------|---------------------------|--------------------------
1  | John Doe | john.newemail@example.com | 2024-01-01 10:00:00
```

##### Updating Multiple Rows

**Input**:

```sql
UPDATE users
   SET email = 'updated@example.com'
 WHERE name LIKE 'Alice%';
```

**Output**:

```plaintext
1 row updated.
```

**Input**:

```sql
SELECT * FROM users WHERE name LIKE 'Alice%' LIMIT 1;
```

**Output**:

```plaintext
id | name          | email                | created_at
---|---------------|----------------------|--------------------------
2  | Alice Johnson | updated@example.com  | 2024-01-01 10:01:00
```

##### Updating Multiple Columns

**Input**:

```sql
UPDATE users
   SET name = 'John Smith', email = 'john.smith@example.com'
 WHERE id = 1;
```

**Output**:

```plaintext
1 row updated.
```

**Input**:

```sql
SELECT * FROM users WHERE id = 1;
```

**Output**:

```plaintext
id | name       | email                  | created_at
---|------------|------------------------|--------------------------
1  | John Smith | john.smith@example.com | 2024-01-01 10:00:00
```

##### Incrementing Values

**Input**:

```sql
UPDATE orders
   SET TotalAmount = TotalAmount + 50
 WHERE TotalAmount < 300;
```

**Output**:

```plaintext
2 rows updated.
```

**Input**:

```sql
SELECT * FROM orders LIMIT 3;
```

**Output**:

```plaintext
OrderID | CustomerID | OrderDate  | TotalAmount
--------|------------|------------|-------------
1       | 1          | 2024-01-01 | 200.00
2       | 1          | 2024-01-02 | 250.00
3       | 2          | 2024-01-03 | 300.00
```

##### Using Subqueries in Updates

**Input**:

```sql
UPDATE users
   SET email = (SELECT email FROM users WHERE name = 'Bob Smith')
 WHERE name = 'John Doe';
```

**Output**:

```plaintext
1 row updated.
```

**Input**:

```sql
SELECT * FROM users WHERE name IN ('John Doe', 'Bob Smith');
```

**Output**:

```plaintext
id | name     | email                | created_at
---|----------|----------------------|--------------------------
1  | John Doe | bob.smith@example.com | 2024-01-01 10:00:00
3  | Bob Smith| bob.smith@example.com | 2024-01-01 10:02:00
```

##### Resetting Values

**Input**:

```sql
UPDATE orders
   SET TotalAmount = 0
 WHERE CustomerID = 3;
```

**Output**:

```plaintext
1 row updated.
```

**Input**:

```sql
SELECT * FROM orders WHERE CustomerID = 3;
```

**Output**:

```plaintext
OrderID | CustomerID | OrderDate  | TotalAmount
--------|------------|------------|-------------
4       | 3          | 2024-01-04 | 0.00
```

#### Workflow

To illustrate a typical workflow in updating data, let's go through a simple example:

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

4. **Update Data**:

```sql
-- Update a single row
UPDATE users SET email = 'john.newemail@example.com' WHERE id = 1;

-- Update multiple rows
UPDATE users SET email = 'updated@example.com' WHERE name LIKE 'Alice%';

-- Update multiple columns
UPDATE users SET name = 'John Smith', email = 'john.smith@example.com' WHERE id = 1;

-- Increment values
UPDATE orders SET TotalAmount = TotalAmount + 50 WHERE TotalAmount < 300;

-- Using subqueries in updates
UPDATE users SET email = (SELECT email FROM users WHERE name = 'Bob Smith') WHERE name = 'John Doe';

-- Resetting values
UPDATE orders SET TotalAmount = 0 WHERE CustomerID = 3;
```

By mastering the `UPDATE` statement and its various usages, you can effectively modify existing records in your SQLite database. Updating data is a crucial operation that ensures your data remains accurate and up-to-date.
