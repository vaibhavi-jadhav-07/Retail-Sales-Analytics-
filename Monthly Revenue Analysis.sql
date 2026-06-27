-- ============================================
-- Business Report 18
-- Monthly Revenue Analysis
-- ============================================

SELECT
    YEAR(o.OrderDate) AS Sales_Year,
    MONTH(o.OrderDate) AS Sales_Month,

    SUM(od.Quantity * p.Price) AS Total_Revenue

FROM Orders o

INNER JOIN OrderDetails od
ON o.OrderID = od.OrderID

INNER JOIN Products p
ON od.ProductID = p.ProductID

GROUP BY
YEAR(o.OrderDate),
MONTH(o.OrderDate)

ORDER BY
Sales_Year,
Sales_Month;