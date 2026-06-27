-- ============================================
-- Business Report 16
-- Top 3 Customers in Each City
-- ============================================

WITH CustomerSales AS
(
    SELECT
        c.CustomerID,
        c.Name,
        c.City,
        SUM(q.Quantity * p.Price) AS Total_Spending
    FROM Customers c
    INNER JOIN Orders o
        ON c.CustomerID = o.CustomerID
    INNER JOIN OrderDetails q
        ON o.OrderID = q.OrderID
    INNER JOIN Products p
        ON q.ProductID = p.ProductID
    GROUP BY
        c.CustomerID,
        c.Name,
        c.City
)

SELECT *
FROM
(
    SELECT
        Name,
        City,
        Total_Spending,

        ROW_NUMBER() OVER
        (
            PARTITION BY City
            ORDER BY Total_Spending DESC
        ) AS CityRank

    FROM CustomerSales
) AS RankedCustomers

WHERE CityRank <= 3

ORDER BY City, CityRank;