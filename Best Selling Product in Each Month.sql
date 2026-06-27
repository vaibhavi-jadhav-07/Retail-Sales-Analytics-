-- ============================================
-- Business Report 22
-- Best Selling Product in Each Month
-- ============================================

WITH MonthlyProductSales AS
(
    SELECT
        YEAR(o.OrderDate) AS Sales_Year,
        MONTH(o.OrderDate) AS Sales_Month,
        p.ProductName,
        SUM(od.Quantity) AS Total_Quantity_Sold
    FROM Orders o
    INNER JOIN OrderDetails od
        ON o.OrderID = od.OrderID
    INNER JOIN Products p
        ON od.ProductID = p.ProductID
    GROUP BY
        YEAR(o.OrderDate),
        MONTH(o.OrderDate),
        p.ProductName
)

SELECT
    Sales_Year,
    Sales_Month,
    ProductName,
    Total_Quantity_Sold
FROM
(
    SELECT
        Sales_Year,
        Sales_Month,
        ProductName,
        Total_Quantity_Sold,

        RANK() OVER
        (
            PARTITION BY Sales_Year, Sales_Month
            ORDER BY Total_Quantity_Sold DESC
        ) AS ProductRank

    FROM MonthlyProductSales
) RankedProducts

WHERE ProductRank = 1

ORDER BY
    Sales_Year,
    Sales_Month;