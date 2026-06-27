-- ============================================
-- Business Report 24
-- Dashboard Dataset
-- ============================================

SELECT

    o.OrderID,
    o.OrderDate,

    YEAR(o.OrderDate) AS Sales_Year,
    MONTH(o.OrderDate) AS Sales_Month,

    c.CustomerID,
    c.Name,
    c.Gender,
    c.City,

    p.ProductID,
    p.ProductName,
    p.Category,
    p.Price,

    od.Quantity,

    (od.Quantity * p.Price) AS Sales_Amount

FROM Orders o

INNER JOIN Customers c
ON o.CustomerID = c.CustomerID

INNER JOIN OrderDetails od
ON o.OrderID = od.OrderID

INNER JOIN Products p
ON od.ProductID = p.ProductID;