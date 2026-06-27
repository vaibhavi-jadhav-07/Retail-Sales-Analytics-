-- ============================================
-- Business Report 17
-- Top Selling Product in Each Category
-- ============================================

WITH ProductSales AS
(
    SELECT
        p.Category,
        p.ProductName,
        SUM(od.Quantity) AS Total_Quantity_Sold
    FROM Products p
    INNER JOIN OrderDetails od
        ON p.ProductID = od.ProductID
    GROUP BY
        p.Category,
        p.ProductName
)

SELECT *
FROM
(
    SELECT
        Category,
        ProductName,
        Total_Quantity_Sold,

        RANK() OVER
        (
            PARTITION BY Category
            ORDER BY Total_Quantity_Sold DESC
        ) AS ProductRank

    FROM ProductSales
) AS RankedProducts

WHERE ProductRank = 1

ORDER BY Category;