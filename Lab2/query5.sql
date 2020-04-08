-- If a customer’s status is ‘H’, that’s a high status customer. (‘M’ is for medium, ‘L’ is for low.) The revenue
-- from a sale equals paidPrice * quantity for that sale.
-- For each sale in which all of the following are true:
--    a) the revenue is greater than or equal to two hundred,
--    b) the customer is a high status customer, and
--    c) the customer’s address isn’t NULL,
-- output the customerID, customer address, revenue and dayDate for that sale. The attribute for the
-- revenue of the sale should appear as theRevenue in your result. No duplicates should appear in your
-- result.

SELECT CUSTOMERS.customerID, CUSTOMERS.address, (SALES.paidPrice*SALES.quantity) as "theRevenue", SALES.dayDate
  FROM CUSTOMERS
  INNER JOIN SALES on SALES.customerID = CUSTOMERS.customerID
    WHERE (
    SALES.paidPrice * SALES.quantity >= 200 AND
    CUSTOMERS.status = 'H' AND
    CUSTOMERS.address IS NOT NULL
  )
  GROUP BY CUSTOMERS.customerID, SALES.dayDate, (SALES.paidPrice*SALES.quantity)
;