-- Find the productID and name for each product whose name begins with ‘Intelligent’. 
-- Your result should be ordered alphabetically by the product’s name. 
-- No duplicates should appear in your result.

SELECT productID, productName
  FROM PRODUCTS 
  WHERE productName LIKE 'Intelligent%'
  ORDER BY productName ASC
;