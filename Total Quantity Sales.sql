-- ============================================
-- Business Report 3
-- Top Selling Products
-- ============================================

SELECT
    p.ProductName,
    SUM(q.Quantity) AS Total_Quantity_Sold
FROM OrderDetails q
INNER JOIN Products p
    ON q.ProductID = p.ProductID
GROUP BY
    p.ProductName
ORDER BY
    Total_Quantity_Sold DESC;