-- q1
SELECT DISTINCT replacement_cost
FROM film
ORDER BY replacement_cost;

-- q2
SELECT CASE WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 'low' WHEN replacement_cost BETWEEN 20 AND 24.99 THEN 'medium' WHEN replacement_cost BETWEEN 25 AND 29.99 THEN 'high' END AS category, COUNT(*) AS count
FROM film
GROUP BY category
ORDER BY count;

-- q3
SELECT f.title, f.length, c.name
FROM film f
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name IN ('Drama', 'Sports')
ORDER BY f.length DESC;

-- q4
SELECT c.name AS category, COUNT(f.title) AS count
FROM film f
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY count DESC;

-- q5
SELECT CONCAT(a.first_name, ' ', a.last_name) AS full_name, COUNT(f.film_id) AS count
FROM actor a
JOIN film_actor ac ON a.actor_id = ac.actor_id
JOIN film f ON ac.film_id = f.film_id
GROUP BY full_name
ORDER BY count DESC;

-- q6
SELECT COUNT(a.address)
FROM address a
LEFT JOIN customer c ON a.address_id = c.address_id
WHERE c.customer_id IS NULL;

-- q7
SELECT SUM(p.amount) AS revenue, ct.city
FROM city ct
JOIN address a ON a.city_id = ct.city_id
JOIN customer cm ON a.address_id = cm.address_id
JOIN payment p ON cm.customer_id = p.customer_id
GROUP BY ct.city
ORDER BY revenue DESC;

-- q8
SELECT ci.city || ',' || co.country AS info, SUM(p.amount) AS revenue
FROM city ci
JOIN country co ON ci.country_id = co.country_id
JOIN address a ON a.city_id = ci.city_id
JOIN customer cm ON a.address_id = cm.address_id
JOIN payment p ON cm.customer_id = p.customer_id
GROUP BY info
ORDER BY revenue;
