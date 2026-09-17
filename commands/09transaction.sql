
-- transaction: group of statements that are executed as a single unit of work

START TRANSACTION;

UPDATE accounts 
SET balance = balance - 100
WHERE id = 1;

UPDATE accounts
SET balance = balance + 100
WHERE id = 2;

-- if correct
COMMIT; -- commit the transaction, making the changes permanent -- DURABILITY

--- if error
ROLLBACK; -- rollback the transaction, undoing the changes -- ATOMICITY

-- postgresql specific command
BEGIN;

UPDATE accounts
SET balance = balance - 100
WHERE id = 1;

UPDATE accounts
SET balance = balance + 100
WHERE id = 2;

ROLLBACK; -- rollback the transaction, undoing the changes -- ATOMICITY




-- LOCKING: mechanism to control concurrent access to data in a database, preventing conflicts and ensuring data integrity

-- row level lock
START TRANSACTION;
SELECT * FROM accounts WHERE id = 1 FOR UPDATE; -- lock the row for update/for share

UPDATE accounts
SET balance = balance - 100
WHERE id = 1;

COMMIT; -- release the lock and commit the transaction

-- table level lock
LOCK TABLES students WRITE; -- lock the table for write operations

UPDATE students
SET email = 'test@example.com'
WHERE id = 1;

UNLOCK TABLES; -- release the lock