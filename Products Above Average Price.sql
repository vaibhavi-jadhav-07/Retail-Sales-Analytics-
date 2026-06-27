-- ============================================
-- Business Report 9
-- Products Above Average Price
-- ============================================

SELECT
    ProductName,
    Price
FROM Products
WHERE Price >
(
    SELECT AVG(Price)
    FROM Products
);

