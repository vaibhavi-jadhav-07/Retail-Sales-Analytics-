-- ============================================
-- Business Report 14
-- Customer Ranking by Total Spending (ROW_NUMBER)
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

SELECT
    ROW_NUMBER() OVER (ORDER BY Total_Spending DESC) AS Customer_Rank,
    Name,
    Total_Spending
FROM CustomerSales;