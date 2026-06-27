-- ============================================
-- Business Report 25
-- Executive Sales Dashboard Summary
-- ============================================

SELECT

    SUM(od.Quantity * p.Price) AS Total_Revenue,

    COUNT(DISTINCT o.OrderID) AS Total_Orders,

    COUNT(DISTINCT c.CustomerID) AS Total_Customers,

    COUNT(DISTINCT p.ProductID) AS Total_Products,

    ROUND(
        SUM(od.Quantity * p.Price) /
        COUNT(DISTINCT o.OrderID),
        2
    ) AS Average_Order_Value

FROM Orders o

INNER JOIN Customers c
ON o.CustomerID = c.CustomerID

INNER JOIN OrderDetails od
ON o.OrderID = od.OrderID

INNER JOIN Products p
ON od.ProductID = p.ProductID;
