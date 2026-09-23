
-- window function

-- simple example
SELECT name, score, RANK() OVER (ORDER BY score DESC) as rank
FROM students;

-- row_number
SELECT name, score, ROW_NUMBER() OVER (ORDER BY score DESC) as row_num
FROM students;

-- dense_rank
SELECT name, score, DENSE_RANK() OVER (ORDER BY score DESC) as dense_rank
FROM students;

-- rank
SELECT name, score, RANK() OVER (ORDER BY score DESC) as rank
FROM students;

-- percent_rank
SELECT name, score, PERCENT_RANK() OVER (ORDER BY score DESC) as percent_rank
FROM students;

-- lag
SELECT name, score, LAG(score, 1) OVER (ORDER BY score DESC) as previous_score
FROM students;

-- lead
SELECT name, score, LEAD(score, 1) OVER (ORDER BY score DESC) as next_score
FROM students;

-- partition by
SELECT name, score, RANK() OVER (PARTITION BY class ORDER BY score DESC) as rank
FROM students;