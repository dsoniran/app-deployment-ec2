# Database Options Challenge

## What is a Database?
A Database is an organised, collection of information (data) that's stored in a computer system. It allows applications to store, retrieve, update and amange informtion efficiently. It is often controlled by a Database Management System (DBMS).

There are two main categories of databases:
 - Relational (SQL) databases
 - Non-relational (NoSQL) databases

## What is a DBMS (Database Management System)
A DBMS is a software that manages the database controlling access, secutirty and structure. Examples include Oracle, MySQL, SQLlite, Microsoft SQL, Apache Tiger, MongoDB, Cassandra.

## Relational Databases (SQL)

 <b>Data is queried using Structured Query Language (SQL).</b>

### Structure
Relational databases store data in tables made up of:
 - Rows (records)
 - Columns (fields with defined data types)

Key structural features:
 - Fixed schema (columns are predefined)
 - Primary keys uniquely identify rows (PK) ie. user_id
 - Foreign keys define relationships between tables (FK) ie. user_id in Orders
 - Data integrity enforced through constraints (NOT NULL, UNIQUE, etc.)
 
```pgsql
+-------------+        +-------------+
|   Users     |        |   Orders    |
+-------------+        +-------------+
| user_id PK  |<------ | order_id PK |
| name        |        | user_id FK  |
| email       |        | order_date  |
+-------------+        | total       |
                       +-------------+
```

### When Would This Database Be Used?
 - Relational databases are best used when:
 - Data is highly structured
 - Relationships between data are important
 - Strong data consistency is required
 - Complex queries and joins are needed
 - Transactions must follow ACID principles (Atomicity, Consistency, Isolation, Durability)

### Common use cases:
 - Banking and financial systems
 - E-commerce platforms
 - Inventory management systems
 - User authentication and account systems

### Examples of Relational Databases
 - MySQL
 - PostgreSQL
 - Microsoft SQL Server
 - Oracle Database
 - SQLite

## Non-relational Databases (NoSQL)
### Structure
Non-relational databases do not use traditional tables. Instead, they support flexible data models such as:
 - Document-based (JSON-like documents)
 - Key-value pairs
 - Column-family stores
 - Graph-based structures

Key structural features:
 - Schema-less or flexible schema
 - Data can vary between records
 - Optimised for horizontal scaling
 - Often designed for high availability and performance

```bash
Collection: users
----------------------------
{
  "_id": "123",
  "name": "Alice",
  "email": "alice@email.com",
  "orders": [
    {
      "order_id": "A1",
      "total": 50.00
    },
    {
      "order_id": "A2",
      "total": 30.00
    }
  ]
}
# Documents Database
```

### When Would This Database Be Used?
 - Non-relational databases are best used when:
 - Data structure changes frequently
 - Large volumes of data are required
 - Scalability is a priority
 - Speed and performance outweigh strict consistency
 - Applications handle unstructured or semi-structured data

### Common use cases:
 - Real-time analytics
 - Social media platforms
 - Content management systems
 - IoT applications
 - Caching and session storage

### Examples of Non-Relational Databases
 - MongoDB (document-based)
 - DynamoDB (key-value)
 - Redis (in-memory key-value)
 - Cassandra (column-family)
 - Neo4j (graph)


## Comparison: Relational vs Non-Relational Databases
|Feature | Relational (SQL) |Non-Relational (NoSQL)|
|---|---|---|
|Data Structure	| Tables with rows and columns| Documents, key-value, graph, or columns |
|Schema| Fixed | Flexible or schema-less |
|Scalability | Vertical (scale up)| Horizontal (scale out) |
|Query Language | SQL | Database-specific APIs |
|Relationships | Strongly enforced | Typically handled in application logic|
|Consistency | Strong (ACID compliant) | Often eventual consistency |
|Best For | Structured, transactional data | Large-scale, flexible data |


## Summary
Relational databases are ideal for applications that require structured data, strong consistency, and complex relationships. Non-relational databases excel in scenarios that demand flexibility, scalability, and performance with large or rapidly changing datasets.

Choosing the right database depends on the application’s data structure, scalability needs, and consistency requirements.

## Sources
 - [IBM: SQL vs NoSQL](https://www.ibm.com/think/topics/sql-vs-nosql)
 - [Coursera: Relational vs Non-Relational Databases](https://www.coursera.org/articles/relational-vs-non-relational-database)
 - [AWS: What's the Difference Between Relational and Non-relational Databases](https://aws.amazon.com/compare/the-difference-between-relational-and-non-relational-databases)
  - [Microsoft: Sql vs. NoSQL data](https://learn.microsoft.com/en-us/dotnet/architecture/cloud-native/relational-vs-nosql-data)