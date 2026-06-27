-- ============================================
-- Business Report 7
-- Product Price Classification
-- ============================================

SELECT
    ProductName,
    Category,
    Price,
    CASE
        WHEN Price > 20000 THEN 'Expensive'
        WHEN Price >= 5000 THEN 'Medium'
        ELSE 'Budget'
    END AS Price_Category
FROM Products;