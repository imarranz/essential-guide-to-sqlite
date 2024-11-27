

### Inner Join

An inner join is a powerful SQL operation used to combine rows from two or more tables based on a related column between them. The result of an inner join includes only the rows where there is a match in both tables, ensuring that only the intersections of the datasets are included in the result set.

#### Syntax

The basic syntax for performing an inner join in SQLite is as follows:

```sql
SELECT columns
  FROM table1
 INNER JOIN table2
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

#### Performing an Inner Join

**Example**:

```sql
SELECT customers.CustomerName, orders.OrderID
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

In this example, only the records with matching `CustomerID` values in both the `customers` and `orders` tables are included in the result set.

#### Using Aliases

Aliases can be used to make table names and column names more readable and manageable in SQL queries. The `AS` keyword is used to assign an alias to a column or table.

**Example with Aliases**:

```sql
SELECT c.CustomerName AS Name, o.OrderID AS OrderNumber
  FROM customers AS c
 INNER JOIN orders AS o
    ON c.CustomerID = o.CustomerID
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
```

#### Inner Join with Additional Conditions

You can add more conditions to the `WHERE` clause to further filter the results of an inner join.

**Example with Additional Conditions**:

```sql
SELECT c.CustomerName, o.OrderID, o.OrderDate
  FROM customers AS c
 INNER JOIN orders AS o
       ON c.CustomerID = o.CustomerID
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
```

#### Inner Join with Multiple Tables

Inner joins can also be performed on more than two tables, allowing you to combine data from multiple sources.

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
SELECT c.CustomerName, o.OrderID, e.EmployeeName
  FROM customers AS c
 INNER JOIN orders AS o
       ON c.CustomerID = o.CustomerID
 INNER JOIN employees AS e
       ON o.CustomerID = e.EmployeeID
 LIMIT 10;
```

**Explanation**:

This query joins three tables (`customers`, `orders`, and `employees`) on their respective matching columns to provide a more comprehensive result set.

**Output**:

```plaintext
CustomerName                       | OrderID | EmployeeName
-----------------------------------|---------|--------------
Alfreds Futterkiste                | 10248   | Nancy Davolio
Ana Trujillo Emparedados y helados | 10249   | Andrew Fuller
Antonio Moreno Taquería            | 10250   | Janet Leverling
```

By mastering inner joins, you can effectively combine and analyze data from multiple tables in your SQLite database, gaining deeper insights and making more informed decisions.
