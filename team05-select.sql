
/*Query 1*/

/*PHP would adjust DESC to ASC to change the result and give the least valued order rather than the most. Also user input would change the given month */

SELECT o.id1, sum(m.price) AS Total
FROM orders AS o
JOIN menu AS m ON o.menu_id=m.id
WHERE o.d LIKE '2021-01%'
GROUP BY o.id1
ORDER BY Total DESC
LIMIT 1;

/*Query 2*/

/*PHP would adjust the given month in the where statement*/


SELECT c.fname, sum(m.price) AS Total
FROM orders as o
JOIN customer as c ON c.id=o.cust_id
JOIN menu as m ON m.id=o.menu_id
WHERE o.d LIKE '2020-11%'
GROUP BY c.fname
ORDER BY Total DESC
LIMIT 1;

/*Query 3*/

/*PHP would adjust the given dates in the where statement*/

SELECT DISTINCT CONCAT(e.fname,' ',e.lname) AS Name, s.id
FROM orders as o
JOIN employee as e ON e.id=o.driver_id
JOIN store as s ON s.id=e.store_id
WHERE o.d BETWEEN '2020-05-01' AND '2021-09-23'
ORDER BY s.id;

/*Query 4*/

/*PHP would adjust the given date in the where statement if they chooose to use a date other than the current date*/

SELECT c.coup_num, c.value
FROM coupon AS c
WHERE CURDATE() < c.exp_date
ORDER BY c.exp_date DESC;



/*Query 5*/

/*PHP would adjust the given month in the where statement*/

SELECT CONCAT(e.fname,' ',e.lname) AS Name, o.id1
FROM orders AS o
JOIN employee as e ON e.id=o.driver_id
WHERE NOT EXISTS (
	SELECT *
	FROM orders AS o1
	WHERE o1.d LIKE '2011-04%'
	AND e.job = 'Driver'
)
GROUP BY Name
ORDER BY o.d;







