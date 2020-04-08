-- Output the productid, customerID and storeID for each sale that was made on January 16, 2018 that had a
-- paidPrice that was more than 20.00 and a quantity that was more than 5 . The attributes in your result
-- should appear as theProduct, theCustomer and theStore . No duplicates should appear in your result

SELECT productid as "theProduct", customerID as "theCustomer", storeID as "theStore"
  FROM SALES
  WHERE (
    dayDate = '2018-01-16' AND
    paidPrice > 20.00 AND
    quantity > 5 )
;