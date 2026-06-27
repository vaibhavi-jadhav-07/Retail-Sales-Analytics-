-- ============================================
-- Business Report 10
-- Highest Spending Customer
-- ============================================

SELECT
    c.Name,
    SUM(q.Quantity * p.Price) AS Total_Spending
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails q
    ON o.OrderID = q.OrderID
INNER JOIN Products p
    ON q.ProductID = p.ProductID
GROUP BY c.Name
ORDER BY Total_Spending DESC
LIMIT 5;