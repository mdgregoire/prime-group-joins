--1	Get all customers and their addresses.

SELECT first_name, last_name, street, city, state, zip  FROM customers AS C
JOIN addresses AS A on C.id = A.customer_id

--2	Get all orders and their line items.

SELECT order_date, total, unit_price, quantity FROM orders AS O
JOIN line_items AS L on O.id = L.order_id


--3 Which warehouses have cheetos?

SELECT warehouse FROM warehouse
JOIN warehouse_product on warehouse.id = warehouse_product.warehouse_id
JOIN products on products.id = warehouse_product.product_id
WHERE products.description = 'cheetos'

--4	Which warehouses have diet pepsi?

SELECT warehouse FROM warehouse
JOIN warehouse_product on warehouse.id = warehouse_product.warehouse_id
JOIN products on products.id = warehouse_product.product_id
WHERE products.description = 'diet pepsi'

--5	Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT last_name, COUNT (*)
FROM orders JOIN addresses on addresses.id = orders.address_id
JOIN customers on addresses.customer_id = customers.id
group by customers.last_name;


--6	How many customers do we have?
SELECT COUNT(*) FROM customers;

--7	How many products do we carry?
SELECT DISTINCT(COUNT(*)) FROM products;

--8	What is the total available on-hand quantity of diet pepsi?
SELECT SUM(on_hand)
FROM products
JOIN warehouse_product on products.id = warehouse_product.product_id
WHERE products.description = 'diet pepsi'
