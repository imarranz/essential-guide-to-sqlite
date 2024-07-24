
[TOC]

***

## Joins

### Full Join

A full join, also known as a full outer join, returns all records when there is a match in either the left or right table. If there is no match, the result is `NULL` on the side of the table without a match. Full joins are useful when you need to retain all records from both tables, even if some records do not have corresponding matches in the other table.


<div class="warning">
<b>Note</b>: SQLite does not support the `FULL` `JOIN` directly. Instead, you can achieve the functionality of a full join by combining the results of a left join and a right join using a `UNION`.
</div>

#### Syntax

The basic syntax for performing a full join in SQLite (using a combination of left and right joins) is as follows:

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

- **columns**: The specific columns you want to retrieve from the tables.
- **table1** and **table2**: The names of the tables you want to join.
- **common_column**: The column that is common between both tables and is used to join them.

#### Tables for Examples

We will use the following two tables, `customers` and `orders`, for our examples. These tables have been designed with some `CustomerID` values present in one table but not the other, to demonstrate the effects of different join operations.

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

#### Performing a Full Join

**Example**:

```sql
SELECT customers.CustomerName, orders.OrderID
  FROM customers
  LEFT JOIN orders
       ON customers.CustomerID = orders.CustomerID
 UNION
SELECT customers.CustomerName, orders.OrderID
  FROM orders
  LEFT JOIN customers
       ON orders.CustomerID = customers.CustomerID
 LIMIT 10;
```

**Explanation**:

This query selects the `CustomerName` from the `customers` table and the `OrderID` from the `orders` table. It performs a left join first and then a right join (by reversing the table order) to include all records from both tables.

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

#### Using Aliases

Aliases can be used to make table names and column names more readable and manageable in SQL queries. The `AS` keyword is used to assign an alias to a column or table.

**Example with Aliases**:

```sql
SELECT c.CustomerName AS Name, o.OrderID AS OrderNumber
  FROM customers AS c
  LEFT JOIN orders AS o
       ON c.CustomerID = o.CustomerID
 UNION
SELECT c.CustomerName AS Name, o.OrderID AS OrderNumber
  FROM orders AS o
  LEFT JOIN customers AS c
       ON o.CustomerID = c.CustomerID
 LIMIT 10;
```

**Explanation**:

This query assigns the alias `c` to the `customers` table and `o` to the `orders` table. The selected columns are also given aliases: `CustomerName` as `Name` and `OrderID` as `OrderNumber`.

**Output**:

```plaintext
Name                               | OrderNumber
-----------------------------------|------------
Alfreds Futterkiste                | 10248
Ana Trujillo Emparedados y helados | 10249
Antonio Moreno Taquería            | 10250
Around the Horn                    | 10251
Berglunds snabbköp                 | 10252
Blauer See Delikatessen            | NULL
NULL                               | 10253
NULL                               | 10254
```

#### Full Join with Additional Conditions

You can add more conditions to the `WHERE` clause to further filter the results of a full join.

**Example with Additional Conditions**:

```sql
SELECT c.CustomerName, o.OrderID, o.OrderDate
  FROM customers AS c
  LEFT JOIN orders AS o
       ON c.CustomerID = o.CustomerID
 WHERE o.OrderDate > '2024-07-05'
 UNION
SELECT c.CustomerName, o.OrderID, o.OrderDate
  FROM orders AS o
  LEFT JOIN customers AS c
       ON o.CustomerID = c.CustomerID
 WHERE o.OrderDate > '2024-07-05'
 LIMIT 10;
```

**Explanation**:

This query filters the results to include only the orders with an `OrderDate` greater than '2024-07-05'.

**Output**:

```plaintext
CustomerName                       | OrderID | OrderDate
-----------------------------------|---------|------------
Antonio Moreno Taquería            | 10250   | 2024-07-06
Around the Horn                    | 10251   | 2024-07-07
Berglunds snabbköp                 | 10252   | 2024-07-08
NULL                               | 10253   | 2024-07-09
NULL                               | 10254   | 2024-07-10
```

#### Full Join with Multiple Tables

Full joins can also be performed on more than two tables, allowing you to combine data from multiple sources.

**Example with Multiple Tables**:

Assume we have an additional `employees` table:
```sql
CREATE TABLE employees (
    EmployeeID INTEGER PRIMARY KEY,
    EmployeeName TEXT NOT NULL,
    Title TEXT
);

INSERT INTO employees (EmployeeID, EmployeeName, Title) VALUES
(1, 'Nancy Davolio', 'Sales Representative'),
(2, 'Andrew Fuller', 'Vice President'),
(3, 'Janet Leverling', 'Sales Representative');
```

**Join Example**:

```sql
SELECT o.OrderID, c.CustomerName, e.EmployeeName
  FROM orders AS o
  LEFT JOIN customers AS c
       ON o.CustomerID = c.CustomerID
  LEFT JOIN employees AS e
       ON o.CustomerID = e.EmployeeID
 UNION
SELECT o.OrderID, c.CustomerName, e.EmployeeName
  FROM customers AS c
  LEFT JOIN orders AS o
       ON c.CustomerID = o.CustomerID
  LEFT JOIN employees AS e
       ON o.CustomerID = e.EmployeeID
 LIMIT 10;
```

**Explanation**:

This query joins three tables (`orders`, `customers`, and `employees`) on their respective matching columns to provide a more comprehensive result set. Since we use a combination of left joins to simulate a full join, all records from each table are included in the results.

**Output**:

```plaintext
OrderID | CustomerName                       | EmployeeName
--------|------------------------------------|--------------
10248   | Alfreds Futterkiste                | NULL
10249   | Ana Trujillo Emparedados y helados | NULL
10250   | Antonio Moreno Taquería            | NULL
10251   | Around the Horn                    | NULL
10252   | Berglunds snabbköp                 | NULL
10253   | NULL                               | NULL
10254   | NULL                               | NULL
```

By mastering full joins (using a combination of left and right joins), you can effectively combine and analyze data from multiple tables in your SQLite database, ensuring that all records from both tables are included in your analysis.
