

## Joins

### Understanding Joins

In SQL, a join is a powerful tool that allows you to combine rows from two or more tables based on a related column between them. Joins are essential for querying data spread across multiple tables and are fundamental to relational database management.

In this section, we will cover the four main types of joins:

1. **Inner Join**: An inner join returns only the rows that have matching values in both tables. It retrieves records that fulfill the join condition, ensuring that only the intersections of the datasets are included in the result set. This type of join is useful when you need to find records that exist in both tables.<br><br>

2. **Left Join**: A left join returns all records from the left table, and the matched records from the right table. If there is no match, the result is NULL on the side of the right table. This type of join is helpful when you need to include all records from the left table, regardless of whether there is a matching record in the right table.<br><br>

3. **Right Join**: A right join returns all records from the right table, and the matched records from the left table. If there is no match, the result is NULL on the side of the left table. This join is useful when you need to include all records from the right table, irrespective of whether there is a corresponding record in the left table.<br><br>

4. **Full Join**: A full join returns all records when there is a match in either the left or right table. If there is no match, the result is NULL on the side of the table without a match. This join combines the results of both left and right joins and is beneficial when you need to retain all records from both tables, even if some records do not have corresponding matches in the other table.<br><br>

![](https://qph.cf2.quoracdn.net/main-qimg-5c60963f6a76a72df5e260baea1293a4)

We'll use two tables, `customers` and `orders`, with no more than 10 records each to illustrate these joins.

#### Tables for Examples

**Customers Table**:

```sql
CREATE TABLE customers (
    CustomerID INTEGER PRIMARY KEY,
    CustomerName TEXT NOT NULL,
    ContactName TEXT,
    Country TEXT
);

INSERT INTO customers (CustomerID, CustomerName, ContactName, Country) VALUES
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Germany'),
(2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Mexico'),
(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mexico'),
(4, 'Around the Horn', 'Thomas Hardy', 'UK'),
(5, 'Berglunds snabbköp', 'Christina Berglund', 'Sweden'),
(6, 'Blauer See Delikatessen', 'Hanna Moos', 'Germany');
```

**Orders Table**:

```sql
CREATE TABLE orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    OrderDate TEXT,
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);

INSERT INTO orders (OrderID, CustomerID, OrderDate) VALUES
(10248, 1, '2024-07-04'),
(10249, 2, '2024-07-05'),
(10250, 3, '2024-07-06'),
(10251, 4, '2024-07-07'),
(10252, 5, '2024-07-08'),
(10253, 7, '2024-07-09'),
(10254, 8, '2024-07-10');
```

#### Inner Join

An inner join returns records that have matching values in both tables.

**Syntax**:

```sql
SELECT columns
  FROM table1
 INNER JOIN table2
       ON table1.common_column = table2.common_column;
```

**Example**:

```sql
SELECT customers.CustomerName,
       orders.OrderID
  FROM customers
 INNER JOIN orders
       ON customers.CustomerID = orders.CustomerID
 LIMIT 10;
```

**Explanation**:

This query selects the `CustomerName` from the `customers` table and the `OrderID` from the `orders` table where the `CustomerID` matches in both tables.

**Output**:

```plaintext
CustomerName                       | OrderID
-----------------------------------|--------
Alfreds Futterkiste                | 10248
Ana Trujillo Emparedados y helados | 10249
Antonio Moreno Taquería            | 10250
Around the Horn                    | 10251
Berglunds snabbköp                 | 10252
```

#### Left Join

A left join returns all records from the left table and the matched records from the right table. The result is `NULL` from the right side if there is no match.

**Syntax**:

```sql
SELECT columns
  FROM table1
  LEFT JOIN table2
       ON table1.common_column = table2.common_column;
```

**Example**:

```sql
SELECT customers.CustomerName,
       orders.OrderID
  FROM customers
  LEFT JOIN orders
       ON customers.CustomerID = orders.CustomerID
 LIMIT 10;
```

**Explanation**:

This query selects the `CustomerName` from the `customers` table and the `OrderID` from the `orders` table, returning all customers and their corresponding orders. If a customer does not have an order, the `OrderID` will be `NULL`.

**Output**:

```plaintext
CustomerName                       | OrderID
-----------------------------------|--------
Alfreds Futterkiste                | 10248
Ana Trujillo Emparedados y helados | 10249
Antonio Moreno Taquería            | 10250
Around the Horn                    | 10251
Berglunds snabbköp                 | 10252
Blauer See Delikatessen            | NULL
```

#### Right Join

A right join returns all records from the right table and the matched records from the left table. The result is `NULL` from the left side when there is no match.

**Syntax**:

```sql
SELECT columns
  FROM table1
 RIGHT JOIN table2
       ON table1.common_column = table2.common_column;
```

**Example**:

```sql
SELECT customers.CustomerName,
       orders.OrderID
  FROM customers
 RIGHT JOIN orders
       ON customers.CustomerID = orders.CustomerID
 LIMIT 10;
```

**Explanation**:

This query selects the `CustomerName` from the `customers` table and the `OrderID` from the `orders` table, returning all orders and their corresponding customers. If an order does not have a matching customer, the `CustomerName` will be `NULL`.

**Output**:

```plaintext
CustomerName                       | OrderID
-----------------------------------|--------
Alfreds Futterkiste                | 10248
Ana Trujillo Emparedados y helados | 10249
Antonio Moreno Taquería            | 10250
Around the Horn                    | 10251
Berglunds snabbköp                 | 10252
NULL                               | 10253
NULL                               | 10254
```

#### Full Join

A full join returns all records when there is a match in either the left or right table. The result is `NULL` from either side when there is no match.

**Note**: SQLite does not support the `FULL JOIN` directly. Instead, you can achieve it using a `UNION` of a `LEFT JOIN` and a `RIGHT JOIN`.

**Syntax**:

```sql
SELECT columns
  FROM table1
  LEFT JOIN table2
       ON table1.common_column = table2.common_column
 UNION
SELECT columns
  FROM table1
 RIGHT JOIN table2
       ON table1.common_column = table2.common_column;
```

**Example**:

```sql
SELECT customers.CustomerName,
       orders.OrderID
  FROM customers
  LEFT JOIN orders
       ON customers.CustomerID = orders.CustomerID
 UNION
SELECT customers.CustomerName,
       orders.OrderID
  FROM customers
 RIGHT JOIN orders
       ON customers.CustomerID = orders.CustomerID
 LIMIT 10;
```

**Explanation**:

This query selects the `CustomerName` from the `customers` table and the `OrderID` from the `orders` table, returning all customers and all orders, whether they have matches in the other table or not.

**Output**:

```plaintext
CustomerName                       | OrderID
-----------------------------------|--------
Alfreds Futterkiste                | 10248
Ana Trujillo Emparedados y helados | 10249
Antonio Moreno Taquería            | 10250
Around the Horn                    | 10251
Berglunds snabbköp                 | 10252
Blauer See Delikatessen            | NULL
NULL                               | 10253
NULL                               | 10254
```

By understanding and utilizing these types of joins, you can effectively combine and analyze data from multiple tables in your SQLite database. Each join type serves a different purpose and can be used to solve various data querying needs.
