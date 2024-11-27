
### Right Join

A right join, also known as a right outer join, returns all records from the right table and the matched records from the left table. If there is no match, the result is `NULL` on the side of the left table. Right joins are useful when you need to include all records from the right table, regardless of whether there is a matching record in the left table.

<div class="warning">
<b>Note</b>: SQLite does not support the `RIGHT` `JOIN` directly. To achieve the functionality of a right join, we can use a left join by reversing the table order.
</div>

#### Syntax

The basic syntax for performing a right join in SQLite (using a reversed left join) is as follows:

```sql
SELECT columns
  FROM table2
  LEFT JOIN table1
       ON table2.common_column = table1.common_column;
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

#### Performing a Right Join

**Example**:

```sql
SELECT orders.OrderID, customers.CustomerName
  FROM orders
  LEFT JOIN customers
       ON orders.CustomerID = customers.CustomerID
 LIMIT 10;
```

**Explanation**:

This query selects the `OrderID` from the `orders` table and the `CustomerName` from the `customers` table, returning all orders and their corresponding customers. If an order does not have a matching customer, the `CustomerName` will be `NULL`.

**Output**:

```plaintext
OrderID | CustomerName
--------|-------------------------------
10248   | Alfreds Futterkiste
10249   | Ana Trujillo Emparedados y helados
10250   | Antonio Moreno Taquería
10251   | Around the Horn
10252   | Berglunds snabbköp
10253   | NULL
10254   | NULL
```

#### Using Aliases

Aliases can be used to make table names and column names more readable and manageable in SQL queries. The `AS` keyword is used to assign an alias to a column or table.

**Example with Aliases**:

```sql
SELECT o.OrderID AS OrderNumber, c.CustomerName AS Name
  FROM orders AS o
  LEFT JOIN customers AS c
       ON o.CustomerID = c.CustomerID
 LIMIT 10;
```

**Explanation**:

This query assigns the alias `o` to the `orders` table and `c` to the `customers` table. The selected columns are also given aliases: `OrderID` as `OrderNumber` and `CustomerName` as `Name`.

**Output**:

```plaintext
OrderNumber | Name
------------|-------------------------------------
10248       | Alfreds Futterkiste
10249       | Ana Trujillo Emparedados y helados
10250       | Antonio Moreno Taquería
10251       | Around the Horn
10252       | Berglunds snabbköp
10253       | NULL
10254       | NULL
```

#### Right Join with Additional Conditions

You can add more conditions to the `WHERE` clause to further filter the results of a right join.

**Example with Additional Conditions**:

```sql
SELECT o.OrderID, c.CustomerName, o.OrderDate
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
OrderID | CustomerName                       | OrderDate
--------|------------------------------------|------------
10250   | Antonio Moreno Taquería            | 2024-07-06
10251   | Around the Horn                    | 2024-07-07
10252   | Berglunds snabbköp                 | 2024-07-08
10253   | NULL                               | 2024-07-09
10254   | NULL                               | 2024-07-10
```

#### Right Join with Multiple Tables

Right joins can also be performed on more than two tables, allowing you to combine data from multiple sources.

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
 LIMIT 10;
```

**Explanation**:

This query joins three tables (`orders`, `customers`, and `employees`) on their respective matching columns to provide a more comprehensive result set. Since we use left joins, all orders will be included in the results, even if they have no matching customers or employees.

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

By mastering right joins (using reversed left joins), you can effectively combine and analyze data from multiple tables in your SQLite database, ensuring that all records from the secondary table are included in your analysis.
