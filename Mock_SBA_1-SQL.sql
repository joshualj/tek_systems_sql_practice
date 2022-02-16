USE mock_sba_db;

-- Question 1
SELECT o.*
FROM orders as o
JOIN users as u on u.USER_ID = o.USER_ID
WHERE FIRST_NAME = "Marion";

-- Question 2
SELECT * FROM users 
WHERE users.USER_ID NOT IN (SELECT DISTINCT user_id from orders);

-- Question 3     -- Concerned this code doesn't ensure items show in separate orders
SELECT i.NAME, i.PRICE
FROM items as i
JOIN order_items as ot on ot.ITEM_ID = i.ITEM_ID
GROUP BY i.ITEM_ID
HAVING COUNT(ot.ITEM_ID)>= 2;


-- Question 4
SELECT oi.ORDER_ID, i.NAME, i.PRICE, oi.QUANTITY
FROM items as i
JOIN order_items as oi on oi.ITEM_ID = i.ITEM_ID
JOIN orders as o on o.ORDER_ID = oi.ORDER_ID
JOIN stores as s on s.STORE_ID = o.STORE_ID
WHERE s.CITY = "New York"
ORDER BY oi.ORDER_ID;

-- Question 5
SELECT i.name as `ITEM_NAME`, SUM(i.PRICE*oi.QUANTITY) AS `REVENUE`
FROM items as i
JOIN order_items as oi on oi.ITEM_ID = i.ITEM_ID
GROUP BY `ITEM_NAME` ORDER BY `REVENUE` DESC;

-- Question 6
SELECT s.NAME, COUNT(o.STORE_ID) AS `ORDER_QUANTITY`, 
CASE
	WHEN COUNT(o.STORE_ID) >3 THEN "High"
	WHEN COUNT(o.STORE_ID) <=3 AND COUNT(o.STORE_ID)>1 THEN "Medium"
	WHEN COUNT(o.STORE_ID) <=1 THEN "Low"
END AS `SALES_FIGURE`
FROM stores as s
JOIN orders as o on o.STORE_ID = s.STORE_ID
GROUP BY o.STORE_ID ORDER BY `ORDER_QUANTITY` desc; 
