-- hw1
SELECT COUNTRY.Continent, FLOOR(AVG(CITY.Population))
FROM CITY
JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code
GROUP BY COUNTRY.Continent;

-- hw2
SELECT ROUND((COUNT(t.email_id)*1.0)/COUNT(DISTINCT e.email_id), 2) AS activation_rate
FROM emails e
LEFT JOIN texts t ON e.email_id = t.email_id AND t.signup_action = 'Confirmed'

-- hw3
SELECT ab.age_bucket, ROUND(SUM(CASE WHEN ac.activity_type = 'send' THEN ac.time_spent ELSE 0 END)/SUM(ac.time_spent)*100.0,2) AS send_perc, ROUND(SUM(CASE WHEN ac.activity_type = 'open' THEN ac.time_spent ELSE 0 END)/SUM(ac.time_spent)*100.0,2) AS open_perc
FROM activities ac
INNER JOIN age_breakdown ab ON ac.user_id = ab.user_id
WHERE ac.activity_type IN ('open', 'send')
GROUP BY ab.age_bucket;

-- hw4
SELECT c.customer_id
FROM customer_contracts c
LEFT JOIN products p ON c.product_id = p.product_id
GROUP BY c.customer_id
HAVING COUNT(DISTINCT product_category) = 3;

-- hw5
SELECT DISTINCT m.employee_id, m.name, COUNT(e.employee_id) AS reports_count, ROUND(AVG(e.age), 0) AS average_age
FROM Employees e
INNER JOIN Employees m ON m.employee_id = e.reports_to
GROUP BY m.employee_id, m.name
ORDER BY m.employee_id;

-- hw6
SELECT p.product_name, SUM(o.unit) AS unit
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;

-- hw7
SELECT p.page_id
FROM pages p  
LEFT JOIN page_likes l ON p.page_id = l.page_id
WHERE l.liked_date IS NULL
ORDER BY p.page_id;
