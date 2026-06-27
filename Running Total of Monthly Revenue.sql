-- ============================================
-- Business Report 19
-- Running Total of Monthly Revenue
-- ============================================

WITH MonthlyRevenue AS
(
    SELECT
        YEAR(o.OrderDate) AS Sales_Year,
        MONTH(o.OrderDate) AS Sales_Month,
        SUM(od.Quantity * p.Price) AS Monthly_Revenue
    FROM Orders o
    INNER JOIN OrderDetails od
        ON o.OrderID = od.OrderID
    INNER JOIN Products p
        ON od.ProductID = p.ProductID
    GROUP BY
        YEAR(o.OrderDate),
        MONTH(o.OrderDate)
)

SELECT
    Sales_Year,
    Sales_Month,
    Monthly_Revenue,

    SUM(Monthly_Revenue)
    OVER
    (
        ORDER BY Sales_Year, Sales_Month
    ) AS Running_Total

FROM MonthlyRevenue;