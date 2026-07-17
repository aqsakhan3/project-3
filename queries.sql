-- ============================================================
-- Project 3: SQL Data Analysis  |  DecodeLabs
-- Dataset: clean_dataset.xlsx  (Sheet: Cleaned_Data, 1200 orders)
-- ============================================================

-- 1. Basic SELECT: core order details
SELECT OrderID, Product, Quantity, UnitPrice, TotalPrice
FROM orders
LIMIT 10;

-- 2. WHERE (equality): orders that were Delivered
SELECT OrderID, Product, OrderStatus, TotalPrice
FROM orders
WHERE OrderStatus = 'Delivered';

-- 3. WHERE (comparison): high-value orders
SELECT OrderID, Product, TotalPrice
FROM orders
WHERE TotalPrice >= 2000;

-- 4. WHERE (pattern matching): addresses on "Main St"
SELECT OrderID, ShippingAddress
FROM orders
WHERE ShippingAddress LIKE '%Main St%';

-- 5. WHERE (AND + BETWEEN): Credit Card orders placed in 2024
SELECT OrderID, OrderDate, PaymentMethod, TotalPrice
FROM orders
WHERE PaymentMethod = 'Credit Card'
  AND OrderDate BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY OrderDate;

-- 6. ORDER BY: Top 10 highest value orders
SELECT OrderID, Product, TotalPrice
FROM orders
ORDER BY TotalPrice DESC
LIMIT 10;

-- 7. GROUP BY + COUNT: number of orders per product
SELECT Product, COUNT(*) AS Total_Orders
FROM orders
GROUP BY Product
ORDER BY Total_Orders DESC;

-- 8. GROUP BY + SUM: revenue per product
SELECT Product, SUM(TotalPrice) AS Total_Revenue
FROM orders
GROUP BY Product
ORDER BY Total_Revenue DESC;

-- 9. GROUP BY + AVG: average order value per payment method
SELECT PaymentMethod, ROUND(AVG(TotalPrice),2) AS Avg_Order_Value, COUNT(*) AS Orders
FROM orders
GROUP BY PaymentMethod
ORDER BY Avg_Order_Value DESC;

-- 10. GROUP BY (multi-metric): orders, revenue & AOV by order status
SELECT OrderStatus,
       COUNT(*) AS Num_Orders,
       SUM(TotalPrice) AS Total_Revenue,
       ROUND(AVG(TotalPrice),2) AS Avg_Order_Value
FROM orders
GROUP BY OrderStatus
ORDER BY Total_Revenue DESC;

-- 11. HAVING: referral sources generating over $50,000 in revenue
SELECT ReferralSource, SUM(TotalPrice) AS Total_Revenue, COUNT(*) AS Orders
FROM orders
GROUP BY ReferralSource
HAVING SUM(TotalPrice) > 50000
ORDER BY Total_Revenue DESC;

-- 12. Percentage contribution of each product to total revenue
SELECT Product,
       SUM(TotalPrice) AS Revenue,
       ROUND(100.0 * SUM(TotalPrice) / (SELECT SUM(TotalPrice) FROM orders), 2) AS Pct_Contribution
FROM orders
GROUP BY Product
ORDER BY Pct_Contribution DESC;

-- 13. GROUP BY: coupon code usage & revenue impact
SELECT CouponCode, COUNT(*) AS Orders, SUM(TotalPrice) AS Revenue, ROUND(AVG(TotalPrice),2) AS Avg_Order
FROM orders
GROUP BY CouponCode
ORDER BY Revenue DESC;

-- 14. GROUP BY: orders & revenue by referral source
SELECT ReferralSource, COUNT(*) AS Orders, SUM(TotalPrice) AS Revenue
FROM orders
GROUP BY ReferralSource
ORDER BY Orders DESC;

-- 15. WHERE IN: lost revenue from Cancelled/Returned orders
SELECT OrderStatus, COUNT(*) AS Num_Orders, SUM(TotalPrice) AS Lost_Revenue
FROM orders
WHERE OrderStatus IN ('Cancelled','Returned')
GROUP BY OrderStatus;

-- 16. GROUP BY: Top 10 customers by total spend
SELECT CustomerID, COUNT(*) AS Orders, SUM(TotalPrice) AS Total_Spent
FROM orders
GROUP BY CustomerID
ORDER BY Total_Spent DESC
LIMIT 10;

-- 17. GROUP BY: monthly revenue trend for 2024
SELECT strftime('%Y-%m', OrderDate) AS Month, COUNT(*) AS Orders, SUM(TotalPrice) AS Revenue
FROM orders
WHERE OrderDate LIKE '2024%'
GROUP BY Month
ORDER BY Month;
