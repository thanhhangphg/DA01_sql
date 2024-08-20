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
