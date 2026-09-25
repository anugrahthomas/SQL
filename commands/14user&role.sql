
-- create user
-- MYSQL
CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'password123';
-- POSTGRESQL
CREATE USER new_user WITH PASSWORD 'password123';

-- read user information
-- MYSQL
SELECT user, host FROM mysql.user;
-- POSTGRESQL
SELECT usename FROM pg_user; -- \du


-- update user password
-- MYSQL
ALTER USER 'new_user'@'localhost' IDENTIFIED BY 'newpassword456';
-- POSTGRESQL
ALTER USER new_user WITH PASSWORD 'newpassword456';

-- delete user
-- MYSQL
DROP USER 'new_user'@'localhost';
-- POSTGRESQL
DROP USER new_user;

-- create role
-- MYSQL
CREATE ROLE 'new_role';
-- POSTGRESQL
CREATE ROLE new_role;

-- select role information
-- MYSQL
SELECT * FROM mysql.user WHERE user = 'new_role';
-- POSTGRESQL
SELECT rolname FROM pg_roles; -- \du new_role

-- update role
ALTER ROLE employee LOGIN;
-- MYSQL
ALTER ROLE 'new_role' WITH PASSWORD 'newpassword456';
-- POSTGRESQL
ALTER ROLE new_role WITH PASSWORD 'newpassword456';

-- delete role
-- MYSQL
DROP ROLE 'new_role';
-- POSTGRESQL
DROP ROLE new_role;

-- grant role to user
-- MYSQL
GRANT 'new_role' TO 'new_user'@'localhost';
-- POSTGRESQL
GRANT new_role TO new_user;

-- grant privileges to user
-- MYSQL
GRANT SELECT, INSERT, UPDATE ON university.* TO 'new_user'@'localhost';
-- POSTGRESQL
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO new_user

-- revoke role from user
-- MYSQL
REVOKE 'new_role' FROM 'new_user'@'localhost';
-- POSTGRESQL
REVOKE new_role FROM new_user;

-- grant privileges to role
-- MYSQL
GRANT SELECT, INSERT, UPDATE ON university.* TO 'new_role';
-- POSTGRESQL
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO new_role;

-- show role privileges
-- MYSQL
SHOW GRANTS FOR 'new_role';
-- POSTGRESQL
SELECT grantee, privilege_type FROM information_schema.role_table_grants WHERE grantee = 'new_role';

-- show user privileges
-- MYSQL
SHOW GRANTS FOR 'new_user'@'localhost';
-- POSTGRESQL
SELECT grantee, privilege_type FROM information_schema.role_table_grants WHERE grantee = 'new_user';