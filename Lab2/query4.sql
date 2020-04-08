-- Find the customerID and name of each customer who bought at least two different products at the
-- same North region store. No duplicates should appear in your result.
SELECT *
FROM
  (SELECT COUNT(distinct t.productID), t.customerID, t.custName FROM
    (SELECT CUSTOMERS.customerID, CUSTOMERS.custName, SALES.productID
      FROM CUSTOMERS
      INNER JOIN SALES on SALES.customerID=CUSTOMERS.customerID
      INNER JOIN PRODUCTS on PRODUCTS.productID=SALES.productID
      INNER JOIN STORES on STORES.storeID=SALES.storeID
      WHERE STORES.region='North'
    ) t group by t.customerID, t.productID, t.custName
) b group by b.customerID, b.custName, b.count
;