-- ============================================
-- Business Report 11
-- Customers Spending Above Average
-- ============================================

SELECT *
FROM
(
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
) AS CustomerSales

WHERE Total_Spending >
(
    SELECT AVG(Total_Spending)
    FROM
    (
        SELECT
            SUM(q.Quantity * p.Price) AS Total_Spending
        FROM Customers c
        INNER JOIN Orders o
            ON c.CustomerID = o.CustomerID
        INNER JOIN OrderDetails q
            ON o.OrderID = q.OrderID
        INNER JOIN Products p
            ON q.ProductID = p.ProductID
        GROUP BY c.Name
    ) AS AvgSales
);