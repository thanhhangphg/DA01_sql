-- hw1
SELECT 
SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views, 
SUM(CASE WHEN device_type = 'phone' OR device_type = 'tablet' THEN 1 ELSE 0 END) AS mobile_views
FROM viewership

-- hw2
SELECT x, y, z,
CASE WHEN x + y <= z OR x + z <= y OR y + z <= x THEN 'No' ELSE 'Yes' END AS 'triangle'
FROM Triangle

-- hw3
SELECT CAST(SUM(CASE WHEN call_category = 'n/a' OR call_category IS NULL THEN 1 ELSE 0 END) AS float)/COUNT(*)*100 AS uncategorised_call_pct
FROM callers;

-- hw4
SELECT name
FROM Customer
WHERE CASE WHEN referee_id IS NULL OR referee_id !=2 THEN 1 ELSE 0 END = 1;

-- hw5
SELECT survived, SUM(CASE WHEN pclass = 1 THEN 1 ELSE 0 END) AS first_class, SUM(CASE WHEN pclass = 2 THEN 1 ELSE 0 END) AS second_class, SUM(CASE WHEN pclass = 3 THEN 1 ELSE 0 END) AS third_class
FROM titanic
GROUP BY survived;
