
#Business Report

SELECT
    c.Name,
    SUM(q.Quantity * p.Price) AS Total_Spending,

    CASE
        WHEN SUM(q.Quantity * p.Price) > 50000 THEN 'VIP'
        WHEN SUM(q.Quantity * p.Price) >= 20000 THEN 'Regular'
        ELSE 'New'
    END AS Customer_Type

FROM Customers c

INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID

INNER JOIN OrderDetails q
    ON o.OrderID = q.OrderID

INNER JOIN Products p
    ON q.ProductID = p.ProductID

GROUP BY c.Name

ORDER BY Total_Spending DESC;