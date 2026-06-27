-- ============================================
-- Business Report 6
-- Categories with Revenue Greater than 50000
-- ============================================

SELECT
    p.Category,
    SUM(q.Quantity * p.Price) AS Total_Revenue
FROM OrderDetails q
INNER JOIN Products p
    ON q.ProductID = p.ProductID
GROUP BY p.Category
HAVING SUM(q.Quantity * p.Price) > 50000
ORDER BY Total_Revenue DESC;