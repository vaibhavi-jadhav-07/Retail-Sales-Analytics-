-- ============================================
-- Business Report 4
-- Revenue by Category
-- ============================================

SELECT
    p.Category,
    SUM(q.Quantity * p.Price) AS Total_Revenue
FROM OrderDetails q
INNER JOIN Products p
    ON q.ProductID = p.ProductID
GROUP BY
    p.Category
ORDER BY
    Total_Revenue DESC;