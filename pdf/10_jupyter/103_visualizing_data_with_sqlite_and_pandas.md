
### Visualizing Data with SQLite and Pandas

Visualizing data is an essential step in data analysis as it helps to uncover insights, patterns, and trends within the data. In this section, we will explore how to visualize data stored in an SQLite database using the `pandas` library in a Jupyter Notebook. We will cover the steps to query the data from SQLite, load it into a `pandas` DataFrame, and create various types of visualizations using `matplotlib`.

#### Loading Data from SQLite into Pandas

The first step is to load the data from the SQLite database into a `pandas` DataFrame. This allows you to leverage the powerful data manipulation and analysis capabilities of `pandas`.

**Example**:

```python
import pandas as pd
import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('example.db')

# Query the database and load the results into a DataFrame
df = pd.read_sql_query('SELECT * FROM customers', conn)

# Display the DataFrame
print(df)

# Close the connection
conn.close()
```

In this example, we connect to the `example.db` SQLite database, execute a SQL query to select all records from the `customers` table, and load the results into a `pandas` DataFrame.

#### Basic Data Exploration

Before creating visualizations, it is helpful to explore the data to understand its structure and contents.

**Example**:

```python
# Display the first few rows of the DataFrame
print(df.head())

# Display summary statistics of the DataFrame
print(df.describe())

# Display the column names and data types
print(df.info())
```

These commands provide a quick overview of the data, including the first few rows, summary statistics, and the column names and data types.

#### Creating Visualizations with Matplotlib

`matplotlib` is a versatile plotting library that can be used to create a wide range of static, animated, and interactive visualizations. Below are some common types of visualizations that can be created using `matplotlib` and `pandas`.

##### Bar Plot

A bar plot is useful for comparing categorical data.

**Example**:

```python
import matplotlib.pyplot as plt

# Create a bar plot of the number of customers per country
df['Country'].value_counts().plot(kind='bar')

# Set the title and labels
plt.title('Number of Customers per Country')
plt.xlabel('Country')
plt.ylabel('Number of Customers')

# Show the plot
plt.show()
```

This example creates a bar plot showing the number of customers per country.

##### Line Plot

A line plot is useful for visualizing trends over time.

**Example**:

```python
# Assuming we have a 'sales' DataFrame with 'Date' and 'Sales' columns
# Create a line plot of sales over time
sales_df.plot(x='Date', y='Sales', kind='line')

# Set the title and labels
plt.title('Sales Over Time')
plt.xlabel('Date')
plt.ylabel('Sales')

# Show the plot
plt.show()
```

This example creates a line plot showing sales over time.

##### Scatter Plot

A scatter plot is useful for visualizing the relationship between two numerical variables.

**Example**:

```python
# Assuming we have a 'products' DataFrame with 'Price' and 'Quantity' columns
# Create a scatter plot of price vs. quantity
products_df.plot(x='Price', y='Quantity', kind='scatter')

# Set the title and labels
plt.title('Price vs. Quantity')
plt.xlabel('Price')
plt.ylabel('Quantity')

# Show the plot
plt.show()
```

This example creates a scatter plot showing the relationship between price and quantity.

##### Histogram

A histogram is useful for visualizing the distribution of a numerical variable.

**Example**:

```python
# Create a histogram of customer counts by country
df['Country'].value_counts().plot(kind='bar')

# Set the title and labels
plt.title('Distribution of Customers by Country')
plt.xlabel('Country')
plt.ylabel('Count')

# Show the plot
plt.show()
```

This example creates a histogram showing the distribution of customers by country.

##### Pie Chart

A pie chart is useful for visualizing the proportion of categories.

**Example**:

```python
# Create a pie chart of the number of customers per country
df['Country'].value_counts().plot(kind='pie', autopct='%1.1f%%')

# Set the title
plt.title('Proportion of Customers by Country')

# Show the plot
plt.show()
```

This example creates a pie chart showing the proportion of customers by country.

#### Customizing Visualizations

`matplotlib` provides extensive options for customizing visualizations, including setting colors, adding gridlines, and customizing tick marks.

**Example**:

```python
# Create a bar plot with customizations
df['Country'].value_counts().plot(kind='bar', color='skyblue', edgecolor='black')

# Set the title and labels
plt.title('Number of Customers per Country')
plt.xlabel('Country')
plt.ylabel('Number of Customers')

# Customize tick marks
plt.xticks(rotation=45)

# Add gridlines
plt.grid(True)

# Show the plot
plt.show()
```

This example creates a customized bar plot with specific colors, rotated tick marks, and gridlines.

#### Example: Full Workflow in Jupyter Notebook

Here is a complete example of querying data from an SQLite database, loading it into a `pandas` DataFrame, and creating a visualization.

**Step 1: Load the SQL extension and connect to the SQLite database**:

```python
%load_ext sql
%sql sqlite:///example.db
```

**Step 2: Load data from the SQLite database into a `pandas` DataFrame**:

```python
import pandas as pd
import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('example.db')

# Query the database and load the results into a DataFrame
df = pd.read_sql_query('SELECT * FROM customers', conn)

# Close the connection
conn.close()

# Display the DataFrame
print(df.head())
```

**Step 3: Create a visualization using `matplotlib`**:

```python
import matplotlib.pyplot as plt

# Create a bar plot of the number of customers per country
df['Country'].value_counts().plot(kind='bar', color='skyblue', edgecolor='black')

# Set the title and labels
plt.title('Number of Customers per Country')
plt.xlabel('Country')
plt.ylabel('Number of Customers')

# Customize tick marks
plt.xticks(rotation=45)

# Add gridlines
plt.grid(True)

# Show the plot
plt.show()
```

By following these steps, you can effectively visualize data stored in an SQLite database using `pandas` and `matplotlib` within a Jupyter Notebook. This enables interactive data exploration and analysis, making it easier to gain insights from your data.
