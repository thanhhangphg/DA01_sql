-- hw1
SELECT DISTINCT CITY
FROM STATION
WHERE ID%2=0;

-- hw2
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION;

-- hw3
SELECT CAST(CEILING(AVG(CAST(salary AS FLOAT)) - AVG(CAST(REPLACE(salary, '0', '') AS FLOAT))) AS INT)
FROM EMPLOYEES
WHERE salary BETWEEN 1000 AND 100000;

-- hw4
SELECT ROUND(SUM(CAST(item_count AS decimal)*order_occurrences)/SUM(order_occurrences), 1)
FROM items_per_order;

-- hw5
SELECT DISTINCT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3;

-- hw6
SELECT user_id, (MAX(DATE(post_date)) - MIN(DATE(post_date))) AS days_between
FROM posts
WHERE post_date BETWEEN '2021-01-01' AND '2022-01-01'
GROUP BY user_id
HAVING COUNT(post_date) > 1;

-- hw7
SELECT card_name, MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC;

-- hw8
SELECT manufacturer, COUNT(drug) AS drug_count, ABS(SUM(total_sales - cogs)) AS total_loss
FROM pharmacy_sales
WHERE total_sales < cogs
GROUP BY manufacturer
ORDER BY total_loss DESC;

-- hw9
SELECT *
FROM Cinema
WHERE id%2=1 AND description NOT LIKE "%boring%"
ORDER BY rating DESC;

-- hw10
SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;

-- hw11
SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;

-- hw12
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
