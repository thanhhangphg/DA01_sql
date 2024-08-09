-- hw1
SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID;

-- hw2
SELECT user_id, CONCAT(UPPER(LEFT(name, 1)), LOWER(RIGHT(name, LENGTH(name)-1))) AS name
FROM Users
ORDER BY user_id;

-- hw3
SELECT manufacturer, '$' || ROUND(SUM(total_sales)/1000000) || ' million' AS sales_mil
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY ROUND(SUM(total_sales)/1000000) DESC, manufacturer DESC;

-- hw4
SELECT EXTRACT(MONTH FROM submit_date) AS mth, product_id, ROUND(AVG(stars),2) AS avg_stars
FROM reviews
GROUP BY EXTRACT(MONTH FROM submit_date), product_id
ORDER BY mth, product_id;

-- hw5
SELECT sender_id, COUNT(message_id) AS count_messages
FROM messages
WHERE EXTRACT(MONTH FROM sent_date) = 8 AND EXTRACT(YEAR FROM sent_date) = 2022
GROUP BY sender_id
ORDER BY count_messages DESC
LIMIT 2;

-- hw6
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;

-- hw7
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-07-27' - 30 AND '2019-07-27'
GROUP BY activity_date
HAVING COUNT(DISTINCT user_id) > 1
ORDER BY active_users DESC;

  -- hw8
SELECT EXTRACT(MONTH FROM joining_date) AS month, COUNT(id) AS employees_hired
FROM employees
WHERE EXTRACT(MONTH FROM joining_date) BETWEEN 1 AND 8
GROUP BY EXTRACT(MONTH FROM joining_date)
ORDER BY month;

-- hw9
SELECT POSITION('a' IN first_name)
FROM worker
WHERE first_name = 'Amitah';

-- hw10
SELECT title, SUBSTRING(title FROM POSITION('2' IN TITLE)  for 4) AS year
FROM winemag_p2
WHERE country = 'Macedonia'
