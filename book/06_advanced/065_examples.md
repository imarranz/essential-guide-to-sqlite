
[TOC]

***

## Advanced SQL Commands

### Examples

In this section, we'll provide extended examples of advanced SQL commands used in SQLite, demonstrating how to update, delete, and filter data, as well as sort results. Each example will include the SQL input and the expected output, with `LIMIT` applied to shorten the outputs for readability. Additionally, each example is followed by a detailed explanation of the SQL syntax used.

#### Updating Data

##### Update a single row

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
SELECT * FROM users
 WHERE id = 1
 LIMIT 1;
```

**Output**:

```plaintext
id | name     | email                     | created_at
---|----------|---------------------------|--------------------------
1  | John Doe | john.newemail@example.com | 2024-01-01 10:00:00
```

**Explanation**:

The `UPDATE` statement is used to modify existing records in a table. The `SET` clause specifies the column to be updated and its new value. The `WHERE` clause filters the rows to be updated. In this example, the `email` column of the row where `id` is 1 is updated to 'john.newemail@example.com'.

##### Update multiple rows

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
SELECT * FROM users
 WHERE name LIKE 'Alice%'
 LIMIT 1;
```

**Output**:

```plaintext
id | name          | email               | created_at
---|---------------|---------------------|--------------------------
2  | Alice Johnson | updated@example.com | 2024-01-01 10:01:00
```

**Explanation**:

The `UPDATE` statement with the `WHERE` clause can also be used to update multiple rows that meet a specific condition. The `LIKE` operator is used for pattern matching. In this example, all rows where the `name` starts with 'Alice' are updated to have the `email` set to 'updated@example.com'.

##### Incrementing values

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

**Explanation**:

The `UPDATE` statement can also be used to perform arithmetic operations on column values. In this example, the `TotalAmount` column is incremented by 50 for all rows where `TotalAmount` is less than 300.

#### Deleting Data

##### Delete a single row

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

**Explanation**:

The `DELETE` statement is used to remove rows from a table. The `WHERE` clause specifies which rows should be deleted. In this example, the row where `id` is 1 is deleted from the `users` table.

##### Delete multiple rows

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

**Explanation**:

The `DELETE` statement can also be used to delete multiple rows that match a specific condition. In this example, all rows where the `name` starts with 'Bob' are deleted from the `users` table.

##### Delete all rows in a table

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

**Explanation**:

To delete all rows in a table without removing the table itself, the `DELETE` statement is used without a `WHERE` clause. In this example, all rows are deleted from the `orders` table.

#### Using WHERE Clause

##### Select with WHERE clause

**Input**:

```sql
SELECT * FROM users
 WHERE name = 'John Doe'
 LIMIT 1;
```

**Output**:

```plaintext
id | name     | email                | created_at
---|----------|----------------------|--------------------------
1  | John Doe | john.doe@example.com | 2024-01-01 10:00:00
```

**Explanation**:

The `WHERE` clause is used to filter records based on a specified condition. In this example, the query selects all columns from the `users` table where the `name` is 'John Doe'.

##### Update with WHERE clause

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
 LIMIT 1;
```

**Output**:

```plaintext
id | name     | email                     | created_at
---|----------|---------------------------|--------------------------
1  | John Doe | john.newemail@example.com | 2024-01-01 10:00:00
```

**Explanation**:

The `WHERE` clause can also be used with the `UPDATE` statement to specify which rows should be updated. In this example, the `email` column is updated for all rows where the `name` is 'John Doe'.

##### Delete with WHERE clause

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
SELECT * FROM users LIMIT 3;
```

**Output**:

```plaintext
id | name          | email                     | created_at
---|---------------|---------------------------|--------------------------
2  | Alice Johnson | alice.johnson@example.com | 2024-01-01 10:01:00
```

**Explanation**:

The `WHERE` clause is used with the `DELETE` statement to specify which rows should be removed. In this example, the row where the `name` is 'Bob Smith' is deleted from the `users` table.

#### Sorting Results with ORDER BY

##### Sort by a single column in ascending order

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

**Explanation**:

The `ORDER BY` clause is used to sort the result set of a query by one or more columns. By default, the sorting is in ascending order (`ASC`). In this example, the query selects all columns from the `users` table and sorts the results by the `name` column in ascending order.

##### Sort by a single column in descending order

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

**Explanation**:

To sort the results in descending order, the `DESC` keyword is used with the `ORDER BY` clause. In this example, the query selects all columns from the `users` table and sorts the results by the `name` column in descending order.

##### Sort by multiple columns

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

**Explanation**:

The `ORDER BY` clause can be used to sort the results by multiple columns. The sorting priority is from left to right. In this example, the query selects all columns from the `orders` table and sorts the results by `CustomerID` in ascending order and `TotalAmount` in descending order.

##### Combine ORDER BY with WHERE clause

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

**Explanation**:

The `ORDER BY` clause can be combined with the `WHERE` clause to filter and sort the results. In this example, the query selects all columns from the `users` table where the `email` contains 'example.com' and sorts the results by the `created_at` column in descending order.

##### Sort numeric values

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

**Explanation**:

The `ORDER BY` clause is used to sort numeric values in ascending or descending order. In the first query, the `orders` table is sorted by `TotalAmount` in ascending order. In the second query, the same table is sorted by `TotalAmount` in descending order.

By practicing these extended examples, you can effectively utilize SQLite's advanced SQL commands to manage and query your data more efficiently. These examples demonstrate how to update, delete, filter, and sort data using various SQL clauses and operators.
