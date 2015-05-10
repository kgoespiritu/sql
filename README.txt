* Hello and Welcome to Gemar's SQL Experiments
* This series will initially focus with MySQL
* MySQL Developer Topics

1. Architecture
   - Client Programs
   - SQL Modes
   - Variables / Properties in Session Scope
2. SQL Statement
   - Identifiers
   - Data Types
   - Functions and Operators
   - Comment Syntax
   - Prepared Statements
   - Transactions & Transaction Isolation Levels
3. SQL Schema Objects
   - Database
   - Table
   - Table Constraints
   - Views
   - Metadata
4. Stored Programs
   - Triggers
   - Stored Programs
   - Stored Functions
   - Error Handling
5. Querying for Data
   - SELECT
   - SELECT limit columns
   - SELECT limit rows
   - SELECT ... sort
   - SELECT ... aggregate
6. Modifying Data
   - INSERT
   - REPLACE
   - UPDATE
   - LOAD DATA
   - TRUNCATE [ TABLE ] table_name
   - DELETE
7. Join Subquery Union
   - JOIN
   - subquery
   - SELECT ... UNION [ ALL ] SELECT ...
8. Application Development
   - MySQL Drivers
   - JAVA
   - PHP
   - .NET
   - Error Handling
   - Collecting Diagnostic Information
   - NoSQL and Memcached
9. Basic Optimization
   - Identify Unoptimized Statements
   - Optimize by Indexes
   - Fix Unoptimized Statements
   - Optimize InnoDB Tables
   - Optimize by Normalization

*
* MySQL Documentation Index
*

Preface
General Information
Installing and Upgrading MySQL
Tutorial

MySQL Programs
Server Administration
MySQL Security
Backup and Recovery
Optimization

Language Structure
Globalization
Data Types
   - overview
   - numeric
   - date time
   - string
   - spatial
   - default
   - 
   - 
Functions and Operators
   - reference
   - type conversion
   - operators
   - string
   - numeric
   - date / time
   - calendar
   - full text
   - cast
   - xml
   - bit
   - encryption & compression
   - information
   - spatial data
   - gtid
   - enterprise encryption
   - miscellanous
   - group by
      - AVG()
      - COUNT( [DISTINCT] )
      - GROUP_CONCAT()
      - MAX()
      - MIN()
      - STD()
      - STDDEV_POP()
      - STDDEX_SAMP()
      - SUM()
      - VAR_POP()
      - VAR_SAMP()
      - VARIANCE()
   - precision math

SQL Statement Syntax
   - Database Objects
      - server
      - database
      - event
      - index
      - logfile event
      - table
      - tablespace
      - trigger
      - stored function
      - stored procedure
      - views
   - DDS
      - CREATE
      - ALTER
      - DROP
      - RENAME
      - TRUNCATE
   - DMS
      - CALL
      - DO
      - INSERT
      - REPLACE
      - UPDATE
      - LOAD DATA
      - LOAD XML
      - DELETE
      - HANDLER
      - SELECT
      - subquery
   - TS
      - START TRANSACTION , COMMIT , ROLLBACK
      - cannot be rolled back
      - implicit commit
      - SAVEPOINT , ROLLBACK TO SAVEPOINT , RELEASE SAVEPOING
      - LOCK TABLES , UNLOCK TABLES
      - SET TRANSACTION
      - XA Transactions 
   - RS
      - Master
      - Slave
   - PS
      - PREPARE
      - EXECUTE
      - DEALLOCATE PREPARE
   - CS
      - BEGIN ... END
      - label
      - DECLARE
      - sp variables
      - flow control
      - cursors
      - condition handling
   - AS
      - account management
      - table maintenance
      - plugin and user-defined functions
      - SET
      - SHOW
      - others
   - US
      - DESCRIBE
      - EXPLAIN
      - HELP
      - USE

InnoDB Storage Engine
Alternative Storage Engines
High Availability and Scalability
Replication
Cluster NDB
Partitioning

Stored Programs and Views
Information_Schema
Performance_Schema

Connectors and API
Extending MySQL

MySQL Enterprise Edition
MySQL Workbench
MySQL for Excel
