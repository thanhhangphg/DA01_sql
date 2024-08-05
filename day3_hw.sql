-- hw1
SELECT NAME
FROM CITY
WHERE POPULATION > 120000 AND COUNTRYCODE = 'USA';

-- hw2
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';

-- hw3
SELECT CITY, STATE
FROM STATION;

-- hw4
SELECT DISTINCT CITY
FROM STATION
WHERE CITY IN ('A%', 'E%', 'I%', 'O%', 'U%');

-- hw5
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE 'A%' 
   OR CITY LIKE 'E%' 
   OR CITY LIKE 'I%' 
   OR CITY LIKE 'O%' 
   OR CITY LIKE 'U%';

-- hw6
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE 'A%'
   AND CITY NOT LIKE 'E%'
   AND CITY NOT LIKE 'I%'
   AND CITY NOT LIKE 'O%'
   AND CITY NOT LIKE 'U%';

-- hw7
SELECT name
FROM Employee
ORDER BY name;

-- hw8
SELECT name
FROM Employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id;

-- hw9
SELECT product_id
FROM Products
WHERE low_fats = 'Y' 
AND recyclable = 'Y';

-- hw10
SELECT name 
FROM Customer 
WHERE referee_id != 2 OR referee_id IS NULL;

-- hw11
SELECT name, population, area
FROM World
WHERE area > 3000000 OR population > 25000000;

-- hw12
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;

-- hw13
SELECT part, assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;

-- hw14
SELECT * 
FROM lyft_drivers
WHERE yearly_salary <= 30000 OR yearly_salary >= 70000;

-- hw15
SELECT * 
FROM lyft_drivers
WHERE yearly_salary <= 30000 OR yearly_salary >= 70000;
