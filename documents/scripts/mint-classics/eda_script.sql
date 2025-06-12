-- 1) Where are items stored and if they were rearranged, could a warehouse be eliminated?
-- Capacity and inventory of warehouses
SELECT 
    w.warehouseCode,
    w.warehouseName,
    w.warehousePctCap,
    COUNT(DISTINCT p.productCode) AS num_product, 
    SUM(p.quantityInStock) AS total_inventory,
    ROUND(SUM(p.quantityInStock) / (w.warehousePctCap / 100), 0) AS estimated_total_capacity,
    (100 - w.warehousePctCap) AS pct_space_available
FROM mintclassics.products p
JOIN mintclassics.warehouses w ON p.warehouseCode = w.warehouseCode
GROUP BY w.warehouseCode, w.warehouseName, w.warehousePctCap
ORDER BY estimated_total_capacity;

-- Warehouse b (East) has the 38 distinct products with a total inventory of 219183, and a capacity of 327139. 33% space available
-- Warehouse a (North) has 25 distinct products with a total inventory of 131688, and a capacity of 182900. 28% space available
-- warehouse c (West) has 24 distinct products with a total inventory of 124880, and a capacity of 249760. 50% space available
-- warehouse d (South) has 23 disticnt products with a total inventory of 79380, and a capacity of 105840. 25% space available


-- warehouse with the least demanded product lines
SELECT 
	p.warehouseCode,
    w.warehouseName,
	p.productLine AS product_line,
	SUM(p.quantityInStock) AS line_quantity
FROM mintclassics.products AS p
JOIN mintclassics.warehouses AS w
ON p.warehouseCode = w.warehouseCode
GROUP BY 1,2,3
ORDER BY SUM(quantityInStock);

-- warehouse D has the inventory for the least demanded product lines which are Trains, Ships, Trucks and buses.
-- warehouse D can be considered for closure based on this insight. Further analysis to be conducted to confirm this decision.

-- Revenue by Product Lines
SELECT 
    p.productLine,
    SUM(od.quantityOrdered * od.priceEach) AS total_revenue
FROM mintclassics.products p
JOIN mintclassics.orderdetails od ON p.productCode = od.productCode
GROUP BY 1
ORDER BY total_revenue DESC;

-- Product lines in warehouse d constitutes 3 out of top 4 Least revenue of product lines

-- warehouse D total inventory is 79380. This quantity can be distributed to other 3 warehouses based on space available. 

-- Seasonality by Product Line
SELECT 
    p.productLine,
    MONTH(o.orderDate) AS order_month,
    SUM(od.quantityOrdered) AS total_units_sold
FROM mintclassics.orders o
JOIN mintclassics.orderdetails od ON o.orderNumber = od.orderNumber
JOIN mintclassics.products p ON od.productCode = p.productCode
GROUP BY p.productLine, order_month
ORDER BY p.productLine, order_month;

-- By following the demand trend period of product lines in warehouse d,
-- Mint Classics can adequately plan for the closure of warehouse d to minimize disruption in meeting demand. 


-- 2) How are inventory numbers related to sales figures? Do the inventory counts seem appropriate for each item?

-- Inventory Vs Sales analysis
SELECT
	w.warehouseCode,
    p.productName,
    p.quantityInStock,
    SUM(od.quantityOrdered) AS total_units_sold,
    (p.quantityInStock - SUM(od.quantityOrdered)) AS inventory_surplus_deficit
FROM mintclassics.products AS p
JOIN mintclassics.orderdetails AS od
ON p.productCode = od.productCode
JOIN mintclassics.warehouses AS w
ON p.warehouseCode = w.warehouseCode
GROUP BY 1,2,3
ORDER BY inventory_surplus_deficit DESC;

-- Inventory levels show high deficit for some items and high surplus for some items
-- Inventory levels should be adjusted accordingly for products that are overstocked and understocked based on the sales trend 
-- Products with inventory surplus over 2000 units should be reduced to allow space for product with inventory deficit be stocked to meet demands.


-- revenue per item
SELECT
    p.productName,
    p.quantityInStock,
    od.priceEach,
    SUM(od.quantityOrdered * od.priceEach) AS total_revenue
FROM mintclassics.products AS p
JOIN mintclassics.orderdetails AS od
ON p.productCode = od.productCode
GROUP BY p.productName, p.quantityInStock, od.priceEach
ORDER BY total_revenue DESC;



-- 3) Are we storing items that are not moving? Are any items candidates for being dropped from the product line?

-- Slow-moving or non-moving items
SELECT 
    p.productCode,
    p.productName,
    p.quantityInStock,
    IFNULL(SUM(od.quantityOrdered), 0) AS total_units_sold,
    (p.quantityInStock - IFNULL(SUM(od.quantityOrdered), 0)) AS inventory_not_sold
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode, p.productName, p.quantityInStock
HAVING total_units_sold = 0 OR total_units_sold < 100
ORDER BY inventory_not_sold DESC;

-- The product code S18_3233 named 1985 Toyota Supra has quantity of 7733 but sold 0 units, thus having an inventory of 7733 not sold.

-- Inventory turnover ratio
SELECT 
    p.productCode,
    p.productName,
    p.quantityInStock,
    SUM(od.quantityOrdered) AS total_units_sold,
    (SUM(od.quantityOrdered) / p.quantityInStock) AS inventory_turnover_ratio
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode, p.productName, p.quantityInStock
ORDER BY inventory_turnover_ratio ASC;

-- Products with low inventory turnover indicate slow-moving products
-- thus inventory for these products can be considered as item candidates to be dropped from product lines
-- Products with high turn inventory turnover indicate fast-moving product
-- thus the inventory for these products should be optimized to meet demands















