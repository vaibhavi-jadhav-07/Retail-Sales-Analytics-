WITH CustomerSales AS
(
    SELECT
        c.CustomerID,
        c.Name,
        SUM(q.Quantity * p.Price) AS Total_Spending
    FROM Customers c
    INNER JOIN Orders o
        ON c.CustomerID = o.CustomerID
    INNER JOIN OrderDetails q
        ON o.OrderID = q.OrderID
    INNER JOIN Products p
        ON q.ProductID = p.ProductID
    GROUP BY c.CustomerID, c.Name
)

SELECT
    Name,
    Total_Spending,
    ROW_NUMBER() OVER (ORDER BY Total_Spending DESC) AS CustomerRank,
    RANK() OVER (ORDER BY Total_Spending DESC) AS SalesRank,
    DENSE_RANK() OVER (ORDER BY Total_Spending DESC) AS DenseRank
FROM CustomerSales
ORDER BY Total_Spending DESC;