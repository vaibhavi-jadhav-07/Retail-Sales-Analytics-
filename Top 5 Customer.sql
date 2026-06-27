-- ============================================
-- Business Report 2
-- Top 5 Customers by Total Sales
-- ============================================

SELECT
    c.Name,
    SUM(q.Quantity * p.Price) AS Total_Sales
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails q
    ON o.OrderID = q.OrderID
INNER JOIN Products p
    ON q.ProductID = p.ProductID
GROUP BY c.Name
ORDER BY Total_Sales DESC
LIMIT 5;