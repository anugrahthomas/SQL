-- list all databases
SHOW DATABASES;

-- creating database
CREATE DATABASE university;

-- select database
USE university;

-- show current database
SELECT DATABASE();

-- delete database
DROP DATABASE university;

-- conditional creation of database
CREATE DATABASE IF NOT EXISTS university;

-- conditional deletion of database
DROP DATABASE IF EXISTS university;

-- alter database (rename, owner, character set, collation) // some of these commands may not work in all database systems
ALTER DATABASE university
RENAME TO university_db;


-- show tables in the current database
SHOW TABLES;
