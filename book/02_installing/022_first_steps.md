
[TOC]

***

## Installing SQLite

### First Steps

Once you have successfully installed SQLite on your system, it's time to get started with some basic operations. This section will guide you through the initial steps of using SQLite, including creating a database, running basic commands, and understanding the SQLite shell.

#### Creating a New Database

Creating a new SQLite database is straightforward. You simply run the `sqlite3` command followed by the desired name of your database file. If the file does not exist, SQLite will create it for you.

```bash
sqlite3 mydatabase.db
```

This command opens the SQLite shell and creates a new database file named `mydatabase.db` in the current directory. If `mydatabase.db` already exists, the command will open the existing database.

#### Opening the SQLite Shell

The SQLite shell is an interactive command-line interface that allows you to execute SQL commands directly on your database. To open the shell without specifying a database, simply run:

```bash
sqlite3
```

In the shell, you can create a new database or open an existing one using the `.open` command:

```sql
.open mydatabase.db
```

#### Running Basic SQL Commands

Once inside the SQLite shell, you can start executing SQL commands. Here are a few basic commands to get you started:

- **Creating a Table**: Use the `CREATE TABLE` command to define a new table. For example, to create a table named `users`:

```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);
```

- **Inserting Data**: Use the `INSERT INTO` command to add records to your table. For example, to insert a new user into the `users` table:

```sql
INSERT INTO users (name, email) VALUES ('John Doe', 'john.doe@example.com');
```

- **Querying Data**: Use the `SELECT` command to retrieve data from your table. For example, to select all records from the `users` table:

```sql
SELECT * FROM users;
```

- **Updating Data**: Use the `UPDATE` command to modify existing records. For example, to update the email address of the user with `id` 1:

```sql
UPDATE users SET email = 'john.newemail@example.com' WHERE id = 1;
```

- **Deleting Data**: Use the `DELETE` command to remove records from your table. For example, to delete the user with `id` 1:

```sql
DELETE FROM users WHERE id = 1;
```

#### Exiting the SQLite Shell

To exit the SQLite shell, you can use the `.exit` or `.quit` command:

```sql
.exit
```

Alternatively, you can simply press `Ctrl+D`.

#### Using SQLite Commands

SQLite provides a set of special commands (dot commands) that are not SQL commands but are used to control the behavior of the SQLite shell. Some useful dot commands include:

- **`.tables`**: List all tables in the current database.

```sql
.tables
```

- **`.schema [table_name]`**: Show the SQL schema of a specific table or all tables if no table name is provided.

```sql
.schema users
```

- **`.databases`**: List all databases opened in the current connection.

```sql
.databases
```

- **`.mode [mode]`**: Change the output mode (e.g., column, csv, list, html).

```sql
.mode column
```

- **`.headers [on|off]`**: Turn on or off the display of column headers.

```sql
.headers on
```

- **`.help`**: Display a list of all dot commands and their descriptions.

```sql
.help
```

#### Example Workflow

To illustrate a typical workflow in SQLite, let's go through a simple example:

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

  7. **Exit the Shell**:

```sql
.exit
```

By following these steps, you can quickly get up and running with SQLite, creating databases, running SQL commands, and managing your data efficiently. Whether you're using SQLite for small projects, learning SQL, or integrating it into larger applications, these first steps will provide a solid foundation.
