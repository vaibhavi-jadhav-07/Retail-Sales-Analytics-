-- ============================================
-- Business Report 12
-- Customers Spending Above Average (Using CTE)
-- ============================================

WITH CustomerSales AS
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
)

SELECT *
FROM CustomerSales
WHERE Total_Spending >
(
    SELECT AVG(Total_Spending)
    FROM CustomerSales
);