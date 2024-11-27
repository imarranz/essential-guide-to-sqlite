

### Basic Commands

Once you have launched the SQLite console, you can start using various commands to interact with your database. This section covers some of the basic commands that you will frequently use while working with SQLite. These commands will help you create tables, insert data, query data, update records, and delete records.

#### Creating Tables

The `CREATE TABLE` command is used to create a new table in your database. When defining a table, you specify the table name and the columns, along with their data types and any constraints.

**Syntax**:

```sql
CREATE TABLE table_name (
    column1_name column1_type column1_constraints,
    column2_name column2_type column2_constraints,
    ...
);
```

**Example**:

To create a table named `users` with columns `id`, `name`, and `email`:

```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);
```

#### Inserting Data

The `INSERT INTO` command is used to add new records to a table. You can specify the columns and the corresponding values for the new record.

**Syntax**:

```sql
INSERT INTO table_name (column1_name, column2_name, ...)
VALUES (value1, value2, ...);
```

**Example**:

To insert a new user into the `users` table:
```sql
INSERT INTO users (name, email) VALUES ('John Doe', 'john.doe@example.com');
```

#### Querying Data

The `SELECT` command is used to retrieve data from one or more tables. You can use various clauses to filter, sort, and format the results.

**Syntax**:

```sql
SELECT column1_name, column2_name, ...
  FROM table_name
 WHERE condition
 ORDER BY column_name [ASC|DESC];
```

**Example**:

To select all records from the `users` table:
```sql
SELECT * FROM users;
```

To select only the `name` and `email` columns for users with a specific condition:

```sql
SELECT name, email FROM users WHERE id = 1;
```

#### Updating Data

The `UPDATE` command is used to modify existing records in a table. You specify the table, the columns to be updated, and the condition that identifies the records to be updated.

**Syntax**:

```sql
UPDATE table_name
   SET column1_name = value1, column2_name = value2, ...
 WHERE condition;
```

**Example**:

To update the email address of the user with `id` 1:

```sql
UPDATE users SET email = 'john.newemail@example.com' WHERE id = 1;
```

#### Deleting Data

The `DELETE` command is used to remove records from a table. You specify the table and the condition that identifies the records to be deleted.

**Syntax**:

```sql
DELETE FROM table_name
 WHERE condition;
```

**Example**:

To delete the user with `id` 1 from the `users` table:

```sql
DELETE FROM users WHERE id = 1;
```

#### Creating Indexes

Indexes can improve the performance of queries by allowing SQLite to quickly locate rows in a table. Use the `CREATE INDEX` command to create an index on one or more columns.

**Syntax**:

```sql
CREATE INDEX index_name
ON table_name (column1_name, column2_name, ...);
```

**Example**:

To create an index on the `email` column of the `users` table:

```sql
CREATE INDEX idx_users_email ON users (email);
```

#### Listing Tables

To list all the tables in the current database, use the `.tables` command:

```sql
.tables
```

#### Describing Table Schema

To display the schema (structure) of a table, use the `.schema` command followed by the table name:

```sql
.schema table_name
```

**Example**:

To display the schema of the `users` table:

```sql
.schema users
```

#### Showing All Records

To display all records from a specific table, use the `SELECT` statement:

```sql
SELECT * FROM table_name;
```

**Example**:

To display all records from the `users` table:

```sql
SELECT * FROM users;
```

#### Using Aggregate Functions

SQLite supports various aggregate functions such as `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX` to perform calculations on data.

**Syntax**:

```sql
SELECT aggregate_function(column_name)
  FROM table_name
 WHERE condition;
```

**Example**:

To count the number of users in the `users` table:

```sql
SELECT COUNT(*) FROM users;
```

#### Example Workflow

To illustrate the use of these basic commands, let's go through a simple example:

1. **Create a Database**:

```bash
sqlite3 example.db
```

2. **Create a Table**:

```sql
CREATE TABLE products (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    price REAL NOT NULL
);
```

3. **Insert Data**:

```sql
INSERT INTO products (name, price) VALUES ('Laptop', 999.99);
INSERT INTO products (name, price) VALUES ('Smartphone', 499.99);
```

4. **Query Data**:

```sql
SELECT * FROM products;
```

5. **Update Data**:

```sql
UPDATE products SET price = 899.99 WHERE name = 'Laptop';
```

6. **Delete Data**:

```sql
DELETE FROM products WHERE name = 'Smartphone';
```

7. **Create an Index**:

```sql
CREATE INDEX idx_products_name ON products (name);
```

8. **List Tables**:

```sql
.tables
```

9. **Describe Table Schema**:

```sql
.schema products
```

By mastering these basic commands, you will be well-equipped to perform essential database operations and manage your data effectively using SQLite. The simplicity and power of these commands make SQLite a valuable tool for both beginners and experienced users.
