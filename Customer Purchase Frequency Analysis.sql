-- ============================================
-- Business Report 23
-- Customer Purchase Frequency Analysis
-- ============================================

SELECT
    c.CustomerID,
    c.Name,
    COUNT(o.OrderID) AS Total_Orders,

    CASE
        WHEN COUNT(o.OrderID) >= 15 THEN 'VIP Customer'
        WHEN COUNT(o.OrderID) >= 5 THEN 'Regular Customer'
        ELSE 'New Customer'
    END AS Customer_Type

FROM Customers c

INNER JOIN Orders o
ON c.CustomerID = o.CustomerID

GROUP BY
    c.CustomerID,
    c.Name

ORDER BY
    Total_Orders DESC;