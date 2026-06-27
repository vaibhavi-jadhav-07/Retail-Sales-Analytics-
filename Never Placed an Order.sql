-- ============================================
-- Business Report 5
-- Customers Who Never Placed an Order
-- ============================================

SELECT
    c.CustomerID,
    c.Name,
    c.City
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;