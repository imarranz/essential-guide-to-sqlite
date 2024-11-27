
## Using SQLite in Command Line

### Launching SQLite Console

The SQLite console, also known as the SQLite shell, is a powerful command-line interface that allows you to interact directly with your SQLite databases. It provides a simple yet effective way to execute SQL commands and manage your databases. This section will guide you through launching the SQLite console and performing basic operations.

#### Opening the SQLite Console

To launch the SQLite console, open your terminal or command prompt and type the `sqlite3` command followed by the name of the database file you want to create or open. If the specified database file does not exist, SQLite will create it for you.

```bash
sqlite3 mydatabase.db
```

This command opens the SQLite shell and creates a new database file named `mydatabase.db` in the current directory. If `mydatabase.db` already exists, the command will open the existing database.

If you want to open the SQLite shell without specifying a database, simply run:

```bash
sqlite3
```

In this mode, you can use the `.open` command within the shell to create or open a database:

```sql
.open mydatabase.db
```

#### SQLite Shell Prompt

Once the SQLite console is launched, you will see a prompt that looks like this:

```plaintext
sqlite>
```

This prompt indicates that you are now in the SQLite shell and can start executing SQL commands. The shell provides an interactive environment where you can perform various database operations.

#### Running SQL Commands

You can now enter SQL commands directly at the `sqlite>` prompt. Here are a few basic commands to get you started:

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

#### Using Dot Commands

In addition to SQL commands, the SQLite shell supports a set of special commands known as dot commands. These commands are used to control the behavior of the SQLite shell and provide useful functionality that is not part of the SQL standard. Here are some commonly used dot commands:

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

#### Exiting the SQLite Console

To exit the SQLite console, you can use the `.exit` or `.quit` command:

```sql
.exit
```

Alternatively, you can simply press `Ctrl+D`.

#### Example Workflow

To illustrate a typical workflow in the SQLite console, let's go through a simple example:

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

By following these steps, you can efficiently use the SQLite console to create and manage your databases, execute SQL commands, and control the shell environment with dot commands. The SQLite shell is a powerful tool that simplifies database management and provides a flexible platform for interacting with your data.
