

### Inserting Data

Inserting data into tables is a crucial operation for populating your database with information. In SQLite, the `INSERT INTO` statement is used to add new records to a table. This section will guide you through the syntax and provide examples to help you understand how to insert data effectively.

#### Syntax

The basic syntax for inserting data into a table in SQLite is as follows:

```sql
INSERT INTO table_name (column1_name, column2_name, ...)
VALUES (value1, value2, ...);
```

- **table_name**: The name of the table where you want to insert data.
- **column1_name, column2_name, ...**: The names of the columns where you want to insert values.
- **value1, value2, ...**: The values to be inserted into the specified columns.

You can also insert data into all columns of a table without specifying the column names, as long as you provide values for all columns in the correct order:

```sql
INSERT INTO table_name
VALUES (value1, value2, ...);
```

#### Example

Let's insert data into a simple table named `users` with the following columns: `id`, `name`, `email`, and `created_at`.

Assuming the `users` table is created as follows:

```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

To insert a new user into the `users` table:

```sql
INSERT INTO users (name, email) VALUES ('John Doe', 'john.doe@example.com');
```

Explanation:
- `INSERT INTO users (name, email)`: Specifies the `users` table and the `name` and `email` columns.
- `VALUES ('John Doe', 'john.doe@example.com')`: Provides the values for the `name` and `email` columns.

If you want to insert data into all columns, including the primary key:

```sql
INSERT INTO users VALUES (1, 'John Doe', 'john.doe@example.com', '2024-01-01 10:00:00');
```

Explanation:
- `INSERT INTO users VALUES (1, 'John Doe', 'john.doe@example.com', '2024-01-01 10:00:00')`: Provides values for all columns in the correct order: `id`, `name`, `email`, and `created_at`.

#### Inserting Multiple Rows

You can insert multiple rows in a single `INSERT INTO` statement by separating each row with a comma:

```sql
INSERT INTO users (name, email) VALUES
('Alice Johnson', 'alice.johnson@example.com'),
('Bob Smith', 'bob.smith@example.com'),
('Carol White', 'carol.white@example.com');
```

#### More Complex Example

For a more complex example, let's insert data into the `products` table with the following columns: `ProductID`, `ProductName`, `SupplierID`, `CategoryID`, `QuantityPerUnit`, `UnitPrice`, `UnitsInStock`, `UnitsOnOrder`, `ReorderLevel`, and `Discontinued`.

Assuming the `products` table is created as follows:

```sql
CREATE TABLE products (
    ProductID INTEGER PRIMARY KEY,
    ProductName TEXT NOT NULL,
    SupplierID INTEGER,
    CategoryID INTEGER,
    QuantityPerUnit TEXT,
    UnitPrice REAL,
    UnitsInStock INTEGER,
    UnitsOnOrder INTEGER,
    ReorderLevel INTEGER,
    Discontinued INTEGER NOT NULL CHECK (Discontinued IN (0, 1)),
    FOREIGN KEY (SupplierID) REFERENCES suppliers(SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID)
);
```

To insert a new product into the `products` table:

```sql
INSERT INTO products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued) VALUES
('Chai', 1, 1, '10 boxes x 20 bags', 18.00, 39, 0, 10, 0);
```

Explanation:

- `INSERT INTO products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)`: Specifies the `products` table and the columns to insert values into.

- `VALUES ('Chai', 1, 1, '10 boxes x 20 bags', 18.00, 39, 0, 10, 0)`: Provides the values for the specified columns.

#### Inserting Data with Default Values

If a table column has a default value, you can omit that column from the `INSERT INTO` statement, and SQLite will use the default value.

Assuming the `users` table has a `created_at` column with a default value:

```sql
INSERT INTO users (name, email) VALUES ('Eve Black', 'eve.black@example.com');
```

Explanation:

- Since `created_at` has a default value, it is not necessary to specify it in the `INSERT INTO` statement. SQLite will automatically set it to the current timestamp.

#### Common Issues and Solutions

1. **Unique Constraint Violation**:

   - If you try to insert a duplicate value into a column with a `UNIQUE` constraint, SQLite will raise an error.

   - Solution: Ensure the values for `UNIQUE` columns are unique or handle the error using `INSERT OR IGNORE`.

   ```sql
   INSERT OR IGNORE INTO users (name, email) VALUES ('John Doe', 'john.doe@example.com');
   ```

2. **Not Null Constraint Violation**:

   - If you try to insert a null value into a column with a `NOT NULL` constraint, SQLite will raise an error.

   - Solution: Provide non-null values for columns with `NOT NULL` constraints.

3. **Foreign Key Constraint Violation**:

   - If you try to insert a value into a column with a foreign key constraint that does not exist in the referenced table, SQLite will raise an error.

   - Solution: Ensure the value exists in the referenced table or insert the referenced value first.

By understanding how to insert data into tables and handle common issues, you can effectively populate your SQLite database with information. Inserting data is a fundamental operation that enables you to work with and manipulate your database records.
