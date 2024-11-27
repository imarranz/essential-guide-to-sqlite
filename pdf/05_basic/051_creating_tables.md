

## Basic SQL Commands

### Creating Tables

Creating tables is one of the fundamental operations when working with databases. In SQLite, the `CREATE TABLE` statement is used to define a new table and its structure. This section will guide you through the syntax and provide examples to help you understand how to create tables effectively.

#### Syntax

The basic syntax for creating a table in SQLite is as follows:

```sql
CREATE TABLE table_name (
    column1_name column1_type column1_constraints,
    column2_name column2_type column2_constraints,
    ...
);
```

- **table_name**: The name of the table you want to create.

- **column1_name, column2_name, ...**: The names of the columns in the table.

- **column1_type, column2_type, ...**: The data types of the columns (e.g., `INTEGER`, `TEXT`, `REAL`, `BLOB`, etc.).

- **column1_constraints, column2_constraints, ...**: Optional constraints on the columns (e.g., `PRIMARY KEY`, `NOT NULL`, `UNIQUE`, `FOREIGN KEY`, etc.).

#### Example

Let's create a simple table named `users` with the following columns:

- `id`: An integer that uniquely identifies each user and serves as the primary key.

- `name`: A text field that stores the user's name.

- `email`: A text field that stores the user's email address and must be unique.

- `created_at`: A datetime field that stores the date and time when the user was created.

Here is the SQL statement to create the `users` table:

```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

Explanation:

- `id INTEGER PRIMARY KEY`: Defines the `id` column as an integer and sets it as the primary key.

- `name TEXT NOT NULL`: Defines the `name` column as a text field that cannot be null.

- `email TEXT UNIQUE NOT NULL`: Defines the `email` column as a unique text field that cannot be null.

- `created_at DATETIME DEFAULT CURRENT_TIMESTAMP`: Defines the `created_at` column as a datetime field with a default value of the current timestamp.

#### More Complex Example

For a more complex example, let's create a `products` table with the following columns:

- `ProductID`: An integer that uniquely identifies each product and serves as the primary key.

- `ProductName`: A text field that stores the product's name.

- `SupplierID`: An integer that references the `SupplierID` in the `suppliers` table.

- `CategoryID`: An integer that references the `CategoryID` in the `categories` table.

- `QuantityPerUnit`: A text field that describes the quantity per unit.

- `UnitPrice`: A real number that represents the price per unit.

- `UnitsInStock`: An integer that represents the number of units in stock.

- `UnitsOnOrder`: An integer that represents the number of units on order.

- `ReorderLevel`: An integer that represents the reorder level.

- `Discontinued`: A boolean that indicates whether the product is discontinued.

Here is the SQL statement to create the `products` table:

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

Explanation:

- `ProductID INTEGER PRIMARY KEY`: Defines the `ProductID` column as an integer and sets it as the primary key.

- `ProductName TEXT NOT NULL`: Defines the `ProductName` column as a text field that cannot be null.

- `SupplierID INTEGER`: Defines the `SupplierID` column as an integer that references the `SupplierID` in the `suppliers` table.

- `CategoryID INTEGER`: Defines the `CategoryID` column as an integer that references the `CategoryID` in the `categories` table.

- `QuantityPerUnit TEXT`: Defines the `QuantityPerUnit` column as a text field.

- `UnitPrice REAL`: Defines the `UnitPrice` column as a real number.

- `UnitsInStock INTEGER`: Defines the `UnitsInStock` column as an integer.

- `UnitsOnOrder INTEGER`: Defines the `UnitsOnOrder` column as an integer.

- `ReorderLevel INTEGER`: Defines the `ReorderLevel` column as an integer.

- `Discontinued INTEGER NOT NULL CHECK (Discontinued IN (0, 1))`: Defines the `Discontinued` column as an integer that cannot be null, with a constraint to ensure the value is either 0 (false) or 1 (true).

- `FOREIGN KEY (SupplierID) REFERENCES suppliers(SupplierID)`: Creates a foreign key constraint on the `SupplierID` column that references the `SupplierID` in the `suppliers` table.

- `FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID)`: Creates a foreign key constraint on the `CategoryID` column that references the `CategoryID` in the `categories` table.

#### Common Data Types

Here are some of the common data types you can use when creating tables in SQLite:

- `INTEGER`: A signed integer.

- `REAL`: A floating-point number.

- `TEXT`: A text string.

- `BLOB`: A binary large object.

- `NUMERIC`: Stores numeric values with an arbitrary precision.

- `BOOLEAN`: Stores a boolean value (0 or 1).

- `DATETIME`: Stores date and time information.

#### Common Constraints

Here are some of the common constraints you can apply to columns in SQLite:

- `PRIMARY KEY`: Uniquely identifies each record in the table.

- `NOT NULL`: Ensures that the column cannot contain NULL values.

- `UNIQUE`: Ensures that all values in the column are unique.

- `CHECK (condition)`: Ensures that all values in the column satisfy the specified condition.

- `DEFAULT value`: Sets a default value for the column.

- `FOREIGN KEY (column) REFERENCES other_table(other_column)`: Creates a foreign key constraint.

By understanding how to create tables and define their structure, you can effectively manage and organize your data in SQLite. Creating well-structured tables is the first step towards building a robust and efficient database.
